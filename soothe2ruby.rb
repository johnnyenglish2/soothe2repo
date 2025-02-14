cask "soothe2" do
  # NOTE: "2" is not a version number, but an intrinsic part of the product name
  version "1.3.1"
  sha256 "ec400a6491523e7f782cd574f62918ce42c543c4c0c0da8248c202bc9be03c41"

  url "https://oeksound.ams3.cdn.digitaloceanspaces.com/soothe2_v#{version.no_dots}_Mac.pkg",
      verified: "oeksound.ams3.cdn.digitaloceanspaces.com/"
  name "Soothe 2"
  desc "Dynamic resonance suppressor"
  homepage "https://oeksound.com/plugins/soothe2/"

  livecheck do
    url "https://oeksound.com/changelog/soothe2/"
    regex(/<h3>v?(\d+(?:\.\d+)+)[" <]/i)
  end

  depends_on macos: ">= :high_sierra"

  pkg "soothe2_v#{version.no_dots}_Mac.pkg"

  uninstall pkgutil: [
    "com.oeksound.soothe2.aax",
    "com.oeksound.soothe2.au",
    "com.oeksound.soothe2.common",
    "com.oeksound.soothe2.vst",
    "com.oeksound.soothe2.vst3",
  ]

  zap trash: [
    "~/Documents/oeksound/soothe2/presets",
    "~/Library/Application Support/oeksound/soothe2/config.xml",
  ]
end
