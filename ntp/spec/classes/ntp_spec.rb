require 'spec_helper'

describe 'ntp' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('ntp') }
  
      it { is_expected.to contain_service('ntpd').with_ensure('running') }
      it { is_expected.to contain_service('ntpd').with_enable('true') }
      it { is_expected.to contain_package('ntp').with_ensure('present') }

      it { is_expected.to contain_file('/etc/ntp.conf').with(
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644'
      )}

    end
  end
end