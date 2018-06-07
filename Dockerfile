FROM alpine:3.7
RUN apk --no-cache add openssh google-authenticator openssh-server-pam \
    && ssh-keygen -A \
    && mkdir /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys
COPY sshd_config /etc/ssh/sshd_config
COPY sshd /etc/pam.d/sshd
COPY google_authenticator /root/.google_authenticator
RUN chmod 600 /root/.ssh /root/.google_authenticator
CMD ["/usr/sbin/sshd", "-D"]
