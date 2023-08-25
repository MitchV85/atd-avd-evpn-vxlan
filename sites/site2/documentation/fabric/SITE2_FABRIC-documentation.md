# SITE2_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| SITE2_FABRIC | l3leaf | s2-brdr1 | 192.168.0.200/24 | ceos | Provisioned | - |
| SITE2_FABRIC | l3leaf | s2-brdr2 | 192.168.0.201/24 | ceos | Provisioned | - |
| SITE2_FABRIC | l3leaf | s2-leaf1 | 192.168.0.22/24 | ceos | Provisioned | - |
| SITE2_FABRIC | l3leaf | s2-leaf2 | 192.168.0.23/24 | ceos | Provisioned | - |
| SITE2_FABRIC | spine | s2-spine1 | 192.168.0.20/24 | ceos | Provisioned | - |
| SITE2_FABRIC | spine | s2-spine2 | 192.168.0.21/24 | ceos | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | s2-brdr1 | Ethernet1 | mlag_peer | s2-brdr2 | Ethernet1 |
| l3leaf | s2-brdr1 | Ethernet2 | spine | s2-spine1 | Ethernet7 |
| l3leaf | s2-brdr1 | Ethernet3 | spine | s2-spine2 | Ethernet7 |
| l3leaf | s2-brdr1 | Ethernet6 | mlag_peer | s2-brdr2 | Ethernet6 |
| l3leaf | s2-brdr2 | Ethernet2 | spine | s2-spine1 | Ethernet8 |
| l3leaf | s2-brdr2 | Ethernet3 | spine | s2-spine2 | Ethernet8 |
| l3leaf | s2-leaf1 | Ethernet1 | mlag_peer | s2-leaf2 | Ethernet1 |
| l3leaf | s2-leaf1 | Ethernet2 | spine | s2-spine1 | Ethernet2 |
| l3leaf | s2-leaf1 | Ethernet3 | spine | s2-spine2 | Ethernet2 |
| l3leaf | s2-leaf1 | Ethernet6 | mlag_peer | s2-leaf2 | Ethernet6 |
| l3leaf | s2-leaf2 | Ethernet2 | spine | s2-spine1 | Ethernet3 |
| l3leaf | s2-leaf2 | Ethernet3 | spine | s2-spine2 | Ethernet3 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.20.0.0/22 | 1024 | 16 | 1.57 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| s2-brdr1 | Ethernet2 | 172.20.3.49/31 | s2-spine1 | Ethernet7 | 172.20.3.48/31 |
| s2-brdr1 | Ethernet3 | 172.20.3.51/31 | s2-spine2 | Ethernet7 | 172.20.3.50/31 |
| s2-brdr2 | Ethernet2 | 172.20.3.53/31 | s2-spine1 | Ethernet8 | 172.20.3.52/31 |
| s2-brdr2 | Ethernet3 | 172.20.3.55/31 | s2-spine2 | Ethernet8 | 172.20.3.54/31 |
| s2-leaf1 | Ethernet2 | 172.20.3.33/31 | s2-spine1 | Ethernet2 | 172.20.3.32/31 |
| s2-leaf1 | Ethernet3 | 172.20.3.35/31 | s2-spine2 | Ethernet2 | 172.20.3.34/31 |
| s2-leaf2 | Ethernet2 | 172.20.3.37/31 | s2-spine1 | Ethernet3 | 172.20.3.36/31 |
| s2-leaf2 | Ethernet3 | 172.20.3.39/31 | s2-spine2 | Ethernet3 | 172.20.3.38/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.0.0.0/24 | 256 | 6 | 2.35 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SITE2_FABRIC | s2-brdr1 | 10.0.0.205/32 |
| SITE2_FABRIC | s2-brdr2 | 10.0.0.206/32 |
| SITE2_FABRIC | s2-leaf1 | 10.0.0.201/32 |
| SITE2_FABRIC | s2-leaf2 | 10.0.0.202/32 |
| SITE2_FABRIC | s2-spine1 | 10.0.0.1/32 |
| SITE2_FABRIC | s2-spine2 | 10.0.0.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.1.1.0/24 | 256 | 4 | 1.57 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| SITE2_FABRIC | s2-brdr1 | 10.1.1.205/32 |
| SITE2_FABRIC | s2-brdr2 | 10.1.1.205/32 |
| SITE2_FABRIC | s2-leaf1 | 10.1.1.201/32 |
| SITE2_FABRIC | s2-leaf2 | 10.1.1.201/32 |
