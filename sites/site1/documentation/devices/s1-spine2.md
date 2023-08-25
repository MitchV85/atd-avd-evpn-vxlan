# s1-spine2

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [NTP](#ntp)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [AAA Authorization](#aaa-authorization)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Configuration](#internal-vlan-allocation-policy-configuration)
- [MAC Address Table](#mac-address-table)
  - [MAC Address Table Summary](#mac-address-table-summary)
  - [MAC Address Table Device Configuration](#mac-address-table-device-configuration)
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [ARP](#arp)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management0 | oob_management | oob | default | 192.168.0.11/24 | 192.168.0.1 |

##### IPv6

| Management Interface | description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management0 | oob_management | oob | default | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management0
   description oob_management
   no shutdown
   ip address 192.168.0.11/24
```

### DNS Domain

#### DNS domain: atd.lab

#### DNS Domain Device Configuration

```eos
dns domain atd.lab
!
```

### NTP

#### NTP Summary

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 192.168.0.1 | - | - | - | True | - | - | - | Management0 | - |

#### NTP Device Configuration

```eos
!
ntp server 192.168.0.1 iburst local-interface Management0
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| default | - | - |

#### Management API HTTP Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf default
      no shutdown
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
| arista | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username arista privilege 15 role network-admin secret sha512 <removed>
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | local |

Authorization for configuration commands is disabled.

#### AAA Authorization Device Configuration

```eos
aaa authorization exec default local
!
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 192.168.0.5:9910 | - | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=192.168.0.5:9910 -cvauth=token,/tmp/token -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## MAC Address Table

### MAC Address Table Summary

- MAC address table entry maximum age: 1800 seconds

### MAC Address Table Device Configuration

```eos
!
mac address-table aging-time 1800
```

## Interfaces

### Switchport Default

#### Switchport Defaults Summary

- Default Switchport Mode: routed

#### Switchport Default Configuration

```eos
!
switchport default mode routed
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet2 | P2P_LINK_TO_S1-LEAF1_Ethernet3 | routed | - | 172.20.1.146/31 | default | 9214 | False | - | - |
| Ethernet3 | P2P_LINK_TO_S1-LEAF2_Ethernet3 | routed | - | 172.20.1.150/31 | default | 9214 | False | - | - |
| Ethernet7 | P2P_LINK_TO_S1-BRDR1_Ethernet3 | routed | - | 172.20.1.162/31 | default | 9214 | False | - | - |
| Ethernet8 | P2P_LINK_TO_S1-BRDR2_Ethernet3 | routed | - | 172.20.1.166/31 | default | 9214 | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet2
   description P2P_LINK_TO_S1-LEAF1_Ethernet3
   no shutdown
   mtu 9214
   no switchport
   ip address 172.20.1.146/31
!
interface Ethernet3
   description P2P_LINK_TO_S1-LEAF2_Ethernet3
   no shutdown
   mtu 9214
   no switchport
   ip address 172.20.1.150/31
!
interface Ethernet7
   description P2P_LINK_TO_S1-BRDR1_Ethernet3
   no shutdown
   mtu 9214
   no switchport
   ip address 172.20.1.162/31
!
interface Ethernet8
   description P2P_LINK_TO_S1-BRDR2_Ethernet3
   no shutdown
   mtu 9214
   no switchport
   ip address 172.20.1.166/31
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 10.0.0.2/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |


#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 10.0.0.2/32
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |

#### IP Routing Device Configuration

```eos
!
ip routing
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP             | Exit interface      | Administrative Distance       | Tag               | Route Name                    | Metric         |
| --- | ------------------ | ----------------------- | ------------------- | ----------------------------- | ----------------- | ----------------------------- | -------------- |
| default | 0.0.0.0/0 | 192.168.0.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 192.168.0.1
```

### ARP

Global ARP timeout: 1500

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000|  10.0.0.2 |

| BGP Tuning |
| ---------- |
| graceful-restart restart-time 300 |
| graceful-restart |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### EVPN-OVERLAY-LOCAL-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Next-hop unchanged | True |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 3 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### IPV4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- |
| 10.0.0.101 | 65101 | default | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | - | - |
| 10.0.0.102 | 65101 | default | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | - | - |
| 10.0.0.105 | 65103 | default | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | - | - |
| 10.0.0.106 | 65103 | default | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | Inherited from peer group EVPN-OVERLAY-LOCAL-PEERS | - | - | - |
| 172.20.1.147 | 65101 | default | - | Inherited from peer group IPV4-UNDERLAY-PEERS | Inherited from peer group IPV4-UNDERLAY-PEERS | - | - | - | - | - |
| 172.20.1.151 | 65101 | default | - | Inherited from peer group IPV4-UNDERLAY-PEERS | Inherited from peer group IPV4-UNDERLAY-PEERS | - | - | - | - | - |
| 172.20.1.163 | 65103 | default | - | Inherited from peer group IPV4-UNDERLAY-PEERS | Inherited from peer group IPV4-UNDERLAY-PEERS | - | - | - | - | - |
| 172.20.1.167 | 65103 | default | - | Inherited from peer group IPV4-UNDERLAY-PEERS | Inherited from peer group IPV4-UNDERLAY-PEERS | - | - | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-LOCAL-PEERS | True | default |

#### Router BGP Device Configuration

```eos
!
router bgp 65000
   router-id 10.0.0.2
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
   neighbor EVPN-OVERLAY-LOCAL-PEERS peer group
   neighbor EVPN-OVERLAY-LOCAL-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-LOCAL-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-LOCAL-PEERS bfd
   neighbor EVPN-OVERLAY-LOCAL-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-LOCAL-PEERS password 7 <removed>
   neighbor EVPN-OVERLAY-LOCAL-PEERS send-community
   neighbor EVPN-OVERLAY-LOCAL-PEERS maximum-routes 0
   neighbor IPV4-UNDERLAY-PEERS peer group
   neighbor IPV4-UNDERLAY-PEERS password 7 <removed>
   neighbor IPV4-UNDERLAY-PEERS send-community
   neighbor IPV4-UNDERLAY-PEERS maximum-routes 12000
   neighbor 10.0.0.101 peer group EVPN-OVERLAY-LOCAL-PEERS
   neighbor 10.0.0.101 remote-as 65101
   neighbor 10.0.0.101 description s1-leaf1
   neighbor 10.0.0.102 peer group EVPN-OVERLAY-LOCAL-PEERS
   neighbor 10.0.0.102 remote-as 65101
   neighbor 10.0.0.102 description s1-leaf2
   neighbor 10.0.0.105 peer group EVPN-OVERLAY-LOCAL-PEERS
   neighbor 10.0.0.105 remote-as 65103
   neighbor 10.0.0.105 description s1-brdr1
   neighbor 10.0.0.106 peer group EVPN-OVERLAY-LOCAL-PEERS
   neighbor 10.0.0.106 remote-as 65103
   neighbor 10.0.0.106 description s1-brdr2
   neighbor 172.20.1.147 peer group IPV4-UNDERLAY-PEERS
   neighbor 172.20.1.147 remote-as 65101
   neighbor 172.20.1.147 description s1-leaf1_Ethernet3
   neighbor 172.20.1.151 peer group IPV4-UNDERLAY-PEERS
   neighbor 172.20.1.151 remote-as 65101
   neighbor 172.20.1.151 description s1-leaf2_Ethernet3
   neighbor 172.20.1.163 peer group IPV4-UNDERLAY-PEERS
   neighbor 172.20.1.163 remote-as 65103
   neighbor 172.20.1.163 description s1-brdr1_Ethernet3
   neighbor 172.20.1.167 peer group IPV4-UNDERLAY-PEERS
   neighbor 172.20.1.167 remote-as 65103
   neighbor 172.20.1.167 description s1-brdr2_Ethernet3
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-LOCAL-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-LOCAL-PEERS activate
      neighbor IPV4-UNDERLAY-PEERS activate
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 300 | 300 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
```

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.0.0.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.0.0.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |

### VRF Instances Device Configuration

```eos
```