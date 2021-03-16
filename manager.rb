require_relative "employee"
class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier) #ned  darren shawna
        return 0 if self.employees.empty? #[darren] [shawna, david] 

        money = 0
        @employees.each do |employee| #darren shawna
            money += employee.bonus(multiplier) #darren.bonus 0
        end
        return money
    end
end


ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees << darren
darren.employees << shawna 
darren.employees << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000