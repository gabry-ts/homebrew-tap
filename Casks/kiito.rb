cask "kiito" do
  version "1.0.0"
  sha256 "6bb29e0ec60fe2c515319759094a5aa842a8c8b2d3d7bfef90d1a56522e756fa"

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
