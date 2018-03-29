# Change Log

## [v0.5.0](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.5.0) (2018-03-29)
[Full Changelog](https://github.com/TypistTech/vagrant-trellis-cert/compare/v0.4.0...v0.5.0)

**Implemented enhancements:**

- Download cert via ruby's openssl gem [\#41](https://github.com/TypistTech/vagrant-trellis-cert/issues/41)

**Closed issues:**

- No certificate is added to keychain [\#44](https://github.com/TypistTech/vagrant-trellis-cert/issues/44)

**Merged pull requests:**

- Download certificate via Ruby's default openssl wrapper [\#45](https://github.com/TypistTech/vagrant-trellis-cert/pull/45) ([TangRufus](https://github.com/TangRufus))
- Readme: Warn about `vagrant-triggers` stale development [\#43](https://github.com/TypistTech/vagrant-trellis-cert/pull/43) ([TangRufus](https://github.com/TangRufus))

## [v0.4.0](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.4.0) (2017-10-04)
[Full Changelog](https://github.com/TypistTech/vagrant-trellis-cert/compare/v0.3.0...v0.4.0)

**Implemented enhancements:**

- Add `distrust` subcommand [\#21](https://github.com/TypistTech/vagrant-trellis-cert/issues/21)

**Merged pull requests:**

- Version bump 0.4.0 [\#39](https://github.com/TypistTech/vagrant-trellis-cert/pull/39) ([TangRufus](https://github.com/TangRufus))
- Add `distrust` subcommand [\#37](https://github.com/TypistTech/vagrant-trellis-cert/pull/37) ([TangRufus](https://github.com/TangRufus))

## [v0.3.0](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.3.0) (2017-09-18)
[Full Changelog](https://github.com/TypistTech/vagrant-trellis-cert/compare/v0.2.0...v0.3.0)

**Implemented enhancements:**

- Filter out unnecessary hosts [\#22](https://github.com/TypistTech/vagrant-trellis-cert/issues/22)
- Fail if loaded without vagrant [\#19](https://github.com/TypistTech/vagrant-trellis-cert/issues/19)

**Merged pull requests:**

- Version bump 0.3.0 [\#36](https://github.com/TypistTech/vagrant-trellis-cert/pull/36) ([TangRufus](https://github.com/TangRufus))
- Determine current VM via `vm-id` as a vagrant plugin should [\#35](https://github.com/TypistTech/vagrant-trellis-cert/pull/35) ([TangRufus](https://github.com/TangRufus))
- Extract class `Result` [\#34](https://github.com/TypistTech/vagrant-trellis-cert/pull/34) ([TangRufus](https://github.com/TangRufus))
- Rename module Commands --\> Command [\#33](https://github.com/TypistTech/vagrant-trellis-cert/pull/33) ([TangRufus](https://github.com/TangRufus))
- Re-raise error with original backtrace [\#32](https://github.com/TypistTech/vagrant-trellis-cert/pull/32) ([TangRufus](https://github.com/TangRufus))
- Extract System::Darwin and download certs into temporary directory [\#31](https://github.com/TypistTech/vagrant-trellis-cert/pull/31) ([TangRufus](https://github.com/TangRufus))
- Update Rubocop to ~\> ~\> 0.50.0 [\#30](https://github.com/TypistTech/vagrant-trellis-cert/pull/30) ([TangRufus](https://github.com/TangRufus))
- Filter out non-ssl hosts and fork Trellis::Config [\#29](https://github.com/TypistTech/vagrant-trellis-cert/pull/29) ([TangRufus](https://github.com/TangRufus))
- Re-raise `StandardError` as `Vagrant::Errors::CLIInvalidUsage` [\#28](https://github.com/TypistTech/vagrant-trellis-cert/pull/28) ([TangRufus](https://github.com/TangRufus))
- Check vagrant requirement and assume loading this plugin normally [\#27](https://github.com/TypistTech/vagrant-trellis-cert/pull/27) ([TangRufus](https://github.com/TangRufus))
- Use Rubocop's default style and Git: Ignore /.gems/ [\#26](https://github.com/TypistTech/vagrant-trellis-cert/pull/26) ([TangRufus](https://github.com/TangRufus))
- Require ruby version `~\> 2.3` [\#24](https://github.com/TypistTech/vagrant-trellis-cert/pull/24) ([TangRufus](https://github.com/TangRufus))

## [v0.2.0](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.2.0) (2017-09-13)
[Full Changelog](https://github.com/TypistTech/vagrant-trellis-cert/compare/v0.1.1...v0.2.0)

**Closed issues:**

- Early return with `--help` [\#8](https://github.com/TypistTech/vagrant-trellis-cert/issues/8)
- Fail fast on windows [\#7](https://github.com/TypistTech/vagrant-trellis-cert/issues/7)

**Merged pull requests:**

- Version bump 0.2.0 [\#18](https://github.com/TypistTech/vagrant-trellis-cert/pull/18) ([TangRufus](https://github.com/TangRufus))
- Make rubocop happy [\#17](https://github.com/TypistTech/vagrant-trellis-cert/pull/17) ([TangRufus](https://github.com/TangRufus))
- Early quit if not on macOS [\#16](https://github.com/TypistTech/vagrant-trellis-cert/pull/16) ([TangRufus](https://github.com/TangRufus))
- Extract `trust` subcommand and lots of refactor [\#15](https://github.com/TypistTech/vagrant-trellis-cert/pull/15) ([TangRufus](https://github.com/TangRufus))
- Use rubygem naming convention [\#12](https://github.com/TypistTech/vagrant-trellis-cert/pull/12) ([TangRufus](https://github.com/TangRufus))
- Add Hound config [\#11](https://github.com/TypistTech/vagrant-trellis-cert/pull/11) ([TangRufus](https://github.com/TangRufus))
- Load vagrant source during development [\#9](https://github.com/TypistTech/vagrant-trellis-cert/pull/9) ([TangRufus](https://github.com/TangRufus))

## [v0.1.1](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.1.1) (2017-09-12)
[Full Changelog](https://github.com/TypistTech/vagrant-trellis-cert/compare/v0.1.0...v0.1.1)

**Merged pull requests:**

- Version bump 0.1.1 [\#6](https://github.com/TypistTech/vagrant-trellis-cert/pull/6) ([TangRufus](https://github.com/TangRufus))
- Fix: Uninitialized constant [\#5](https://github.com/TypistTech/vagrant-trellis-cert/pull/5) ([TangRufus](https://github.com/TangRufus))

## [v0.1.0](https://github.com/TypistTech/vagrant-trellis-cert/tree/v0.1.0) (2017-09-12)
**Merged pull requests:**

- Version bump 0.1.0 [\#4](https://github.com/TypistTech/vagrant-trellis-cert/pull/4) ([TangRufus](https://github.com/TangRufus))
- bundle exec rubocop --auto-correct [\#3](https://github.com/TypistTech/vagrant-trellis-cert/pull/3) ([TangRufus](https://github.com/TangRufus))
- first release [\#2](https://github.com/TypistTech/vagrant-trellis-cert/pull/2) ([TangRufus](https://github.com/TangRufus))
- Fix: Incorrect link [\#1](https://github.com/TypistTech/vagrant-trellis-cert/pull/1) ([TangRufus](https://github.com/TangRufus))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*