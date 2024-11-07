Valgte 2, siden det er kun én infrastruktur som til slutt skal legges ut, mener det blir mye copy-paste og overfladiske filer hvis man bruker 1 eller 3

prævde førsdt å bruike public IP me dlb men det ble litt vanskelig. valgte derfor å fokusere på intenr nettvklerjk denne gangen, uten jnoen publig interfafces

strugles med web app, og lb

synes det er utdelig om man skal lage nye brnaches følr man gåpr inn i env brnahces. Velger derfor å tyde det som at man skal lage brnahcves for de ulike env



Disse gjorde at jeg endret: 
https://aquasecurity.github.io/tfsec/v1.28.11/checks/azure/database/no-public-access/
https://aquasecurity.github.io/tfsec/v1.28.11/checks/azure/storage/use-secure-tls-policy/
https://aquasecurity.github.io/tfsec/v1.28.11/checks/azure/database/no-public-access/
https://aquasecurity.github.io/tfsec/v1.28.11/checks/azure/database/secure-tls-policy/
https://aquasecurity.github.io/tfsec/v1.28.11/checks/azure/database/enable-audit/

gammle v av tfsec