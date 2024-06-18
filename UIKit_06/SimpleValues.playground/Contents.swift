import UIKit

/*
let theAnswerToTheUItimateQuestion = 42
let pi = 3.14159
let myName = "Ahmad Sahar"

var restaurantRating: Double = 3
//restaurantRating = "Good"


//연산자 살펴보기
let sum = 23 + 20
let result = 32 - sum
let total = result * 5
let divide = total / 10

let a = 12
let b = 12.0
//let c = a + b
//a를 Double로 변환
let c = Double(a) + b

var d = 1
d += 2 // d = d + 2 의 단축 표현
d -= 1 // d = d - 1 의 단축 표현

//비교 연산자
//결과가 맞으면 true 반환, 틀리면 false 반환
1 == 1
2 != 1
2 > 1
1 < 2
//이상, 이하 연산자는 꺽쇠가 앞에, 등호가 뒤
1 >= 1
2 <= 1

//논리 연산자
//&&: 둘 다 맞아야 true 반환
(1 == 1) && (2 == 2)
(1 == 1) && (2 != 2)
//||: 둘 중에 하나만 맞아도 true 반환
(1 == 1) || (2 == 2)
(1 == 1) || (2 != 2)
(1 != 1) || (2 != 2)
//!: 결과 반대로 반환
!(1 == 1)

//문자열 결힙
let greeting = "Good" + "Morning"

//문자열과 다른 타입 결합
let rating = 3.5
var ratingResult = "The restaurant rating is " + String(rating)

//문자열 보간
ratingResult = "The restautant rating is \(rating)"


//조건문
//if
let isRestaurantOpen = true

if isRestaurantOpen {
    print("Restaurant id open.")
}

let isRestaurantFound = false

if isRestaurantFound {
    print("Restautant was not found.")
}

let drinkingAgeLimit = 21
let customerAge = 23

if customerAge < drinkingAgeLimit {
    print("Under age limit")
} else {
    print("Over age limit")
}

let trafficLightColor = "Yellow"

switch trafficLightColor {
case "Red":
    print("stop")
case "Yellow":
    print("Caution")
case "Green":
    print("Go")
default:
    print("Invalid color")
}

var spouseName: String?
print(spouseName ?? "No value in spouseName")

spouseName =  "Nia"
print(spouseName ?? "No value in spouseName")

//spouseTempVar에 값이 있으면(spouseName에 값이 있어서 nil 상태가 아니면) 실행
if let spouseTempVar = spouseName {
    let greeting = "Hello, " + spouseTempVar
    print(greeting)
} else {
    print("No one")
}


let myRange = 10...20 //20포함
let myRange2 = 10..<20 //20미포함

for number in myRange {
    print(number)
}

for number in myRange2 {
    print(number)
}

for number in (0...5).reversed()/*0부터 5까지 거꾸로*/ {
    print(number)
}

//조건 만족 못하면 아예 실행 안됨
var y = 50
while y < 50 {
    y += 5
    print("Y is \(y)")
}

//조건 만족 못해도 한 번은 실행
var x = 50
repeat {
    x += 5
    print("X is \(x)")
} while x < 50
 

//배열
//var로 만들면 수정 가능한 배열, let으로 만들면 수정 불가능한 배열
var shoppingList = ["Egg", "Milk"]
//빈 배열인지 확인
shoppingList.isEmpty
shoppingList.count == 0

print(shoppingList.count)
print("----------------------------------")

shoppingList.append("Cooking Oil")
shoppingList = shoppingList + ["Chicken"]

print(shoppingList)
print("----------------------------------")

shoppingList.insert("Water", at: 1)

print(shoppingList)
print("----------------------------------")

shoppingList.remove(at: 1)
shoppingList.removeLast()

print(shoppingList)
print("----------------------------------")

//리무브 활용
//삭제하시겠습니까 경고창 같은
var removeElement = shoppingList.removeLast()
print("remove: \(removeElement)")
print("----------------------------------")

shoppingList[1]
shoppingList[1] = "Soy Milk"
shoppingList[1]


//딕셔너리
//let: imuterble
//var: mutable
//새로운 딕셔너리 만들기: 키와 밸류 값이 한 쌍
var contactList = ["Shah"/*키값*/: "+6012345456789"/*밸류값*/, "Aamir": "+02234546789"]

print(contactList.count)
print(contactList.isEmpty)

//키의 밸류값 변경
contactList["Jane"] = "+0229876543"
print(contactList["Shah"] ?? "No Value")

var oldDictValue = contactList.removeValue(forKey: "Aamir")
print(oldDictValue ?? "No Value")
print(contactList.count)

//딕셔너리 반복문
//contactList에 있는 키와 값을 각각 name과 contactNumber에 할당해서 출력
for /*튜플형식*/(name, contactNumber) in contactList {
    print("\(name): \(contactNumber)")
}

//set 실습
var movieGeneres: Set = ["Horror", "Action", "Romantic Comedy"]

