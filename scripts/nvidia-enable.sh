#!/bin/bash
sudo cp /etc/sysconfig/nvidia-enable /etc/sysconfig/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg /dev/null 2>&1
sudo cp /etc/dracut.conf.d/nvidia-enable.conf /etc/dracut.conf.d/local.conf
sudo dracut -f --kver `uname -r` /dev/null 2>&1
echo "You can now use gpu on host machine."
echo "Rebooting in 3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
