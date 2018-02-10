 Tytu�: System zg�osze� z mo�liwo�ci� zapisu do bazy danych MySQL.
 Autor: Drakon.
 Wersja: 1.0 Beta (Nietestowana)

1. Instalacja:
 - Zawarto�� folderu "Skrypt" nale�y przenie�� do katalogu g��wnego naszego serwera SA-MP.
 - Wszelkie zapytania o scalanie folder�w oraz podmian� plik�w zatwierdzi�.
 - Doda� nazw� skryptu ("warnSystem") do pliku "server.cfg" w linijce "filterscripts" oraz nazwy potrzebnych plugin�w ("mysql", "sscanf")
   w linijce "plugins". (Je�eli serwer pracuje na Linux'ie, nale�y do nazw plugin�w doda� rozszerzenie ".so" (np. "sscanf.so")).
   Windows tego nie wymaga - wystarczy sama nazwa lub z rozszerzeniem ".dll".
 - Uruchomi�, zrestartowa� serwer lub wpisa� w konsoli polecenie "loadfs warnSystem" - je�eli wy�wietli�a si�
   wiadomo�� "Filterscript 'warnSystem.amx' loaded." to wszystko przebieg�o pomy�lnie.

2. Konfiguracja skryptu:
Konfiguracja skryptu jest bardzo prosta. Po pierwszym uruchomieniu skryptu, utworzy nam si� plik konfiguracyjny 
(domy�lnie w "/scriptfiles/DrakonScripts/WarnSystem/") o nazwie warnSystem.ini. Nale�y go ustawi� wg. w�asnych upodoba�.
 - mysql_host - host do bazy danych mysql
 - mysql_user - nazwa u�ytkownika =/=
 - mysql_password - has�o =/=
 - mysql_db - nazwa bazy danych
 - table_prefix - prefix nazwy tabeli do zapisu zg�osze�
 - savingType - "0" je�eli zg�oszenia maj� by� zapisywane tylko przy nieobecno�ci administracji, "1" - je�eli zawsze

3. Uwagi:
 - Zabraniam zmiany autora skryptu.
 - Zezwalam na zmiany w skrypcie, ale z zachowaniem prawdziwego autora.
 - Zabraniam u�ywania skryptu do cel�w komercyjnych.
 - Wszelkie b��dy prosz� zg�asza� na maila: "drakon.biznes@gmail.com"
 - Oczywiste jest, �e skrypt wymaga bazy danych MySQL, kt�r� ZA DARMO mo�na utworzy� tutaj:
   (http://pawno.pl/index.php?app=database)

Dzi�kuj� za skorzystanie z mojego skryptu.
Pozdrawiam serdecznie.
