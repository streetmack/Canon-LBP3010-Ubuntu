#!/bin/bash
# script for install Canon LBP3010 for Ubuntu
# author - streetmack 2011
aptitude update
aptitude upgrade
wget http://files.canon-europe.com/files/soft40567/Software/CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
tar -xvpf CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
cd CAPT_Printer_Driver_for_Linux_V220_uk_EN/32-bit_Driver/Debian
dpkg -i cndrvcups-common_2.20-1_i386.deb
dpkg -i cndrvcups-capt_2.20-1_i386.deb
/etc/init.d/cups restart
/usr/sbin/lpadmin -p LBP3010 -m CNCUPSLBP3050CAPTK.ppd -v ccp:/var/ccpd/fifo0
/usr/sbin/ccpdadmin -p LBP3010 -o /dev/usb/lp0
/etc/init.d/ccpd restart
