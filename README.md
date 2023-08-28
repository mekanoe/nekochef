# nekochef

Catgirls in your terminyal.

**There is a high risk of NSFW content being displayed.**

## Supports terminals...

- [x] kitty
- [ ] iterm2
- [ ] others via w3m

## Supports catgirl sources...

- [x] [Gelbooru](https://gelbooru.com)
- [ ] [nekos.moe](https://nekos.moe)
- [ ] any Gelbooru-like

## Configuration

Config can live as either a YAML file at `~/.config/nekochef/config.yml`, `$CONFIG_PATH`, or as environment variables.

Translate YAML keys to environment variables by uppercasing and replacing `.` with `_`; e.g. `gelbooru.use` becomes `GELBOORU_USE`. 

Booleans are `true`/`1` or `false`/`0`.

### Gelbooru Setup

1. Go here: https://gelbooru.com/index.php?page=account&s=options
2. Find "API Access Credentials"
3. Set as `GELBOORU_API_AUTH=` **OR** stuff in `~/.config/nekochef/config.yml` like so:

```yaml
gelbooru:
  use: true
  extra_params: -loli -furry
  api_auth: "&api_key=aaaabbbccc&user_id=12345"
```

To lessen the chance of NSFW content, you may enable the "General Only Listing" setting in Gelbooru. It's not perfect.

Our default tag search is: `cat_girl solo ${gelbooru.extra_params}`. -- *extra_params by default is `-loli -furry`.*

## Contributing

`nekochef` is a Crystal app that runs in one of the above terminal emulators.

You'll need:
- Crystal >=1.9
- Shards
- A supported terminal emulator or w3m installed
- An internet connection to your source of choice.

You can specify a `CONFIG_PATH` to not use your system config. I usually make a `./hack/config.yml`.