# oplog

A very simple opinionated logging configuration for Crystal.

Very simple: it does logging the way *I* like it:

* Configurable verbosity 0-6
* Colorful output when it makes sense (not on pipes, for example)
* Send errors or worse to stderr
* Send warning or better to stdout

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     oplog:
       github: ralsina/oplog
   ```

2. Run `shards install`

## Usage

```crystal
require "oplog"

# Call with the desired verbosity level. Default is 4: info
Oplog.setup(3)
```


## Development

This probably doesn't need much development, but feel free to send PRs :-)

## Contributing

1. Fork it (<https://github.com/ralsina/oplog/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Roberto Alsina](https://github.com/your-github-user) - creator and maintainer
