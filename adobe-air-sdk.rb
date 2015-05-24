# Find downloads at: https://helpx.adobe.com/air/kb/archived-air-sdk-version.html
class AdobeAirSdk < Formula
  homepage "https://www.adobe.com/devnet/air/air-sdk-download.html"
  url "http://airdownload.adobe.com/air/mac/download/17.0/AIRSDK_Compiler.tbz2"
  sha256 "36643ae1349ffde5e48a52ab37186460e1a5eb6051589e6e2004f6c1f865f3db"
  version "17.0.0.172"

  conflicts_with "adobe-air-sdk-flex"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    To set AIR_HOME:
      export AIR_HOME=#{libexec}
    EOS
  end

  test do
    system "#{bin}/fontswf", "-h"
  end
end
