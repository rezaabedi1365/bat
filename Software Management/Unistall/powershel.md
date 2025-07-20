اگر می‌خواهی **ManageEngine Patch Manager Plus Agent** را با `msiexec` به صورت Silent حذف کنی، باید اول **Product Code** (کد محصول MSI) را پیدا کنی.

---

### ✅ مرحله ۱: پیدا کردن Product Code

در PowerShell:

```powershell
Get-WmiObject Win32_Product | Where-Object { $_.Name -like "*ManageEngine*" } | Select-Object Name, IdentifyingNumber
```

خروجی مثلاً:

```
Name                           IdentifyingNumber
----                           -----------------
ManageEngine Patch Manager Plus Agent  {12345678-ABCD-1234-ABCD-1234567890AB}
```

---

### ✅ مرحله ۲: حذف با `msiexec`

```cmd
msiexec /x {12345678-ABCD-1234-ABCD-1234567890AB} /qn /norestart
```

---

### ✅ سوییچ‌ها:

| سوییچ        | توضیح                |
| ------------ | -------------------- |
| `/x`         | Uninstall            |
| `/qn`        | Quiet (بی‌صدا)       |
| `/norestart` | جلوگیری از ری‌استارت |

---

### ⚠️ هشدار مهم:

* دستور `Get-WmiObject` گاهی اوقات کند است و همه برنامه‌ها را نشان نمی‌دهد.
* اگر برنامه از MSI نصب نشده باشد، این روش جواب نمی‌دهد.

---

### ✅ مرحله ۳ (اگر MSI نبود): استفاده از Uninstaller Agent

```powershell
& "C:\Program Files (x86)\ManageEngine\Patch Manager Plus Agent\uninst.exe" -uninstall -silent
```

---

اگر خواستی، می‌تونم یک اسکریپت ترکیبی برای شناسایی و حذف بهت بدم تا خودش بررسی کنه و حذف کنه.
💬 بگو تا برات بسازم.

```
# تعریف نام نرم‌افزار (اینجا مثال با ManageEngine)
$AppName = "*ManageEngine*"

# جستجوی Product Code
$Product = Get-WmiObject Win32_Product | Where-Object { $_.Name -like $AppName }

# بررسی اینکه آیا پیدا شد یا نه
if ($Product) {
    $ProductCode = $Product.IdentifyingNumber
    Write-Output "Product Code Found: $ProductCode"

    # اجرای Uninstall Silent
    Start-Process "msiexec.exe" -ArgumentList "/x $ProductCode /qn" -Wait
    Write-Output "Uninstall command executed."
} else {
    Write-Output "Application not found."
}

```

### run in eset consol task
 ###### Execution Policy & Visibility
 - Use -ExecutionPolicy Bypass to avoid policy block
 - Use -WindowStyle Hidden to hide the console
 - Use -NoProfile for clean run

```
powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "\\server\share\yourscript.ps1"

```
