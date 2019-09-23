import UIKit

//------------16.09.2019--------------
////MARK: OPTIONAL
//func optional() {
//    var x: String? = "cfsdsd"
//
////Принудительное развёртывание (forced unwrapping) — небезопасно.
//    var a: String = x!
//
////Неявное развертывание при объявлении переменной — небезопасно.
//    a = x!
//
////Optional binding — безопасно.
//    if a == x  {
//
//    }
//
////Optional chaining — безопасно.
//    let b = x?.count
//
////Nil coalescing operator — безопасно.
//    a = x ?? ""
//
////Оператор Guard — безопасно.
//    func test() {
//       // guard let c = x, c = a else { return }
//    }
//
////Optional pattern — безопасно.
//    if case let a? = x {
//        print(a)
//    }
//}
//
//// MARK: CLASS
//class TestClass {
//
//    var one: Int?
//    var two: Int
//    var three = 3
//
//    init(two: Int) {
//        self.two = two
//    }
//}
//
//var instanceClass = TestClass(two: 2)
//
//instanceClass.one = 1
//instanceClass.two = 22
//instanceClass.three = 333
//
//debugPrint("one = \(instanceClass.one ?? 0), two = \(instanceClass.two), three = \(instanceClass.three)")
//
////MARK: STRUCT
//struct TestStruct {
//
//    var a: String?
//    var b: String
//    var c = "c"
//
//    init(b: String) {
//        self.b = b
//    }
//}
//
//var instanceStruct = TestStruct(b: "b")
//
//instanceStruct.a = "aa"
//instanceStruct.b = "bb"
//instanceStruct.c = "cc"
//
//debugPrint("a = \(instanceStruct.a ?? "error"), b = \(instanceStruct.b), c = \(instanceStruct.c)")
//
//struct Resolution {
//    var width = 0
//    var height = 0
//}
//
//class VideoMode {
//    var resolution = Resolution()
//    var interlaced = false
//    var frameRate = 0.0
//    var name: String?
//}
//
//var someResolution = Resolution()
//let someVideoMode = VideoMode()
//
//someVideoMode.resolution.height = 200
//debugPrint("someVideoMode.resolution.height = \(someVideoMode.resolution.height)")
//someResolution.height = 100
//debugPrint("someResolution.height = \(someResolution.height)")
//debugPrint("someVideoMode.resolution.height = \(someVideoMode.resolution.height)")
//
////MARK: Операторы тождественности
//
//class Person: Equatable {
//
//    let ssn: Int
//    let name: String
//
//    init(ssn: Int, name: String) {
//        self.ssn = ssn
//        self.name = name
//    }
//
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        return lhs.name == rhs.name
//    }
//}
//
//let person1 = Person(ssn: 5, name: "Bob")
//let person2 = Person(ssn: 5, name: "Bob")
//
//if person1 == person2 {
//    debugPrint("the two instances are equal!")
//}
//
//if person1 === person1 {
//    debugPrint("person1 === person2: the two instances are identical!")
//} else {
//    debugPrint("person1 === person2: the two instances are NOT identical!")
//}
//
//let person3 = Person(ssn: 4, name: "Andy")
//let person4 = Person(ssn: 7, name: "David")
//
//if person3 == person4 {
//    debugPrint("person3 == person4")
//}
//
//if person3 === person4 {
//    debugPrint("person3 === person4: the two instances are identical!")
//} else if person3 !== person4 {
//    debugPrint("person3 !== person4: the two instances are not identical!")
//}

//-----------------17.08.2019-----------------------

//MARK: несколько переменных в guard

//func fewVarInGuard() {
//
//    let a = "a"
//    let b = "b"
//    let c = "c"
//
//    guard a == b, a == c else {
//        return
//    }
//
//}
//
////MARK: deinit (можно ли вызвать в struct)
//
//struct DeinitStruct {
//
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
////    deinit {
////
////    }
//}

