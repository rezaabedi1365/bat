برای حذف **Agent نرم‌افزار ManageEngine Patch Manager Plus** به صورت خط فرمان، روش‌های زیر وجود دارد:

---

### ✅ ۱) استفاده از Uninstall String در رجیستری

این روش رسمی و مطمئن است.

۱. ابتدا از رجیستری، کلید uninstall را پیدا کن:

```cmd
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "ManageEngine"
```

یا برای ۶۴ بیتی:

```cmd
reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "ManageEngine"
```

۲. در خروجی دنبال **UninstallString** باش.

مثلاً خروجی ممکن است باشد:

```
UninstallString    REG_SZ    "C:\Program Files (x86)\ManageEngine\Patch Manager Plus Agent\uninst.exe" -uninstall
```

۳. بعد دستور Uninstall را بزن:

```cmd
"C:\Program Files (x86)\ManageEngine\Patch Manager Plus Agent\uninst.exe" -uninstall
```

---

### ✅ ۲) استفاده از `wmic` (اگر موجود باشد)

```cmd
wmic product where "name like '%%ManageEngine%%'" call uninstall
```

⚠️ این روش همیشه قابل اطمینان نیست چون `wmic` بعضی نرم‌افزارها را شناسایی نمی‌کند.

---

### ✅ ۳) استفاده از PowerShell + رجیستری

```powershell
Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
Where-Object { $_.DisplayName -like "*ManageEngine*" } | 
Select-Object DisplayName, UninstallString
```

بعد دستور uninstall رو مستقیم اجرا کن.

---

### ✅ ۴) استفاده از ابزار `winget` (اگر ساپورت بشه)

```cmd
winget uninstall "ManageEngine Patch Manager Plus Agent"
```

---

اگر خواستی، می‌تونم اسکریپت کامل برای Silent Uninstall هم بهت بدم.
کافیه بگی می‌خوای توی اسکریپت یا ریموت اجراش کنی.
