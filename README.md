# Penchart

**Penchart** is a simple script that can be used to generate statistics
graphs / charts for penetration testing reports.

## Prerequisites & dependencies

- Ruby: (tested on 2.7 but 2.4+ may be fine)
  - ArchLinux: `pacman -S ruby`
  - OpenSUSE: `zypper in ruby`
  - Ubuntu: `apt install ruby`
- `gruff`: `gem install gruff`

## Install & Usage

```
git clone https://github.com/sec-it/penchart.git
cd penchart
# edit src/data.json to set your vuln scores
# edit config.rb to change the lang, font or color
ruby penchart.rb
```

Expected values for `src/data.json` are those described in `src/label.<lang>.json`.

## Preview & screnshots

- [English](examples.en.md)
- [French](examples.fr.md)
