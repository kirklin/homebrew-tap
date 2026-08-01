cask "magpie" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "b8acaff7543344e5546834f9f4632317a9147e06d45af683f9c2f81b8bbe3b42",
         intel: "23edb92155283e0465e128f35c84a76d45802fc6f6a415e5df3ed888ff03120f"

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
