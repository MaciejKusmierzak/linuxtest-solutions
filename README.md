# Part 1 / General Knowledge:
## 1/ Explain what this command does:
```ps -ef | grep python | wc -l```

Answer: 

> ps -ef 

```ps``` displays information about running processes. Option ```-e``` displays all processes, while without it ```ps``` displays only processes with the same EUID as the current user and associated with the same terminal as `ps` was invoked from. Option `-f` provides additional information about processes.

> grep python

outputs only lines from the input containing pattern "python"

> wc -l

outputs number of lines (newline) in input

> |

pipe redirects output from one command to input of other command

> ps -ef | grep python | wc -l

outputs number of all running instances of python (and other commands that include the word 'python')

## 2/ Is 172.56.23.5 a public or private IP address?

Answer: 172.56.23.5 is a public ip adress, it **does not** fall in the closest private ip block which is 172.16.0.0/12.

## 3/ How many IP address are available in this subnet 192.168.0.0 / 28

- 32 - 28 = 4 bits = 4 ^ 2 = 16 total addresses
- without network and broadcast adress: 16 - 2 = 14

Answer: 14 addresses

## 4/ Explain what this command does:


```lsof | grep /tmp 2>&1 | awk {'print $2'} | sort -u```

>lsof

lists open files

>grep /tmp 2>&1

output only lines containing pattern "/tmp", redirect standard error (file descriptor 2) to standard output (file descriptor 1).

>awk {'print $2'}

using awk for each line of input output second item (by deafult items are separated by whitespace sequences) which is PID (process id) in output of ```lsof``` .

>sort -u

outputs sorted lines of text. Option `-u` removes duplicate lines from output.

> lsof | grep /tmp 2>&1 | awk {'print $2'} | sort -u

output unique process IDs sorted in ascending order of processes that have files open in the /tmp directory

## 5/ How would you check the status of a service running on a centos 8 machine?

Answer: ```systemctl status SERVICENAME```

## 6/ If I wanted to set a static IP address on an interface which should be persisted over reboot, should I use the command:

- ip
- nmcli
- ifconfig
- ipconfig

Answer: ```nmcli```

- ```ip``` and ```ifconfig``` changes dont persist over reboot
- ```ipconfig``` is a Windows command that can't be used to set static ip

# Part 2/ Solve this Problem
Note: To see the message on host at localhost:80 you need to publish the exposed port (80). When using ```docker run``` to create a container this can be done with option ```-p```.

Mapping port 80 in container to port 80 in host machine: ```docker run -itd -p 80:80 IMAGE:TAG```



