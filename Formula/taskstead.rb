class Taskstead < Formula
  desc "Simple task dashboard for persistent coding sessions in Ghostty"
  homepage "https://github.com/chrstnjsff/taskstead"
  url "https://github.com/chrstnjsff/taskstead/releases/download/v0.1.0/taskstead-0.1.0.tar.gz"
  sha256 "be8fe6832c605486a1899b23bc915f6715530d7cf4f58ce00788d6f2f042f033"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"
  depends_on "tmux"

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    state = testpath/"state"
    assert_match version.to_s, shell_output("#{bin}/taskstead --version")
    assert_empty JSON.parse(shell_output("#{bin}/taskstead --data-dir #{state} list --json"))

    system bin/"taskstead", "--data-dir", state, "new", "smoke", "--in-place",
           "--repo", testpath, "--", "/bin/echo", "taskstead-smoke"
    begin
      output = ""
      50.times do
        output = shell_output("#{bin}/taskstead --data-dir #{state} logs smoke")
        break if output.include?("taskstead-smoke")

        sleep 0.1
      end
      assert_match "taskstead-smoke", output
    ensure
      system bin/"taskstead", "--data-dir", state, "stop", "smoke", "--yes"
    end
  end
end
