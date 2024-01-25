#!/bin/bash
sudo cp /etc/sysconfig/nvidia-disable /etc/sysconfig/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg /dev/null 2>&1
sudo cp /etc/dracut.conf.d/nvidia-disable.conf /etc/dracut.conf.d/local.conf
sudo dracut -f --kver `uname -r`
echo "You can now use gpu on virtual machine."
echo "Rebooting in 3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
