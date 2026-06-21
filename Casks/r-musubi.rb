cask "r-musubi" do
  version "0.1.2"
  sha256 "9baae1c22d274fea21e56e199d225c276de386176cd9e0450d13d94d9f4bc68d"

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
