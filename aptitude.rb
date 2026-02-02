class Aptitude < Formula
  desc "Test harness for validating AI agent behavior against steering guides"
  homepage "https://github.com/tatimblin/aptitude"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-arm64"
      sha256 "ee507ce335055c883e8bdf972bf848d2bc20076dab212b023f5f4979d105e8c1"
    else
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-x86_64"
      sha256 "24e78ad258c2ba34c7d03526c60d362095b62e4a0af5259b149d535620e68a22"
    end
  end

  on_linux do
    url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-linux-x86_64"
    sha256 "9c5d185dae9c5222aa2c2bc68c35c0ed5d0120bbfc38ccccff5d5d57fafda909"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "aptitude-macos-arm64" => "aptitude"
      else
        bin.install "aptitude-macos-x86_64" => "aptitude"
      end
    else
      bin.install "aptitude-linux-x86_64" => "aptitude"
    end
  end

  test do
    system "#{bin}/aptitude", "--help"
  end
end
