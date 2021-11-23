module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    // Chrome Dev Tools is much better for development
    {
      match: /^https?:\/\/localhost.*$/,
      browser: "Google Chrome",
    },
    // Apollo Studio does not work in Safari for localhost
    {
      match: /^https?:\/\/studio\.apollographql\.com\/.*$/,
      browser: "Google Chrome",
    },
  ],
};