//
//class DeinitClass {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//        debugPrint("name - инициализируется")
//    }
//
//    deinit {
//        debugPrint("name - деинициализируется")
//    }
//}
//
//var deinitClass1: DeinitClass?
//var deinitClass2: DeinitClass?
//var deinitClass3: DeinitClass?
//
//deinitClass1 = DeinitClass(name: "Alex")
//deinitClass2 = deinitClass1
//deinitClass3 = deinitClass1
//
//deinitClass1 = nil
//deinitClass2 = nil
//deinitClass3 = nil
//
//
////MARK:  пример разницы между классом и структурой
//
//class SomeClass {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//var aClass = SomeClass(name: "A")
//var bClass = aClass
//bClass.name = "B"
//
//debugPrint("aClass = \(aClass.name)")
//debugPrint("bClass = \(bClass.name)")
//
//
//struct SomeStruct {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//var aStruct = SomeStruct(name: "A")
//var bStruct = aStruct
//bStruct.name = "B"
//
//debugPrint("aStruct = \(aStruct.name)")
//debugPrint("bStruct = \(bStruct.name)")
//
////MARK:- Generic
//
//func exampleOneGeneric<T>(x: T) -> T {
//    return x
//}
//
//func exampleTwoGeneric(x: Any) -> Any {
//    return x
//}
//
//func int1(int1: Int, int2: Int) -> Int {
//    return int1 + int2
//}
//
//func float1(f1: Float, f2: Float) -> Float {
//    return f1 + f2
//}
//
//func gener<T>(t1: T, t2: T) -> T {
//    return t2
//}
//gener(t1: 3, t2: 5)
//
//var z = exampleOneGeneric(x: "Hello")
//var y = exampleTwoGeneric(x: "Hello")
//
//z = ""
//y = ""
//
//
//class SomeClassGeneric<T> {
//
//    var items: [T]?
//    func append(item: T) {
//       items?.append(item)
//    }
//
//}
//
//var gener = SomeClassGeneric<Any>()
//var append = gener.items?.append("qwerty")
//gener.append(item: append ?? "")
//debugPrint(gener.items ?? [String]())


//protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
//extension Int: Summable {}
//extension Double: Summable {}
//extension String: Summable {}
//extension Float: Summable {}
//
//
//func add<T: Summable>(x: T, y: T) -> T {
//    return x + y
//}
//
//let sum = add(x: 1.333, y: 1.6)
//
//
//
//class ClassGeneric<T> {
//
//    var b: [T]
//
//    init(b: [T]) {
//        self.b = b
//    }
//
//    func add(a: T) {
//        self.b.append(a)
//    }
//}
//
//protocol MyProtocol {
//
//}
//
//class MyUniversalArrayClass<T> {//<T: MyProtocol> {
//    var myArray: [T] = []
//
//    func saveToArray(value: T) {
//        myArray.append(value)
//    }
//}
//
//var stringArray = MyUniversalArrayClass<String>()
//stringArray.saveToArray(value: "132")
//stringArray.saveToArray(value: "312")
//
//var fistObj = stringArray.myArray.first!
//
//var intArray = MyUniversalArrayClass<Int>()
//intArray.saveToArray(value: 23)
//debugPrint(intArray.myArray.count)
//
////class MyObj: MyProtocol {}
////
////var t = MyUniversalArray<MyObj>()
//
//struct MyUniversalArrayStruct<T> {
//    var myArray: [T] = []
//
//    mutating func saveToArray(value: T) {
//        myArray.append(value)
//    }
//}
//
//var doubleArray = MyUniversalArrayStruct<Double>()
//doubleArray.saveToArray(value: 5.10)
//debugPrint(doubleArray.myArray.count)
//
//
//var charArray = MyUniversalArrayStruct<Character>()
//charArray.saveToArray(value: "x")
//let x = charArray.myArray
//debugPrint(x)
//
//charArray.saveToArray(value: "s")
//let s = charArray.myArray
//debugPrint(s)
//
//
//func a<T>(_ a: inout T,_ b: inout T) {
//
//}
//
//func b<T>(a: T, b: T) {
//
//}

//----------18.09.2019----------
// Closure

