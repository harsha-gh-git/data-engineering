



# Learning

### Why DBT?

Before DBT, data transformation work was often done through
1. SQL scripts: Manually maintained, often with no version control
2. ETL tools: Complex and expensive tools that required specialized knowledge
3. Custom Code: Python, Scala or other programming languages used to transform data

Also we did have 
1. Maintainability Issues
2. Lack of Testing
3. Poor Documentation
4. Dependency Management
5. Collaboration difficulties

### Using DBT

We can achieve
1. Modularity: Break down complex transformations into manageable pieces
2. Reusability: Create and reuse common SQL patterns across your project,
3. Testing framework: Built in testing capabilities to ensure data quality
4. Documentation generation: Automatically generate documentation for your data models
5. Dependency management: Automatically handle the order of model execution
6. Development workflow: Support for developement environments separate from production


DataWarehouse is a central repository designed for storing and analyzing large volumes of structured data from various sources

DataLake is a storage repository that holds a vast amount of raw data in its native format until its needed

DataLakehouse is a relatively new architecture that combines the best elements of data warehouse and data lakes.

ETL is Extract Transform load
ELT is Extract Load Transform
the last transform here is done by dbt

## About the Project

we are dealing with Netflix Movie Ratings Dataset. MovieLens 20M movie ratings. Stable benchmark dataset. 20 million ratings and 465,000 tag applications applied to 27,000 movies by 138,000 users. Includes tag genome data with 12 million relevance scores across 1,100 tags.




### What are DBT Models?

DBT models are SQL select statements that transform your data.Each model:
- Is defined in a .sql file
- Contains a single SELECT statement
- Produces a table or view in your data warehouse
- Can reference other models, creating a dependency graph

Models are the core building blocks of DBT projects and represent transformations applied to your data.






