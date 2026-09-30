cask "kello" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/gabry-ts/kello/releases/download/v#{version}/Kello-#{version}.dmg"
  name "Kello"
  desc "Calendar in the menu bar"
  homepage "https://apps.partiti.dev/kello/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Kello.app"

  zap trash: [
    "~/Library/Application Support/Kello",
    "~/Library/Caches/com.gabrielepartiti.kello",
    "~/Library/HTTPStorages/com.gabrielepartiti.kello",
    "~/Library/Preferences/com.gabrielepartiti.kello.plist",
  ]
end
