---

# palmbash

Minimal shell with time-based color prompt.

## Install

```bash
git clone https://github.com/svalked-dev/palmbash
cd palmbash
chmod +x palmbash.sh
sudo cp palmbash.sh /usr/local/bin/palmbash
```

Or just:

```bash
curl -o palmbash https://raw.githubusercontent.com/svalked-dev/palmbash/main/palmbash.sh
chmod +x palmbash
sudo cp palmbash /usr/local/bin/palmbash
```

User install:

```bash
mkdir -p ~/.local/bin
cp palmbash.sh ~/.local/bin/palmbash
chmod +x ~/.local/bin/palmbash
export PATH="$HOME/.local/bin:$PATH"
```

## Uninstall

```bash
sudo rm /usr/local/bin/palmbash
rm ~/.palmbash_history
```

## Usage

```bash
palmbash
```

Built-in: `exit`, `quit`, `history`, `help`, `cd`

Everything else runs in subshell.

## Alias

```bash
alias pb='palmbash'
```

---
