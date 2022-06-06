module Utility
  class Handler
    # include Utility::Converter
    @currencies = Exchange.all
    def self.addCurrency(params)
        find_result = Exchange.find_by title: params[:title]
        if find_result.blank?
          resp = Exchange.new(params)
          esp = resp.save
          esp = Exchange.find_by title: params[:title]
          return { msg: "Currency has been added",  data: esp }
        end
        else
          return  { msg: "Currency already exits",  data: find_result }
    end
    def self.all
      data = @currencies
    end
    @currencies.each do |c|
      define_singleton_method("convert_#{c[:title].downcase}_to_usd") do |params|
        puts "PARAMS are: #{params}"
        c[:usd_value]
      end
    end
    def method_missing(m, *args, &block)
      binding.pry
      if @currencies.include?(m[:title].to_sym)
        self.send(@currencies[m[:title].to_sym], *args, &block)
      else
        raise ArgumentError.new("Method `#{m[:title]}` doesn't exist.")
    end
  end
  end
end
