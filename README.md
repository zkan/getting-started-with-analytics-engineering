# Getting Started with Analytics Engineering

## Getting Started

To start the Docker compose:

```sh
make up
```

### To Set Up and Activate Your Python Virtual Environment

```bash
python -m venv ENV
source ENV/bin/activate
pip install -r requirements.txt
```

### To Initialize A dbt Project

```bash
dbt init
```

**Note:** Let's specify the project name `greenery`.

### To Set Up Your dbt Profile

1. Change the directory to your dbt project.

    ```bash
    cd <dbt_project_name>
    ```

1. Run the following command to copy the profiles example file to the real
   profiles file in the project folder.

    ```bash
    cp ../yaml_files/profiles.yml .
    ```

1. Edit the content in the `profiles.yml` file by changing the output and
   target to your name (e.g., `dbt_john`), and save. See the example below.

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

1. We then should be able to use dbt now. :-)

### To Debug The dbt Project

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt debug
```

### To Create Your Data Models

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt run
```

### To Test Your Data Models

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt test
```

### To Generate The dbt Documentation and Serve It

```bash
export DBT_ENV_SECRET_PG_PASSWORD=postgres
cd <dbt_project_name>
dbt docs generate
dbt docs serve
```
