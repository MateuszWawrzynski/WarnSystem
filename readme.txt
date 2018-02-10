 Tytu³: System zg³oszeñ z mo¿liwoœci¹ zapisu do bazy danych MySQL.
 Autor: Drakon.
 Wersja: 1.0 Beta (Nietestowana)

1. Instalacja:
 - Zawartoœæ folderu "Skrypt" nale¿y przenieœæ do katalogu g³ównego naszego serwera SA-MP.
 - Wszelkie zapytania o scalanie folderów oraz podmianê plików zatwierdziæ.
 - Dodaæ nazwê skryptu ("warnSystem") do pliku "server.cfg" w linijce "filterscripts" oraz nazwy potrzebnych pluginów ("mysql", "sscanf")
   w linijce "plugins". (Je¿eli serwer pracuje na Linux'ie, nale¿y do nazw pluginów dodaæ rozszerzenie ".so" (np. "sscanf.so")).
   Windows tego nie wymaga - wystarczy sama nazwa lub z rozszerzeniem ".dll".
 - Uruchomiæ, zrestartowaæ serwer lub wpisaæ w konsoli polecenie "loadfs warnSystem" - je¿eli wyœwietli³a siê
   wiadomoœæ "Filterscript 'warnSystem.amx' loaded." to wszystko przebieg³o pomyœlnie.

2. Konfiguracja skryptu:
Konfiguracja skryptu jest bardzo prosta. Po pierwszym uruchomieniu skryptu, utworzy nam siê plik konfiguracyjny 
(domyœlnie w "/scriptfiles/DrakonScripts/WarnSystem/") o nazwie warnSystem.ini. Nale¿y go ustawiæ wg. w³asnych upodobañ.
 - mysql_host - host do bazy danych mysql
 - mysql_user - nazwa u¿ytkownika =/=
 - mysql_password - has³o =/=
 - mysql_db - nazwa bazy danych
 - table_prefix - prefix nazwy tabeli do zapisu zg³oszeñ
 - savingType - "0" je¿eli zg³oszenia maj¹ byæ zapisywane tylko przy nieobecnoœci administracji, "1" - je¿eli zawsze

3. Uwagi:
 - Zabraniam zmiany autora skryptu.
 - Zezwalam na zmiany w skrypcie, ale z zachowaniem prawdziwego autora.
 - Zabraniam u¿ywania skryptu do celów komercyjnych.
 - Wszelkie b³êdy proszê zg³aszaæ na maila: "drakon.biznes@gmail.com"
 - Oczywiste jest, ¿e skrypt wymaga bazy danych MySQL, któr¹ ZA DARMO mo¿na utworzyæ tutaj:
   (http://pawno.pl/index.php?app=database)

Dziêkujê za skorzystanie z mojego skryptu.
Pozdrawiam serdecznie.
