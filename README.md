# SpecX CLI

`specx` is an open-source command line tool for compiling prompts into SpecX markdown through the hosted SpecX API.

## Install

### macOS (download prebuilt binary)

```bash
# Download v0.1.3 assets
curl -L -o specx-macos https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos
curl -L -o specx-macos.sha256 https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos.sha256

# Verify checksum (optional but recommended)
shasum -a 256 -c specx-macos.sha256

# Install
chmod +x specx-macos
sudo mv specx-macos /usr/local/bin/specx

# Test
specx --help
```

## Usage

```bash
export SPECX_API_KEY=xxxxx

specx compile prompt.txt -o spec.md
cat prompt.txt | specx compile -
specx compile prompt.txt --locale en
specx compile prompt.txt --hash-only
```

### Options

- `-o, --output <path>`: write output to file (atomic write)
- `--locale zh|en`: request locale (default: `zh`)
- `--format md`: output format, only `md` is accepted
- `--hash-only`: print only `spec_hash`
- `--base-url <url>`: override API base URL

## Server Defaults

- Default base URL: `https://specx.opeiai.com`
- Default endpoint: `/v1/spec/compile`
- Default format: `md`
- Default spec version: `3.3`

Environment variable precedence:

- `--base-url` flag
- `SPECX_API_BASE`
- `https://specx.opeiai.com`

Required environment variable:

- `SPECX_API_KEY`

## Open Source Scope

- This CLI is open source.
- The SpecX backend service is hosted and closed source.

## Security

Never commit API keys into git history or repository files. Use environment variables (for example `SPECX_API_KEY`) in local shell or CI secrets.

## Homebrew Tap (Publishing Plan)

Use a dedicated tap repository (recommended: `specx/homebrew-tap`):

1. Create tap repo `specx/homebrew-tap`.
2. Add formula `specx.rb` that points to your GitHub Release tarball URL and sha256.
3. Publish new formula updates for each CLI release.

User install commands:

```bash
brew tap specx/tap
brew install specx
```

## License

MIT.
