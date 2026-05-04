# Identity & Access Management

## RBAC Structure
| User | Role | Scope | Type |
|---|---|---|---|
| Ops User | Contributor | Subscription | Eligible (PIM) |
| Dev User | Network Contributor | Resource Group | Eligible (PIM) |
| ReadOnly User | Reader | Subscription | Eligible (PIM) |

## PIM Configuration
- All privileged roles configured as Eligible (not permanent)
- Maximum activation duration: 4 hours
- Approval required for Contributor role
- Full audit trail enabled

## Managed Identity
- VM uses System-assigned Managed Identity
- Identity granted Key Vault Secrets User role
- No stored credentials anywhere

## RBAC Audit
- PowerShell script audits all role assignments
- Flags Owner, Contributor, User Access Administrator
- Exports CSV report with findings