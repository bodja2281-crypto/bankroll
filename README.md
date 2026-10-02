# XXtejo.lua — FTAP

Source repository for the XXtejo.lua FTAP interface and its local visual
modules.

## Repository layout

- `bankroll_ftap.lua` — development source.
- `loader.lua` — checked loader with remote and local fallbacks.
- `bootstrap.lua` — small checked loader for the public protected build.
- `.darklua.json` — protected build configuration.
- `.github/workflows/protected-build.yml` — manual GitHub Actions build.

## Local loader

Place the source at `XXtejo/bankroll_ftap.lua` in the executor workspace and
execute the contents of `loader.lua`.

Do not run `loadstring(readfile("loader.lua"))()` unless `loader.lua` is an
actual file in the executor workspace. A directory with that name produces
`Expected File But Got Directory`.

## Remote loader

After publishing the protected build as
`bodja2281-crypto/bankroll/main/xxtejo.lua`, run:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/bodja2281-crypto/bankroll/main/bootstrap.lua"))()
```

The `bankroll` repository must be public and `xxtejo.lua` must be stored
directly in the repository root on the `main` branch. Opening the Raw URL in a
private browser tab must display Lua source, not `404: Not Found`.

A private GitHub Raw URL cannot be downloaded anonymously by `game:HttpGet`.
Never put a GitHub personal access token inside a Lua loader. Keep the source
repository private and publish only the protected build in the public loader
repository.

## Protected build

Run the `Protected build` workflow manually from the GitHub Actions tab. It
creates a minified artifact with renamed local variables and a SHA-256
checksum.

The source repository remains private. This build makes casual copying harder
but cannot make client-side Lua impossible to inspect.
