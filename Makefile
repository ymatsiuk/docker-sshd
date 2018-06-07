build:
	docker run -it -v $(PWD):/tmp -w /tmp --rm sshd google-authenticator --rate-limit=3 --rate-time=30 --time-based --allow-reuse --force --secret=/tmp/google_authenticator --issuer=root@container --label=docker --window-size=3
	docker build -t sshd .
clean:
	rm -f google_authenticator
