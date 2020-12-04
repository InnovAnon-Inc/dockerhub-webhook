# DockerHub Web Hook
REST API Service to receive DockerHub Web Hooks
==========

- Create the secret .env for runit:
  ```
  API_KEY=...
  mkdir             .env/DOCKERHOOK_TOKEN
  echo "$API_KEY" > .env/DOCKERHOOK_TOKEN
  ```
- Install the software:
  ```
  sudo ./install.sh
  ```
- Activate the service:
  ```sudo ./activate.sh```
