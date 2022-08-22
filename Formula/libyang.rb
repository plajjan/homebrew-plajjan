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
    (testpath/"test.c").write <<~EOS
      #include <stdio.h>
      #include <stdlib.h>

      #include <libyang/libyang.h>

      struct ly_ctx *ctx;

      int main(int argc, char **argv) {
          LY_ERR err;
          err = ly_ctx_new(NULL, 0, &ctx);

          if (ctx != 0)
              exit(-1);
          return 0;
      }
    EOS
    system ENV.cc, "-I#{include}", testpath/"test.c",
           "-L#{lib}", "-lyang", "-o", "test"
    system "./test"
  end
end
