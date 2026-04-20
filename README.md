# SpecX CLI 🚀

> **Prompt to Spec in One Command**

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Release](https://img.shields.io/github/v/release/BTCNAI/specx-cli)](https://github.com/BTCNAI/specx-cli/releases)
[![Homebrew](https://img.shields.io/badge/dynamic/json?url=https://formulae.brew.sh/api/formula/specx.json&query=$.versions.stable&label=homebrew)](https://formulae.brew.sh/formula/specx)

Compile prompts into structured AI specs with unique hash verification.

---

## 🎯 Why SpecX CLI?

**Problem:** Prompts are unstructured, hard to version, and impossible to verify.

**Solution:** SpecX - a standardized format with unique hash verification.

```
Prompt → SpecX Compiler → Structured Spec + Unique Hash
```

---

## ✨ Features

- 🔧 **One-Command Compile** - Transform any prompt into SpecX format
- 🔐 **Hash Verification** - Each spec gets a unique, verifiable hash
- 🌐 **Multi-Language** - Auto-detect Chinese/English prompts
- 📦 **Developer First** - CLI-first design, easy to integrate
- 🔒 **Secure** - API key via environment variables only

---

## 🚀 Quick Start

### Install

**macOS (Prebuilt Binary):**
```bash
# Download latest release
curl -L -o specx-macos https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos
curl -L -o specx-macos.sha256 https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos.sha256

# Verify and install
( shasum -a 256 -c specx-macos.sha256 2>/dev/null ) || \
( echo "$(cat specx-macos.sha256)  specx-macos" | shasum -a 256 -c - )

chmod +x specx-macos
sudo install -m 0755 specx-macos /usr/local/bin/specx

# Test
specx --help
```

**Homebrew (Coming Soon):**
```bash
brew tap specx/tap
brew install specx
```

### Usage

```bash
# Set API key
export SPECX_API_KEY=your_api_key_here

# Compile a prompt file
specx compile prompt.txt -o spec.md

# Pipe from stdin
cat prompt.txt | specx compile -

# Specify locale
specx compile prompt.txt --locale en

# Get hash only
specx compile prompt.txt --hash-only
```

### Options

| Flag | Description | Default |
|------|-------------|---------|
| `-o, --output <path>` | Write output to file (atomic write) | stdout |
| `--locale zh\|en` | Request locale | `zh` |
| `--format md` | Output format (only `md` supported) | `md` |
| `--hash-only` | Print only `spec_hash` | false |
| `--base-url <url>` | Override API base URL | - |

---

## 📖 Examples

### Example 1: Simple Prompt

**Input (`prompt.txt`):**
```
写一个 Python 函数，计算斐波那契数列的第 n 项
```

**Command:**
```bash
specx compile prompt.txt -o fib-spec.md
```

**Output (`fib-spec.md`):**
```markdown
# SpecX v3.3

## Input
写一个 Python 函数，计算斐波那契数列的第 n 项

## Output Format
Python function

## Constraints
- Time complexity: O(n) or better
- Handle edge cases (n <= 0)

## Spec Hash
abc123def456...
```

### Example 2: Complex Prompt with Locale

```bash
specx compile complex-prompt.txt --locale en -o spec.md
```

### Example 3: CI/CD Integration

```bash
# In your CI pipeline
SPEC_HASH=$(specx compile prompt.txt --hash-only)
echo "Spec hash: $SPEC_HASH"

# Verify spec hasn't changed
if [ "$SPEC_HASH" != "expected_hash" ]; then
  echo "Spec changed!"
  exit 1
fi
```

---

## 🏗 Architecture

```
┌─────────────┐     ┌──────────────┐     ┌─────────────┐
│   Prompt    │ ──→ │ SpecX CLI    │ ──→ │ SpecX Spec  │
│   (.txt)    │     │ (Compiler)   │     │ (.md + hash)│
└─────────────┘     └──────────────┘     └─────────────┘
                           │
                           ↓
                    ┌──────────────┐
                    │ SpecX API    │
                    │ (Hosted)     │
                    └──────────────┘
```

### Server Defaults

| Setting | Value |
|---------|-------|
| Base URL | `https://specx.opeiai.com` |
| Endpoint | `/v1/spec/compile` |
| Format | `md` |
| Spec Version | `3.3` |

**Environment Variable Precedence:**
1. `--base-url` flag
2. `SPECX_API_BASE` env var
3. Default: `https://specx.opeiai.com`

**Required:**
- `SPECX_API_KEY` (via environment variable)

---

## 🔒 Security

**Never commit API keys!**

✅ **Do:**
```bash
export SPECX_API_KEY=your_key
specx compile prompt.txt
```

❌ **Don't:**
```bash
# Never hardcode in scripts or commit to git
SPECX_API_KEY=your_key specx compile prompt.txt
```

Use CI/CD secrets for automated workflows.

---

## 📦 Homebrew Tap (Publishing Plan)

1. Create tap repo: `specx/homebrew-tap`
2. Add formula `specx.rb` pointing to release tarball
3. Update for each release

**User install:**
```bash
brew tap specx/tap
brew install specx
```

---

## 🤝 Open Source Scope

- ✅ **CLI** - Open source (this repo)
- ❌ **Backend** - Hosted, closed source

---

## 🎯 Use Cases

### 1. Prompt Version Control
```bash
# Track prompt changes over time
git add prompts/
specx compile prompts/v1.txt -o specs/v1.md
specx compile prompts/v2.txt -o specs/v2.md

# Compare specs
diff specs/v1.md specs/v2.md
```

### 2. Team Standardization
```bash
# Enforce spec format across team
for prompt in prompts/*.txt; do
  specx compile "$prompt" -o "specs/$(basename $prompt .txt).md"
done
```

### 3. CI/CD Validation
```yaml
# .github/workflows/validate.yml
- name: Validate Specs
  run: |
    for prompt in prompts/*.txt; do
      specx compile "$prompt" --hash-only
    done
```

---

## 📊 Roadmap

### v0.1 (Current)
- ✅ Basic compile functionality
- ✅ Hash verification
- ✅ Multi-language support

### v0.2 (Coming)
- [ ] Homebrew formula
- [ ] Batch compile mode
- [ ] Spec diff tool
- [ ] Local caching

### v1.0 (Planned)
- [ ] Offline mode
- [ ] Custom templates
- [ ] Plugin system
- [ ] Spec validation rules

---

## 🙋 FAQ

**Q: Is the SpecX API free?**
A: Check pricing at [specx.opeiai.com](https://specx.opeiai.com)

**Q: Can I self-host the API?**
A: Currently hosted only. Self-hosting may be available in the future.

**Q: What's the SpecX format?**
A: See [SpecX Specification](https://specx.opeiai.com/spec)

**Q: How do I get an API key?**
A: Sign up at [specx.opeiai.com](https://specx.opeiai.com)

---

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md)

```bash
git clone https://github.com/BTCNAI/specx-cli.git
cd specx-cli
# Make your changes
git commit -m "feat: your feature"
git push
```

---

## 📄 License

MIT License - see [LICENSE](LICENSE)

---

## 🔗 Links

- **GitHub:** [github.com/BTCNAI/specx-cli](https://github.com/BTCNAI/specx-cli)
- **API:** [specx.opeiai.com](https://specx.opeiai.com)
- **Issues:** [github.com/BTCNAI/specx-cli/issues](https://github.com/BTCNAI/specx-cli/issues)

---

**Made with ❤️ by [@btcnai](https://github.com/BTCNAI)**

> "Structure your prompts, verify your specs"
