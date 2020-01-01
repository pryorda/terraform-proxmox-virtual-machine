# terraform-proxmox-virtual-machine

Module `terraform-proxmox-virtual-machine` is a universal module that can be
used to deploy proxmox virtual machines from a Linux-based template based off of a cloud img. Link: [Proxmox Cloud-Init Support](https://pve.proxmox.com/wiki/Cloud-Init_Support)

This makes use of the following resources and data sources within the
[Terraform Proxmox Provider](https://github.com/Telmate/terraform-provider-proxmox):

* [Resource VM QEMU](https://github.com/Telmate/terraform-provider-proxmox/blob/master/proxmox/resource_vm_qemu.go)

In order to use this module, ensure that you have configured the Proxmox
provider as per the instructions seen [Terraform Proxmox Provider](https://github.com/Telmate/terraform-provider-proxmox).

Usage Example:

    module "virtual_machines" {
      source          = "https://github.com/pryorda/terraform-provider-virtual-machine"
      datastore       = "${var.datastore}"
      disk_size       = "${var.disk_size}"
      dns_server      = "${var.dns_server}"
      domain_name     = "${var.domain_name}"
      memory          = "${var.memory}"
      num_cores       = "${var.num_cores}"
      network_bridge  = "${var.network_bridge}"
      vm_count        = "${var.vm_count}"
      vm_name_prefix  = "${local.vm_name_prefix}"
      template_name   = "${var.template_name}"
      resource_pool   = "${var.resource_pool}"
    }



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| datastore | The Storage Pool to deploy the virtual machines to. | string | - | yes |
| disk_size | The amount of disk space to assign to each VM. | string | `40` | no |
| dns_server | The DNS server to assign to each virtual machine. | string | - | no |
| domain_name | The domain of the virtual machine. This is added as the domain name on Linux, and to the DNS domain search list on both Linux and Windows. | string | `example.com` | no |
| memory | The amount of memory, in MB, to assign each virtual machine. | number | `1024` | no |
| network_bridge | The network to deploy virtual machines to. | string | - | no |
| num_cores | The number of cores to assign each virtual machine. | number | `2` | no |
| num_sockets | The number of sockets to assign each virtual machine. | number | `1` | no |
| qemu_agent | Whether the qemu_agent is running or not. | number | 0 | no | 
| resource_pool | The resource pool to deploy the virtual machines to. | string | - | yes |
| ssh_public_key | The public key location for authentication | string | `~/.ssh/id_rsa.pub` | no |
| target_node | The node to deploy the virtual machine to. | string | - | yes |
| template_name | The template to clone virtual machines from. Leave this blank when creating a virtual machine from scratch. | string | `` | no |
| vm_count | The number of virtual machines to create. | string | `1` | no |
| vm_name_prefix | The prefix to use for virtual machines created with this module. | string | 'example-vm' | no |

## Outputs

| Name | Description |
|------|-------------|
| NA Currently | NA Currently |

