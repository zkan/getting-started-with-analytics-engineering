# Getting Started with Analytics Engineering

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/)

## Getting Started

To start the Docker compose:

```sh
make up
```

### To set up and activate Python virtual environment

```bash
python -m venv ENV
source ENV/bin/activate
pip install -r requirements.txt
```

### To initialize a dbt project

```bash
dbt init
```

**Note:** Let's specify the project name `greenery`.

### To set up your dbt profile

1. Create `profiles.yml` under your dbt project.
1. Add the content below to the file, change the output and target to your name
   (e.g., `dbt_john`), and save.

    ```yaml
    greenery:

      outputs:
        dbt_zkan:
          type: postgres
          threads: 1
          host: localhost
          port: 5432
          user: postgres
          pass: "{{ env_var('DBT_ENV_SECRET_PG_PASSWORD') }}"
          dbname: greenery
          schema: dbt_zkan

        prod:
          type: postgres
          threads: 1
          host: localhost
          port: 5432
          user: postgres
          pass: "{{ env_var('DBT_ENV_SECRET_PG_PASSWORD') }}"
          dbname: greenery
          schema: prod

      target: dbt_zkan
    ```

1. Set the environment variable.

    ```bash
    export DBT_ENV_SECRET_PG_PASSWORD=postgres
    ```

### To debug the dbt project

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt debug
```

### To create your data models

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt run
```

### To test your data models

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt test
```
