# TechNova
## Spring Framework  
est un framework open-source, puissant et polyvalent pour le développement d'applications Java. Il permet aux développeurs de créer des applications Java robustes, bien structurées, évolutives, et faciles à maintenir.
Le framework est modulable, ce qui signifie que vous pouvez utiliser seulement les modules nécessaires à votre projet, ou le framework dans son intégralité. Parmi les modules les plus utilisés, on trouve 
Spring Core, Spring MVC, Spring Data, Spring Security, et Spring Boot.
## Caractéristiques principales de Spring :
- Injection de dépendances (DI) :C’est un des concepts fondamentaux du framework, permettant la gestion des objets et de leurs dépendances sans avoir à les instancier manuellement dans le code.
- Programmation orientée aspect (AOP): Permet de séparer les préoccupations transversales (comme la gestion des transactions ou la gestion des logs) du reste du code métier.
- Intégration facile avec d'autres technologies: Spring s’intègre bien avec d’autres frameworks et bibliothèques comme Hibernate, JPA.
- Facilité de test : Le framework permet un développement orienté test, en rendant les composants facilement testables grâce à l'injection de dépendances.
## L'Inversion de contrôle (IoC): 
 est un principe de conception qui permet aux développeurs de se concentrer sur la logique métier de l'application, en déléguant la gestion des objets et de leurs dépendances à un framework (comme Spring). Cela signifie que c'est le framework, plutôt que l'application elle-même, qui gère la création, la configuration et le cycle de vie des objets. Ainsi, IoC simplifie la structure du code et réduit le couplage entre les composants, rendant l'application plus modulaire et plus facile à maintenir. 
 ## Principaux avantages de l'IoC :
- Couplage faible:  IoC réduit le couplage entre les composants en les rendant moins dépendants les uns des autres.
- Meilleure testabilité: Avec IoC, il devient facile de remplacer des dépendances par des objets simulés (mocks) lors des tests unitaires.
- Séparation des préoccupations:  Les objets ne sont plus responsables de créer ou de gérer leurs dépendances. Ils se concentrent uniquement sur leur logique métier, tandis que le conteneur Spring s'occupe de la gestion des dépendances et du cycle de vie des objets.
## Les types d'injection de dépendances dans IoC :
- **Injection par Constructeur** :Les dépendances sont fournies à travers le constructeur de la classe
- **Injection par setter** : Les dépendances sont injectées après la création de l'objet via des méthodes setter.
- **Injection par interface** : Cela permet d'injecter des dépendances en passant par des interfaces, bien que cette méthode soit moins courante que les deux précédentes
## Gestion des Beans:
Spring Core utilise un conteneur IoC pour gérer les Beans, qui sont les objets instanciés, configurés et gérés par Spring. Le cycle de vie des Beans (instanciation, initialisation, destruction) est géré automatiquement, ce qui permet aux développeurs de se concentrer sur la logique métier plutôt que sur la gestion des objets.
Le conteneur Spring IoC est responsable de la création de ces objets (appelés Beans), ainsi que de la gestion de leur cycle de vie : instanciation, initialisation et destruction.
## Cycle de vie d'un Bean
Le conteneur IoC de Spring gère tout le cycle de vie des Beans :

- **Instanciation** : Spring crée l'objet Bean.
- **Initialisation** : Spring initialise le Bean en injectant ses dépendances et en exécutant les méthodes d'initialisation définies.
- **Utilisation** : Le Bean est prêt à être utilisé dans l'application.
- **Destruction** : Lorsque l'application se termine, ou lorsque le Bean n'est plus nécessaire, Spring détruit le Bean et libère les ressources associées.
## Types de beans dans Spring
Il existe différents types de Beans dans Spring, principalement liés à leur portée (scope).
Le scope d'un Bean définit combien d'instances de ce Bean peuvent exister dans le conteneur Spring
### 1. Singleton
C'est le scope par défaut dans Spring. Un Bean Singleton signifie qu'une seule instance de ce Bean est créée dans le conteneur Spring, et cette instance est partagée tout au long du cycle de vie de l'application.
exemple:
```bash
  <bean id="monBean" class="com.example.MonBean" scope="singleton"/>
```
### 2. Prototype
signifie qu'une nouvelle instance du Bean est créée à chaque fois qu'il est demandé. Ce scope est utile si vous avez besoin d'une nouvelle instance à chaque demande.
exemple:
```bash
<bean id="monBean" class="com.example.MonBean" scope="prototype"/>
```
### 3. Request (Demande HTTP)
Le scope request est utilisé dans les applications web. Chaque requête HTTP reçoit une instance distincte du Bean.
exemple:
```bash
<bean id="monBean" class="com.example.MonBean" scope="request"/>
```
### 4. Session
Le scope session est également utilisé dans les applications web. Une instance unique du Bean est créée pour chaque session utilisateur, et cette instance reste active tant que la session est valide.
exemple:
```bash
<bean id="monBean" class="com.example.MonBean" scope="session"/>
```