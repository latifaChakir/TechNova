# TechNova
# Table des matières

- [Spring Framework](#spring-framework)
- [Caractéristiques principales de Spring](#caractéristiques-principales-de-spring)
- [L'Inversion de contrôle (IoC)](#linversion-de-contrôle-ioc)
- [Gestion des Beans](#gestion-des-beans)
- [ApplicationContext](#applicationcontext)
- [Spring Core Annotation](#spring-core-annotation)
- [Spring Data JPA](#spring-data-jpa)
- [Spring MVC](#spring-mvc)

## Spring Framework
est un framework open-source, puissant et polyvalent pour le développement d'applications Java. Il permet aux développeurs de créer des applications Java robustes, bien structurées, évolutives, et faciles à maintenir.
Le framework est modulable, ce qui signifie que vous pouvez utiliser seulement les modules nécessaires à votre projet, ou le framework dans son intégralité. Parmi les modules les plus utilisés, on trouve 
Spring Core, Spring MVC, Spring Data, Spring Security, et Spring Boot.
## Caractéristiques principales de Spring
- Injection de dépendances (DI) :C’est un des concepts fondamentaux du framework, permettant la gestion des objets et de leurs dépendances sans avoir à les instancier manuellement dans le code.
- Programmation orientée aspect (AOP): Permet de séparer les préoccupations transversales (comme la gestion des transactions ou la gestion des logs) du reste du code métier.
- Intégration facile avec d'autres technologies: Spring s’intègre bien avec d’autres frameworks et bibliothèques comme Hibernate, JPA.
- Facilité de test : Le framework permet un développement orienté test, en rendant les composants facilement testables grâce à l'injection de dépendances.
## L'inversion de contrôle (IoC
est un principe de conception qui permet aux développeurs de se concentrer sur la logique métier de l'application, en déléguant la gestion des objets et de leurs dépendances à un framework (comme Spring). Cela signifie que c'est le framework, plutôt que l'application elle-même, qui gère la création, la configuration et le cycle de vie des objets. Ainsi, IoC simplifie la structure du code et réduit le couplage entre les composants, rendant l'application plus modulaire et plus facile à maintenir. 
## Example
``` java
<bean id="userDao" class="com.example.techNovaa.dao.UserDao" />
<bean id="userService" class="com.example.techNovaa.service.UserService">
    <constructor-arg ref="userDao"/>
</bean>
```
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
``` java
  <bean id="monBean" class="com.example.MonBean" scope="singleton"/>
```
### 2. Prototype
signifie qu'une nouvelle instance du Bean est créée à chaque fois qu'il est demandé. Ce scope est utile si vous avez besoin d'une nouvelle instance à chaque demande.
exemple:
``` java
<bean id="monBean" class="com.example.MonBean" scope="prototype"/>
```
### 3. Request (Demande HTTP)
Le scope request est utilisé dans les applications web. Chaque requête HTTP reçoit une instance distincte du Bean.
exemple:
``` java
<bean id="monBean" class="com.example.MonBean" scope="request"/>
```
### 4. Session
Le scope session est également utilisé dans les applications web. Une instance unique du Bean est créée pour chaque session utilisateur, et cette instance reste active tant que la session est valide.
exemple:
``` java
<bean id="monBean" class="com.example.MonBean" scope="session"/>
```
## ApplicationContext
est l'interface centrale pour configurer et gérer les beans Spring. Il est responsable de l'injection de dépendances, de la gestion du cycle de vie des beans, et d'autres fonctionnalités importantes.
### Example
``` java
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = context.getBean(UserService.class);
```
## Spring Core Annotation
- **@Component** : permet à Spring de scanner les classes et de les instancier automatiquement.
- **@Service**: Cette annotation clarifie que la classe implémente une logique métier.
- **@Repository**: est utilisé dans la couche de persistance pour encapsuler la logique d'accès aux données.
-**@Controller**: Elle est responsable de gérer les requêtes HTTP et de renvoyer des réponses HTTP.
- **@Autowired**:Cette annotation permet l'injection automatique de dépendances dans un bean
- **@Scope**:pour définir la portée (scope) d'un bean Spring, c'est-à-dire son cycle de vie dans l'application.
- **@PostConstruct et @PreDestroy**: Utilisées pour marquer les méthodes qui doivent être exécutées après l'initialisation d'un bean (@PostConstruct) ou avant sa destruction (@PreDestroy).

## Spring Data JPA
permet aux développeurs de manipuler des données dans une base de données relationnelle de manière efficace tout en minimisant la quantité de code à écrire.
L'objectif principal de Spring Data JPA est de simplifier les opérations CRUD (Créer, Lire, Mettre à jour, Supprimer) en réduisant la quantité de code "boilerplate" nécessaire pour implémenter les couches d'accès aux données.
### les avantages de JPA
- Réduction du code
- Facilité de pagination et de tri findAll(Sort.by(Sort.Direction.ASC, "nom"));findAll(PageRequest.of(0, 5));
- Support des transactions
### Comment utiliser JPA
``` java
public interface UserDao extends JpaRepository<User, Long> {}
```

## Spring MVC
**Spring MVC** (Model-View-Controller) est un framework au sein de Spring qui facilite le développement d'applications web basées sur l'architecture MVC. 
### Fonctionnement général :
- L'utilisateur fait une requête HTTP (comme en accédant à une URL).
- La requête est interceptée par le DispatcherServlet, qui est le cœur de Spring MVC. Il agit comme un contrôleur frontal pour toutes les requêtes.
- Le Controller associé traite la requête, effectue les opérations nécessaires (comme appeler un service pour récupérer des données) et renvoie un modèle avec des données.
- Le DispatcherServlet passe le modèle à une vue qui est rendue pour renvoyer une réponse à l'utilisateur.
 ### Exemple
``` java
@Controller
@RequestMapping("/users")
public class UserController {
    private final UserService userService;
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping
    public String getAllUsers(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "users-list";
    }
```



