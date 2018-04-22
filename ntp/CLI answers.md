# Isaiah Frantz - Homework Questions
### sample input:
  ```
  unchanged,2018-04-06 16:35:40,TT,false,,devspz008.unix.sample.org
  unchanged,2018-04-06 16:35:40,PX,false,,devspsr130.unix.sample.org
  ```
1. Extract sorted host names from csv data
  a. FQDN
    ```
    awk -F, '{print $NF}' sample2-candidate-data.csv|sort
    ```
    or
    ```
    cut -d, -f6 sample2-candidate-data.csv|sort
    ```
    ```
    perl -ne 'printf("%s", (split(/,/,$_))[-1])' sample2-candidate-data.csv|sort
    ```
  b. Short name
    ```
    awk -F, '{print $NF}' sample2-candidate-data.csv|cut -d. -f1|sort
    ```
    or
    ```
    cut -d, -f6 sample2-candidate-data.csv |cut -d. -f1|sort
    ```
    or
    ```
    perl -ne 'printf("%s\n", split(/\./,(split(/,/,$_))[-1]))' sample2-candidate-data.csv|sort
    ```

2. Split hosts in to files based on data center location
  a. PX
    ```
    grep PX sample2-candidate-data.csv > PX_hosts.csv
    ```
  b. TT
    ```
    grep TT sample2-candidate-data.csv > TT_hosts.csv
    ```