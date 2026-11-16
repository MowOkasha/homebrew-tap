cask "atrium" do
  version "1.0.0"
  sha256 "ca70f4fe9341c6bd86353d030195b8077819bf2e104455bc55ee97abbcb3b4d6"

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
