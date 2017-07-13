class ApacheSparkNoHadoopAT20 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-without-hadoop.tgz"
  version "2.0.2"
  sha256 "122ec1af0fcb23c0345f20f77d33cf378422ffe966efe4b9ef90e55cf7a46a3c"

  bottle :unneeded
  
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
