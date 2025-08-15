# Introduction

* Ash is declarative, resource oriented, application framework for building application.
* Ash does not handle the web-specific aspects like routing and templating.

## Key aspects of Ash
Declarative Design:
    * It describe what your application does rather than how it does.

Resource-Oriented:
    * Ash models the core entities of your system as resources.
    * Resource encapsulate the data, actions and relationships, providing a centralized defination for various aspects of your applications.


Domain-Centric:
    * Ash focuses on modeling your business domain and logic. It aims to provide strong opinions on how to structure your application's core, allowing for easier understanding and modification over time

Derivable Interfaces:
    * By defining your resources and actions declaratively, Ash can automatically derive various interfaces, such as database migrations, API endpoints, and even user interfaces (with appropriate integrations).

Complementary to Phoenix:
    * While Ash provides a robust application layer, it is commonly used in conjunction with Phoenix for building web interfaces.

Focus on Maintainability and Scalability:
    * The declarative and resource-oriented approach of Ash aims to reduce complexity and make applications easier to understand, maintain, and scale, especially for teams.


    