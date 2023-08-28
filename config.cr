require "yaml"

config_path = ENV["CONFIG_PATH"] ||= "#{ENV["HOME"]}/.config/nekochef/config.yml"

if File.exists?(config_path)
  config_yml = File.open(config_path, "r") do |file|
    YAML.parse(file)
  end

  if config_yml["gelbooru"]?
    ENV["GELBOORU_API_AUTH"] ||= config_yml["gelbooru"]["api_auth"]?.to_s || ""
    ENV["GELBOORU_USE"] ||= config_yml["gelbooru"]["use"]?.to_s || ""
    ENV["GELBOORU_EXTRA_PARAMS"] ||= config_yml["gelbooru"]["extra_params"]?.to_s || ""
  end

  if config_yml["nekos"]?
    ENV["NEKOS_USERNAME"] ||= config_yml["nekos"]["username"]?.to_s || ""
    ENV["NEKOS_PASSWORD"] ||= config_yml["nekos"]["password"]?.to_s || ""
    ENV["NEKOS_USE"] ||= config_yml["nekos"]["use"]?.to_s || ""
    ENV["NEKOS_ALLOW_NSFW"] ||= config_yml["nekos"]["allow_nsfw"]?.to_s || ""
  end
end

enum Terminal
  Kitty
  W3M
  ITerm2

  def detect
    if ENV["KITTY_WINDOW_ID"]?
      Kitty
    elsif ENV["ITERM_SESSION_ID"]?
      ITerm2
    else
      W3M
    end
  end
end

Config = {
  user_agent: "nekochef (+https://github.com/mekanoe/nekochef) nyan/4.20 nya/69", # i'm a functioning adult
  terminal:   Terminal::Kitty.detect,
  gelbooru:   {
    use:          ENV["GELBOORU_USE"]? == "true",
    api_auth:     ENV["GELBOORU_API_AUTH"]?,
    extra_params: ENV["GELBOORU_EXTRA_PARAMS"]?,
  },
  nekos: {
    use:        ENV["NEKOS_USE"]? == "true",
    username:   ENV["NEKOS_USERNAME"]?,
    password:   ENV["NEKOS_PASSWORD"]?,
    allow_nsfw: ENV["NEKOS_ALLOW_NSFW"]? == "true",
  },
}
