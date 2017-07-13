class ApacheSparkAT20 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://www.apache.org/dist/spark/spark-2.0.2/spark-2.0.2-bin-hadoop2.7.tgz"
  version "2.0.2"
  sha256 "9a1d19ab295d1252ecb0a4adcaaf5f215a75dc7427597af9a9475f0c0fe0a59713ff601e5c13ece25eccd67913167fab85a04d1c104a51c027d4f39e2c414034"
  revision 1

  bottle :unneeded

  keg_only :versioned_formula

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Long = 1000", pipe_output(bin/"spark-shell", "sc.parallelize(1 to 1000).count()")
  end
end