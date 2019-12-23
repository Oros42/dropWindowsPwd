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
./dwp.sh
```
