cask "kiito" do
  version "1.2.0"
  sha256 "d0eb84de3c50923b68ac7818dc6ba5c5cc4e7f89f7002a66f4ae7aeea6ca7363"

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
