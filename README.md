# docker-sshd

Add your `id_rsa.pub` here and run:

```
make
```

Search in output for the following part:

```
https://www.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/docker%3Fsecret%3DJIOXLB2IFOD3Q3YRE54OYXIB3A%26issuer%3Droot@container
Your new secret key is: JIOXLB2IFOD3Q3YRE54OYXIB3A
Your verification code is 210192
Your emergency scratch codes are:
  66481250
  32671569
  65195156
  70409836
  85654024
```

Run container:

```
docker run -d -p 32022:22 sshd
```

Login into container:

```
ssh root@localhost -p 32022 -i ~/.ssh/id_rsa
```
