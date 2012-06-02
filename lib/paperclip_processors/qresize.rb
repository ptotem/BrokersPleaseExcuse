module Paperclip
  # handles compression of image by reducing its quality
  class Qresize < Processor

    def initialize file, options = {}, attachment = nil
      super
      @format = File.extname(@file.path)
      @basename = File.basename(@file.path, @format)
    end

    def make
      src = @file
      dst = Tempfile.new([@basename, @format])
      dst.binmode

    #  debugger
      begin
        parameters = []
        parameters << ":source"
        parameters << "-quality 10"
        parameters << ":dest"

        parameters = parameters.flatten.compact.join(" ").strip.squeeze(" ")

        success = Paperclip.run("convert", parameters, :source => "#{File.expand_path(src.path)}[0]", :dest => File.expand_path(dst.path))
      rescue PaperclipCommandLineError => e
        raise PaperclipError, "There was an error during the Size Reduction  for #{@basename}" if @whiny
      end

      dst
    end

  end
end
