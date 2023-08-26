# github deploy portainer

GitHub Action for deploy to portainer.

## ENV's 

- API_URL 
- API_KEY 
- FILE_PATH 
- STACK_NAME

| Name           | Description                                   | Exemple           | 
|----------------|-----------------------------------------------|-------------------------|
| `API_URL`     | URL do endpoint                                      | http://endpoint/api/stacks"  |
| `API_KEY`     | token do portainer                                      | avc_9d76asd978a6sd9asdadakljsdgaksdgasasd=  |
| `FILE_PATH`   | file path                      | './docker-compose.yml' |
| `STACK_NAME` | stack name | front                |


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
[MIT](https://github.com/Hugollemos/portainer/blob/main/LICENSE)