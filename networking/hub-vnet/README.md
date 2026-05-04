# Hub VNet

## Details
| Field | Value |
|---|---|
| Name | vnet-hub-prod-aue-001 |
| Address Space | 10.0.0.0/16 |
| Region | Australia East |

## Subnets
| Subnet | Address Range | Purpose |
|---|---|---|
| AzureBastionSubnet | 10.0.1.0/26 | Azure Bastion |
| snet-gateway | 10.0.0.0/27 | VPN Gateway |
| snet-firewall | 10.0.2.0/26 | Azure Firewall |
| snet-shared | 10.0.3.0/24 | Shared Services |

## Connected To
- vnet-spoke1-prod-aue-001 via peering
- vnet-spoke2-prod-aue-001 via peering