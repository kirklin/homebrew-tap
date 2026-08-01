cask "magpie" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.5"
  sha256 arm:   "5a91081a441dd41b27d475c3e49bfb4da904fcbaca42155b6ea20a1784b86607",
         intel: "6c7ec6a2af95e388c79d9c62314294e02c1cf7277e9c8594fdc5166c21686a6a"

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
