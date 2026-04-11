# typed: false
# frozen_string_literal: true

class Swarm < Formula
  desc "Local dev CLI for kubeswarm - run LLM agent pipelines without a cluster"
  homepage "https://kubeswarm.io"
  license "Apache-2.0"
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.3.0/swarm-darwin-arm64"
      sha256 "ecf6d4c4a66859b0f286bbee34bbc3cb967dd1a2153b976f2c756d959048b818"

      def install
        bin.install "swarm-darwin-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.3.0/swarm-darwin-amd64"
      sha256 "ba072d6f8ee7c32acdea0ce74f2b36a59796e0bf99ff3398ebe17eca219d9e2f"

      def install
        bin.install "swarm-darwin-amd64" => "swarm"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.3.0/swarm-linux-arm64"
      sha256 "1a645048050d34f7a332d60ac0230ad9d95befab7687222aa3d532a557b05597"

      def install
        bin.install "swarm-linux-arm64" => "swarm"
      end
    else
      url "https://github.com/kubeswarm/kubeswarm-cli/releases/download/v0.3.0/swarm-linux-amd64"
      sha256 "89e130ac3eb3f0e6438fbc06a8f7e0361ac64efecfb9846a7f19f2be08e9fc73"

      def install
        bin.install "swarm-linux-amd64" => "swarm"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swarm --version")
  end
end
