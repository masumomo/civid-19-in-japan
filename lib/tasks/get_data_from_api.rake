namespace :get_data_from_api do
    desc "Get totals and statistics data from CIVID-19 API"
    task getData: :environment do
        for total in get_totals do
            upsert_total total
        end
        for statistic in get_statistics do
            upsert_statistic(convert_statistic statistic)
        end
    end

    private
        def upsert_total(total_param)
            p total_param
            @total = Total.find_by date: total_param["date"]
            if @total == nil
                @total = Total.new(total_param)
                if @total.save
                    puts "Create Total data!"
                else
                    puts "Failed creating Total data"
                end
            else
                if @total.update_attributes(total_param)
                    puts "Update Total data!"
                else
                    puts "Failed updating Total data"
                end
            end
        end
        def convert_statistic(statistic)
            return converted_statistic = {
                name: statistic["name_en"],
                total_count: statistic["total_count"],
                male_count: statistic["male"]["count"],
                male_00s: statistic["male"]["generations_count"]["00s"],
                male_10s: statistic["male"]["generations_count"]["10s"],
                male_20s: statistic["male"]["generations_count"]["20s"],
                male_30s: statistic["male"]["generations_count"]["30s"],
                male_40s: statistic["male"]["generations_count"]["40s"],
                male_50s: statistic["male"]["generations_count"]["50s"],
                male_60s: statistic["male"]["generations_count"]["60s"],
                male_70s: statistic["male"]["generations_count"]["70s"],
                male_80s: statistic["male"]["generations_count"]["80s"],
                male_90s: statistic["male"]["generations_count"]["90s"],
                male_100s: statistic["male"]["generations_count"]["100s"],
                male_unknown: statistic["male"]["generations_count"]["unknown"],
                female_count: statistic["female"]["count"],
                female_00s: statistic["female"]["generations_count"]["00s"],
                female_10s: statistic["female"]["generations_count"]["10s"],
                female_20s: statistic["female"]["generations_count"]["20s"],
                female_30s: statistic["female"]["generations_count"]["30s"],
                female_40s: statistic["female"]["generations_count"]["40s"],
                female_50s: statistic["female"]["generations_count"]["50s"],
                female_60s: statistic["female"]["generations_count"]["60s"],
                female_70s: statistic["female"]["generations_count"]["70s"],
                female_80s: statistic["female"]["generations_count"]["80s"],
                female_90s: statistic["female"]["generations_count"]["90s"],
                female_100s: statistic["female"]["generations_count"]["100s"],
                female_unknown: statistic["female"]["generations_count"]["unknown"],
                unknown_gender_count: statistic["unkown_gender"]["count"],
                unknown_gender_00s: statistic["unkown_gender"]["generations_count"]["00s"],
                unknown_gender_10s: statistic["unkown_gender"]["generations_count"]["10s"],
                unknown_gender_20s: statistic["unkown_gender"]["generations_count"]["20s"],
                unknown_gender_30s: statistic["unkown_gender"]["generations_count"]["30s"],
                unknown_gender_40s: statistic["unkown_gender"]["generations_count"]["40s"],
                unknown_gender_50s: statistic["unkown_gender"]["generations_count"]["50s"],
                unknown_gender_60s: statistic["unkown_gender"]["generations_count"]["60s"],
                unknown_gender_70s: statistic["unkown_gender"]["generations_count"]["70s"],
                unknown_gender_80s: statistic["unkown_gender"]["generations_count"]["80s"],
                unknown_gender_90s: statistic["unkown_gender"]["generations_count"]["90s"],
                unknown_gender_100s: statistic["unkown_gender"]["generations_count"]["100s"],
                unknown_gender_unknown: statistic["unkown_gender"]["generations_count"]["unknown"]
            }
        end

        def upsert_statistic(statistic_param)
            puts statistic_param
            @statistic = Statistic.find_by name: statistic_param[:name]
            if @statistic == nil
                @statistic = Statistic.new(statistic_param)
                if @statistic.save
                    puts "Create Statistic data!"
                else
                    puts "Failed creating Statistic data"
                end
            else
                if @statistic.update_attributes(statistic_param)
                    puts "Update Statistic data!"
                else
                    puts "Failed Statistic updating data"
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


        def get_statistics
            request_api(
            "https://covid19-japan-web-api.now.sh/api/v1/statistics"
            )
        end
end
