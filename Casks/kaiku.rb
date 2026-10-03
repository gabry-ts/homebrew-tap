cask "kaiku" do
  version "1.6.0"
  sha256 "c3de2a0bfc5e16da95b23a086b851430dc691d7754e62b1ebe76bb5d2bb58599"

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
