### How to shout down the database

From the current folder run command **docker-compose rm --force**

### How to recreate database

Create a new folder in the current folder named **target**, take **psd2-tpp-config-ci-develop-SNAPSHOT-DB.zip** and unzip it there.

From the current folder run command **docker-compose up --build -d**
