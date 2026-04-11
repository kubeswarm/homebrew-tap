# typed: false
# frozen_string_literal: true

class Swarm < Formula
  desc "Local dev CLI for kubeswarm - run LLM agent pipelines without a cluster"
  homepage "https://kubeswarm.io"
  license "Apache-2.0"
  version "0.1.0-alpha.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.1/swarm-darwin-arm64"
      sha256 "a11259a36ff8c3f71fad908e6c17cea1a5c85ce0ca600bb1a666c86a0726775a"

      def install
        bin.install "swarm-darwin-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.1/swarm-darwin-amd64"
      sha256 "8e47f1975bf82e0a7f6ef0269f903c0e9a7073e2540ba3a0a3234b6a5421d123"

      def install
        bin.install "swarm-darwin-amd64" => "swarm"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.1/swarm-linux-arm64"
      sha256 "3c5eda20dc1ae35345925d1475e77c9b4fbd6c1c1e6e8ae0c25885ddb4cad4a5"

      def install
        bin.install "swarm-linux-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.1.0-alpha.1/swarm-linux-amd64"
      sha256 "706593293c418317ee497284f99adca4747fba89b1d2569e38382390d836cdd2"

      def install
        bin.install "swarm-linux-amd64" => "swarm"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swarm --version")
  end
end
