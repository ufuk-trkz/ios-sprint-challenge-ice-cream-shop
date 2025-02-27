                                                            // Ufuk Türközü
                    
//1. Create a struct called `Flavor`. Add the following properties. Think about what type they should be:
//    - `name`
//    - `rating`

struct Flavor {
    
    var name: String
    var rating: Int
    
}
                                                            
//2. Create an enum called `Size`.
//    - Give it a case for small, medium, and large.
//    - Make the enum have `Double` raw values. The raw value should represent the size's price. For example, small might be 3.99.

enum Size: Double {
    
    case small = 3.99
    case medium = 4.99
    case large = 5.99
    
}

//3. Create a struct called `Cone`.
//    - Give the struct properties (constants) that hold a flavor, topping (as a `String`), and size.
//    - Create a function called `eat`. It shouldn't have any arguments. It should print a string of text that includes the name of the cone's flavor. For example: "Mmm! I love <flavor here>!"

struct Cone {
    
    let flavor: Flavor
    let topping: String
    let size: Size

    func eat() {

        print("Mmm! I love \(flavor.name)!")
    }
}
                                                                
//4. Create a class called `IceCreamShop`.
//    - An ice cream shop needs a menu, so create variables that hold the various flavors, sizes, and toppings you want to have in your shop.
//    - Create a variable called `totalSales`. This will be used to keep track of how much money was made.

class IceCreamShop {
    
    var flavors: [Flavor] = []
    var sizes: [Size]
    var toppings: String
    var totalSales: Double = 0
    
    init(flavors: [Flavor], sizes: [Size], toppings: String, totalSales: Double) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = totalSales
    }
}

//5. If a customer asks which flavors are available, we need to be ready to tell them. To accomplis this, do the following:
//    - Create a function called `listTopFlavors`.
//    - This function doesn't need any arguments.
//    - In the function, build a string that lists out the names of each flavor in the shop's `flavors` array whose rating is over 4.0. For example, the string might say "Our top flavors are <flavors here>." **Hint:** You may want to loop through the array of flavors in order to access each one's name.
//    - When the string has been created, print it.

let iceCreamShop = IceCreamShop(flavors: [], sizes: [] , toppings: "", totalSales: 0)
                                                                    
func listTopFlavors(iceCreamShop: IceCreamShop) {
    
    for flavor in iceCreamShop.flavors {
        if flavor.rating > 4 {
            print("Our top flavors are \(flavor.name).")
        }
    }
}
                                                                              
//6. Customers will need a way to order a cone.
//    - Create a function called `orderCone`.
//    - This should have arguments needed to initialize a `Cone`, such as a flavor, topping (if desired), and a size.
//    - This function should return an optional `Cone` object. We're going to have it be optional for later use.
//    - In this function, create a constant that initializes a new `Cone` with the arguments passed into the function.
//    - Add the price of the cone to the `totalSales` variable you made in the previous step.
//    - Create a string that tells the price of the cone, along with its flavor and topping. **NOTE:** account for the potential lack of a topping on the `Cone` in that string by using optional binding (if-let). For example, the string could say "Your mint ice cream with chocolate chips is 3.99", or "Your vanilla ice cream is 5.99." Print the string.
//    - Finally, return the cone you initialized.

func orderCone(flavor: Flavor, topping: String?, size: Size) -> Cone? {
                                                                
    let newCone = Cone(flavor: flavor, topping: topping ?? "", size: size)
    
    iceCreamShop.totalSales += size.rawValue
    
    if topping != "" {
        print("Your \(newCone.size) \(newCone.flavor.name) ice cream with \(newCone.topping) is \(newCone.size.rawValue)")
    } else {
        print("Your \(newCone.size) \(newCone.flavor.name) ice cream is \(newCone.size.rawValue)")
    }
    
    print("Total Sales: \(iceCreamShop.totalSales)")
    return newCone
}
                                                            
//7. At the bottom of the playground, create a few `Flavor` constants, an array of sizes, and an array of toppings.
                                                                    
let strawberry = Flavor(name: "Strawberry", rating: 7)
let chocolate = Flavor(name: "Chocolate", rating: 8)
let vanilla = Flavor(name: "Vanilla", rating: 9)
              
iceCreamShop.flavors.append(strawberry)
iceCreamShop.flavors.append(chocolate)
iceCreamShop.flavors.append(vanilla)
                    
let sizes: [Size]
let toppings: [String] = ["Topping1", "Topping2", "Topping3"]
                                            
//8. Use the constants you just made to initialize a new `IceCreamShop` constant.
//9. Call the shop's `listTopFlavors` function and make sure it runs correctly.
                                                            
listTopFlavors(iceCreamShop: iceCreamShop)
                                                            
//10. Create a new `Cone` constant. Use the shop's `orderCone` function to assign the constant a `Cone` value.
                                                            
let newCone: Cone = orderCone(flavor: iceCreamShop.flavors[0], topping: "", size: .small) ?? <#default value#>
                                                            
//11. Using that new `Cone` constant, call its `eat` function without unwrapping the constant.

newCone.eat()

//Validate your work through running your playground and ensure that your code operates as designed.
//
//## Stretch Problems (Optional)
//
//After finishing your required elements, you can push your work further. These goals may or may not be things you have learned in this module but they build on the material you just studied. Time allowing, stretch your limits and see if you can deliver on the following **optional** goals:
//
//- Format the various strings to account for edge cases, such as if there are no flavors with a rating above 4.0, finishing the last flavor with "and". For example,"<flavor>, <flavor>, and <flavor>", instead of just "<flavor>, <flavor>, <flavor>"
//- In the `orderCone` function, check to make sure the flavor that the person requested exists on the menu.

                                                                                                
        
