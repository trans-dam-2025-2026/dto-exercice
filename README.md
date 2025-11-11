## 🧩 Exercice Flutter / Firestore ODM

### **Gestion des Produits et Catégories avec DTO et ODM**

------

### 🎯 **Objectif général**

L’objectif de cet exercice est de mettre en pratique la **manipulation de DTO (Data Transfer Objects)** et l’utilisation du **Firestore ODM** pour interagir avec une base de données Firestore de manière **type-safe et structurée**.

Les étudiants devront modéliser leurs données, générer le schéma ODM, puis afficher dynamiquement des listes de **catégories** et de **produits** dans l’interface Flutter.

------

### 🧱 **Contexte**

Vous développez une application Flutter de gestion de produits, intitulée **MyFruitz**.
 Chaque utilisateur possède plusieurs **catégories**, et chaque catégorie contient plusieurs **produits**.
 L’application doit permettre :

- d’afficher les **catégories existantes** ;
- d’afficher les **produits associés à chaque catégorie**.

L’application utilisera **Firestore ODM** pour gérer la structure des données et assurer la sécurité des types.

------

### 🚀 **Étapes à suivre**

#### **Étape 1 — Création du DTO**

- Créez deux **modèles de données** :
  - un modèle `Category` pour représenter les catégories,
  - un modèle `Product` pour représenter les produits.
- Chaque modèle doit comporter les champs nécessaires (ex. : `id`, `title`, `description`, `price`, `categoryId`, etc.).
- Utilisez les annotations adaptées pour Firestore ODM et la sérialisation (`@Collection`, `@DocumentIdField`, etc.).

------

#### **Étape 2 — Définition du schéma ODM**

- Créez un fichier décrivant le **schéma général de la base** (par exemple `schema.dart`).
- Définissez-y la structure hiérarchique :
  - un utilisateur contient des **catégories**,
  - chaque catégorie contient des **produits**.
- Vérifiez que le schéma ODM permet d’accéder à :
  - `db.users(userId).categories`
  - `db.users(userId).categories(categoryId).products`

------

#### **Étape 3 — Génération du code ODM**

- Exécutez la génération de code ODM (avec `build_runner`).
- Vérifiez que les fichiers générés contiennent les extensions et méthodes nécessaires (`get()`, `stream`, `insert()`, etc.).
- Assurez-vous que les modèles DTO sont bien reconnus et utilisables depuis votre code Flutter.

------

#### **Étape 4 — Affichage des catégories**

- Implémentez un widget (ex. `CategorySlider`) permettant d’afficher la **liste des catégories** de l’utilisateur connecté.
- Utilisez les méthodes ODM (`get()` ou `stream`) pour récupérer les données Firestore.
- Affichez chaque catégorie sous forme de **carte (Card)** avec son titre et sa description.

------

#### **Étape 5 — Affichage des produits**

- Implémentez un second widget (ex. `ProductSlider`) pour afficher la **liste des produits** associés à une catégorie donnée.
- Utilisez également les méthodes ODM (`get()` ou `stream`) sur la sous-collection `products`.
- Affichez pour chaque produit son nom, sa description et son prix.

------

#### **Étape 6 — Vue détaillée (Single View)**

- Créez une vue dédiée pour afficher les **détails d’un produit** ou d’une **catégorie** à partir de son identifiant.
- Utilisez un `FutureBuilder` pour charger les données ODM à partir de l’ID reçu en argument via la navigation.
- Affichez les informations détaillées dans une mise en page claire et cohérente avec les autres écrans.

------

#### **Étape 7 — Vérifications finales**

- Vérifiez que les données s’affichent correctement après ajout ou modification dans Firestore.
- Testez les rechargements automatiques si vous utilisez des `StreamBuilder`.
- Assurez-vous que les modèles DTO correspondent bien aux documents présents dans votre base Firestore.

------

### 🧭 **Critères de réussite**

- Les modèles DTO sont correctement définis et annotés.
- Le schéma ODM permet une navigation claire entre utilisateurs, catégories et produits.
- Les listes de catégories et de produits s’affichent dynamiquement à partir de Firestore.
- L’interface est fonctionnelle et cohérente avec les autres pages de l’application.

------

### 💡 **Bonus (facultatif)**

- Ajouter une action pour **modifier la catégorie d’un produit** depuis la vue “Single Product”.
- Ajouter un bouton pour **supprimer une catégorie** ou un **produit**.
- Gérer les cas où la base est vide avec un affichage alternatif (“Aucun produit”, “Aucune catégorie”).