//class Student {
//    var name = String()
//    var age = Int()
//}
//
//var student1 = Student()
//student1.name = "Andrew"
//student1.age = 20
//
//var student2 = Student()
//student2.name = "Bogdan"
//student2.age = 31
//
//var student3 = Student()
//student3.name = "Daniil"
//student3.age = 47
//
//var studentArray = [student1, student2, student3]
//
//var sortAge = studentArray.sorted { $0.age < $1.age }
//var sortAge1 = studentArray.sorted(by: {$0.age < $1.age})
//
//print(sortAge)
//
//
//var names = ["Максим", "Сергей", "николай", "Артем", "Альберт", "Тарас"]
//var namesArray = ["Максим", "Сергей", "Николай", "Артем", "Альберт", "Тарас"]
//
////1
//let n = names.sorted(by: { $0.lowercased() < $1.lowercased() })
//debugPrint("1) n = \(n)")
////2
//let q = names.sorted(by: { $0 < $1 })
//debugPrint("2) q = \(q)")
////3
//let z = names.sorted(by: <)
//debugPrint("3) z = \(z)")
//// 4
//let t = names.sorted()
//debugPrint("4) t = \(t)")
//
//// С несколькими параметрами
//let avgFunc = { (a, b) in (a + b) / 2}
//let avg = avgFunc(3, 5)
//debugPrint(avg)
//
//// Void функция как параметр
//func checkAndProgress(_ number: Int, process: (Int) -> Void) {
//    if number < 10 {
//    process(number)
//    }
//}
//
//let process = {
//    (number: Int) in print(number * 10)
//}
//
//let check = checkAndProgress(5, process: process)
//
//// Без возвращаемого значения
//let add2AndPrint = { a in
//    print(a + 2)
//}
//
//add2AndPrint(4)
//
//// Изменение захваченных переменных
//var xy = 5
//
//let addZtoXY = { z in
//    print(xy += z)
//}
//addZtoXY(4)
//
//// С несколькими операторами
//
//struct Point {
//    var x: Double
//    var y: Double
//}
//
//let getDistance = { (p1: Point, p2: Point) -> Double in
//    let d1 = pow(p1.x - p2.x, 2)
//    let d2 = pow(p1.y - p2.y, 2)
//    return sqrt(d1 + d2)
//}
//let point1 = Point(x: 0, y: 5)
//let point2 = Point(x: 5, y: 0)
//let distance = getDistance(point1, point2)
//print(distance)
//
//// С одним параметром
//
//let powOfTwo = { (power: Int) -> Int in
//    Int(pow(2.0, Double(power)))
//}
//
//let pow8 = powOfTwo(8)
//print("powOfTwo(4)  = \(pow8)")
//
//let powOfThree = {
//    power in pow(3.0, power)
//}
//let pow3 = powOfThree(3)
//print("powOfThree(10) = \(pow3)")
//
//// Функция как возвращаемое значение
//func makeSum() -> (_ a: Int, _ b: Int) -> Int {
//    return { (a, b) in a + b}
//}
//
//let sumFunc = makeSum()
//let sum = sumFunc(5, 8)
//print(sum)
//
//
////--------------TEST-----------
//
//var aa = 5
//var bb = 6
//
//var myVar1: () -> () = {
//    print("5 + 6 = \(aa + bb)")
//}
//
//myVar1
//
//var myVar2: () -> (Int) = { () -> (Int) in
//    return aa + bb
//}
//print("myVar2 = \(myVar2)")
//
//var myVar3: (Int, Int) -> (Int) = { (a: Int, b: Int) -> (Int) in
//    return a + b
//}
//
//print("myVar3(5,6) = \(myVar3(aa, bb))")
//
//
//// Это Closure у которого содержание имеет одно единственное выражение, поетому return можно не писать
//var closure1  = { (a: Int, b: Int) -> Int in
//  a + b
//}
//
//print("closure1 = \(closure1(1, 2))")
//
//// Анонимный кложер
//var mySum : (Int, Int) -> (Int)
//mySum = {
//    $0 + $1
//}
//
//var valueSum = mySum(1,2)
//print("valueSum = \(valueSum)")
//
//var closureTest = { (name: String, age: Int) in
//    print(name, age)
//}
//
//
//class ClassClosure {
//
//    var closure: ((_ arg: Double) -> Bool)
//
//    init(closure: @escaping ((_ arg: Double) -> Bool)) {
//        self.closure = closure
//    }
//}
//
//
//class ChatViewController {
//
//    var someClosure: (() -> Void)! // nil
//    var anotherClosure: ((_ arg: Int) -> Bool)! // nil
//
//    func executeClosures() {
//        if self.someClosure != nil {
//            self.someClosure()
//        }
//
//        if self.anotherClosure != nil {
//            let boolResult = self.anotherClosure(2)
//        }
//    }
//
//    func addSelfClosure(closure: (() -> Void)!) {
//        self.someClosure = closure
//    }
//
//    func printSomething() {
//        self.addSelfClosure() {
//            print("closure called")
//        }
//        self.executeClosures() // prints: closure called
//    }
//}
//
//var chat = ChatViewController()
//var close = chat.anotherClosure
//close = { (arg: Int) -> (Bool) in
//    if arg % 2 == 0 {
//        return true
//    } else {
//        return false
//    }
//}
//
//if let none = close {
//    debugPrint(none(5))
//} else {
//    debugPrint("Error")
//}

