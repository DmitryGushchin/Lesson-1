//
//  main.swift
//  Lesson 4
//
//  Created by Дмитрий on 05.12.2021.
//

import Foundation

// Задание 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.


class Car {
    var color: String
    var name: String
    var transmission: String
    var year: Int
    var volumeTank: Int
    var volumeEngine: Int
    var zeroToOneHundred: Double

    init (color: String, name: String, transmission: String, year: Int, volumeTank: Int, volumeEngine: Int, zeroToOneHundred: Double) {
        self.color = color  //Если в ините создать значение = 0/ = "", то при вызове класса далее, можно будет не указывать данное свойство
        self.name = name
        self.transmission = transmission
        self.year = year
        self.volumeTank = volumeTank
        self.volumeEngine = volumeEngine
        self.zeroToOneHundred = zeroToOneHundred
    }
    func carAction() {
        print("У \(name) заведен двигатель")
    }
}

let car = Car(color: "white", name: "BMW", transmission: "Automatic", year: 2018, volumeTank: 65, volumeEngine: 3000, zeroToOneHundred: 6)
car.color = "black"
car.carAction()
print(car.color)

// Задание 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
// Задание 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
// Задание 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
// Задание 5. Создать несколько объектов каждого класса. Применить к ним различные действия.


enum Action {
    case window
    case engine
    case door
    case trunk
}

let TrunkCar1 = Action.engine
let TrunkCar2 = Action.door

class TrunkCar: Car {
    var passegersSeats: Int
    var volumeTrunk: Int
    var diskSize: Int
    func carAction1(the option: Action) {
        switch option {
        case .window:
            print("Открыто окно пассажира")
        case .engine:
            print("Двигатель заведен")
        case .door:
            print("У \(name) открыта дверь водителя")
        case .trunk:
            print("В баке мало бензина")
        }
    }
    override func carAction() {
        super.carAction()
        print("Внимание! Возможен перегрев!")
    }
    init(color: String, name: String, transmission: String, year: Int, volumeTank: Int, volumeEngine: Int, zeroToOneHundred: Double, passegersSeats: Int, volumeTrunk: Int, diskSize: Int) {
        self.passegersSeats = passegersSeats
        self.volumeTrunk = volumeTrunk
        self.diskSize = diskSize
        super.init(color: color, name: name, transmission: transmission, year: year, volumeTank: volumeTank, volumeEngine: volumeEngine, zeroToOneHundred: zeroToOneHundred)
    }
}

enum EngineState {
    case start
    case stop
}

class SportCar: Car {
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
    override func carAction() {
        super.carAction()
        print("Топливо расходуется")
    }
    func frontLed() {
        print("Фары \(name) включены")
    }

    init(color: String = "", name: String = "", transmission: String = "", year: Int = 0, volumeTank: Int = 0, volumeEngine: Int = 0, zeroToOneHundred: Double = 0, topSpeed: Int = 0, numberOfDoors: Int = 0, wheelDrive: String = "", engineWork: EngineState = .stop) {
        self.topSpeed = topSpeed
        self.numberOfDoors = numberOfDoors
        self.wheelDrive = wheelDrive
        self.engineWork = engineWork
        super.init(color: color, name: name, transmission: transmission, year: year, volumeTank: volumeTank, volumeEngine: volumeEngine, zeroToOneHundred: zeroToOneHundred)
    }
}

var trunkCar = TrunkCar(color: "Red", name: "Toyota", transmission: "Manual", year: 2002, volumeTank: 150, volumeEngine: 7000, zeroToOneHundred: 22, passegersSeats: 3, volumeTrunk: 4000, diskSize: 24)

print(trunkCar.name)
print(trunkCar.color)
print(trunkCar.diskSize)
trunkCar.carAction1(the: TrunkCar1)
trunkCar.carAction1(the: TrunkCar2)
trunkCar.carAction()

var sportCar = SportCar(color: "Blue", name: "Mercedes", transmission: "Automat", year: 2020, volumeTank: 65, volumeEngine: 2000, zeroToOneHundred: 4, topSpeed: 300, numberOfDoors: 2, wheelDrive: "Four", engineWork: .start)

print(sportCar.name)
print(sportCar.color)
sportCar.engineWork = .start
sportCar.engineWork = .stop
sportCar.carAction()
sportCar.frontLed()


final class SuperSportCar: SportCar {
    override func frontLed() {
        super.frontLed()
        print("Внимание! Возможна разрядка аккумулятора!")
    }
}
var superSportCar = SuperSportCar()
superSportCar.frontLed()


