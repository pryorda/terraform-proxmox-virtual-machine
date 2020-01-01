Download image.

qm create 9001 --memory 2048 --net0 virtio,bridge=vmbr0
qm importdisk 9001 eoan-server-cloudimg-amd64.img FreeNAS-Proxmox-Shared
qm set 9001 --scsihw virtio-scsi-pci --scsi0 FreeNAS-Proxmox-Shared:9001/vm-9001-disk-0.raw
qm set 9001 --ide2 FreeNAS-Proxmox-Shared:cloudinit
qm set 9001 --boot c --bootdisk scsi0
qm set 9001 --serial0 socket --vga serial0
qm template 9001
