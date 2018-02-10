
/*
 *		Tytu³: System zg³oszeñ z mo¿liwoœci¹ ich zapisu w bazie danych MySQL.
 *		Autor: Drakon
 *		Wersja: 1.0 Beta (Nietestowana)
 *		Data ostatniej modyfikacji: 12.07.2015r
 */


#include <a_samp>
#include <sscanf2>
#include <zcmd>
#include <DOF2>
#include <mysql>	//StrickenKid


#define		WARNSYSTEM_FILENAME		"DrakonScripts/WarnSystem/warnSystem.ini"		//	œcie¿ka do pliku konfiguracyjnego (raczej nie zmieniaæ)
#define		IsAdmin(%0)				IsPlayerAdmin(%0)					//	sposób okreœlania gracza jako admina (mo¿na zmieniæ)
#define		SCM						SendClientMessage
#define		GUI						ShowPlayerDialog
#define		DIALOG_WARNINGS			123									//	do zmiany


new MySQL:database;
enum config_enum{
	mysql_host[32],							//	host do bazy danych mysql
	mysql_user[32],							//	nazwa u¿ytkownika do bazy danych mysql
	mysql_password[32],						//	has³o do konta do bazy danych mysql
	mysql_db[32],							//	nazwa bazy danych
	table_prefix[16],						//	prefix nazwy tabeli jaka ma byæ u¿ywana
	savingType								//	"0" je¿eli zg³oszenia maj¹ byæ zapisywane tylko przy nieobecnoœci administracji, "1" - je¿eli zawsze
};
new WarnConfig[config_enum];


public OnFilterScriptInit(){
	print("-----------------------------------------------------");
	print("[WARN-SYSTEM] Skrypt rozpoczyna prace...");
	if(!DOF2_FileExists("DrakonScripts")) return print("[WARN-SYSTEM] Nie utworzono folderu na pliki konfiguracyjne (scriptfiles/DrakonScripts)!");
	if(!DOF2_FileExists(WARNSYSTEM_FILENAME)){
		print("[WARN-SYSTEM] Nie znaleziono pliku konfiguracyjnego...");
		DOF2_CreateFile(WARNSYSTEM_FILENAME, " ");
		DOF2_SaveFile();
		printf("[WARN-SYSTEM] ...utworzono (%s)", WARNSYSTEM_FILENAME);
		DOF2_SetString(WARNSYSTEM_FILENAME, "mysql_host", "host");
		DOF2_SetString(WARNSYSTEM_FILENAME, "mysql_user", "user");
		DOF2_SetString(WARNSYSTEM_FILENAME, "mysql_password", "password");
		DOF2_SetString(WARNSYSTEM_FILENAME, "mysql_db", "db");
		DOF2_SetString(WARNSYSTEM_FILENAME, "table_prefix", "table_prefix");
		DOF2_SetInt(WARNSYSTEM_FILENAME, "savingType", 0);
		printf("[WARN-SYSTEM] Ustawiono domyslne opcje w pliku konfiguracyjnym!\n(%s)", WARNSYSTEM_FILENAME);
		print("[WARN-SYSTEM] Ustaw koniecznie plik konfiguracyjny wedlug upodoban!");
	}else{
		print("[WARN-SYSTEM] Wczytywanie ustawien z pliku konfiguracyjnego...");
		strcopy(WarnConfig[mysql_host], DOF2_GetString(WARNSYSTEM_FILENAME, "mysql_host"));
		strcopy(WarnConfig[mysql_user], DOF2_GetString(WARNSYSTEM_FILENAME, "mysql_user"));
		strcopy(WarnConfig[mysql_password], DOF2_GetString(WARNSYSTEM_FILENAME, "mysql_password"));
		strcopy(WarnConfig[mysql_db], DOF2_GetString(WARNSYSTEM_FILENAME, "mysql_db"));
		strcopy(WarnConfig[table_prefix], DOF2_GetString(WARNSYSTEM_FILENAME, "table_prefix"));
		WarnConfig[savingType] = DOF2_GetInt(WARNSYSTEM_FILENAME, "savingType");
		printf("[WARN-SYSTEM] ...wczytano (%s)", WARNSYSTEM_FILENAME);
	}
	print("[WARN-SYSTEM] Proba polaczenia z baza danych...");
	database = mysql_init(1);
	new sql_handle = mysql_connect(WarnConfig[mysql_host], WarnConfig[mysql_user], WarnConfig[mysql_password], WarnConfig[mysql_db], database, .auto_reconnect = 1);
	if(sql_handle){
		print("[WARN-SYSTEM] Nie udalo siê uzyskac polaczenia z baza danych!");
		print("[WARN-SYSTEM] Serwer zostaje zamkniety!");
		SendRconCommand("exit");
	}else{
		print("[WARN-SYSTEM] ...polaczono!");
		print("[WARN-SYSTEM] Sprawdzanie/tworzenie tabel w bazie danych...");
		new string[256];
		format(string, 256, "CREATE TABLE IF NOT EXISTS %s_warnings(wid INT(10) NOT NULL AUTO_INCREMENT, nick CHAR(25), data CHAR(50), tresc CHAR(128), PRIMARY KEY(wid))", WarnConfig[table_prefix]);
		if(mysql_query(string)) mysql_ping();
		print("[WARN-SYSTEM] ...zakonczono!");
		print("[WARN-SYSTEM] Skrypt zostal uruchomiony!");
	}
	print("-----------------------------------------------------");
	return 1;
}
public OnFilterScriptExit(){
	mysql_close(database);
	DOF2_Exit();
	return 1;
}


