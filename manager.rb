require "byebug"
require_relative "employee"
class Manager < Employee

    attr_reader :employees, :salary

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier) # Ned
        money = 0
        @employees.each do |employee| # Darren
            if employee.employees.nil?
                money += employee.salary * multiplier
            else
                money += employee.bonus(multiplier) # Darren
                money += employee.salary * multiplier
            end
        end
        money 
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

p ned.bonus(5) # => 500_000 >> 390_000 (Darren)
p darren.bonus(4) # => 88_000 >> 110_000 (David, Shawna)
p david.bonus(3) # => 30_000