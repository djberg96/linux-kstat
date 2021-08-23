[![Ruby](https://github.com/djberg96/linux-kstat/actions/workflows/ruby.yml/badge.svg)](https://github.com/djberg96/linux-kstat/actions/workflows/ruby.yml)

## Description

A Ruby library for gathering Linux kernel statistics out of `/proc/stat`.

## Installation

`gem install linux-kstat`

## Adding the trusted cert
`gem cert --add <(curl -Ls https://raw.githubusercontent.com/djberg96/linux-kstat/main/certs/djberg96_pub.pem)`

### Bundler

If you have trouble install this gem via bundler, please try this:

  `bundle config specific_platform true`

Then attempt to install again.

## Synopsis
```ruby
# require 'linux-kstat' will also work
require 'linux/kstat'

kstat = Linux::Kstat.new

p kstat[:cpu]
p kstat[:procs_running]
```

## Details

The values for most of the keys are a single numeric value. However, in the
case of "cpu" keys, the result is a 7 element hash of numeric values. In
the case of the "intr" key, the value is an array containing the list of
interrupts.

## Information about /proc/stat

See http://www.linuxhowtos.org/System/procstat.htm for more information
about the meaning of each of the fields.

## Known Bugs

None known. Please report any bugs on the github project page.

http://www.github.com/djberg96/linux-kstat

## License

Apache-2.0

## Copyright

(C) 2003-2020 Daniel J. Berger
All Rights Reserved.`

## Warranty

This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose.

## Author

Daniel J. Berger
