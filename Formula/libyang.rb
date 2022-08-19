class Libyang < Formula
  desc "YANG data modeling language library"
  homepage "https://github.com/CESNET/libyang"
  url "https://github.com/CESNET/libyang/archive/refs/tags/v2.0.231.tar.gz"
  sha256 "50c63a131bca2bee5867fd00f0e3357d9ed3d2a68e7ab7386af467e6d630ca31"
  license "BSD-3-Clause"

  depends_on "cmake" => :build

  depends_on "pcre2"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_INSTALL_RPATH=#{rpath}"
      system "make", "install"
    end
  end

  test do
    system "true"
  end
end
