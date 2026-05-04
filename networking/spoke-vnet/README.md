# Spoke VNets

## Spoke 1
| Field | Value |
|---|---|
| Name | vnet-spoke1-prod-aue-001 |
| Address Space | 10.1.0.0/16 |

## Spoke 1 Subnets
| Subnet | Address Range | Purpose |
|---|---|---|
| snet-app | 10.1.0.0/24 | Application tier |
| snet-data | 10.1.1.0/24 | Data tier |

## Spoke 2
| Field | Value |
|---|---|
| Name | vnet-spoke2-prod-aue-001 |
| Address Space | 10.2.0.0/16 |

## Spoke 2 Subnets
| Subnet | Address Range | Purpose |
|---|---|---|
| snet-app | 10.2.0.0/24 | Application tier |
| snet-data | 10.2.1.0/24 | Data tier |

## Security
- NSGs applied to all app subnets
- Deny-all inbound rule on all NSGs
- Allow HTTPS from hub only
- Allow SSH from Bastion subnet only