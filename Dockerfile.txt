# Використовуємо офіційний образ Jenkins
FROM jenkins/jenkins:lts

# Перемикаємось на користувача root для встановлення додаткових пакетів
USER root

# Встановлюємо необхідні пакети для Jenkins
RUN apt-get update && apt-get install -y \
    git \
    maven \
    default-jdk \
    && apt-get clean

# Повертаємось до користувача jenkins
USER jenkins

# Налаштовуємо середовище Jenkins
ENV JENKINS_HOME=/var/jenkins_home

# Відкриваємо порт для Jenkins
EXPOSE 8080

# Запускаємо Jenkins
ENTRYPOINT ["jenkins.sh"]
