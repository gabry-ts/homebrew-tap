cask "kaiku" do
  version "1.6.1"
  sha256 "cc406b0c2ca9f71873a9b68b0822833c4f4e898dc61382a69acb26f349c14c81"

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
