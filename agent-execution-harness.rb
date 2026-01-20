class AgentExecutionHarness < Formula
  desc "Test harness for validating AI agent behavior against steering guides"
  homepage "https://github.com/tatimblin/agent-execution-harness"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-macos-arm64"
      sha256 "d4076d66485f580bf9d1a4501c2c56afb0253e23fc0432ccb0153e2b7e910215"
    else
      url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-macos-x86_64"
      sha256 "a66ed48d3da08d42dccb4bf1481f801d724334aa169158bc676da2532db81856"
    end
  end

  on_linux do
    url "https://github.com/tatimblin/agent-execution-harness/releases/download/v#{version}/harness-linux-x86_64"
    sha256 "10a430034116be6b01db9d276beac103c37b7dd97ecc7f269870c4e69c57f61f"
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