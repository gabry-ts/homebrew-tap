cask "kello" do
  version "1.2.0"
  sha256 "0148dc252ab32f9f90fc734abe6ec27f15570026b358f688932c9a3f32ae7838"

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
