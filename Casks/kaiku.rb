cask "kaiku" do
  version "1.6.3"
  sha256 "446dfd73276d817d2fa44497ceef3611333e467c10f1b8eb063c81f7150d9ce1"

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
