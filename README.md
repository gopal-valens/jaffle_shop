## Testing dbt project: `jaffle_shop`

`jaffle_shop` is a fictional ecommerce store. This dbt project transforms raw data from an app database into a customers and orders model ready for analytics.

### What is this repo?
What this repo _is_:
- A self-contained playground dbt project, useful for testing out scripts, and communicating some of the core dbt concepts.

What this repo _is not_:
- A tutorial — check out the [Getting Started Tutorial](https://docs.getdbt.com/tutorial/setting-up) for that. Notably, this repo contains some anti-patterns to make it self-contained, namely the use of seeds instead of sources.
- A demonstration of best practices — check out the [dbt Learn Demo](https://github.com/dbt-labs/dbt-learn-demo) repo instead. We want to keep this project as simple as possible. As such, we chose not to implement:
    - our standard file naming patterns (which make more sense on larger projects, rather than this five-model project)
    - a pull request flow
    - CI/CD integrations
- A demonstration of using dbt for a high-complex project, or a demo of advanced features (e.g. macros, packages, hooks, operations) — we're just trying to keep things simple here!

### What's in this repo?
This repo contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app.

The raw data consists of customers, orders, and payments, with the following entity-relationship diagram:

![Jaffle Shop ERD](/etc/jaffle_shop_erd.png)


### Running this project
To get up and running with this project:
1. Install dbt using [these instructions](https://docs.getdbt.com/docs/installation).

2. Clone this repository.

3. Change into the `jaffle_shop` directory from the command line:
```bash
$ cd jaffle_shop
```

4. Set up a profile called `jaffle_shop` to connect to a data warehouse by following [these instructions](https://docs.getdbt.com/docs/configure-your-profile). If you have access to a data warehouse, you can use those credentials – we recommend setting your [target schema](https://docs.getdbt.com/docs/configure-your-profile#section-populating-your-profile) to be a new schema (dbt will create the schema for you, as long as you have the right privileges). If you don't have access to an existing data warehouse, you can also setup a local postgres database and connect to it in your profile.

5. Ensure your profile is setup correctly from the command line:
```bash
$ dbt debug
```

6. Load the CSVs with the demo data set. This materializes the CSVs as tables in your target schema. Note that a typical dbt project **does not require this step** since dbt assumes your raw data is already in your warehouse.
```bash
$ dbt seed
```

7. Run the models:
```bash
$ dbt run
```

> **NOTE:** If this steps fails, it might mean that you need to make small changes to the SQL in the models folder to adjust for the flavor of SQL of your target database. Definitely consider this if you are using a community-contributed adapter.

8. Test the output of the models:
```bash
$ dbt test
```

9. Generate documentation for the project:
```bash
$ dbt docs generate
```

10. View the documentation for the project:
```bash
$ dbt docs serve
```

# Installation

- Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the dev requirements ([dbt](https://www.getdbt.com/), [pre-commit](https://pre-commit.com/))
- Run `pre-commit install` to set up your git hook scripts. This will set your hooks so that the next time you commit, pre-commit will be invoked (note: on its first invocation, pre-commit will need to install its own dependencies which may take a minute; these dependencies will be installed outside of your project and will be available from that moment onwards).

```bash
$ pip install -r requirements.txt
$ pre-commit install
```

# Working with Pre-Commit
- Pre-commit is configured to run various checks automatically when you attempt to commit your code.
- Pre-commit will only run against changed files to keep its execution as quick as possible.
- On its first execution, pre-commit will install any dependencies it needs into a virtual environment (located outside of this repo); this may take a few minutes on its first run, but every following run will reuse that env and as a result will be much quicker.

## Working with SQLFluff
- SQLFluff lint is configured as a pre-commit hook that runs on commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run SQLFluff lint manually, or would like to run it in fix mode, you can do so with the following commands which will run them through pre-commit. 
```bash
pre-commit run --hook-stage commit sqlfluff-lint --all-files
pre-commit run --hook-stage manual sqlfluff-fix --all-files
```

## Working with YAMLLint
- YAMLLint is configured as a pre-commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run YAMLLint manually, you can do so with the following command which will run it through pre-commit.
```bash
pre-commit run --hook-stage commit yamllint
```

## Working with dbt-checkpoint
- dbt-checkpoint is configured as a set of pre-commit hooks, so in most cases no explicit commands are needed. These hooks will ensure the dbt project is following standard convention. This will only list errors and will not fix any errors if found.
- If you would like to run dbt-checkpoint manually, you can do so with the following command which will run it through pre-commit. Replace `{{dbt-checkpoint hook_id}}` with the name of the hook you want to run (e.g. `check-model-has-tests`).
```bash
pre-commit run {{dbt-checkpoint hook_id}} --hook-stage commit --all-files
```