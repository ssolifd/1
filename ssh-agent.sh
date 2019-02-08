
    #!/bin/sh
    # curl https://raw.githubusercontent.com/ssolifd/1/master/ssh-agent.sh - o /etc/profile.d/ssh-agent.sh && chmod +x /etc/profile.d/ssh-agent.sh
    if [ -f ~/.agent.env ]; then
    . ~/.agent.env >/dev/null
    if ! kill -0 $SSH_AGENT_PID >/dev/null 2>&1; then
    echo "Stale agent file found. Spawning new agent..."
    eval `ssh-agent |tee ~/.agent.env`
    ssh-add /root/.ssh/id_rsa
    fi
    else
    echo "Starting ssh-agent..."
    eval `ssh-agent |tee ~/.agent.env`
    ssh-add /root/.ssh/id_rsa
    fi
