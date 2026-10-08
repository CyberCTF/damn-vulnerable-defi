# Damn Vulnerable DeFi

[Damn Vulnerable DeFi](https://github.com/theredguild/damn-vulnerable-defi) by
[The Red Guild](https://theredguild.org) (created by tinchoabbate): the smart contract security
playground, eighteen vulnerable DeFi challenges solved by writing Foundry tests. This repository
runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes one
workbench machine, built by [`build/workbench/Dockerfile`](build/workbench/Dockerfile) from the
upstream release vendored in [`build/workbench/app/`](build/workbench/app) with its library
submodules.

| Machine | Services |
| --- | --- |
| workbench | Foundry v1.0.0 and the challenges (already built), an anvil node on 8545, the build report on 8000 |

## Run it

```bash
isoloom generate
isoloom run docker
isoloom connect workbench
```

The shell opens as `player` in `~/damn-vulnerable-defi`. For each challenge, read
`src/<challenge>/README.md`, write the solution in `test/<challenge>/<Challenge>.t.sol` and run
`forge test --mp test/<challenge>/<Challenge>.t.sol` (add `--isolate` in the challenges that
restrict the number of transactions). The challenge is solved when its test passes. vim-tiny and
nano are installed; the anvil node (chain id 31337) answers at http://localhost:8545 from your
machine, for scripts and experiments.

Two challenges (puppet-v3, curvy-puppet) fork Ethereum mainnet: put your own RPC URL in `.env`
(`MAINNET_FORKING_URL`); the lab network has internet access for that. Every other challenge
runs offline. Progress lives in the container: copy your solutions out before `isoloom down`.

Lab guide: upstream's [README](build/workbench/app/README.md) and each challenge's prompt.
Upstream version and commits: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as Damn Vulnerable DeFi ([LICENSE](LICENSE)). The vendored libraries keep their own
licences (listed in [UPSTREAM.md](UPSTREAM.md)). These contracts are deliberately vulnerable:
never deploy them anywhere real.
