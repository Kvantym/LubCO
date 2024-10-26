FROM your-base-image

# Копіюємо RPM пакет
COPY countfiles-1.0-1.x86_64.rpm /usr/local/bin/countfiles-1.0-1.x86_64.rpm

# Копіюємо скрипт
COPY count_files.sh /usr/local/bin/count_files.sh
RUN chmod +x /usr/local/bin/count_files.sh

# Встановлюємо RPM пакет
RUN rpm -ivh /usr/local/bin/countfiles-1.0-1.x86_64.rpm
