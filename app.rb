class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize (location, purpose, hour, min)
        location_validator(location)
        purpose_validator(purpose)
        hour_validator(hour)
        min_validaror(min)
    end

    def location_validator(location)
        if location.class == String
            @location = location
        else
            raise 'bad'
        end
    end

    def purpose_validator(purpose)
        if purpose.class == String
            @purpose = purpose
        else
            raise 'bad'
        end
    end

    def hour_validator(hour)
        if hour.class == Integer
            @hour = hour
        else
            raise 'bad'
        end
    end

    def min_validaror(min)
        if min.class == Integer
            @min = min
        else
            raise 'bad'
        end
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        day_validator(day)
    end

    def day_validator(day)
        if day.class == Integer
            @day = day
        else
            raise 'bad'
        end
    end

    def occurs_on?(day)
        self.day == day
    end

    def to_s
        "Reunión mensual en #{location} sobre #{purpose} el día #{day} a la(s) #{hour}:#{min}."
    end
end

puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        self.hour == hour && self.min == min
    end

    def to_s
        "Reunión diaria en #{location} sobre #{purpose} a la(s) #{hour}:#{min}."
    end
end

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize (location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        day_validator(day)
        month_validator(month)
        year_validator(year)
    end

    def day_validator(day)
        if day.class == Integer
            @day = day
        else
            raise 'bad'
        end
    end

    def month_validator(month)
        if month.class == Integer
            @month = month
        else
            raise 'bad'
        end
    end

    def year_validator(year)
        if year.class == Integer
            @year = year
        else
            raise 'bad'
        end
    end

    def occurs_on?(day, month, year)
        self.day == day && self.month == month && self.year == year
    end

    def to_s
        "Reunión única en #{location} sobre #{purpose} el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}."
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
