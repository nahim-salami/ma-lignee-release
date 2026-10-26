# Publie la branche courante et les tags du dépôt privé vers le dépôt public
# nahim-salami/ma-lignee-release, où GitHub Actions compile, teste et déploie.
#
# Usage : ./scripts/publier-release.ps1 [-Branche main]

param(
    [string]$Branche = (git rev-parse --abbrev-ref HEAD)
)

$ErrorActionPreference = 'Stop'
$depotPublic = 'https://github.com/nahim-salami/ma-lignee-release.git'

if (-not (git remote | Select-String -Pattern '^release$' -Quiet)) {
    git remote add release $depotPublic
}

# Refuse de publier des modifications non commitées : le dépôt public doit refléter un commit précis.
if (git status --porcelain) {
    Write-Error 'Des modifications ne sont pas commitées. Commite-les avant de publier.'
}

# Garde-fou : aucun fichier de secrets suivi par git.
$secrets = git ls-files | Select-String -Pattern '(^|/)(\.env(\..+)?|\.dev\.vars)$|\.(keystore|jks)$' |
    Where-Object { $_ -notmatch '\.env\.example$' }
if ($secrets) {
    Write-Error "Fichiers sensibles suivis par git, publication annulée :`n$($secrets -join "`n")"
}

git push release "${Branche}:${Branche}"
git push release --tags
Write-Host "Publié : $Branche -> ma-lignee-release"
