# SpecX CLI

`specx` is an open-source command line tool for compiling prompts into SpecX markdown through the hosted SpecX API.

## Install

### Build from source

```bash
git clone <your-repo-url>
cd specx-cli
swift build -c release
./.build/release/specx --help
```

### Install from GitHub Release artifact

1. Download `specx-macos-arm64.tar.gz` or `specx-macos-x86_64.tar.gz` from Releases.
2. Extract and move `specx` into your PATH.

```bash
tar -xzf specx-macos-arm64.tar.gz
chmod +x specx
mv specx /usr/local/bin/specx
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
