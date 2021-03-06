module TotalHelper
    def get_beginning_date
        @beginning_date = Total
        .select("date")
        .order(:date)
        .limit(1)[0][:date]
    end
    def get_latest_date
        @latest_date = Total
        .select("date")
        .order("date DESC")
        .limit(1)[0][:date]
    end

    def total_by_duration(start_date, end_date)
        if start_date.methods.include? :strftime then
            start_date = start_date.strftime("%Y%m%d")
        end
        if end_date.methods.include? :strftime then
            end_date = end_date.strftime("%Y%m%d")
        end
        @totals = Total
            .where("date >= ? and date <= ? ", start_date, end_date)
            .order(:date)
        @totaldata = {}
        @totaldata[:labels] = []
        @totaldata[:datasets] = []
        @totaldata[:datasets] << { label: "Pcr", data: [] } # 0
        @totaldata[:datasets] << { label: "Hospitalize", data: [] } # 1
        @totaldata[:datasets] << { label: "Positive", data: [] } # 2
        @totaldata[:datasets] << { label: "Severe", data: [] } # 3
        @totaldata[:datasets] << { label: "Dischargecr", data: [] }# 4
        @totaldata[:datasets] << { label: "Death", data: [] } # 5
        @totaldata[:datasets] << { label: "Symptom confirming", data: [] } # 6

        @totals.each do |total|
            @totaldata[:labels] << total.date
            @totaldata[:datasets][0][:data] << total.pcr
            @totaldata[:datasets][1][:data] << total.hospitalize
            @totaldata[:datasets][2][:data] << total.positive
            @totaldata[:datasets][3][:data] << total.severe
            @totaldata[:datasets][4][:data] << total.discharge
            @totaldata[:datasets][5][:data] << total.death
            @totaldata[:datasets][6][:data] << total.symptom_confirming
        end
        return @totaldata
    end

end