//class someClass {
//    var someClosure: ((_ arg: Int) -> Bool)
//
//    init(someClosure: ((_ arg: Int) -> Bool)) {
//        self.someClosure = someClosure
//    }
//}


//---------19.09.2019--------------

//weak self


//class SomeObj<T> {
//    var a = T.self
//    var b = T.self
//    var closure = { [weak self](a: T, b: T) -> T in
//        var c = "a =\(a), b = \(b)"
//        return c as! T
//    }
//}

//class SomeObj {
//    var a = Int()
//    var b = Int()
//    var closureA = { [weak self](a: Int, b: Int) -> String in
//        var c = "a =\(a), b = \(b)"
//        return c
//    }
//    var closureB = { (a: Int, b: Int) -> Int in
//        return a + b
//    }
//}
//
//var someObjc = SomeObj()
//
//DispatchQueue.main.async {
//    someObjc.closureB
//}

//let myClosure = { [weak self] in
//    guard self = self else { return }
//}

// ARC
//
//class Person {
//    var name: String?
//    unowned var workPlace: Company
//
//    init(workPlace: Company) {
//        self.workPlace = workPlace
//        print("Person init")
//    }
//
//    deinit {
//        debugPrint("Person deinit")
//    }
//}
//
//class Company {
//    var name: String?
//    weak var worker: Person?
//
//    init() {
//        print("Company init")
//    }
//
//    deinit {
//        debugPrint("Company deinit")
//    }
//}
//
//var person1: Person?
//var company1: Company?
//
//func companyReturn() -> Company {
//    guard let company = company1 else { return company1! }
//    return company
//}
//
//person1 = Person(workPlace: companyReturn())
//person1?.name = "Jim"
//var personName = person1?.name
//person1?.workPlace.name = "Andersen"
//person1 = nil
//
//company1?.name = "Andersen"
//
//
////protocol ProtocolNameDelegate: class {
////}
////
////class SomeClass {
////    weak var delegate: ProtocolNameDelegate?
////}
//
//class School {
//    weak var teacher: Teacher?
//    weak var student: Student?
//
//    init() {
//        print("School init")
//    }
//
//    deinit {
//        print("School deinit")
//    }
//}
//
//class Teacher {
//    var school: School?
//
//    init() {
//        print("Teacher init")
//    }
//
//    deinit {
//        print("Teacher deinit")
//    }
//}
//
//class Student {
//    var school: School?
//
//    init() {
//        print("Student init")
//    }
//
//    deinit {
//        print("Student deinit")
//    }
//}
//
//var school: School? = School()
//var teacher: Teacher? = Teacher()
//var student: Student? = Student()
//
//print("------------------------")
//
//school = nil
//teacher = nil
//student = nil
////teacher = nil
////student = nil
//
//
//var x = 5
//var y = 5
//
////Захват значения х
//let someClosure = {[x, y] in
//    print("\(x), \(y)")
//}
//
//x = 6
//y = 6
//
//someClosure()
//print(x,y)
//
//
//class WWDCGreeting {
//    let who: String
//
//    init(who: String) {
//        self.who = who
//    }
//
//    lazy var greetingMaker: () -> String = { [weak self] in
//        return "Hello, \(self?.who ?? "")."
//    }
//}
//var wwdc: WWDCGreeting? = WWDCGreeting(who: "Man")
//var noname = wwdc?.greetingMaker()
//
//if let who = noname {
//    print("who = \(who)")
//} else {
//    print("noname = \(noname)")
//}
//
//class Kraken {
//    let petName = "Krakey-poo"
//    lazy var businessCardName: String = {
//        return "Mr. Kraken AKA " + self.petName
//    }()
//}
//
//var kraken: Kraken? = Kraken()
//kraken?.businessCardName
//
//
//
//struct InterviewCandidate {
//    var isiOS:Bool?
//
//    lazy var iOSResumeDescription: String = {
//        return "I am an iOS developer"
//    }()
//    lazy var androidResumeDescription: String = {
//        return "I am an android developer"
//    }()
//}
//
//var person1 = InterviewCandidate()
//person1.isiOS = true
//
//if person1.isiOS! {
//    print(person1.iOSResumeDescription)
//} else {
//    print(person1.androidResumeDescription)
//}
//
//
//protocol ProtocolNameDelegateClass: class {
//
//}
//
//protocol ProtocolNameDelegateObject: AnyObject {
//
//}

