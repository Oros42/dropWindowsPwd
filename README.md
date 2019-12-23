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
