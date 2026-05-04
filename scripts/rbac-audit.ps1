# ============================================
# RBAC Audit Script
# Flags overprivileged users in Azure
# ============================================

# Connect to Azure (comment out if already connected)
# Connect-AzAccount

# Get all role assignments in the subscription
$assignments = Get-AzRoleAssignment

# Define overprivileged roles to flag
$privilegedRoles = @("Owner", "Contributor", "User Access Administrator")

# Initialise results array
$results = @()

foreach ($assignment in $assignments) {
    
    $isOverPrivileged = $privilegedRoles -contains $assignment.RoleDefinitionName
    $isServicePrincipal = $assignment.ObjectType -eq "ServicePrincipal"
    
    $results += [PSCustomObject]@{
        DisplayName    = $assignment.DisplayName
        Role           = $assignment.RoleDefinitionName
        Scope          = $assignment.Scope
        ObjectType     = $assignment.ObjectType
        Overprivileged = $isOverPrivileged
        Flag           = if ($isOverPrivileged -and -not $isServicePrincipal) 
                         { "⚠️ REVIEW REQUIRED" } 
                         else 
                         { "✅ OK" }
    }
}

# Display results in console
Write-Host "`n===== RBAC AUDIT REPORT =====" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date)" -ForegroundColor Cyan
Write-Host "==============================`n" -ForegroundColor Cyan

# Show flagged assignments first
$flagged = $results | Where-Object { $_.Flag -eq "⚠️ REVIEW REQUIRED" }
$clean = $results | Where-Object { $_.Flag -eq "✅ OK" }

Write-Host "⚠️  FLAGGED - REVIEW REQUIRED ($($flagged.Count) assignments)" -ForegroundColor Red
$flagged | Format-Table -AutoSize

Write-Host "✅ OK ($($clean.Count) assignments)" -ForegroundColor Green
$clean | Format-Table -AutoSize

# Export to CSV
$exportPath = "rbac-audit-$(Get-Date -Format 'yyyy-MM-dd').csv"
$results | Export-Csv -Path $exportPath -NoTypeInformation

Write-Host "`nAudit report exported to: $exportPath" -ForegroundColor Yellow
Write-Host "Total assignments reviewed: $($results.Count)" -ForegroundColor Yellow
Write-Host "Flagged for review: $($flagged.Count)" -ForegroundColor Red