import UIKit

//Задача 1
//Создать класс Contact c переменными name, number. Добавить конструктор для инициализации этих переменных.
//Создать класс Phone, содержащий переменные number, model и массив контактов(Contact). Добавить конструктор в класс Phone для инициализации этих переменных.
//Добавить метод receiveCall в класс Phone, который принимает на вход один параметр - номер звонящего и выводит сообщение в консоли - “Звонок от (имя_звонящего)” если в массиве контактов есть данный номер, “Звонок от (номер_звонящего)” если данного номера нет.
//
//  Задача 2
//Создать класс Product c переменными имя, цена
//Создать класс Basket, содержащий массив купленных товаров(Product) и методы добавления/удаления одного товара.
//Создать класс Customer, содержащий имя и объект класса Basket.
//Создать класс Market, содержащий имя, адрес и метод распечатки чека для Customer в виде:
//Магазин “(имя_магазина)”.
//Чек для (имя_клиента).
//
//(имя_товара): (цена_товара)
//(имя_товара): (цена_товара)
//....
//Итого: (общая стоимость)
//
//Спасибо за покупку!

//2
class Product{
    var name: String = ""
    var price: Double = 0.0
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class Basket {
    
    var products = [Product] ()

    func addProduct(name: String, price: Double) -> [Product] {
        let product = Product(name: name, price: price)
            products.append(product)
        return products
    }

    func deleteProduct(position: Int) -> [Product] {
            products.remove(at: position)
        return products
    }
}

class Customer {
    var name: String = ""
    var basket = Basket()
}

class Market{
    var name: String = ""
    var adress: String = ""
    
    func printCheck(customer: Customer)  {
        print("Магазин: " + "'\(name)'")
        print("Чек для \(customer.name)")
        print("")
        var totalPrice = 0.0
        for product in basket.products{
            print("\(product.name):" + "\(product.price) сом" )
            totalPrice += product.price
        }
        print("...")
    print("Итого: \(totalPrice) сом")
        print("")
        print("Спасибо за покупку!")
    }
}

var basket = Basket()
basket.addProduct(name: "Cola", price: 35.0)
basket.addProduct(name: "KitKat", price: 40.0)
basket.addProduct(name: "Pizza", price: 250.0)

var customer = Customer()
customer.name = "Aidana"

var market = Market()
market.name = "Zhyldyz"
market.adress = "Bishkek"
market.printCheck(customer: customer)

//1
class Contact {
    private var name:String = ""
    private var number: Int = 0
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    func getName() -> String {
        return name
    }
    
    func editName(contactName: String)  {
        name = contactName
    }
    
    func editNumber(contactNumber: Int)  {
    number = contactNumber
    }
    
    func getNumber() -> Int {
    return number
    }
}

class Phone {
    var number: Int = 0
    var model: String = ""
    var contacts = [String: Int]()
    
    init(number: Int, model: String, contacts: [String: Int]) {
        self.number = number
        self.model = model
        self.contacts = contacts
    }
    
    func receiveCall(number: Int)  {
        var inContacts = false
        for (key, value) in contacts {
            if number == value{
                print("Звонок от \(key)")
                inContacts = true
            }
        }
        if (inContacts == false){
            print("Zvonok ot \(number)")
        }
    }
}

class IPhone : Phone {
    
    override func receiveCall(number: Int) {
        var inContacts = false
        for (key, value) in contacts {
            if number == value{
                print("\(key) is calling")
                inContacts = true
            }
        }
        if (inContacts == false){
            print("\(number)")
        }
    }
    
}
var contact = Contact(name: "Nursultan", number: 0776608806)

var contacts = [String: Int]()
contacts["Akylzat"] = 0775508805
contacts["Aidar"] = 0555744477
contacts["Orozber"] = 0509209290
contacts["Nursultan"] = 0776608806
contacts["Aidana"] = 0553200209

//var phone = Phone(number: contact.getNumber(), model: "A31", contacts: contacts)
//
//phone.receiveCall(number: 0553200209)

var iPhone = IPhone(number: contact.getNumber(), model: "Iphone Xr", contacts: contacts)
iPhone.receiveCall(number: 0509209290)
