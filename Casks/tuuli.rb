cask "tuuli" do
  version "1.1.0"
  sha256 "8566e36d14f078d56053544c4f3e1084e3882210507d36d74592ee4fb8e2138a"

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
