cask "tuuli" do
  version "1.2.0"
  sha256 "5227fb0a84f74718770841c9895dfc676548a5f8a3b89d671554a55e951876e1"

  url "https://github.com/gabry-ts/tuuli/releases/download/v#{version}/Tuuli-#{version}.dmg"
  name "Tuuli"
  desc "Menu bar temperatures and fan control"
  homepage "https://apps.partiti.dev/tuuli/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Tuuli.app"

  uninstall launchctl: "com.gabrielepartiti.tuuli.helper",
            delete:    [
              "/Library/LaunchDaemons/com.gabrielepartiti.tuuli.helper.plist",
              "/Library/PrivilegedHelperTools/com.gabrielepartiti.tuuli.helper",
            ]

  zap trash: [
    "~/Library/Caches/com.gabrielepartiti.tuuli",
    "~/Library/HTTPStorages/com.gabrielepartiti.tuuli",
    "~/Library/Preferences/com.gabrielepartiti.tuuli.plist",
  ]
end
