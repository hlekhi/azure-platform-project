## Management Group Hierarchy

Root Tenant
└── Platform
    ├── Workloads  ← subscription lives here
    └── Sandbox

## RBAC Assignments
| Scope | Role | Why |
|---|---|---|
| Platform MG | Owner | Full admin at platform level |
| Workloads MG | Contributor | Deploy resources |
| Sandbox MG | Reader | Read-only for testing |    

## Policies Applied
| Policy | Effect | Scope |
|---|---|---|
| Require environment tag | Deny | Workloads MG |
| Allowed locations | Deny | Workloads MG |
| Storage HTTPS only | Deny | Workloads MG |