print(movieGeneres.count)
print(movieGeneres.isEmpty)

//set 안에 요소 추가
movieGeneres.insert("War")

//해당 요소가 set안에 들어있는지 확인
movieGeneres.contains("War")

var oldSetValue = movieGeneres.remove("Action")
print(oldSetValue ?? "No Value")

//set 반복문
for genre in movieGeneres {
    print(genre)
}

//set으로 배열 합치기
let movieGenres2: Set = ["SF", "War", "Fantasy"]

//합집합
movieGeneres.union(movieGenres2)
//교집합
movieGeneres.intersection(movieGenres2)
//차집합
movieGeneres.subtracting(movieGenres2)
//여집합
movieGeneres.symmetricDifference(movieGenres2)

var subSetMovieGenres = movieGeneres.subtracting(movieGenres2)

//set 비교연산자
movieGeneres == movieGenres2
subSetMovieGenres.isSubset(of: movieGeneres)
movieGeneres.isSuperset(of: subSetMovieGenres)

//딕셔너리는 '키'가 고유하고 세트는 '값'이 고유
 

//함수와 클로저
//매개변수와 반환값이 없는 함수
func serviceCharge() {
    let mealCost = 50
    let serviceCharge = mealCost / 10
    print("Service charge is \(serviceCharge)")
}

serviceCharge()

//매개변수와 반환값이 있는 함수
func serviceCharge(mealCost: Int) -> Int {
    return mealCost / 10
}
//함수호출
let serviceChargeAmount = serviceCharge(mealCost: 50)
print(serviceChargeAmount)


//외부매개변수명과 내부매개변수명
func serviceCharge(forMealPrice/*함수 밖에서 사용하는 이름*/ mealCost/*함수 안에서 사용하는 이름*/: Int) -> Int {
    return mealCost / 5
}
//함수호출
let serviceChargeAmount2 = serviceCharge(forMealPrice: 50)
print(serviceChargeAmount2)


//외부매개변수명 생략: 함수 이름이 직관적인 경우에만 사용하는 것이 좋음
func serviceCharge(_ mealCost: Int) -> Int {
    return mealCost / 5
}
//함수호출
let serviceChargeAmount3 = serviceCharge(50)
print(serviceChargeAmount3)
 


//중첩 함수 사용하기: 함수 안에 있는 함수는 밖에서는 호출 불가능
//차 할부금 계산
func calculateMonthlyPayments(carPrice: Double, downPayment: Double, interestRate: Double, paymentTerm: Double) -> Double {
    func loanAmount() -> Double {
        return carPrice - downPayment
    }
    func totalInterest() -> Double {
        return interestRate * paymentTerm
    }
    func numberOfMonths() -> Double {
        return paymentTerm * 12
    }
    
    return ((loanAmount() + (loanAmount() * totalInterest() / 100)) / numberOfMonths())
}
//함수 호출: 달에 235불 지불
calculateMonthlyPayments(carPrice: 50000, downPayment: 5000, interestRate: 3.5, paymentTerm: 36)

//함수를 반환타입으로 사용 = 클로저
func makePi() -> /*함수를 반환 값으로 사용: ((함수) -> 반환타입)*/(() -> Double) {
    func generatePi() -> Double {
        return 22.0 / 7.0
    }
    return generatePi
}

let pi = makePi()
print(pi())


//함수를 파라미터로 사용
func isThereAMatch(listOfNumbers: [Int], condition: (Int) -> Bool) -> Bool {
    for item in listOfNumbers {
        if condition(item) /*condition 갑과 item 값이 같으면 출력*/ {
            return true
        }
    }
    return false
}

//입력된 값이 홀인지 짝인지 출력
func oddNumber(number: Int) -> Bool {
    return (number % 2) > 0
}

let numbersList = [2, 4, 6, 7]
isThereAMatch(listOfNumbers: numbersList, condition: oddNumber)


//가드 사용
//guard 문: 조건이 충족되지 않으면 함수 조기 종료
func buySomething(itemValueEntered itemValueField: String, cardBalance: Int) -> Int {
    guard let itemValue = Int(itemValueField) else {
        print("error in item value")
        return cardBalance
    }
    let remainingBalance = cardBalance - itemValue
    return remainingBalance
}

print(buySomething(itemValueEntered: "10", cardBalance: 50))
print(buySomething(itemValueEntered: "blue", cardBalance: 50))
 

//클로저
var numbersArray = [2, 4, 6, 7]
let myClosure = { (number: Int) -> Int in
    let result = number * number
    return result
}

let mappedNumbers = numbersArray.map(myClosure)

var testNumbers = [2, 4, 6, 7]
//기본형
let mappedTestNumbers1 = testNumbers.map({ (number: Int) -> Int in
    let result = number * number
    return result
})
//축약형
let mappedTextNumbers2 = testNumbers.map { $0 * $0 }
print(mappedTextNumbers2)


