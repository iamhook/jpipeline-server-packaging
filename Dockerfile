FROM openjdk:11
RUN mkdir /home/jpipeline
RUN groupadd jpipeline && useradd -g jpipeline jpipeline
USER jpipeline:jpipeline
WORKDIR "/home/jpipeline/.jpipeline"
ARG MANAGER_JAR_FILE=jpipeline/jpipeline-manager/build/libs/jpipeline-manager.jar
ARG EXECUTOR_JAR_FILE=jpipeline/jpipeline-executor/build/libs/jpipeline-executor.jar
ARG WORKFLOW_CONFIG_FILE=jpipeline/workflow-config.json
COPY --chown=jpipeline:jpipeline ${MANAGER_JAR_FILE} jpipeline-manager.jar
COPY --chown=jpipeline:jpipeline ${EXECUTOR_JAR_FILE} jpipeline-executor.jar
COPY --chown=jpipeline:jpipeline ${WORKFLOW_CONFIG_FILE} workflow-config.json
RUN mkdir libs
ENTRYPOINT ["java","-jar","jpipeline-manager.jar"]
EXPOSE 9543
EXPOSE 7000