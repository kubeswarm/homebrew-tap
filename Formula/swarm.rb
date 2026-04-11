# typed: false
# frozen_string_literal: true

class Swarm < Formula
  desc "Local dev CLI for kubeswarm - run LLM agent pipelines without a cluster"
  homepage "https://kubeswarm.io"
  license "Apache-2.0"
  version "0.1.0-alpha.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.2/swarm-darwin-arm64"
      sha256 "0039f28a7ec1913c9f88a5c099c4ce693bedecbbefad31efbd8a0f2f85c3404c"

      def install
        bin.install "swarm-darwin-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.2/swarm-darwin-amd64"
      sha256 "f100fac78de96324377885b467044a1533e5c1c9e68d8ef9e45f4eaeedd0f1cb"

      def install
        bin.install "swarm-darwin-amd64" => "swarm"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.2/swarm-linux-arm64"
      sha256 "533b0fa60fdff0cc8901125f67f71b426d340a3227e15d9f42a061d0ec4d6417"

      def install
        bin.install "swarm-linux-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.2/swarm-linux-amd64"
      sha256 "a0345c688958091aac00c1f261c4527afec63add160531fad2579a2f778a944f"

      def install
        bin.install "swarm-linux-amd64" => "swarm"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swarm --version")
  end
end
