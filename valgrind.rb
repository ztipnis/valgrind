class Valgrind < Formula
  desc "Dynamic analysis tools (memory, debug, profiling)"
  homepage "http://www.valgrind.org/"

  head do
    url "https://github.com/ztipnis/valgrind.git", :branch => "catalina"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  # Valgrind needs vcpreload_core-*-darwin.so to have execute permissions.
  # See #2150 for more information.
  skip_clean "lib/valgrind"

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-only64bit
      --build=amd64-darwin
    ]

    # Look for headers in the SDK on Xcode-only systems: https://bugs.kde.org/show_bug.cgi?id=295084
    inreplace "coregrind/Makefile.am" , %r{\[\[kern\]\]}, MacOS.sdk_path.to_s+"/System/Library/Frameworks/Kernel.framework"
    system "./autogen.sh" if build.head?
    system "./configure" , *args
    inreplace "coregrind/Makefile", %r{(\s)(?=/usr/include/mach/)}, '\1'+MacOS.sdk_path.to_s
    system "xcodebuild"
    system "make", "install"
  end

  test do
    system "#{bin}/valgrind", "ls", "-l"
  end
end
