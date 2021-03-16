
class Manager < Employee

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        return 0 if self.employees.empty?

        money = 0
        @employees.each do |employee|
            money += employee.bonus(multiplier)
        end

    end
end

# manager bonus == 
# Iterate over all employees (which will be instances)
# Check if employee.