provider "proxmox" {
  pm_tls_insecure = true
  /*
    USES ENVIRONMENT VARIABLES FOR AUTH
  */
}

resource "proxmox_vm_qemu" "virtual_machine" {
  count = var.vm_count
  name  = "${var.vm_name_prefix}${count.index}.${var.domain_name}"

  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = var.target_node

  # The destination resource pool for the new VM
  pool = var.resource_pool

  # The template name to clone this vm from
  clone = var.template_name

  # Activate QEMU agent for this VM
  agent = var.qemu_agent

  os_type  = "cloud-init"
  cores    = var.num_cores
  sockets  = var.num_sockets
  vcpus    = "0"
  cpu      = "host"
  memory   = var.memory
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  # Setup the disk. The id has to be unique
  disk {
    id           = 0
    size         = var.disk_size
    type         = "scsi"
    storage      = var.datastore
    storage_type = var.disk_format
    iothread     = false
  }

  # Setup the network interface and assign a vlan tag: 256
  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0    = "ip=dhcp"
  nameserver   = var.dns_server
  searchdomain = var.domain_name
  sshkeys      = file(var.ssh_public_key)
}