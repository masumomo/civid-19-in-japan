namespace :get_data_from_api do
    desc "Get totals and statistics data from CIVIC-19 API"
    task getData: :environment do
        puts "Hello World"
        # @totals = Total.all
        # puts @totals
        for total in get_totals do
            upsert total
        end
    end

    private

        def upsert(total_param)
            @total = Total.find_by date: total_param[:date]
            if @total == nil
                @total = Total.new(total_param)
                if @total.save
                    puts "Create data!"
                else
                    puts "Failed creating data"
                end
            else
                if @total.update_attributes(total_param)
                    puts "Update data!"
                else
                    puts "Failed updating data"
                end
            end
        end

        def request_api(url)
            response = Excon.get(
            url,
            headers: {
                'X-RapidAPI-Host' => URI.parse(url).host,
            }
            )
            return nil if response.status != 200
            JSON.parse(response.body)
        end

        def get_totals
            request_api(
            "https://covid19-japan-web-api.now.sh/api/v1/total?history=true&predict=true"
            )
        end
end
