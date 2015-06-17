class ActiveSupport::TimeWithZone
    def as_json(options = {})
        strftime("%b %d, %Y")
    end
end

