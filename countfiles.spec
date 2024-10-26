Name:           countfiles
Version:        1.0
Release:        1%{?dist}
Summary:        Utility to count files in a directory

License:        GPL
Source0:        count_files.sh

%description
Скрипт, який рахує кількість файлів у каталозі /etc.

%prep

%build

%install
mkdir -p %{buildroot}/usr/local/bin
cp %{SOURCE0} %{buildroot}/usr/local/bin/count_files.sh

%files
/usr/local/bin/count_files.sh

%changelog
* Fri Oct 20 2023 Your Name <your.email@example.com> - 1.0-1
- Initial package
