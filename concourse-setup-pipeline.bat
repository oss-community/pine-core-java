fly --target pine destroy-pipeline --pipeline pine-core-java

fly --target pine set-pipeline ^
--pipeline pine-core-java ^
--config .\ci\concourse\pipeline.yml ^
--load-vars-from .\ci\concourse\credentials.yml

fly --target pine unpause-pipeline --pipeline pine-core-java