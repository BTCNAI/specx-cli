# Contributing to SpecX CLI

Thanks for considering contributing! 🙏

---

## How to Contribute

### 1. Report Bugs

Found a bug? [Open an Issue](https://github.com/BTCNAI/specx-cli/issues)

**Include:**
- Steps to reproduce
- Expected behavior
- Actual behavior
- Environment (macOS version, CLI version)

### 2. Suggest Features

Have an idea? [Open an Issue](https://github.com/BTCNAI/specx-cli/issues)

**Include:**
- Problem description
- Proposed solution
- Use cases

### 3. Submit Code

```bash
# Fork the repo
git clone https://github.com/YOUR_USERNAME/specx-cli.git
cd specx-cli

# Create branch
git checkout -b feature/your-feature

# Make changes
# ...

# Commit
git commit -m "feat: add your feature"

# Push
git push origin feature/your-feature

# Create Pull Request
```

---

## Development Setup

### Prerequisites

- macOS
- Xcode Command Line Tools
- Swift 5.0+

### Build from Source

```bash
git clone https://github.com/BTCNAI/specx-cli.git
cd specx-cli

# Build
swift build

# Run
.swift-build/debug/specx --help
```

### Run Tests

```bash
swift test
```

---

## Code Style

- Follow Swift API Design Guidelines
- Use 4 spaces for indentation
- Use `self` explicitly
- Add comments for public APIs

---

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style
- `refactor:` Refactoring
- `test:` Tests
- `chore:` Build/Tools

**Examples:**
```
feat: add batch compile mode
fix: handle empty prompt correctly
docs: update README examples
```

---

## Pull Request Process

1. Update README.md if needed
2. Add tests for new features
3. Ensure all tests pass
4. Request review from maintainers

---

## Code of Conduct

- Be respectful
- Be constructive
- Be inclusive

---

## Questions?

- [Open an Issue](https://github.com/BTCNAI/specx-cli/issues)
- Email: specx@btcnai.com

---

Thanks for contributing! 🚀
