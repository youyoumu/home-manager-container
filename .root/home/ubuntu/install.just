nix:
    curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --no-daemon

rustup:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 

rust:
    . .cargo/env && rustup default stable && rustup component add rust-analyzer

fnm:
    . .cargo/env && cargo install fnm

node:
    . .cargo/env && fnm install --lts

pnpm:
    npm i -g pnpm

opencode:
    npm i -g opencode-ai

gemini:
    npm install -g @google/gemini-cli

codex:
    npm i -g @openai/codex

qwen-code:
    npm install -g @qwen-code/qwen-code@latest
