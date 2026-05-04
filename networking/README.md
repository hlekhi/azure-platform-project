## Network Architecture

### Topology: Hub and Spoke

| VNet | Address Space | Purpose |
|---|---|---|
| vnet-hub-prod-aue-001 | 10.0.0.0/16 | Central hub |
| vnet-spoke1-prod-aue-001 | 10.1.0.0/16 | Workload 1 |
| vnet-spoke2-prod-aue-001 | 10.2.0.0/16 | Workload 2 |

### Security Controls
- All subnets protected by NSGs
- Deny-all inbound rule on all NSGs
- No public IPs on any VM
- VM access via Azure Bastion only
- Storage accessible via Private Endpoint only
- Private DNS zones linked to all VNets
