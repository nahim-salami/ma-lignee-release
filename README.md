# Ma Lignée

Application de généalogie collaborative, 100 % gratuite : inscris-toi, rattache-toi à ta famille et
découvre ta lignée — parents, frères et sœurs, grands-parents, arrière-grands-parents… jusqu'à l'époque
de ton choix. Arbre interactif animé, carte des migrations, frise chronologique, photos, vidéos,
enregistrements audio et récits de famille.

## Documentation

- [Analyse complète et plan d'implémentation](docs/ANALYSE-ET-PLAN.md)

## Dépôts

| Dépôt | Visibilité | Rôle |
|---|---|---|
| `nahim-salami/ma-lignee` | Privé | Source de vérité, développement |
| `nahim-salami/ma-lignee-release` | Public | Tests, compilation, APK et déploiement (GitHub Actions) |

Publier la branche courante (et les tags) vers le dépôt public :

```powershell
./scripts/publier-release.ps1
```

## Pile technique

React + Vite (PWA) · Cloudflare Workers + Hono · Cloudflare D1 · Cloudflare R2 · Better Auth ·
MapLibre + OpenFreeMap · D3 / family-chart · Motion.

## Licence

Tous droits réservés © Nahim Salami. Le code visible dans le dépôt public ne peut pas être réutilisé sans autorisation.
