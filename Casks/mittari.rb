cask "mittari" do
  version "1.0.0"
  sha256 "5796537835f4b51a66fdc618a1e68d0bc43ce45f59eb75976f5a7e177643d907"

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
