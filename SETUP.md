
# Domain name hosting

Domain names are set up on **AWS Route53**.

- **Log in:** <https://console.aws.amazon.com/console/home>
- **Price:** EUIR 12/domain

## DNS Set up

Add these DNS records:

```
origin.example.com.         CNAME  ocean.romeovansnick.be.
example.com.                A      ALIAS [GET FROM AWS].cloudfront.net.
www.example.com.            A      [GET FROM AWS].cloudfront.net.
```

# Email Hosting

Email servers are hosted on [Versio.nl](<https://versio.nl>).

- **Log in:** <https://www.versio.nl/customer/>
- **Admin:** <https://vserver379.axc.eu>
- **Spam Test:** <https://isnotspam.com>

## DNS Set up

Add these records to the domain name.

```
example.com.                MX     10 mail.example.com
example.com.                TXT    "v=spf1 a mx ip4:185.182.56.245 a:spf.spamexperts.axc.nl -all"
x._domainkey.example.com.   TXT    "v=DKIM1; k=rsa; p=MII... [Get this from ADMIN ~ example.com ~ DKIM Management]
mail.example.com.           A      185.182.56.245
pop.example.com.            A      185.182.56.245
smtp.example.com.           A      185.182.56.245
```

## Google Webmasters

- **Admin:** <https://search.google.com/search-console>
- Click **Add Property**
- Add the `TXT` to DNS in AWS

## Forwarders

Add forwarders to `example.client@gmail.com` for example on `ADMIN ~ example.com
~ Forwarders`.
