# Vagrant Trellis Cert

[![Gem](https://img.shields.io/gem/v/vagrant-trellis-cert.svg)](https://rubygems.org/gems/vagrant-trellis-cert)
[![Gem](https://img.shields.io/gem/dt/vagrant-trellis-cert.svg)](https://rubygems.org/gems/vagrant-trellis-cert)
[![license](https://img.shields.io/github/license/TypistTech/vagrant-trellis-cert.svg)](https://github.com/TypistTech/vagrant-trellis-cert/blob/master/LICENSE)
[![Donate via PayPal](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.typist.tech/donate/vagrant-trellis-cert/)
[![Hire Typist Tech](https://img.shields.io/badge/Hire-Typist%20Tech-ff69b4.svg)](https://www.typist.tech/contact/)

Trust Trellis self-signed certificates with a single command

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Minimum Requirements](#minimum-requirements)
- [Installation](#installation)
- [Usage](#usage)
- [It looks awesome. Where can I find some more goodies like this?](#it-looks-awesome-where-can-i-find-some-more-goodies-like-this)
- [Support!](#support)
  - [Donate](#donate)
  - [Why don't you hire me?](#why-dont-you-hire-me)
  - [Want to help in other way? Want to be a sponsor?](#want-to-help-in-other-way-want-to-be-a-sponsor)
- [Feedback](#feedback)
- [Change log](#change-log)
- [Author Information](#author-information)
- [Contributing](#contributing)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Minimum Requirements

- macOS 10.13.3
- Vagrant 2.0.3

## Installation

```bash
$ vagrant plugin install vagrant-trellis-cert
```

## Usage

```bash
Usage: vagrant trellis-cert trust [options] [vm-id]
Usage: vagrant trellis-cert distrust [options] [vm-id]

    -h, --help                       Print this help

# Example: Running within Trellis directory
$ vagrant trellis-cert trust
$ vagrant trellis-cert distrust

# Example: Specify VM id
$ vagrant global-status
id       name    provider   state    directory
-----------------------------------------------------------------------------------
fb90ab5  default virtualbox running  /Users/me/Code/trellis

$ vagrant trellis-cert trust fb90ab5
$ vagrant trellis-cert distrust fb90ab5
```

## It looks awesome. Where can I find some more goodies like this?

* Articles on Typist Tech's [blog](https://typist.tech)
* [Tang Rufus' WordPress plugins](https://profiles.wordpress.org/tangrufus#content-plugins) on wp.org
* More projects on [Typist Tech's GitHub profile](https://github.com/TypistTech)
* Stay tuned on [Typist Tech's newsletter](https://typist.tech/go/newsletter)
* Follow [Tang Rufus' Twitter account](https://twitter.com/TangRufus)
* Hire [Tang Rufus](https://typist.tech/contact) to build your next awesome site

## Support!

### Donate

Love Vagrant Trellis Cert? Help me maintain it, a [donation here](https://typist.tech/donation/) can help with it.

### Why don't you hire me?

Ready to take freelance WordPress jobs. Contact me via the contact form [here](https://typist.tech/contact/) or, via email [info@typist.tech](mailto:info@typist.tech)

### Want to help in other way? Want to be a sponsor?

Contact: [Tang Rufus](mailto:tangrufus@gmail.com)

## Troubleshooting

`getaddrinfo: nodename nor servname provided, or not known`

Make sure your hosts file contains all urls you're self-signing.

## Feedback

**Please provide feedback!** We want to make this library useful in as many projects as possible.
Please submit an [issue](https://github.com/TypistTech/vagrant-trellis-cert/issues/new) and point out what you do and don't like, or fork the project and make suggestions.
**No issue is too small.**

## Change log

Please see [CHANGELOG](./CHANGELOG.md) for more information on what has changed recently.

## Author Information

[Vagrant Trellis Cert](https://github.com/TypistTech/vagrant-trellis-cert) is a [Typist Tech](https://www.typist.tech) project and maintained by [Tang Rufus](https://twitter.com/Tangrufus), freelance developer for [hire](https://www.typist.tech/contact/).

Special thanks to [the Roots team](https://roots.io/about/) whose [Trellis](https://github.com/roots/trellis) make this project possible.

Full list of contributors can be found [here](https://github.com/TypistTech/vagrant-trellis-cert/graphs/contributors).

## Contributing

Please see [CODE_OF_CONDUCT](./CODE_OF_CONDUCT.md) for details.

## License

[Vagrant Trellis Cert](https://github.com/TypistTech/vagrant-trellis-cert) is released under the [MIT License](https://opensource.org/licenses/MIT).
