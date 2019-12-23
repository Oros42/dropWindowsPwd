# dropWindowsPwd
Drop all Windows account's passords on all NTFS partitions.  
Run this script on a live Debian or Kali.  
  
## Setup  
```
sudo apt install -y mount ntfs-3g chntpw coreutils gawk
wget -q https://raw.githubusercontent.com/Oros42/dropWindowsPwd/master/dwp.sh
chmod +x dwp.sh
```

## Run
```
sudo ./dwp.sh
```

## Undo password's reset

Go in ```/Windows/System32/config/``` and move ```SAM.back_xxxxxxxxxx``` to ```SAM```

## For noobs
  
Download : 
- Virtualbox : https://www.virtualbox.org/
- Windows : https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/  
- Kali : https://www.kali.org/downloads/  

## Example of output

```
root@kali:~# ./dwp.sh 
Mounting volume... OK
Processing of $MFT and $MFTMirr completed successfully.
Checking the alternate boot sector... OK
NTFS volume version is 3.1.
NTFS partition /dev/disk/by-partuuid/5e3e38f0-01 was processed successfully.
mount -t ntfs-3g /dev/disk/by-partuuid/5e3e38f0-01 /media/tmpMount
chntpw version 1.00 140201, (c) Petter N Hagen
Hive </media/tmpMount/Windows/System32/config/SAM> name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c <lh>
File size 65536 [10000] bytes, containing 6 pages (+ 1 headerpage)
Used for data: 314/28528 blocks/bytes, unused: 16/4048 blocks/bytes.

| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | dis/lock |
| 01f7 | DefaultAccount                 |        | dis/lock |
| 01f5 | Guest                          |        | dis/lock |
| 03e8 | IEUser                         | ADMIN  |          |
| 03e9 | sshd                           |        | dis/lock |
| 03ea | sshd_server                    | ADMIN  |          |
RID :01f4
chntpw version 1.00 140201, (c) Petter N Hagen
Hive </media/tmpMount/Windows/System32/config/SAM> name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c <lh>
File size 65536 [10000] bytes, containing 6 pages (+ 1 headerpage)
Used for data: 314/28528 blocks/bytes, unused: 16/4048 blocks/bytes.
```
[...]  
```
| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | *BLANK*  |
| 01f7 | DefaultAccount                 |        | *BLANK*  |
| 01f5 | Guest                          |        | *BLANK*  |
| 03e8 | IEUser                         | ADMIN  | *BLANK*  |
| 03e9 | sshd                           |        | *BLANK*  |
| 03ea | sshd_server                    | ADMIN  | *BLANK*  |
```
