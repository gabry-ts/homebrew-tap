cask "kiito" do
  version "1.1.0"
  sha256 "804475d57f8cf1cbda57ab04c54090f3ae44097d351ae2a25377a604b640ad32"

  url "https://github.com/gabry-ts/kiito/releases/download/v#{version}/Kiito-#{version}.dmg"
  name "Kiito"
  desc "Scroll by holding a mouse button and rolling a trackball"
  homepage "https://apps.partiti.dev/kiito/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Kiito.app"

  zap trash: [
    "~/Library/Caches/com.gabrielepartiti.kiito",
    "~/Library/HTTPStorages/com.gabrielepartiti.kiito",
    "~/Library/Preferences/com.gabrielepartiti.kiito.plist",
  ]
end
