cask "kaiku" do
  version "1.0.2"
  sha256 "7b31edd6499e2ea2e9a50747bcb8710890aa3d62f8d980e06aff89d9504acfd7"

  url "https://github.com/gabry-ts/kaiku/releases/download/v#{version}/Kaiku-#{version}.dmg"
  name "Kaiku"
  desc "Records and transcribes calls without a meeting bot"
  homepage "https://apps.partiti.dev/kaiku/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Kaiku.app"

  zap trash: [
    "~/Library/Caches/com.gabrielepartiti.kaiku",
    "~/Library/HTTPStorages/com.gabrielepartiti.kaiku",
    "~/Library/Preferences/com.gabrielepartiti.kaiku.plist",
  ]
end
