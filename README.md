# Gestion avancée des identités avec OpenStack Keystone et Tableau de bord Horizon personnalisé

Projet de gestion avancée des identités avec OpenStack Keystone et Tableau de bord Horizon personnalisé

![OpenStack](https://img.shields.io/badge/OpenStack-Horizon%20%7C%20Keystone-ed1944?style=for-the-badge&logo=openstack&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Django](https://img.shields.io/badge/Django-Web_Framework-092E20?style=for-the-badge&logo=django&logoColor=white)

## 📖 À propos du projet

Ce projet vise à étendre et moderniser **OpenStack** (composants Keystone et Horizon) pour le transformer en une véritable plateforme Cloud SaaS prête pour les entreprises. 

Par défaut, OpenStack est un puissant moteur d'infrastructure (IaaS), mais il nécessite des extensions pour répondre aux exigences modernes des organisations. Ce projet apporte une refonte complète de l'expérience utilisateur (UX/UI), un moteur de sécurité backend avancé (MFA, ABAC), et prépare le terrain pour une gestion financière intégrée (FinOps).

## ✨ Fonctionnalités implémentées

Le socle de sécurité et l'interface utilisateur ont été entièrement repensés et intégrés :

### 🛡️ Sécurité & Identité (Backend Keystone)
* **Authentification Multi-Facteurs (MFA) :** Sécurisation renforcée des accès utilisateurs avec la prise en charge d'un second facteur d'authentification natif.
* **Contrôle d'Accès Basé sur les Attributs (ABAC) :** Extension granulaire de Keystone permettant de définir des politiques de permissions complexes basées sur les attributs des utilisateurs et des ressources (dépassant les limites du RBAC traditionnel).

### 🎨 Expérience Utilisateur & Audit (Frontend Horizon)
* **Refonte UI/UX "SaaS Premium" (Glassmorphism) :** Modernisation complète de la page d'authentification (`Login` et `MFA`) avec un design *Glassmorphism* (effets de verre dépoli, arrière-plans dynamiques) et redesign de la navigation latérale.
* **Tableau de Bord d'Audit ABAC :** Création d'un dashboard analytique sur mesure pour le suivi des journaux de sécurité, intégrant des KPI en temps réel et des graphiques interactifs (via **Chart.js**).
* **Génération de Rapports PDF Dynamiques :** Moteur d'exportation côté client (via `html2pdf.js`) permettant de générer des rapports de sécurité filtrables par dates.
* **Routage Intelligent (Role-Based Routing) :** Redirection dynamique post-connexion. Les administrateurs atterrissent sur le Dashboard de Sécurité, tandis que les utilisateurs accèdent à leur vue classique.

## 🚀 Roadmap & Fonctionnalités à venir

Les prochaines étapes se concentrent sur l'ouverture de l'infrastructure vers l'extérieur et la monétisation des ressources :

- [ ] **Fédération d'Identité (SAML / OAuth2) :** Intégration de fournisseurs d'identité externes (IdP) pour permettre le Single Sign-On (SSO) en mappant les attributs externes vers les rôles et projets OpenStack.
- [ ] **Suivi Budgétaire & Facturation (FinOps) :** Développement d'un plugin Horizon dédié pour tracker la consommation réelle des ressources (Compute, Storage) et générer des rapports de facturation.
- [ ] **Gestion Visuelle des Ressources :** Simplification extrême de l'interface d'Horizon pour la création de projets, l'allocation des quotas et la gestion des utilisateurs (orienté drag-and-drop / vues simplifiées).

## 🛠️ Stack Technique

* **Backend :** Python, Django, OpenStack Keystone API
* **Frontend :** OpenStack Horizon, SCSS, Bootstrap 3, JavaScript (ES6)
* **Librairies Data/Export :** Chart.js, html2pdf.js