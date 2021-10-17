# Cron

## LetsEncrypt Certificates

```
30 1 * * 7 /bin/bash renew_certs.sh
```

This will shutdown apache2 to renew all certs every Sunday at 01:30 UTC.

