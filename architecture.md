# Restaurant Maintenance App Architecture

```mermaid
flowchart TD
    User[User]
    Web[Phoenix Web Endpoint]
    Domain[RestaurantMaintenance Domain]
    Resources[Resources: Restaurant, Equipment, MaintenanceRequest]
    Repo[AshPostgres Repo]
    DB[(Postgres Database)]

    User --> Web
    Web --> Domain
    Domain --> Resources
    Resources --> Repo
    Repo --> DB
```
- **User** interacts with the web endpoint.
- **Phoenix Web Endpoint** handles HTTP requests.
- **Domain** contains business logic.
- **Resources** define entities and actions.
- **Repo** communicates with the database.
