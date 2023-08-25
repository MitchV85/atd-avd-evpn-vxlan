# SITE1_FABRIC

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
| SITE1_FABRIC | l3leaf | s1-brdr1 | 192.168.0.100/24 | ceos | Provisioned | - |
| SITE1_FABRIC | l3leaf | s1-brdr2 | 192.168.0.101/24 | ceos | Provisioned | - |
| SITE1_FABRIC | l3leaf | s1-leaf1 | 192.168.0.12/24 | ceos | Provisioned | - |
| SITE1_FABRIC | l3leaf | s1-leaf2 | 192.168.0.13/24 | ceos | Provisioned | - |
| SITE1_FABRIC | l3leaf | s1-leaf3 | 192.168.0.12/24 | ceos | Provisioned | - |
| SITE1_FABRIC | l3leaf | s1-leaf4 | 192.168.0.13/24 | ceos | Provisioned | - |
| SITE1_FABRIC | spine | s1-spine1 | 192.168.0.10/24 | ceos | Provisioned | - |
| SITE1_FABRIC | spine | s1-spine2 | 192.168.0.11/24 | ceos | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | s1-brdr1 | Ethernet1 | mlag_peer | s1-brdr2 | Ethernet1 |
| l3leaf | s1-brdr1 | Ethernet2 | spine | s1-spine1 | Ethernet7 |
| l3leaf | s1-brdr1 | Ethernet3 | spine | s1-spine2 | Ethernet7 |
| l3leaf | s1-brdr1 | Ethernet6 | mlag_peer | s1-brdr2 | Ethernet6 |
| l3leaf | s1-brdr2 | Ethernet2 | spine | s1-spine1 | Ethernet8 |
| l3leaf | s1-brdr2 | Ethernet3 | spine | s1-spine2 | Ethernet8 |
| l3leaf | s1-leaf1 | Ethernet1 | mlag_peer | s1-leaf2 | Ethernet1 |
| l3leaf | s1-leaf1 | Ethernet2 | spine | s1-spine1 | Ethernet2 |
| l3leaf | s1-leaf1 | Ethernet3 | spine | s1-spine2 | Ethernet2 |
| l3leaf | s1-leaf1 | Ethernet6 | mlag_peer | s1-leaf2 | Ethernet6 |
| l3leaf | s1-leaf2 | Ethernet2 | spine | s1-spine1 | Ethernet3 |
| l3leaf | s1-leaf2 | Ethernet3 | spine | s1-spine2 | Ethernet3 |
| l3leaf | s1-leaf3 | Ethernet1 | mlag_peer | s1-leaf4 | Ethernet1 |
| l3leaf | s1-leaf3 | Ethernet2 | spine | s1-spine1 | Ethernet4 |
| l3leaf | s1-leaf3 | Ethernet3 | spine | s1-spine2 | Ethernet4 |
| l3leaf | s1-leaf3 | Ethernet6 | mlag_peer | s1-leaf4 | Ethernet6 |
| l3leaf | s1-leaf4 | Ethernet2 | spine | s1-spine1 | Ethernet5 |
| l3leaf | s1-leaf4 | Ethernet3 | spine | s1-spine2 | Ethernet5 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.20.0.0/22 | 1024 | 24 | 2.35 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| s1-brdr1 | Ethernet2 | 172.20.1.161/31 | s1-spine1 | Ethernet7 | 172.20.1.160/31 |
| s1-brdr1 | Ethernet3 | 172.20.1.163/31 | s1-spine2 | Ethernet7 | 172.20.1.162/31 |
| s1-brdr2 | Ethernet2 | 172.20.1.165/31 | s1-spine1 | Ethernet8 | 172.20.1.164/31 |
| s1-brdr2 | Ethernet3 | 172.20.1.167/31 | s1-spine2 | Ethernet8 | 172.20.1.166/31 |
| s1-leaf1 | Ethernet2 | 172.20.1.145/31 | s1-spine1 | Ethernet2 | 172.20.1.144/31 |
| s1-leaf1 | Ethernet3 | 172.20.1.147/31 | s1-spine2 | Ethernet2 | 172.20.1.146/31 |
| s1-leaf2 | Ethernet2 | 172.20.1.149/31 | s1-spine1 | Ethernet3 | 172.20.1.148/31 |
| s1-leaf2 | Ethernet3 | 172.20.1.151/31 | s1-spine2 | Ethernet3 | 172.20.1.150/31 |
| s1-leaf3 | Ethernet2 | 172.20.1.153/31 | s1-spine1 | Ethernet4 | 172.20.1.152/31 |
| s1-leaf3 | Ethernet3 | 172.20.1.155/31 | s1-spine2 | Ethernet4 | 172.20.1.154/31 |
| s1-leaf4 | Ethernet2 | 172.20.1.157/31 | s1-spine1 | Ethernet5 | 172.20.1.156/31 |
| s1-leaf4 | Ethernet3 | 172.20.1.159/31 | s1-spine2 | Ethernet5 | 172.20.1.158/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.0.0.0/24 | 256 | 8 | 3.13 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SITE1_FABRIC | s1-brdr1 | 10.0.0.105/32 |
| SITE1_FABRIC | s1-brdr2 | 10.0.0.106/32 |
| SITE1_FABRIC | s1-leaf1 | 10.0.0.101/32 |
| SITE1_FABRIC | s1-leaf2 | 10.0.0.102/32 |
| SITE1_FABRIC | s1-leaf3 | 10.0.0.103/32 |
| SITE1_FABRIC | s1-leaf4 | 10.0.0.104/32 |
| SITE1_FABRIC | s1-spine1 | 10.0.0.1/32 |
| SITE1_FABRIC | s1-spine2 | 10.0.0.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.1.1.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| SITE1_FABRIC | s1-brdr1 | 10.1.1.105/32 |
| SITE1_FABRIC | s1-brdr2 | 10.1.1.105/32 |
| SITE1_FABRIC | s1-leaf1 | 10.1.1.101/32 |
| SITE1_FABRIC | s1-leaf2 | 10.1.1.101/32 |
| SITE1_FABRIC | s1-leaf3 | 10.1.1.103/32 |
| SITE1_FABRIC | s1-leaf4 | 10.1.1.103/32 |
