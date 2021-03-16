require "byebug"
require_relative "employee"
class Manager < Employee

    attr_reader :employees, :salary

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    # def bonus(multiplier) #ned  darren shawna
    #     return employee.salary if self.employees.empty? #[darren] [shawna, david] 

    #     money = 0
    #     @employees.each do |employee| #darren shawna
    #         money += employee.bonus(multiplier) #darren.bonus 0
    #         money += (employee.salary * multiplier)
    #     end
    #     return money
    # end

    def bonus(multiplier) #ned  darren shawna
        # return employee.salary if self.employees.empty? #[darren] [shawna, david] 
        money = 0
        # debugger
        @employees.each do |employee| #darren shawna
            if employee.employees.nil?
                money += employee.salary
            else
                money += employee.bonus(multiplier)
                # money += employee.salary
            end
        end
        money += @employees.first.salary * multiplier
        money * multiplier
    end
end

# Ned >> Darren >> Shawna, David >> 



ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees << darren
darren.employees << shawna 
darren.employees << david

p ned.bonus(5) # => 500_000 >> 110_000 (David, Shawna)
p darren.bonus(4) # => 88_000 >> 390_000 (Darren)
p david.bonus(3) # => 30_000