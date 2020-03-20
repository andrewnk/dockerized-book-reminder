### Book Reminder - Version 2

In this example, the project and the docker information are located in the same repo. Organizing it this way gives us a better overview into the project and associated services as well as allowing us to have an easy to setup development environment within the repo.

Update the secret key in the [secret_key_base file](secret_key_base) if need be.

Available Build Args/Environment Variables (located in [.env](.env))

| Name | Defaults |
| ------ | ------ |
| RUBY_VERSION | 2.4.9 |
| RAILS_ENV | production |
| PORT | 8181 |

To build and start the project, run:

```
docker-compose up -d --build
```

Once the project has finished building, you can view the application by accessing:

[http://localhost:8181](http://localhost:8181) (be sure to change the port if you modified the env variable)


To build and start a development environment, run:
```
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
```

Changes can then be made directly in the ```src``` dir and will be reflected within the docker container.


To backup a database file you can run the following command (example is for the production db, i.e. production.sqlite3):
```
docker run --rm --user=${UID}:${GID} --volumes-from book-reminder-app -v $(pwd):/backup alpine tar -C /usr/src/app/db/ -czvf /backup/backup-$(date +%Y-%m-%d).tar.gz production.sqlite3
```