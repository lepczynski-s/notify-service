module Utils
  module RegexPatterns

    DOMAIN = /^[\p{Word}\.-]+\.[a-z]{2,}$/i
    EMAIL = /^[\p{Word}\.-]+@[\p{Word}\.-]+\.[a-z]{2,}$/i

  end
end
