



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



## Seeds and Sources

### Working with Seeds

Seeds in DBT are CSV files that you can load into your data warehouse. They're useful for static refernce data like country codes, ZIP code mappings or product mappings


## Slowly Changing Dimensions

#### Understanding SCD Types

1) Type 0 (No Change): Historical Changes are not tracked
2) Type 1 (Overwrite): Only the current values are maintained, historical values are overwritten
3) Type 2 (Add new Row) : Historical changes are tracked by adding new rows with effective dates.
4) Type 3 (Add new Attribute): Limited Historical values are maintained in additional columns.
5) Type 4 (History Table): Current values in main table, historical values in separate history table.
6) Type 6 (Hybrid/Combined Approach): Combines Type 1,2 and 3 



## Snapshots

#### What are Snapshots?

Snapshots in DBT are built in implementation of Type 2 Slowly Changing Dimensions. They record the state of a mutable table over time by
- Tracking changes to specified columns
- Adding effective dates (dbt_valid_from and dbt_valid_to)
- Maintaining a complete history of changes


DBT offers two main strategies for snapshots:

1) Timestamp Strategy
    This strategy uses a timestamp column to identify changes


## Testing

#### Types of Tests


DBT supports two main types of tests:
1) Generic Tests: Reusable tests that can be applied to multiple models
2) Singular Tests: Custom SQL Queries that test specific conditions.


#### Generic Tests

Generic tests are reusable assertions about your models.DBT comes with four built in generic tests:
1) Unique: Tests that values in a column are unique.
2) Not Null: Tests that a column contains no null values.
3) Relationships: Tests referential integrity between tables.
4) Accepted Values: Tests that values in a column are from a defined set.


## Macros

Macros in DBT are reusable pieces of SQL code, similar to functions in other programming languages. They use Jinja, a templating language, to generate SQL dynamically.
Benefits of macros:
- Reduce code duplication
- Encapsulate complex logic
- Make your code more maintainable

## Analysis

#### Creating Analysis Files

Analysis files in DBT are SQL queries that dont create object in your warehouse.They're useful for:
- Ad-hoc analysis
- exploratory data analysis
- testing complex Queries
- Generating reports
