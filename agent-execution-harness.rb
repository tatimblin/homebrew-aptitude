class AgentExecutionHarness < Formula
  desc "Test harness for validating AI agent behavior against steering guides"
  homepage "https://github.com/tatimblin/agent-execution-harness"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-macos-arm64"
      sha256 "f29ecb7c99b31cb8008b40c6efb8780816a81e3f140109b6198ca5ac3b6945cf"
    else
      url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-macos-x86_64"
      sha256 "a058edbbc1bea8a6d669e960c42202131acba7050267abd8d7221bfac724cfdb"
    end
  end

  on_linux do
    url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-linux-x86_64"
    sha256 "a66d222745ede8efc23bee82ea18fdce055f027846fec84e7dddbe72bccfdc85"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "harness-macos-arm64" => "harness"
      else
        bin.install "harness-macos-x86_64" => "harness"
      end
    else
      bin.install "harness-linux-x86_64" => "harness"
    end
  end

  test do
    system "#{bin}/harness", "--help"
  end
end