#
#Powershell

Powershell altypapisi kullanarak, kullanicilara Command Line Interface (CLI) saglamak amaciyla gelistirilmis
bir linux bash benzeri bir shelldir.
Nesne tabanlidir. �alisan komutlar standart �alistirilabilir (executable) dosyalar seklinde degilde .NET fonksiyonlari seklinde 
�alismaktadir.

> Powershell .NET k�t�phanesi kullanmasinin yaninda bu k�t�phaneden faydalanarak script (betik) yazilabilmesi sistemi y�netmek adina b�y�k rahatlik saglar.



##
Cmdlets 

Powershellin komut setidir. Powershell �zerinden *Get-Command* diyerek tum komutlari listelemek m�mk�nd�r.


Powershell �zerinde script �alistirabilmek i�in;


	Set-ExecutionPolicy RemoteSigned 

veya 

	Set-ExecutionPolicy Unrestricted

komutlarindan biri kullanilmalidir. Yine bunun haricinde scriptte kullandigimiz bazi komutlar (network interfaces vb.) y�netici yetkisi olmadan �alismayacagi i�in,
uygulamayi y�netici yetkisiyle a�mamiz gerekir.

##Script Yapisi


*Systeminfo* komutuyla sisteme ait bilgileri �ekebiliriz.

*findstr* ile aramlarda filtrelemeler yapip istedigimiz satirlarin gelmesini sagliyoruz.
 Linuxtaki *grep* mantigi.

	Get-WmiObject -class Win32_NetworkAdapterConfiguration 

ile cihazin ip bilgileri �ekiyoruz.



	netstat 

ile sistem �zerindeki t�m baglantilari listeler.


	netstat -r 

ile routing tablolarini �ekiyoruz.


	apr -a 

ile arp tablolarini �ekiyoruz.

	Get-AdGroup 

ile sistem grup bilgileri �ekilir.


	[System.Security.Principal.WindowsIdentity]::GetCurrent().Name  

ile aktif olan kullanici bilgisi �ekilir.


	Get-AdUser 

ile kullanici bilgileri �ekilir.


	Get-WmiObject -class win32_groupuser | Where-Object { $_.GroupComponent -match 'administrators' -and ($_.GroupComponent -match "Domain=`"$env:COMPUTERNAME`"")}


ile admin olan kullanicilar �ekilir.


	gwmi win32_LoggedOnUser 

ile daha �nce login islemi ger�eklesirilmis kullanicilar �ekilir.



	Get-History 

ile komut ge�misi �ekilir.



	Get-Process 

ile sisteme ait s�re�ler �ekilir.


	Get-Service 

ile sisteme ait servisler �ekilir.



	Get-ScheduledTask 

ile zamanlanmis g�revlerin listesini verir.


	tasklist 

ile sistemde �alisan programlar g�r�nt�lenir.


##Active Directory


Bulunan networkte hizmet veren, networke ait cihazlarin adlarini ve bilgilerini tutan bir veritabanidir. Domain, Active
Directory�nin en temel bilesenidir.



	Get-ADDomain 

ile domaine ait bilgiler g�r�nt�lenir.


	Get-ADDomainController 

ile domain contoller a ait bilgiler g�r�nt�lenir.
