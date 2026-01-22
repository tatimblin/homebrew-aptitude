class Aptitude < Formula
  desc "Test harness for validating AI agent behavior against steering guides"
  homepage "https://github.com/tatimblin/aptitude"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-arm64"
      sha256 "8d4b627110ed007b4801bace9b19ae0d2e2f016d2ff529f9e3527d4b507e846e"
    else
      url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-macos-x86_64"
      sha256 "59de940310462838917b039d479c087e8444924b9a03ec1dadfde5b7f3abfb4e"
    end
  end

  on_linux do
    url "https://github.com/tatimblin/aptitude/releases/download/v#{version}/aptitude-linux-x86_64"
    sha256 "588175846412306252787ad41f21fe8597c7fc05bdc7f8d162fd59ccad2f7e1e"
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