CMD:report(playerid, params[]){
	new string[256], id, tresc[128], adm;
	if(sscanf(params, "is[128]", id, tresc)) return SCM(playerid, -1, "U¿yj: /report [id gracza] [tresc zg³oszenia]");
	if(!IsPlayerConnected(id)) return SCM(playerid, -1, "Nie ma takiego gracza!");
	for(new a; a < GetMaxPlayers(); a++){
		if(IsAdmin(a)){
			adm++;
			format(string, 256, "[WARN] %s[%d]: %s[%d] %s", PlayerName(playerid), playerid, PlayerName(id), id, tresc);
			SCM(a, -1, string);
		}
	}
	if(adm == 0){
		new query[128];
		format(query, 128, "INSERT INTO %s_warnings SET nick='%s', data='%s', tresc='%s - %s'", PlayerName(playerid), CurrentTimeInString(), PlayerName(id), tresc);
		if(mysql_query(query)) mysql_ping();
		SCM(playerid, -1, "Aktualnie nie ma ¿adnego administratora na serwerze, ale...");
		SCM(playerid, -1, "Twoje zg³oszenie zosta³o zapisane w bazie i zostanie odczytane póŸniej.");
		return SCM(playerid, -1, "Dziêkujemy za zg³oszenie!");
	}else{
		if(WarnConfig[savingType] == 1){
			new query[128];
			format(query, 128, "INSERT INTO %s_warnings SET nick='%s', data='%s', tresc='%s - %s'", PlayerName(playerid), CurrentTimeInString(), PlayerName(id), tresc);
			if(mysql_query(query)) mysql_ping();
			SCM(playerid, -1, "Twoje zg³oszenie zosta³o zapisane w bazie oraz dodatkowo wys³ane do administracji.");
			return SCM(playerid, -1, "Dziêkujemy za zg³oszenie!");
		}
	}
	return 1;
}
CMD:showreports(playerid, params[]){
	new string[1024], text[128], query[128], data[64], tresc[128];
	if(!IsAdmin(playerid)) return SCM(playerid, -1, "Nie jesteœ administratorem!");
	if(isnull(params))
	format(query, 128, "SELECT data, tresc FROM %s_warnings", WarnConfig[table_prefix]);
	if(mysql_query(query)) mysql_ping();
	mysql_store_result();
	strcat(string, "Data\tTreœæ\n");
	for(new a; a < mysql_num_rows(); a++){
		if(mysql_fetch_row(query, "|"))
			sscanf(query, "p<|>s[64]s[128]", data, tresc);
		format(text, 128, "%s\t%s\n", data, tresc);
		strcat(string, text);
	}
	mysql_free_result();
	GUI(playerid, DIALOG_WARNINGS, DIALOG_STYLE_TABLIST_HEADERS, "Lista warnów w bazie danych", string, "Otwórz", "WyjdŸ");
	return 1;
}


stock PlayerName(p){
	new N[MAX_PLAYER_NAME];
	GetPlayerName(p, N, MAX_PLAYER_NAME);
	return N;
}
stock CurrentTimeInString(){
	new str[32], rok, miesiac, dzien, godzina, minuta;
	getdate(rok, miesiac, dzien);
	gettime(godzina, minuta);
	format(str, 32, "%02d.%02d.%04d godz. %02d:%02d", dzien, miesiac, rok, godzina, minuta);
	return str;
}
stock strcopy(dest[], const source[], length = sizeof source){
	strins((dest[0] = EOS, dest), source, 0, length);
}

//	Koniec :)