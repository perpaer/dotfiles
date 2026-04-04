typeset -U path

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_AVD_HOME="$HOME/.config/.android/avd"

# Flutter
export FLUTTER_HOME="$HOME/flutter"

# Deno
export DENO_INSTALL="$HOME/.deno"

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Volta
export VOLTA_HOME="$HOME/.volta"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

path=(
  "$HOME/.local/bin"
  "$HOME/.opencode/bin"
  "$HOME/.rbenv/bin"
  "$PNPM_HOME"
  "$DENO_INSTALL/bin"
  "$VOLTA_HOME/bin"
  "$HOME/.cargo/bin"
  "$FLUTTER_HOME/bin"
  "$ANDROID_HOME/tools"
  "$ANDROID_HOME/platform-tools"
  $path
)
