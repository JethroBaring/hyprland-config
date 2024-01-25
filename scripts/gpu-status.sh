#!/bin/zsh

gpu_status=$(envycontrol --query)
nvidia_status=$(lspci -k | grep -i "VGA" -A 2 | grep "Kernel driver" | sed -n '2p' | awk '{print $5}')

if [ $gpu_status = "hybrid" ]; then
    if [ $nvidia_status = "vfio-pci" ]; then
        echo '{"text": "Vfio"}'
    else
        echo '{"text": "Nvidia"}'
    fi
else
    echo '{"text": "iGPU"}'
fi
