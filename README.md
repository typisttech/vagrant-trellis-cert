<div align="center">

# Vagrant Trellis Cert

</div>

<div align="center">

[![Gem](https://img.shields.io/gem/v/vagrant-trellis-cert.svg?style=flat-square)](https://rubygems.org/gems/vagrant-trellis-cert)
[![Gem](https://img.shields.io/gem/dt/vagrant-trellis-cert.svg?style=flat-square)](https://rubygems.org/gems/vagrant-trellis-cert)
[![license](https://img.shields.io/github/license/TypistTech/vagrant-trellis-cert.svg?style=flat-square)](https://github.com/TypistTech/vagrant-trellis-cert/blob/master/LICENSE)
[![Twitter Follow @TangRufus](https://img.shields.io/twitter/follow/TangRufus?style=flat-square&color=1da1f2&logo=twitter)](https://twitter.com/tangrufus)
[![Hire Typist Tech](https://img.shields.io/badge/Hire-Typist%20Tech-ff69b4.svg?style=flat-square)](https://www.typist.tech/contact/)

</div>

<p align="center">
  <strong>Trust Trellis self-signed certificates with a single command</strong>
  <br />
  <br />
  Built with ♥ by <a href="https://www.typist.tech/">Typist Tech</a>
</p>

---

**Vagrant Trellis Cert** is an open source project and completely free to use.

However, the amount of effort needed to maintain and develop new features is not sustainable without proper financial backing. If you have the capability, please consider donating using the links below:

<div align="center">

[![GitHub via Sponsor](https://img.shields.io/badge/Sponsor-GitHub-ea4aaa?style=flat-square&logo=github)](https://github.com/sponsors/TangRufus)
[![Sponsor via PayPal](https://img.shields.io/badge/Sponsor-PayPal-blue.svg?style=flat-square&logo=paypal)](https://typist.tech/go/paypal-donate/)
[![More Sponsorship Information](https://img.shields.io/badge/Sponsor-More%20Details-ff69b4?style=flat-square)](https://typist.tech/donate/imposter-plugin/)

</div>

---

## Usage

```sh-session
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

---

<p align="center">
  <strong>Typist Tech is ready to build your next awesome WordPress site. <a href="https://typist.tech/contact/">Hire us!</a></strong>
</p>

---

## Minimum Requirements

- macOS 10.13.3
- Vagrant 2.0.3

## Installation

```sh-session
$ vagrant plugin install vagrant-trellis-cert
```

## FAQ

### What to do when `getaddrinfo: nodename nor servname provided, or not known`

Make sure your hosts file (`/etc/hosts`) contains all the domains you're self-signing.

Usually it can be rectified by `$ vagrant reload --provision` or `$ vagrant hostmanager`.

Ask on [Root Discourse](https://discourse.roots.io/) if the problem persists.

### It looks awesome. Where can I find some more goodies like this

- Articles on [Typist Tech's blog](https://typist.tech)
- [Tang Rufus' WordPress plugins](https://profiles.wordpress.org/tangrufus#content-plugins) on wp.org
- More projects on [Typist Tech's GitHub profile](https://github.com/TypistTech)
- Stay tuned on [Typist Tech's newsletter](https://typist.tech/go/newsletter)
- Follow [Tang Rufus' Twitter account](https://twitter.com/TangRufus)
- **Hire [Tang Rufus](https://typist.tech/contact) to build your next awesome site**

### Where can I give 5-star reviews?

Thanks! Glad you like it. It's important to let me knows somebody is using this project. Please consider:

- [tweet](https://twitter.com/intent/tweet?text=Vagrant%20Trellis%20Cert%20-%20Trust%20Trellis%20self-signed%20certificates%20with%20a%20single%20command&url=https://github.com/TypistTech/vagrant-trellis-cert&hashtags=webdev,wordpress&via=TangRufus&url=https://github.com/TypistTech/vagrant-trellis-cert&hashtags=webdev,wordpress&via=TangRufus) something good with mentioning [@TangRufus](https://twitter.com/tangrufus)
- ★ star [the Github repo](https://github.com/TypistTech/vagrant-trellis-cert)
- [👀 watch](https://github.com/TypistTech/vagrant-trellis-cert/subscription) the Github repo
- write tutorials and blog posts
- **[hire](https://www.typist.tech/contact/) Typist Tech**

## Feedback

**Please provide feedback!** We want to make this project as useful as possible.
Please [submit an issue](https://github.com/TypistTech/vagrant-trellis-cert/issues/new) and point out what you do and don't like, or fork the project and [send pull requests](https://github.com/TypistTech/vagrant-trellis-cert/pulls/).
**No issue is too small.**

## Security Vulnerabilities

If you discover a security vulnerability within this project, please email us at [vagrant-trellis-cert@typist.tech](mailto:vagrant-trellis-cert@typist.tech). 
All security vulnerabilities will be promptly addressed.

## Credits

[Vagrant Trellis Cert](https://github.com/TypistTech/vagrant-trellis-cert) is a [Typist Tech](https://www.typist.tech) project and maintained by [Tang Rufus](https://twitter.com/Tangrufus), freelance developer for [hire](https://www.typist.tech/contact/).

Special thanks to [the Roots team](https://roots.io/about/) whose [Trellis](https://github.com/roots/trellis) make this project possible.

Full list of contributors can be found [here](https://github.com/TypistTech/vagrant-trellis-cert/graphs/contributors).

## License

[Vagrant Trellis Cert](https://github.com/TypistTech/vagrant-trellis-cert) is released under the [MIT License](https://opensource.org/licenses/MIT).
