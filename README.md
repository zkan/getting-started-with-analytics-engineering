# Getting Started with Analytics Engineering

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/)

## Getting Started

To start the Docker compose:

```sh
make up
```

### To initialize a dbt project:

```sh
dbt init
```

**Note:** Let's specify the project name `greenery`.

### To set up your dbt profile:

1. Create `profiles.yml` under your dbt project.
1. Add the content below to the file and save.

    ```yaml
    greenery:

      outputs:
        dev:
          type: postgres
          threads: 1
          host: localhost
          port: 5432
          user: postgres
          pass: "{{ env_var('DBT_ENV_SECRET_PG_PASSWORD') }}"
          dbname: greenery
          schema: public

        prod:
          type: postgres
          threads: 1
          host: localhost
          port: 5432
          user: postgres
          pass: "{{ env_var('DBT_ENV_SECRET_PG_PASSWORD') }}"
          dbname: greenery
          schema: prod

      target: dev
    ```

1. Set the environment variable:

    ```bash
    export DBT_ENV_SECRET_PG_PASSWORD=postgres
    ```

### To debug the dbt project:

```sh
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt debug
```

### To create your data models:

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt run
```

### To test your data models:

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt test
```
