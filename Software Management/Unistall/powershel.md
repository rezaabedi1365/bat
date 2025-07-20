برای حذف نرم‌افزار در **PowerShell**، چند حالت داریم — بستگی داره برنامه معمولی باشه یا اپلیکیشن UWP (اپلیکیشن‌های Store).

---

### ۱️⃣ حذف برنامه‌های نصبی معمولی (Win32 Apps)

ابتدا اطلاعات نرم‌افزار را از رجیستری بگیر:

```powershell
Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" |
Where-Object { $_.DisplayName -like "*اسم برنامه*" } |
Select-Object DisplayName, UninstallString
```

بعد از اینکه مسیر `UninstallString` رو دیدی، اون رو اجرا کن:

```powershell
& "مسیر کامل UninstallString"
```

مثال:

```powershell
& "C:\Program Files\ManageEngine\Patch Manager Plus Agent\uninst.exe" -uninstall
```

---

### ۲️⃣ حذف برنامه‌های ۶۴ بیتی (از WOW6432Node):

```powershell
Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" |
Where-Object { $_.DisplayName -like "*اسم برنامه*" } |
Select-Object DisplayName, UninstallString
```

---

### ۳️⃣ حذف اپلیکیشن‌های Store (UWP Apps)

اگر می‌خواهی App های Store را حذف کنی:

```powershell
Get-AppxPackage *اسم برنامه* | Remove-AppxPackage
```

---

### ۴️⃣ حذف با Winget (پیشنهاد ویژه)

```powershell
winget uninstall "اسم نرم افزار"
```

---

💡 **اگر اسم دقیق نرم‌افزار یا نمونه uninstall string رو بدی، می‌تونم دستوری دقیق برات بنویسم.**
همچنین می‌تونم اسکریپت آماده برای silent uninstall (حذف بی‌صدا) بدم.
