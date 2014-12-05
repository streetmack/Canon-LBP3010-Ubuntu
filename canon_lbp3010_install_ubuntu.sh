#!/bin/bash
# script for install Canon LBP3010 for Ubuntu 64 bit
# author Huseyin Karamelikli @webmarangoz 2014 


sudo aptitude update
sudo aptitude upgrade
wget http://files.canon-europe.com/files/soft40567/Software/CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
tar -xvpf CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
cd CAPT_Printer_Driver_for_Linux_V220_uk_EN/64-bit_Driver/RPM
sudo apt-get install alien dpkg-dev debhelper build-essential -y
sudo alien cndrvcups-capt-2.20-1.x86_64.rpm  --scripts
sudo alien cndrvcups-common-2.20-1.x86_64.rpm  --scripts
sudo dpkg -i  cndrvcups-common_2.20-2_amd64.deb
sudo dpkg -i cndrvcups-capt_2.20-2_amd64.deb 
sudo apt-get install cups-common
sudo apt-get install portreserve
sudo apt-get install cups

sudo /etc/init.d/cups restart
sudo /usr/sbin/lpadmin -p LBP3010 -m CNCUPSLBP3050CAPTK.ppd -v ccp:/var/ccpd/fifo0
sudo /usr/sbin/ccpdadmin -p LBP3010 -o /dev/usb/lp0
sudo /etc/init.d/ccpd restart
sudo update-rc.d ccpd defaults 20

cd ../../../
rm -R CAPT_Printer_Driver_for_Linux_V220_uk_EN  
rm -R CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz  
#sudo reboot
exit

