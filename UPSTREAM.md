# Upstream

| Dir | Repository | Version | Commit | Licence |
| --- | --- | --- | --- | --- |
| build/workbench/app | https://github.com/theredguild/damn-vulnerable-defi | v4.1.0 | 64fddf9f96de2782f8868898d68673acb295119c | MIT |
| build/workbench/app/lib/forge-std | https://github.com/foundry-rs/forge-std | submodule of v4.1.0 | 3b20d60d14b343ee4f908cb8079495c07f5e8981 | Apache-2.0 |
| build/workbench/app/lib/multicall | https://github.com/mds1/multicall | submodule of v4.1.0 | 5f54bc9778338fc4ccdccaedaebc352a1b258b2a | MIT |
| build/workbench/app/lib/murky | https://github.com/dmfxyz/murky | submodule of v4.1.0 | 5feccd1253d7da820f7cccccdedf64471025455d | MIT |
| build/workbench/app/lib/openzeppelin-contracts | https://github.com/openzeppelin/openzeppelin-contracts | submodule of v4.1.0 | acd4ff74de833399287ed6b31b4debf6b2b35527 | MIT |
| build/workbench/app/lib/openzeppelin-contracts-upgradeable | https://github.com/openzeppelin/openzeppelin-contracts-upgradeable | submodule of v4.1.0 | 3d5fa5c24c411112bab47bec25cfa9ad0af0e6e8 | MIT |
| build/workbench/app/lib/permit2 | https://github.com/Uniswap/permit2 | submodule of v4.1.0 | cc56ad0f3439c502c246fc5cfcc3db92bb8b7219 | MIT |
| build/workbench/app/lib/safe-smart-account | https://github.com/safe-global/safe-smart-account | submodule of v4.1.0 | bf943f80fec5ac647159d26161446ac5d716a294 | LGPL-3.0 |
| build/workbench/app/lib/solady | https://github.com/vectorized/solady | submodule of v4.1.0 | 77b41d04aa0aa80d6c455d8c9a379ae067ab4c98 | MIT |
| build/workbench/app/lib/solmate | https://github.com/transmissions11/solmate | submodule of v4.1.0 | 97bdb2003b70382996a79a406813f76417b1cf90 | see its LICENSE |
| build/workbench/app/lib/v2-core | https://github.com/uniswap/v2-core | submodule of v4.1.0 | ee547b17853e71ed4e0101ccfd52e70d5acded58 | GPL-3.0 |
| build/workbench/app/lib/v2-periphery | https://github.com/uniswap/v2-periphery | submodule of v4.1.0 | 0335e8f7e1bd1e8d8329fd300aea2ef2f36dd19f | GPL-3.0 |
| build/workbench/app/lib/v3-core | https://github.com/Uniswap/v3-core | submodule of v4.1.0 | 6562c52e8f75f0c10f9deaf44861847585fc8129 | see its LICENSE |
| build/workbench/app/lib/v3-periphery | https://github.com/Uniswap/v3-periphery | submodule of v4.1.0 | b325bb0905d922ae61fcc7df85ee802e8df5e96c | GPL-2.0 |

`build/workbench/app/` is that release, unchanged, without its Git history. Its `lib/` folders
are Git submodules upstream; each is vendored at the commit the release pins (rows above),
also without history (nested submodules of those libraries are not needed by the build and are
left empty, as a non-recursive checkout leaves them).

`build/workbench/Dockerfile` is ours (upstream ships a devcontainer that installs the latest
Foundry): Foundry v1.0.0 from its release tarball (SHA-256 pinned), the challenges copied to
`/home/player/damn-vulnerable-defi`, `.env` from `.env.sample`, and `forge build` plus one
upstream test run at image build time. To update, replace `build/workbench/app/` (and its
`lib/` folders at the new release's submodule commits), then this table.
