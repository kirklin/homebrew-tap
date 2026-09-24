cask "magpie" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "14039a18320c82b1fc4dddc7d2e14ea334e09dbff6e0029d8aa40ffa92d6a554",
         intel: "fe9448c787151f6abbcc181fb67faadb4c708536a7a0e50672200a568d290693"

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
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-r", "-d", "com.apple.quarantine", "{{appdir}}/Magpie.app"],
        writable_paths: "{{appdir}}/Magpie.app"
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
