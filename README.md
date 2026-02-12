# Projet Tutoré – Commande par retour d'état basée observateur  
### Asservissement en position angulaire & GyroBoy (Segway)

**Encadrante :** G. Iuliana Bara  
**Lieu :** Illkirch — Salles C138 et C003  
**Auteurs :** @carolinelb1 & @Albernye

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
- Modélisation de l'actionneur MCC.
- Synthèse d'un Observateur (Luenberger / Kalman).
- Commande par retour d'état (régulation + suivi).
- Ajout d'une **action intégrale**.
- Vérification du **principe de séparation**.
- Implémentation & tests sur Lego EV3.

### **2. Segway — Commande de rotation et Capteurs**
- **Modélisation sur espace d'états :** Basée sur les travaux de Hughes et al. (2020) pour le découplage des dynamiques *Forward* (Avance) et *Turning* (Rotation) ainsi que le calcul des gains.
- Synthèse du contrôleur **LQR**.
- Estimation des états via filtre de Kalman.
- Intégration dans le modèle GyroBoy.
- **Mises à jour Février 2026 :**
    - Gestion de la rotation (Yaw) validée.
    - Ajout des capteurs **Ultrasons** (Poursuite).
    - Ajout des capteurs **Infrarouge** (Évitement : rotation 90° sur obstacle).
    - Logique de **commande par couleur** au sol.

---

## 🚀 État d'avancement (Février 2026)
Le projet est fonctionnel sur le robot réel.
- **Branche `rotation` :** Fusionnée. La commande de lacet est opérationnelle.
- **Capteurs :** Drivers Ultrasons et IR intégrés. Le robot réagit à son environnement (obstacles et couleur).
- **Structure :** Le code a été nettoyé pour séparer la partie `MCC` (préliminaire) de la partie `Segway`.

---

## 🧪 Matériel disponible
- PC portable avec MATLAB/Simulink.
- **Robot :** Lego Mindstorms EV3 (Configuration GyroBoy).
- **Capteurs :**
    - Gyroscope (Équilibre).
    - Encodeurs moteurs (Position/Vitesse).
    - Capteur Ultrason (Distance).
    - Capteur Infrarouge (Détection obstacle).
    - Capteur de Couleur (Logique de commande).

---

## 📁 Arborescence actuelle du projet

Le projet est divisé en répertoires principaux :

### 📂 `MCC/` (Partie 1 : Moteur à Courant Continu)
Contient les fichiers relatifs à la première phase (TP asservissement).
* `observateur.mdl` / `observateur_terme_integral.mdl` : Modèles de simulation des observateurs.
* `Systeme_reel.mdl` : Modèle du système physique.
* `sujetTP_SS_MCC.pdf` : Énoncé de référence.

### 📂 `Segway/` (Partie 2 : GyroBoy - Développement)
Contient les fichiers sources et les versions intermédiaires.
* **Scripts MATLAB :**
    * `model.m` : **(Fichier Principal)** Définit les paramètres physiques, calcule les matrices d'état (A,B,C,D) et les gains. À exécuter avant toute simulation.
    * `model_discret.m` : Étude de la discrétisation.
* **Modèles Simulink :**
    * `LegoEV3.slx` : Retour d'état simple (Stabilisation pure).
    * `LegoEV3_poursuite.slx` : Commande en **vitesse** (au lieu de position) avec détection d'obstacle via capteur.

### 📂 `Papier/` (Version Finale)
* `EV3_Rotation.slx` : **(Fichier Final)** Version complète de démonstration. Le robot se stabilise et effectue des pirouettes (rotations contrôlées) lorsqu'il détecte une couleur spécifique au sol.

---

## 📝 Comment lancer le projet

1.  Ouvrir MATLAB.
2.  Se placer dans le dossier `Segway`.
3.  Exécuter le script de paramètres pour charger les matrices :
    ```matlab
    run model.m
    ```
4.  Ouvrir le modèle Simulink souhaité :
    * **Pour la démo finale (Couleurs & Pirouettes) :** Aller dans `Papier/` et ouvrir `EV3_Rotation.slx`.
    * **Pour tester l'équilibre seul :** Rester dans `Segway/` et ouvrir `LegoEV3.slx`.
5.  Cliquer sur **"Build, Deploy & Start"** dans l'onglet Hardware.

---

## 📚 Références
Ce projet s'appuie notamment sur l'article suivant pour l'établissement des matrices d'états (*Forward* & *Turning*) et l'approche de commande :
* **Timothy H. Hughes, Gareth H. Willetts, Jakub A. Kryczka.** *LQG controller for the LEGO MINDSTORMS EV3 Gyroboy Segway robot*. [cite_start]IFAC PapersOnLine 53-2 (2020). [cite: 5, 10, 52]