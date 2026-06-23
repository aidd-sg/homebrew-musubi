cask "r-musubi" do
  version "0.1.13"
  sha256 "1b4040347d504fe3b483e937e590143ef1eb1217de6a2408e4a8803150c5fb09"

  url "https://musubi.aidd.space/download/R-Musubi-#{version}-arm64.dmg"
  name "R-Musubi"
  desc "Internal AI assistant for Jira, Confluence, Bitbucket, Figma, and Outlook"
  homepage "https://musubi.aidd.space/"

  # `brew livecheck r-musubi` reads the auto-update manifest to detect new versions.
  livecheck do
    url "https://musubi.aidd.space/updates/latest-mac.yml"
    regex(/version:\s*(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  # The app self-updates via electron-updater, so Homebrew defers version
  # management to the app. `brew upgrade` still pulls a fresh DMG when the cask's
  # version below is bumped (good for users who skip the in-app prompt).
  auto_updates true
  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "R-Musubi.app"

  # `brew uninstall --zap r-musubi` also removes the app's local data (chats,
  # settings, skills, boards) stored under the space.aidd.musubi identity.
  zap trash: [
    "~/Library/Application Support/R-Musubi",
    "~/Library/Caches/space.aidd.musubi",
    "~/Library/Caches/space.aidd.musubi.ShipIt",
    "~/Library/Logs/R-Musubi",
    "~/Library/Preferences/space.aidd.musubi.plist",
    "~/Library/Saved Application State/space.aidd.musubi.savedState",
  ]
end
