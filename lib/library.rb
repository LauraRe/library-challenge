class Library
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :collection, :person

    def initialize 
        @collection = YAML.load_file('./lib/data.yml') 
        @person = person
    end

    def display_title_author
        @collection.map {|obj| obj[:item]}
    end

    def check_out(name)
        title_author = @collection.map {|obj| obj[:item]}
        titles = title_author.map {|obj| obj[:title]}
        index =titles.index(name)
        if @collection[index][:available] then
            @collection[index][:available] = false
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            true
        else
            false
        end



    end
        
    

    def availability
       @collection[][:available] == true ? check_out : unavailable_book
    end


    def set_return_date
        if check_out == true then
            book[:return_date] = Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%Y')
        end
    end
end








