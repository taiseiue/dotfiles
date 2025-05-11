export PGDATA="/usr/local/var/postgres"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

if [ "$(uname)" = 'Darwin' ]; then
    # 1passwordのSSHエージェントを使用する
    export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

. "$HOME/.cargo/env"
