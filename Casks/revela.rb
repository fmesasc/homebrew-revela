# Homebrew: brew install --cask fmesasc/revela/revela  (tap: github.com/fmesasc/homebrew-revela, this file in Casks/)
cask "revela" do
  version "0.4.67"
  sha256 "e4723499bfb3dd5d04bc774899945ffbe47e691ce19a6c4277e00fa996534ae5"

  url "https://github.com/fmesasc/revela/releases/download/v#{version}/Revela_#{version}_universal.dmg",
      verified: "github.com/fmesasc/revela/"
  name "Revela"
  desc "Presentation editor with 3D, animations, live polls and PowerPoint compatibility"
  homepage "https://revelaslides.com/download"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Revela.app"

  # (Not signed with an Apple certificate: without this, macOS refuses to open it the first time.)
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Revela.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/io.github.fmesasc.revela",
    "~/Library/Caches/io.github.fmesasc.revela",
    "~/Library/WebKit/io.github.fmesasc.revela",
  ]
end
