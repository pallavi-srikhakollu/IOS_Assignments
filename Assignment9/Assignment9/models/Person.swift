import Foundation

class Person{
    
    var firstName:String
    var lastName :String
    var address :Address
    init()
    {
        self.firstName = ""
        self.lastName = ""
        self.address = Address()
    }
    
    func printDetails(){
        println( "FirstName is \(self.firstName)")
        println("LastName is \(self.lastName)")
        println("Address is \(self.address.city)")
    }
    
    
}
