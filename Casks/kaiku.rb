cask "kaiku" do
  version "1.0.0"
  sha256 "a6d71f77247aeb12142b0d44ff125ffa0fadc39e04ad3f24c66356bd744b4464"

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
