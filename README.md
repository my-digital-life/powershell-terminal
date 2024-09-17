## powershell-terminal

This was forked from https://github.com/ibnYusrat/my-windows-terminal

This repository has two install scripts, i-e `Install_Step1.ps1` and `Install_Step2.ps1`. These scripts will automatically setup everything that needs to be done to get the fancy pants PowerShell Prompt. 
You don't need to run these scripts with elevated privileges (`Run as Administrator`) but before running the script,
you will need to allow execution of scripts by setting the execution policy to `RemoteSigned` with the following command -- and this ONLY works if you run `Windows PowerShell` as an Administrator:

`Set-ExecutionPolicy RemoteSigned`

After running the above command, you should exit `Windows Powershell` which you launched as an administrator and launch a regular `Windows Powershell` session and navigate to the place where you cloned this repository. Execute the `Install_Step.ps1` by simply writing:

`./Install_Step1.ps1` 

in Windows PowerShell.

Once the script executes successfully, you will need to exit `Windows PowerShell` and Launch `Windows Terminal` from Start menu. This will be installed automatically by the first install script so you should be able to see it. When you're inside `Windows Terminal` simply navigate to the clone of this repository again and this time run:

`./Install_Step2.ps1`

And this should set up everything you need for a fancy prompt. Once the script executes successfully, exist `Windows Terminal` one last time and launch it again and *hopefully* you should have a nice brand new prmopt now.

I recieved some errors, Can't remember if it was during Step 1 or 2   
I ran both of these, Seems I was running a older verion.

Install-Module PSReadLine   
Install-Module PSReadLine -Force   


Terminal output from secondary computer   
PS C:\Users\mydig> Install-Module PSReadLine                                                                                                                                                                                                                                            NuGet provider is required to continue
PowerShellGet requires NuGet provider version '2.8.5.201' or newer to interact with NuGet-based repositories. The NuGet provider must be
available in 'C:\Program Files\PackageManagement\ProviderAssemblies' or
'C:\Users\mydig\AppData\Local\PackageManagement\ProviderAssemblies'. You can also install the NuGet provider by running
'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force'. Do you want PowerShellGet to install and import the NuGet provider
now?
[Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"): y

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its InstallationPolicy value by running
the Set-PSRepository cmdlet. Are you sure you want to install the modules from 'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): y
WARNING: Version '2.0.0' of module 'PSReadLine' is already installed at 'C:\Program Files\WindowsPowerShell\Modules\PSReadLine\2.0.0'. To
install version '2.3.5', run Install-Module and add the -Force parameter, this command will install version '2.3.5' in side-by-side with
version '2.0.0'.
PS C:\Users\mydig> Install-Module PSReadLine -Force
