require 'spec_helper'

describe 'ntp' do
    on_supported_os.each do |os, os_facts|
        context "on #{os}" do
            let(:facts) { os_facts }

            # three hosts from each of the prod hiera files
            {
                'PX' => {
                    'hosts' => ["devoidu120", "devscms104", "devspdj130"],
                    'ntp_server' => '1.1.1.1'
                },
                'TT' => {
                    'hosts' => ["devspz008", "devsspz009", "devsspz015"],
                    'ntp_server' => '2.2.2.2'
                },
            }.each do |dc,data|
                describe "ntp.conf generated with hiera based lookup for dc=>#{dc}" do
                    ntp_server=data['ntp_server']
                    data['hosts'].each do |host|
                        context "hostname=>#{host}, ntp_server=>#{ntp_server}" do
                            let(:facts) do
                                super().merge({ 
                                    'hostname' => host,
                                })
                            end

                            it { is_expected.to compile.with_all_deps }
                            it { is_expected.to contain_class('ntp') }

                            it { is_expected.to contain_service('ntpd').with_ensure('running') }
                            it { is_expected.to contain_service('ntpd').with_enable('true') }
                            it { is_expected.to contain_package('ntp').with_ensure('present') }

                            # check that conf file was generated with the proper contents
                            it { is_expected.to contain_file('/etc/ntp.conf').with(
                                'ensure' => 'file',
                                'owner'  => 'root',
                                'group'  => 'root',
                                'mode'   => '0644',
                                'content' => /#{ntp_server}/,
                            )}

                            # check that the file has the dc specific ntp server
                            #it { is_expected.to contain_file('/etc/ntp.conf').with_content(/10.#{dc_num}.2.191/) }

                        end #context "hostname=>#{hostname}, ntp_server=>#{ntp_server}" do

                    end #data{hosts}.each do |hostname|
                end #describe "ntp.conf generated with hiera based lookup for dc=>#{dc}" do
            end #}.each do |dc,data|


        end #context "on #{os}" do
    end #on_supported_os.each do |os, os_facts|
end #describe 'ntp' do
