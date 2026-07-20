cask "magpie" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "623d5eb6b9e73bb3c10f98cd6b39f4acb294d61fa9a6ac9c7d396d3858622bbf",
         intel: "d9fcdcf2011232b29f30a2631c17aec573c75e4750dcf421f5cf780d27d62864"

  url "https://github.com/kirklin/magpie/releases/download/v#{version}/Magpie_#{version}_#{arch}.dmg"
  name "Magpie"
  desc "Fast, modern clipboard manager built with Tauri, React, and Rust"
  homepage "https://github.com/kirklin/magpie"

  app "Magpie.app"

  # Magpie is currently ad-hoc signed (not Apple-notarized). Homebrew adds a
  # quarantine flag to every downloaded app, which Gatekeeper then blocks with
  # "Magpie is damaged and can't be opened". Strip it after install so a plain
  # `brew install --cask magpie` just works. Remove this block once the release
  # pipeline signs + notarizes the build.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Magpie.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.magpie.clipboard",
    "~/Library/Caches/com.magpie.clipboard",
    "~/Library/HTTPStorages/com.magpie.clipboard",
    "~/Library/Preferences/com.magpie.clipboard.plist",
    "~/Library/Saved Application State/com.magpie.clipboard.savedState",
    "~/Library/WebKit/com.magpie.clipboard",
  ]
end
