class Aptitude < Formula
  desc "Test harness for validating AI agent behavior against steering guides"
  homepage "https://github.com/tatimblin/aptitude"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-arm64"
      sha256 "b910aaeabbe6af3a3dfc0b6e7078e84c79937b5f4d083f30f052e594fd496145"
    else
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-x86_64"
      sha256 "4928a560f50c226ee28a12a6086cd76707356911679b866714cdb5b79cdbeed5"
    end
  end

  on_linux do
    url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-linux-x86_64"
    sha256 "be34baf385528858ba5e83e92cac73ce6db64e95c1839a63f4998b5bc6c33332"
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
