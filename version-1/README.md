### Book Reminder - Version 1

In this example, the project is maintained in a separate repository and is cloned during the build process.

Update the secret key in the [secret_key_base file](secret_key_base) if need be.

Available Build Args/Environment Variables (located in [.env](.env))

| Name | Defaults |
| ------ | ------ |
| RUBY_VERSION | 2.4.9 |
| RAILS_ENV | production |
| PORT | 8080 |
| REPO | https://github.com/andrewnk/book_reminder.git |
| REPO_BRANCH | master |

To build and start the project, run:

```
docker-compose up -d --build
```

Once the project has finished building, you can view the application by accessing:

[http://localhost:8080](http://localhost:8080) (be sure to change the port if you modified the env variable)


To backup a database file you can run the following command (example is for the production db, i.e. production.sqlite3):
```
docker run --rm --user=${UID}:${GID} --volumes-from book-reminder-app -v $(pwd):/backup alpine tar -C /usr/src/app/db/ -czvf /backup/backup-$(date +%Y-%m-%d).tar.gz production.sqlite3
```