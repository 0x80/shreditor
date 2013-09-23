Vauxlab Licencing Tool
=======================

Notes
--------
* Iedere user krijgt een key waar user name al in geencrypt is.
* Die key zorgt samen met de system id voor de uiteindelijke license code
* De license code wordt gegenereerd door een algorithme online en wat ook in vx object zit
* Code wordt opgeslagen in application support


Moeilijke Versie
---------------
System id met online registratie. User krijgt na kopen een username, en wachtwoord, plus 1 user key. Key is voor licentie van 1 machine. User kan meerdere licenties hebben.

license code = user key + system id + salt

system id = processor + .... + salt_2

decode = salt > license code > system id > check

## pros
* veilig

## cons
* gaat klant in de weg zitten
* kost tijd om te maken



Middenweg
---------------
Elke user krijgt 1 key, die gegenereerd wordt vanuit naam bij aankoop. De key kan 2 keer per jaar gebruikt worden voor een registratie, daarna geblokkeerd.

user key = naam + salt
license code = user key + secret + computer username
decode = salt > license code > secret check, user key check, user name check

## pros
* geen system id, dus werkt ook in virtual machine enzo.
*

## cons
* makkelijk te kraken omdat secret overal hetzelfde is
* klopt de username altijd?


Simpele Versie
----------------
Geen system id gebruiken en geen online registratie

user key = naam + secret > salt
decode = salt > naam + secretkey > check secret


## pros
* werkt altijd zonder gezeik

## cons
* key kan doorgegeven worden


Of
-----
Bij registratie geef je user name + user key. In de key zit de username al verwerkt.

* (optioneel) Check of username overeen komt met key
* Check online evt of user mag registreren / blacklist (server check)
* Genereer en store application key en user key (evt server side): User key + computer username+ salt
* Decode: salt > user key -> check opgeslagen user key en computer user name

Bij de registratie slaan we het ip adres op waarvandaan geregistreerd wordt. Als er te vaak en vanaf verschillende plekken geregistreerd wordt, dan blacklist.

Na 2 registraties block -> manual unblock

