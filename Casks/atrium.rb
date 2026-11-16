cask "atrium" do
  version "1.0.1"
  sha256 "29887dda4e21852cf6ccbeb2d3375f6b7302f2ea69252e48290a14d17a9e42fd"

  url "https://github.com/MowOkasha/atrium/releases/download/v#{version}/Atrium-#{version}.zip"
  name "Atrium"
  desc "Names your desktops and keeps your windows in place"
  homepage "https://github.com/MowOkasha/atrium"

  depends_on macos: :tahoe

  app "Atrium.app"

  # Atrium is ad-hoc signed (not notarized), so clear the download quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Atrium.app"]
  end

  uninstall quit: "io.github.mowokasha.atrium"

  zap trash: [
    "~/Library/Application Support/Atrium",
    "~/Library/Preferences/io.github.mowokasha.atrium.plist",
  ]
end
