To get the display name from a service name:

```
sc GetDisplayName <service_name>
```
To get the service name from a display name:

```
sc GetKeyName "<Display Name>"
```

Disable the service
```
sc stop "SERVICE-NAME" & sc config "SERVICE-NAME" start=disabled
```
