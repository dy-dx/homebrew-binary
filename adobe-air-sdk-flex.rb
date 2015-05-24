# Find downloads at: https://helpx.adobe.com/air/kb/archived-air-sdk-version.html
class AdobeAirSdkFlex < Formula
  homepage "https://www.adobe.com/devnet/air/air-sdk-download.html"
  url "http://airdownload.adobe.com/air/mac/download/17.0/AdobeAIRSDK.tbz2"
  sha256 "c71708fcfb82a3d3c6a78a3932e498b059ecccb72aa8bba123594d9f50622f3f"
  version "17.0.0.172"

  conflicts_with "adobe-air-sdk"

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
