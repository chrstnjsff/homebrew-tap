# Homebrew tap

Install [Taskstead](https://github.com/chrstnjsff/taskstead), a Rust task dashboard for persistent coding sessions in Ghostty.

```sh
brew install chrstnjsff/tap/taskstead
taskstead doctor
taskstead
```

The formula builds from a versioned source release using its committed Cargo lockfile.
Homebrew installs Rust as a build dependency and Git and tmux as runtime dependencies.
Codex and Claude Code are optional and are installed separately.

```sh
brew update
brew upgrade taskstead
brew test taskstead
```

To update the formula, publish a new Taskstead source release, replace the release URL and SHA-256 digest in `Formula/taskstead.rb`, and run Homebrew's style, audit, installation, and test checks.