//-----------19.09.2019--------

////////////// //////////////////

//// Протокол для делегирования нажатия кнопки в ViewController
//protocol ButtonDelegate: class {
//    func onButtonTap(sender: UIButton)
//}
//
//
//class MyViewController: UIViewController, ButtonDelegate{
//
//    let viewWithTextAndButton = ViewWithTextAndButton(frame:CGRect(x:0, y:0, width:100, height:100))
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Присваиваем делегат
//        viewWithTextAndButton.delegate = self
//        view.addSubview(viewWithTextAndButton)
//    }
//
//    // MARK: ButtonDelegate
//    // Реализация делегируемой логики здесь
//    func onButtonTap(sender: UIButton) {
//        print("This button was clicked in the subview!")
//    }
//}

//
//class Weak<T: AnyObject> {
//    weak var value : T?
//    init (value: T) {
//        self.value = value
//    }
//}
//
//class Stuff {}
//var weakly : [Weak<Stuff>] = [Weak(value: Stuff()), Weak(value: Stuff())]

//----------20.09.2019----
//class Book {
//    var pages = [Page]()
//
//    func add(_ page : Page) {
//        pages.append(page)
//    }
//}
//
//class Page {
//    weak var book : Book?
//
//    init(book : Book) {
//        self.book = book
//    }
//}
//
//let book = Book()
//let page = Page(book: book)
//book.add(page)
//
//
//class Human {
//    var firstName: String
//    var lastName: String
//
//    var fullName:(String) -> String = { [unowned self] titlePrefix in
//        return "\(titlePrefix) \(self.firstName) \(self.lastName)"
//    }
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        print("Human init")
//    }
//
//    deinit {
//        print("Human deinit")
//    }
//}
//
//var humanObj: Human? = Human(firstName: "Jon", lastName: "Snow")
//let fullName = humanObj?.fullName("Mr")
//humanObj = nil


