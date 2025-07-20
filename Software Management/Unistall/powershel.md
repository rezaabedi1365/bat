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
