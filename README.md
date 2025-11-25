# Projet Tutoré – Commande par retour d'état basée observateur  
### Asservissement en position angulaire & GyroBoy (Segway)

**Encadrante :** G. Iuliana Bara  
**Lieu :** Illkirch — Salles C138 et C003

---

## 🎯 Objectifs du projet

### 1. Amélioration du TP 2A sur l'asservissement en position (MCC + roue dentée)

Le système étudié est un actionneur MCC du Lego Mindstorms EV3 pilotant une roue dentée.  
Dans le TP initial, la **vitesse** était obtenue par dérivation de la position mesurée ⇒ fort **bruit** & **quantification**.

L'objectif est :

- d'introduire un **observateur** (Luenberger ou **filtre de Kalman**)  
- d'utiliser cet observateur dans une **commande par retour d'état**,  
- d'améliorer l'estimation de la vitesse du MCC → amélioration des performances de la boucle fermée (BF),
- puis de tester l'ensemble **sur le Lego EV3**.

### 2. Commande de rotation autour de l'axe vertical du Segway (GyroBoy)

Le second objectif concerne l'enrichissement de la commande du **Segway / GyroBoy**, utilisée pour la Fête de la Science :

- synthèse d'une commande de rotation sur l'axe vertical,
- utilisation d'un **LQR** + **Filtre de Kalman**,
- implémentation complète sur la plateforme Lego.  

Démonstration de référence :  
https://youtu.be/ST8VZM7IPws

---

## 🧩 Déroulement du projet

### **1. MCC — Commande par retour d'état + Observateur (+ Action intégrale)**
- Modélisation de l'actionneur MCC
- Synthèse d'un Observateur :
  - Observateur de Luenberger  
  - OU filtre de Kalman
- Commande par retour d'état (régulation + suivi)
- Ajout d'une **action intégrale**
- Vérification du **principe de séparation**
- Implémentation & tests sur Lego EV3

### **2. Segway — Commande de rotation autour de l'axe vertical**
- Modélisation sur espace d'états
- Synthèse du contrôleur **LQR**
- Estimation des états via filtre de Kalman
- Intégration dans le modèle GyroBoy
- Tests / validation

---

## 🧪 Matériel disponible
- PC portable
- Lego Mindstorms EV3 + capteurs et actionneurs liés

---

## 📁 Arborescence actuelle du projet

A suivre...