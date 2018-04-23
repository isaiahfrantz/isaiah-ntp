# Isaiah Frantz - Homework Questions
### sample input:
  ```
  unchanged,2018-04-06 16:35:40,TT,false,,devspz008.unix.sample.org
  unchanged,2018-04-06 16:35:40,PX,false,,devspsr130.unix.sample.org
  ```
1. Extract sorted host names from csv data
   1. FQDN, options:
      * `awk -F, '{print $NF}' sample2-candidate-data.csv|sort`
      * `cut -d, -f6 sample2-candidate-data.csv|sort`
      * `perl -ne 'printf("%s", (split(/,/,$_))[-1])' sample2-candidate-data.csv|sort`
   2. Short name
      * `awk -F, '{print $NF}' sample2-candidate-data.csv|cut -d. -f1|sort`
      *  `cut -d, -f6 sample2-candidate-data.csv |cut -d. -f1|sort`
      * `perl -ne 'printf("%s\n", split(/\./,(split(/,/,$_))[-1]))' sample2-candidate-data.csv|sort`

2. Split hosts in to files based on data center location
    * `grep PX sample2-candidate-data.csv > PX_hosts.csv`
    * `grep TT sample2-candidate-data.csv > TT_hosts.csv`
    
3. I cant think of a good reason to manage a separate copy of a config for each host instead of a template. Most hosts will have very similar or identical configs based on their function or location so templates can help reduce redundancy. Also, templates make it really easy to make sweeping changes that can reduce the chance of error that the manual editing of multiple config can result in.