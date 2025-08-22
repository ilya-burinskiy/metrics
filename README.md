## Запуск приложения
`source .env.dev`
```
docker run --name alerting-postgres --publish 5432:5432 \
           -e POSTGRES_PASSWORD=password -e POSTGRES_USER=alerting -d \
           postgres:latest
```
`mix ecto.create`
`mix phx.start`
