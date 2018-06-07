FROM alpine:3.7
RUN apk --no-cache add openssh google-authenticator openssh-server-pam \
    && ssh-keygen -A \
    && mkdir /root/.ssh

COPY id_rsa.pub /root/.ssh/authorized_keys
COPY sshd_config /etc/ssh/sshd_config
COPY sshd /etc/pam.d/sshd

RUN google-authenticator \
        --rate-limit=3 \
        --rate-time=30 \
        --time-based \
        --allow-reuse \
        --force \
        --secret=/root/.google_authenticator \
        --issuer=root@container \
        --label=docker \
        --window-size=3 \
    && chmod 600 /root/.ssh /root/.google_authenticator

CMD ["/usr/sbin/sshd", "-D"]
