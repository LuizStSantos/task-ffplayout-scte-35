**task-ffplayout**

task for ffplayout to execute command for scte-35

**Python and pip install**

``` 
sudo wget -O - https://raw.githubusercontent.com/LuizStSantos/task-ffplayout-scte-35/main/python3-pip | sudo bash
```

**Task download**

```
sudo wget -c https://raw.githubusercontent.com/LuizStSantos/task-ffplayout-scte-35/main/task-ffplayout-python3-comand-scte-break-for-SCTE-35-HLS-Sideways
```

**How the task works**

The task works by executing a SCTE-35-HLS-Sideways command to inject SCTE-35.

**SCTE-35-HLS-Sideways GIT**

```
https://github.com/futzu/SCTE-35-HLS-Sideways
```

**How does the task work within ffplayout**

The task is executed in ffplayout in the settings tab where you will add the task file to be executed, with each video 
played it will execute but it will not give the command if it is not following some rules that I created.

***Standards***

Only the video that contains **break** in the name will be executed.
.mp4 format only video file format example

***examples***

```
break.mp4

break-video01.mp4

video01-break.mp4

video01-break-video01.mp4

video01-video01-break.mp4

etc...
```

**scte-35 task cue time**

The scte-35 time is based on the current ffplayout video named break

**Important**

Keep in mind that it will be necessary to make adjustments to the script for better operation, especially in the command 
executed to synchronize the input of the SCTE-35 command with the break **--pts 0**

```
62 execute_shell_command('adbreak --pts 0 --duration {duration} --sidecar /usr/share/ffplayout/sidecar.txt
```

It is also necessary that the file is executed where SCTE-35-HLS-Sideways is first running or the sidecar.txt file is allocated
**/usr/share/ffplayout/sidecar.txt**

```
62 execute_shell_command('adbreak --pts 0 --duration {duration} --sidecar /usr/share/ffplayout/sidecar.txt
```
