# script de vérification SCCM
## résumé
ce Script permet d'effectuer les 1ers tests localement la bonne santé d'un point de distribution SCCM.
Il vérifie:
* l'accès au site IIS
* Si le serveur central est membre du groupe "admin local" du DP
* S'il reste de l'espace disque libre sur les disques System et DATA

En cas d'anomalie, il envoi un email de notification