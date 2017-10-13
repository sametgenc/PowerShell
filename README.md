#Powershell

Powershell altypapisi kullanarak, kullanicilara Command Line Interface (CLI) saglamak amaciyla gelistirilmis
bir linux bash benzeri bir shelldir.
Nesne tabanlidir. Çalisan komutlar standart çalistirilabilir (executable) dosyalar seklinde degilde .NET fonksiyonlari seklinde 
çalismaktadir.

> Powershell .NET kütüphanesi kullanmasinin yaninda bu kütüphaneden faydalanarak script (betik) yazilabilmesi sistemi yönetmek adina büyük rahatlik saglar.

#Cmdlets 

Powershellin komut setidir. Powershell üzerinden *Get-Command* diyerek tum komutlari listelemek mümkündür.

Powershell üzerinde script çalistirabilmek için;

	Set-ExecutionPolicy RemoteSigned 

veya 

	Set-ExecutionPolicy Unrestricted

komutlarindan biri kullanilmalidir. Yine bunun haricinde scriptte kullandigimiz bazi komutlar (network interfaces vb.) yönetici yetkisi olmadan çalismayacagi için,
uygulamayi yönetici yetkisiyle açmamiz gerekir.

#Script Yapısı

*Systeminfo* komutuyla sisteme ait bilgileri çekebiliriz.

*findstr* ile aramlarda filtrelemeler yapip istedigimiz satirlarin gelmesini sagliyoruz.
 Linuxtaki *grep* mantigi.

	Get-WmiObject -class Win32_NetworkAdapterConfiguration 

ile cihazin ip bilgileri çekiyoruz.

	netstat 

ile sistem üzerindeki tüm baglantilari listeler.

	netstat -r 

ile routing tablolarini çekiyoruz.

	apr -a 

ile arp tablolarini çekiyoruz.

	Get-AdGroup 

ile sistem grup bilgileri çekilir.

	[System.Security.Principal.WindowsIdentity]::GetCurrent().Name  

ile aktif olan kullanici bilgisi çekilir.

	Get-AdUser 

ile kullanici bilgileri çekilir.

	Get-WmiObject -class win32_groupuser | Where-Object { $_.GroupComponent -match 'administrators' -and ($_.GroupComponent -match "Domain=`"$env:COMPUTERNAME`"")}

ile admin olan kullanicilar çekilir.

	gwmi win32_LoggedOnUser 

ile daha önce login islemi gerçeklesirilmis kullanicilar çekilir.

	Get-History 

ile komut geçmisi çekilir.

	Get-Process 

ile sisteme ait süreçler çekilir.

	Get-Service 

ile sisteme ait servisler çekilir.

	Get-ScheduledTask 

ile zamanlanmis görevlerin listesini verir.


	tasklist 

ile sistemde çalisan programlar görüntülenir.

#Active Directory

Bulunan networkte hizmet veren, networke ait cihazlarin adlarini ve bilgilerini tutan bir veritabanidir. Domain, Active
Directory’nin en temel bilesenidir.

	Get-ADDomain 

ile domaine ait bilgiler görüntülenir.

	Get-ADDomainController 

ile domain contoller a ait bilgiler görüntülenir.
