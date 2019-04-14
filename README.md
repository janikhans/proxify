# Proxify

For those times when you all you need is a quick list of proxies. Proxies come
from [Free Proxy List](https://free-proxy-list.net/).

## Usage

Choose your provider (all come from free-proxy-list.net)

    default = https://free-proxy-list.net/
    us = https://www.us-proxy.org/
    uk = https://free-proxy-list.net/uk-proxy.html
    web = https://free-proxy-list.net/web-proxy.html
    anonymous = https://free-proxy-list.net/anonymous-proxy.html
    google = http://www.google-proxy.net/
    socks = https://www.socks-proxy.net/
    ssl = https://www.sslproxies.org/

Instantiate a new `Proxify` object with your desired provider

    $ list = Proxify::List.new(provider: :default)

Proxies are available by calling the proxies method

    $ list.proxies

There are convenience methods to filter proxies by type

    $ list.elite_proxies
    $ list.anonymous_proxies

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/janikhans/proxify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Proxify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/proxify/blob/master/CODE_OF_CONDUCT.md).
