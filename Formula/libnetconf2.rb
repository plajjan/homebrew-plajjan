class Libnetconf2 < Formula
  desc "C NETCONF library"
  homepage "https://github.com/CESNET/libnetconf2"
  url "https://github.com/CESNET/libnetconf2/archive/refs/tags/v2.1.18.tar.gz"
  sha256 "f684b5640f72b509a44614fd5711d045313f73926a860a9da3999a1da2662762"
  license "BSD-3-Clause"

  depends_on "cmake" => :build

  depends_on "libssh"
  depends_on "libyang"
  depends_on "openssl@1.1"

  def install
    system "sed", "-i", "-e", "/# crypt/,+7d", "CMakeLists.txt"
    args = ["-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"]
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    system "true"
  end
end
