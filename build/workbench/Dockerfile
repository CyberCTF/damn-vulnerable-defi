# Damn Vulnerable DeFi as a workbench: upstream ships no Dockerfile (its .devcontainer installs
# the latest Foundry with foundryup). This image follows upstream's README "Install" steps:
#   - Foundry v1.0.0 (the release tarball pinned by SHA-256; the stable release when v4.1.0
#     came out) instead of `foundryup`;
#   - the challenges in /home/player/damn-vulnerable-defi: the release, plus its lib/ Git
#     submodules at the commits the release pins (all vendored in app/);
#   - README step 5, `forge build`, run at image build time (it downloads the solc versions the
#     contracts need into the player's ~/.svm), then one upstream test that must pass on an
#     unsolved checkout (Unstoppable's initial state), as proof that the suite runs;
#   - `.env` from `.env.sample` (README step 3): empty MAINNET_FORKING_URL, for the player to
#     fill for the two fork challenges (puppet-v3, curvy-puppet).
# The container runs an anvil node on port 8545 (chain id 31337), for scripts and experiments,
# and serves the build report (status.txt) on port 8000.
FROM debian:bookworm-20250929-slim
ARG FOUNDRY=v1.0.0
ARG FOUNDRY_SHA256=8c078eaced6bfce76af902def65e36db677842ffbf53f76730647082a5b1e45a
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl git busybox vim-tiny nano less jq \
 && rm -rf /var/lib/apt/lists/* \
 && curl -fsSL -o /tmp/foundry.tgz \
      "https://github.com/foundry-rs/foundry/releases/download/${FOUNDRY}/foundry_${FOUNDRY}_linux_amd64.tar.gz" \
 && echo "${FOUNDRY_SHA256}  /tmp/foundry.tgz" | sha256sum -c - \
 && tar -xzf /tmp/foundry.tgz -C /usr/local/bin \
 && rm /tmp/foundry.tgz \
 && useradd -m -s /bin/bash player
COPY --chown=player:player app/ /home/player/damn-vulnerable-defi/
COPY start.sh /usr/local/bin/start-workbench
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER player
WORKDIR /home/player/damn-vulnerable-defi
RUN cp .env.sample .env \
 && forge --version > /home/player/build.txt \
 && forge build 2>&1 | tail -n 5 >> /home/player/build.txt \
 && forge test --mp test/unstoppable/Unstoppable.t.sol --mt test_assertInitialState 2>&1 | tail -n 5 >> /home/player/build.txt \
 && mkdir -p /home/player/www \
 && { echo "damn-vulnerable-defi v4.1.0: forge build ok"; cat /home/player/build.txt; } > /home/player/www/status.txt \
 && cat /home/player/www/status.txt
EXPOSE 8545 8000
ENTRYPOINT ["/bin/bash", "/usr/local/bin/start-workbench"]
