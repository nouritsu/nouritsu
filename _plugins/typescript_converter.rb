require "jekyll"
require "open3"
require "digest"
require "fileutils"

module Jekyll
  class TypeScriptConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext.casecmp(".ts").zero?
    end

    def output_ext(_ext)
      ".js"
    end

    def convert(content)
      Jekyll.logger.info "TypeScriptConverter:", "Starting TypeScript conversion"
      content_hash = Digest::MD5.hexdigest(content)

      tmp_dir = File.join(".jekyll-cache", "typescript_converter")
      FileUtils.mkdir_p(tmp_dir)

      ts_path = File.join(tmp_dir, "#{content_hash}.ts")
      js_path = File.join(tmp_dir, "#{content_hash}.js")

      begin
        File.write(ts_path, content)

        esbuild_cmd = "npx"
        unless command_exists?(esbuild_cmd)
          Jekyll.logger.error "TypeScriptConverter:", "npx command not found. Please ensure esbuild is installed."
        end

        command_args = [
          "esbuild", ts_path,
          "--outfile=#{js_path}",
          "--bundle",
          "--platform=browser",
          "--target=es2016",
          "--minify",
        ]

        stdout, stderr, status = Open3.capture3(esbuild_cmd, *command_args)

        if status.success?
          File.read(js_path)
        else
          Jekyll.logger.error "TypeScriptConverter:", "esbuild failed for #{ts_path}: #{stderr}"
        end
      rescue StandardError => e
        Jekyll.logger.error "TypeScriptConverter:", "Unexpected error during conversion for #{ts_path}: #{e.message}"
      ensure # Cleanup
        File.delete(ts_path) if File.exist?(ts_path)
        File.delete(js_path) if File.exist?(js_path)
      end
    end

    private

    def command_exists?(command)
      exts = ENV["PATHEXT"] ? ENV["PATHEXT"].split(";") : [""]
      ENV["PATH"].split(File::PATH_SEPARATOR).each do |path|
        exts.each do |ext|
          exe = File.join(path, "#{command}#{ext}")
          return true if File.executable?(exe) && !File.directory?(exe) # command exists in PATH
        end
      end
      false
    end
  end
end
