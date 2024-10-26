FROM jenkins/jenkins:lts

USER root

# Встановлюємо інструменти для побудови RPM та DEB
RUN apt-get update && apt-get install -y \
    rpm \
    dpkg-dev \
    && apt-get clean

USER jenkins
