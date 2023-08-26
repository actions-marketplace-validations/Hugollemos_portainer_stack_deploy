# github deploy portainer

GitHub Action for deploy to portainer.

## ENV's 

- API_URL 
- API_KEY 
- FILE_PATH 
- STACK_NAME

| Name           | Description                                   | Required when           | 
|----------------|-----------------------------------------------|-------------------------|
| `API_URL`     | url                                      | Username-password auth  |
| `API_KEY`     | token do portainer                                      | Username-password auth  |
| `FILE_PATH`   | caminho do arquivo                      | Client certificate auth |
| `STACK_NAME` | nome da stack | Optional                |


## como usar

```yaml
      -
        name: deploy
        uses: Hugollemos/portainer@v1
        env:
          API_URL: ${{ secrets.API_URL }}
          API_KEY: ${{ secrets.API_KEY }}
          FILE_PATH: "./docker-compose.yml"
          STACK_NAME: nome da sua stack
```
## License
