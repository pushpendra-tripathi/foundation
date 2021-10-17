# Cron

## LetsEncrypt Certificates

```
30 4 * * 7 /bin/bash /usr/local/sbin/renew_certs.sh
```

This will shutdown apache2 to renew all certs every Sunday at 04:30 UTC.

