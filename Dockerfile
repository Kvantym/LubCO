# Використовуємо базовий образ Jenkins LTS
FROM jenkins/jenkins:lts

# Перемикаємося на користувача root для встановлення пакетів
USER root

# Оновлюємо пакетний менеджер та встановлюємо необхідні пакети
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    rpm \
    dpkg-dev \
    build-essential \
    devscripts \
    debhelper \
    alien

# Встановлюємо Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

# Додаємо користувача Jenkins до групи Docker
RUN usermod -aG docker jenkins

# Копіюємо скрипт count_files.sh в образ
COPY countscript/count_files.sh /usr/local/bin/count_files.sh

# Змінюємо права доступу до скрипта, щоб його можна було виконувати
RUN chmod +x /usr/local/bin/count_files.sh

# Очищаємо кеш пакетного менеджера
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Повертаємося до користувача Jenkins
USER jenkins

# Встановлюємо плагіни Jenkins
RUN jenkins-plugin-cli --plugins \
    workflow-aggregator \
    git \
    docker-workflow

# Вказуємо команду, яка запускає Jenkins
CMD ["bash", "-c", "jenkins"]
