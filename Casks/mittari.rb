cask "mittari" do
  version "1.2.0"
  sha256 "11808df0c0905c69e11c048e8f6744282c04f20f089ded530afb30608eea2e2b"

  url "https://github.com/gabry-ts/mittari/releases/download/v#{version}/Mittari-#{version}.dmg"
  name "Mittari"
  desc "Claude Code and Codex usage in the menu bar"
  homepage "https://apps.partiti.dev/mittari/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Mittari.app"

  zap trash: [
    "~/Library/Caches/com.gabrielepartiti.mittari",
    "~/Library/HTTPStorages/com.gabrielepartiti.mittari",
    "~/Library/Preferences/com.gabrielepartiti.mittari.plist",
  ]
end
