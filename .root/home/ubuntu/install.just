nix:
    curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --no-daemon

rustup:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 

rust:
    . .cargo/env && rustup default stable && rustup component add rust-analyzer

fnm:
    . .cargo/env && cargo install fnm

uv:
    . .cargo/env && cargo install uv

node:
    . .cargo/env && fnm install --lts

pnpm:
    npm i -g pnpm

pi:
    npm i -g @mariozechner/pi-coding-agent

opencode:
    npm i -g opencode-ai

gemini:
    npm i -g @google/gemini-cli

codex:
    npm i -g @openai/codex

qwen-code:
    npm i -g @qwen-code/qwen-code@latest

claude-code:
    npm i -g @anthropic-ai/claude-code

kilo:
    npm i -g @kilocode/cli

kimi:
    uv tool install --python 3.13 kimi-cli