//class Human {
//    var firstName: String
//    var lastName: String
//
//    var fullName: ((String) -> String)?
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    deinit {
//        print("Human deinit")
//    }
//}
//
//var humanObjc: Human = Human(firstName: "Jon", lastName: "Snow")
//var mrClosure = humanObjc.fullName
////mrClosure = { [weak self] (mr: String) -> String in
////    return "\(self.mr) \(humanObjc.firstName)) \(humanObjc.lastName)"
////}
////print(mrClosure("Mr") ?? "")
//
//class Test {
//    var humanObjc: Human = Human(firstName: "Jon", lastName: "Snow")
//
//    func someFunc() {
//        var mrClosure = humanObjc.fullName
//        mrClosure = { [weak self] (mr: String) -> String in
//            return "\(mr) \(self!.humanObjc.firstName)) \(self!.humanObjc.lastName)"
//        }
//    }
//}

// tuple
//
//var tuple = (name: "Jon", lastName: "Snow", age: 25, sex: "Men", status: "Ex king", originalName: "Kit", OriginalLastName: "Harington")
//
//
//func someFunc(name: String, age: Int) -> (returnName: String, returnAge: Int) {
//    return (name, age)
//}
//
//var someObjc = someFunc(name: "Jon", age: 25)
//let name = someObjc.returnName
//let age = someObjc.returnAge
//


// ENUM

//enum WeakDay {
//
//    case monday
//    case tuesday
//    case wednes­day
//    case thursday
//    case friday
//    case saturday
//    case sunday
//
//}


//enum Weak {
//
//    enum Monday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Tuesday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Wednes­day {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Thursday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Friday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Saturday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//
//    enum Sunday {
//        case morning(Dictionary<String, String>)
//        case day(Dictionary<String, String>)
//        case night(Dictionary<String, String>)
//    }
//}
//
//
//var dayFriday = Weak.Friday.day(["8:00": "Start work"])
//
//switch dayFriday {
//
//case .morning(_):
//    print("morning")
//case .day(_):
//    print("day")
//case .night(_):
//    print("night")
//default:
//    break
//}
//
//
//class SomeClass {
//
//    enum SomeEnum: Int {
//        case some1 = 1
//        case some2 = 2
//        case some3 = 3
//    }
//}
//
//var a = SomeClass.SomeEnum.some1

//let spring = Season.spring
//let baseValue = spring.rawValue
//
//print(baseValue)


//enum Season: Int {
//    case summer
//    case fall
//    case winter
//    case spring
//    case none
//
//    init(name: String) {
//        switch name.lowercased() {
//        case "summer":
//            self = .summer
//        case "Fall":
//            self = .fall
//        case "winter":
//            self = .winter
//        case "spring":
//            self = .spring
//        default:
//            self = .none
//        }
//    }
//}
//
//let winter = Season(name: "fall")
//print(winter)

//indirect enum Shape {
//    case point(Int, Int)
//    case line(Shape, Shape)
//
//    func toString() -> String {
//        switch self {
//            case .point(let x, let y):
//                return "(\(x), \(y))"
//            case .line(let p1, let p2):
//                return p1.toString() + "; " + p2.toString()
//        }
//    }
//}
//
//let point1 = Shape.point(3, 4)
//let point2 = Shape.point(7, 9)
//let line = Shape.line(point1, point2)
//let info = line.toString()
//print(point1)
//print(point2)
//print(info)


//enum WeakDay {
//
//    case monday
//    case tuesday
//    case wednes­day
//    case thursday
//    case friday
//    case saturday
//    case sunday
//}
//
//func dayType(for day: String) -> String {
//    switch day {
//    case "Saturday", "Sunday":
//        return "Weekend"
//    case "Monday", "Tuesday", "Wednessday", "Thursday", "Friday":
//        return "Weekday"
//    default:
//        return "This is not a valid date"
//    }
//}
//
//let result1 = dayType(for: "Sunday") //will return "Weekend"
//let result2 = dayType(for: "Thursday")
//
//print(result1)
//print(result2)


//enum AppleDevice {
//    case iPad
//    case iPhone
//    case AppleTv
//    case AppleWatch
//
//    func description() -> String {
//        switch self {
//        case .AppleTv:
//            return "AppleTv is an apple device"
//        case .AppleWatch:
//            return "AppleWatch is an apple device"
//        case .iPad:
//            return "iPad is an apple device"
//        case .iPhone:
//            return "iPhone is an apple device"
//        default:
//            break
//        }
//    }
//}
//
//var watch = AppleDevice.AppleWatch.description()
//print(watch)

//enum Flagman: String{
//    case Samsung = "Galaxy S9"
//    case Apple = "iPhone X"
//    case Microsoft = "Lumia 950"
//    case Google = "Pixel 2"
//}
//
//print(Flagman.Apple.rawValue)
//
//enum DayOfWeek: Int{
//
//    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
//
//    var label : String {
//        switch self {
//        case .Monday:
//            return "Понедельник"
//        case .Tuesday:
//            return "Вторник"
//        case .Wednesday:
//            return "Среда"
//        case .Thursday:
//            return "Четверг"
//        case .Friday:
//            return "Пятница"
//        case .Saturday:
//            return "Суббота"
//        case .Sunday:
//            return "Воскресенье"
//        }
//    }
//}
//let day1 = DayOfWeek.Monday
//print(day1.label)               // Понедельник
//print(DayOfWeek.Friday.label)   // Пятница

enum Cash {
    case cardNumber(String?)
    case cardHolderName(String?)
    case cardExpirationDate(String?)
    case giftCertificateNumber(String?)
    case paypalTransactionId(String?)
    case paypalTransactionAuthCode(String?)
}
