//
//  main.swift
//  Lesson 5
//
//  Created by Дмитрий on 11.12.2021.
//

import Foundation

//Задание 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

enum Action {
    case window
    case engine
    case door
    case trunk
}

enum EngineState {
    case start
    case stop
}

protocol CarProtocol {
    var topSpeed: Int { get set }
    var volumeTank: Int { get set }
    var transmission: String { get set }
    var color: String { get set }
    var year: Int { get set }
    var name: String { get set }

    func carAction()
}


//Задание 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).



extension CarProtocol {
    func frontLed() {
        print("Фары \(name) включены")
    }
}



extension CarProtocol {
    func start(type: String) -> String {
        return "Внимание открыто " + type
    }
}

extension CarProtocol {
    func someAction(type: String, startOne: Bool) -> String {
        if startOne {
            return start(type: type)
        } else {
            return "Внимание " + type + " закрыто"
        }
    }
    func printSomeAction() {
        print(someAction(type: "окно водителя", startOne: false))
    }
}

extension CarProtocol {
    func carNewAction(the option: Action) {
        switch option {
        case .window:
            print("Открыто окно пассажира")
        case .engine:
            print("Двигатель заведен")
        case .door:
            print("Открыта дверь водителя")
        case .trunk:
            print("В баке мало бензина")
        }
    }
}

// Задание 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

final class TrunkCar: CarProtocol {
    var topSpeed: Int
    var volumeTank: Int
    var transmission: String
    var color: String
    var year: Int
    var name: String
    var passegersSeats: Int
    var volumeTrunk: Int
    var diskSize: Int
    //var carNewAction: option

    init(topSpeed: Int = 0,
         volumeTank: Int = 0,
         transmission: String = "",
         color: String = "",
         year: Int = 0,
         name: String = "",
         passegersSeats: Int = 0,
         volumeTrunk: Int = 0,
         diskSize: Int = 0){    //carNewAction: option = .door)
        self.topSpeed = topSpeed
        self.volumeTank = volumeTank
        self.transmission = transmission
        self.color = color
        self.year = year
        self.name = name
        self.passegersSeats = passegersSeats
        self.volumeTrunk = volumeTrunk
        self.diskSize = diskSize    //self.carNewAction = carNewAction
    }
    func carAction() {
        print("Открыт люк")
    }
}

class SportCar: CarProtocol {
    var volumeTank: Int
    var transmission: String
    var color: String
    var year: Int
    var name: String
    var topSpeed: Int
    var numberOfDoors: Int
    var wheelDrive: String
    var engineWork: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель заведен")
            } else {
                print("Двигатель не заведен")
            }
        }
    }
    init(volumeTank: Int = 0,
         transmission: String = "",
         color: String = "",
         year: Int = 0,
         name: String = "",
         topSpeed: Int = 0,
         numberOfDoors: Int = 0,
         wheelDrive: String = "",
         engineWork: EngineState = .stop) {
        self.volumeTank = volumeTank
        self.transmission = transmission
        self.color = color
        self.year = year
        self.name = name
        self.topSpeed = topSpeed
        self.numberOfDoors = numberOfDoors
        self.wheelDrive = wheelDrive
        self.engineWork = engineWork
    }

    func carAction() {
        print("Открыт люк")
    }
}


// Задание 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvert

extension TrunkCar: CustomStringConvertible {
    var description: String{
        return "Марка автомобиля \(name)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String{
        return "Марка автомобиля \(name)"
    }
}

// Задание 5. Создать несколько объектов каждого класса. Применить к ним различные действия.


var trunkCar = TrunkCar(topSpeed: 140,
                        volumeTank: 150,
                        color: "black",
                        name: "Scania",
                        passegersSeats: 3,
                        diskSize: 33)

var sportCar = SportCar(name: "Mercedes",
                        topSpeed: 200,
                        numberOfDoors: 2,
                        wheelDrive: "four",
                        engineWork: .start)

trunkCar.carAction()
trunkCar.frontLed()
trunkCar.printSomeAction()
print("Максимальная скорость \(trunkCar.topSpeed)")
print(trunkCar.start(type: "окно водителя"))

print("___________")

sportCar.carAction()
sportCar.engineWork = .start
print(sportCar.numberOfDoors)
sportCar.frontLed()
print(sportCar.start(type: "окно пассажира"))
sportCar.printSomeAction()

print(trunkCar)
print(sportCar)

print(TrunkCar.init(name: "MAN"))
print(SportCar.init(name: "BMW"))

var window = Action.window
var door = Action.door
sportCar.carNewAction(the: window)
trunkCar.carNewAction(the: door)

