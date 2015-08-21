
let arrayOfInformationDicitonary: [[String:Any]] = [
    [
        "firstName": "Pallavi",
        "lastName": "Srikhakollu",
        "employeeId": 1,
        "address": [
            "city" : "pune",
            "state" : "Maharshtra"
        ],
        "technology" :"C++",
        "experience" : 2
    ],
    [
        "firstName": "Rakshith",
        "lastName": "Nandish",
        "employeeId": 2,
        "address": [
            "city" : "Dharwad",
            "state" : "karanataka"
        ],
        "technology" :"java",
        "experience" : 1
        
        
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "employeeId": 3,
        "address": [
            "city" : "Mumbai",
            "state" : "Maharashtra"
        ],
        "technology" :"objective c",
        "experience" : 3
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "employeeId": 4,
        "address": [
            "city" : "california",
            "state" : "us"
        ],
        "technology" :"html",
        "experience" : 5
        
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "employeeId": 5,
        "address": [
            "city" : "newjersey",
            "state" : "karanataka"
        ],
        "technology" :"javascript",
        "experience" : 0
        
    ]]


import Foundation
class Employee : Person{
    
    var employeeId:Int
    var experience :Int
    var technology : String
    var arrayOfEmployeeObjects = Array <Employee>()
    
    
    override init() {
        
        self.technology = ""
        self.employeeId = 0
        self.experience = 0
        super.init()
        
    }
    override func printDetails(){
        super.printDetails()
        println("Technology is \(self.technology)")
        
        println("Employee is \(self.employeeId)")
        
    }
    
    func arrayOfEmployeeInformation(){
        
        for dict in arrayOfInformationDicitonary {
            var employee = Employee()
            employee.firstName = dict["firstName"] as! String
            employee.lastName = dict["lastName"] as! String
            employee.employeeId = dict["employeeId"] as! Int
            employee.technology = dict["technology"] as! String
            employee.experience = dict["experience"] as! Int
            var dictArray1: Dictionary<String, String>
            
            dictArray1 =  dict["address"] as! Dictionary
            
            employee.address.city = dictArray1["city"] as String!
            employee.address.state = dictArray1["state"] as String!
            arrayOfEmployeeObjects.append(employee)
        }
    }
    
    func selectedEmployeeWithLessExperience(userExperienceInput:Int){
        
        println("Employee details with less expereinece then \(userExperienceInput)");
        for employeeTemp in arrayOfEmployeeObjects {
            if(employeeTemp.experience < userExperienceInput){
                employeeTemp.printDetails()
            }
        }
        
    }
    
    func selectedEmployeeWithEqualExperience(userExperienceInput:Int){
        
        println("Employee details with equal expereinece to \(userExperienceInput)")
        
        for employeeTemp in arrayOfEmployeeObjects {
            if(employeeTemp.experience == userExperienceInput)
            {
                
                employeeTemp.printDetails()
                
            }
        }
        
    }
    
    func selectedEmployeeWithMoreExperience(userExperienceInput:Int){
        
        println("Employee details with less expereinece then \(userExperienceInput)")
        
        for employeeTemp in arrayOfEmployeeObjects
        {
            if(employeeTemp.experience == userExperienceInput)
            {
                employeeTemp.printDetails()
            }
        }
    }
    
    func employeeWithHighestExperienceInGivenTechnology(givenTechnology:String)
    {
        var maximumExperience = 0
        var employeeIdWithMaximumExperience = 0
        println("Employee with highest experience in the given technology \(givenTechnology)")
        var employeePrint = Employee()
         for (index,employeeTemp) in enumerate(arrayOfEmployeeObjects)
        {
            if(employeeTemp.technology == givenTechnology)
            {
                if(maximumExperience < employeeTemp.experience ){
        
                    employeeIdWithMaximumExperience = index ;
                   
                }
            }
        }
     employeePrint = arrayOfEmployeeObjects [employeeIdWithMaximumExperience]
        employeePrint.printDetails()
   
}

    
}



