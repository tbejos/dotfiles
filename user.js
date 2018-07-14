// Author: tbejos
// My user.js file

// From privacy tools.io

user_pref("privacy.firstparty.isolate", true);
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("browser.cache.offline.enable", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.send_pings", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("dom.battery.enabled"), false;
user_pref("dom.event.clipboardevents.enabled", false);
user_pref("geo.enabled", false);
user_pref("media.navigator.enabled", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("network.cookie.lifetimePolicy", 0);
user_pref("network.http.referer.trimmingPolicy", 2);
user_pref("network.http.referer.XOriginPolicy", 2);
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
user_pref("browser.sessionstore.privacy_level", 2);
user_pref("webgl.disabled", true);
user_pref("network.IDN_show_punycode", true);

// Other privacy
user_pref("beacon.enabled", false);
user_pref("dom.event.contextmenu.enabled", false);
user_pref("plugins.enumerable_names", blank);
user_pref("network.http.referer.spoofSource", true);
user_pref("geo.wifi.uri", blank);
user_pref("browser.search.geoip.url", blank);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.send_pings.require_same_host", true);
user_pref("browser.cache.memory.enable", false);
user_pref("browser.cache.disk_cache_ssl", false);
user_pref("browser.cache.disk.enable", false);
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.site", blank);
user_pref("extensions.pocket.oAuthConsumerKey", blank);
user_pref("extensions.pocket.api", blank);
user_pref("network.predictor.enabled", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("network.http.speculative-parallel-limit", 0);