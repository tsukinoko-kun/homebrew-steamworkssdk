class SteamworksSdk < Formula
  desc "Steamworks SDK Redistributable Binaries"
  homepage "https://partner.steamgames.com/"
  url "https://github.com/tsukinoko-kun/SteamworksSDK/releases/download/v1.63/steamworks_sdk_libs.tar.gz"
  sha256 "73eb019b0bd52350301962190f7140186969161ce8c8b87773bdbd25eb79efa8"
  version "v1.63"
  license "Proprietary"

  def install
    if OS.mac?
      lib.install "lib/osx/libsteam_api.dylib"
    elsif OS.linux?
      if Hardware::CPU.intel?
        lib.install "lib/linux64/libsteam_api.so"
      elsif Hardware::CPU.arm?
        lib.install "lib/linuxarm64/libsteam_api.so"
      end
    end
  end

  test do
    # Basic test to verify the library file exists in the installation
    if OS.mac?
      assert_predicate lib/"libsteam_api.dylib", :exist?
    elsif OS.linux?
      assert_predicate lib/"libsteam_api.so", :exist?
    end
  end
end
