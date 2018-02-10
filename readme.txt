 Tytuł: System zgłoszeń z możliwością zapisu do bazy danych MySQL.
 Autor: Drakon.
 Wersja: 1.0 Beta (Nietestowana)

1. Instalacja:
 - Zawartość folderu "Skrypt" należy przenieść do katalogu głównego naszego serwera SA-MP.
 - Wszelkie zapytania o scalanie folderów oraz podmianę plików zatwierdzić.
 - Dodać nazwę skryptu ("warnSystem") do pliku "server.cfg" w linijce "filterscripts" oraz nazwy potrzebnych pluginów ("mysql", "sscanf")
   w linijce "plugins". (Jeżeli serwer pracuje na Linux'ie, należy do nazw pluginów dodać rozszerzenie ".so" (np. "sscanf.so")).
   Windows tego nie wymaga - wystarczy sama nazwa lub z rozszerzeniem ".dll".
 - Uruchomić, zrestartować serwer lub wpisać w konsoli polecenie "loadfs warnSystem" - jeżeli wyświetliła się
   wiadomość "Filterscript 'warnSystem.amx' loaded." to wszystko przebiegło pomyślnie.

2. Konfiguracja skryptu:
Konfiguracja skryptu jest bardzo prosta. Po pierwszym uruchomieniu skryptu, utworzy nam się plik konfiguracyjny 
(domyślnie w "/scriptfiles/DrakonScripts/WarnSystem/") o nazwie warnSystem.ini. Należy go ustawić wg. własnych upodobań.
 - mysql_host - host do bazy danych mysql
 - mysql_user - nazwa użytkownika =/=
 - mysql_password - hasło =/=
 - mysql_db - nazwa bazy danych
 - table_prefix - prefix nazwy tabeli do zapisu zgłoszeń
 - savingType - "0" jeżeli zgłoszenia mają być zapisywane tylko przy nieobecności administracji, "1" - jeżeli zawsze

3. Uwagi:
 - Zabraniam zmiany autora skryptu.
 - Zezwalam na zmiany w skrypcie, ale z zachowaniem prawdziwego autora.
 - Zabraniam używania skryptu do celów komercyjnych.
 - Oczywiste jest, że skrypt wymaga bazy danych MySQL, którą ZA DARMO można utworzyć tutaj:
   (http://pawno.pl/index.php?app=database)

Dziękuję za skorzystanie z mojego skryptu.
Pozdrawiam serdecznie.