//클래스
class Animal {
    var name: String
    var sound: String
    var numberOfLegs: Int
    var breathesOxygen: Bool = true
    
    init(name: String, sound: String, numberOfLegs: Int, breathesOxygen: Bool) {
        self.name = name
        self.sound = sound
        self.numberOfLegs = numberOfLegs
        self.breathesOxygen = breathesOxygen
    }
    
    //메소드: 클래스 혹은 구조체 안의 함수
    //메소드 생성
    func makeSound() {
        print(self.sound)
    }
    
    //self: 동일한 이름의 변수가 있을 때 위치 값에서 가능 근접한 값 사용
    func description() -> String {
        return "name: \(self.name) \nsound:\(self.sound) \nnumberOfLegs: \(self.numberOfLegs) \nbreathesOxygen: \(self.breathesOxygen)"
    }
}

//서브 클래스
//class 서브클래스명: 부모클래스명
class Mammal: Animal {
    //서브 클래스에 새로운 속성 추가
    let hasFurOrHair: Bool = true
    
    
    //부모 클래스에 있는 함수를 가져와서 재정의
    override func description() -> String {
        return super.description() + "\nhasFurOrHair: \(self.hasFurOrHair)"
    }
}

let cat = Mammal(name: "Cat", sound: "Mew", numberOfLegs: 4, breathesOxygen: true)
print(cat.description())
 


//구조체 struct 실습
struct Reptile {
    var name: String
    var sound: String
    var numbersOfLegs: Int
    var breadthesOxygen: Bool
    let hasFurOrHair: Bool = false
    
    func makeSound() {
        print(sound)
    }
    
    func description() -> String {
        return "Struct name: \(self.name) \nsound: \(self.sound) \nnumbersOfLegs: \(numbersOfLegs) \nbreathesOxygen: \(breadthesOxygen)"
    }
}

var snake = Reptile(name: "Snake", sound: "Hiss", numbersOfLegs: 0, breadthesOxygen: true)
print(snake.description())
snake.makeSound()


//열거형
enum TrafficLightColor: String {
    //열거형 타입이 문자열인 경우, 따로 rawValue를 입력하지 않으면 case이름이 rowValue로 출력
    //rawValue 미입력
    case red
    //rawValue 입력
    case yellow = "y"
    case green
    
    func description() -> String {
        switch self {
        case .red:
            return "red"
        case .yellow:
            return "yellow"
        case .green:
            return "green"
        }
    }
}

var trafficLightColor = TrafficLightColor.red
print(trafficLightColor.description())
print(trafficLightColor.rawValue)

var trafficLightColor2 = TrafficLightColor.yellow
print(trafficLightColor2.description())
print(trafficLightColor2.rawValue)


//프로토콜 실습
//프로토콜: 일종의 약속. 얘는 이 기능은 꼭 가지고 있어야 한다, 이 기능은 꼭 지켜야 한다~하는 약속
protocol  CalorieCount {
    //이 변수는 정수 타입을 출력하는 용도로 사용할 것이라는 약속(꼭 얘만 가져야 한다는 내용이 아니라 최소 이 기능은 가지고 있어야 해, 라는 의미)
    var calories: Int { get }
    //이 함수는 값을 문자열 타입으로 반환할 것이라는 약속
    func desccription() -> String
}

//프로토콜 사용법: class or struct 클래스 혹은 구조체 이름: 프로토콜 이름
class Burger: CalorieCount {
    var calories = 800
    
    func desccription() -> String {
        return "This buger has \(calories) calories"
    }
}

struct Fries: CalorieCount {
    var calories = 500
    
    func desccription() -> String {
        return "This fries have \(calories) calories"
    }
}



//확장 실습
enum Sauce {
    case chili
    case tomato
}

extension Sauce: CalorieCount {
    var calories: Int {
        switch self {
        case .chili:
            return 50
        case .tomato:
            return 80
        }
    }
    
    func desccription() -> String {
        switch self {
        case .chili:
            return "This chili sauce has \(calories) calories"
        case .tomato:
            return "This tomato sauce has \(calories) calories"
        }
    }
}

Sauce.chili.calories
Sauce.tomato.calories

let burger = Burger()
let fries = Fries()
let sauce = Sauce.tomato

//같은 프로토콜을 공유하는 객체끼리는 배열에 함께 담을 수 있음
let foodArray: [CalorieCount] = [burger, fries, sauce]

var totalCalories = 0
for food in foodArray {
    totalCalories += food.calories
}

print(totalCalories)
 */


//오류 핸들링
//오류 정의
enum WebsiteError: Error {
    case noInternerConnection
    case siteDown
    case wrongURL
}

func checkWebsite(siteUP: Bool) throws -> String {
    if siteUP == false {
        throw WebsiteError.siteDown
    }
    return "Site is up"
}

let siteStatus = false
do {
    print(try checkWebsite(siteUP: siteStatus))
} catch {
    print(error)
}
