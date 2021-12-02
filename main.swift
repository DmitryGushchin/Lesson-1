//
//  main.swift
//  lesson 3
//
//  Created by Дмитрий on 02.12.2021.
//

import Foundation

// Задание 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Задание 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct Car {
    let name: String
    let year: Int
    let volumeTrunk: Int
    let engineWork: String
    let volumeEngine: Int
    let transmission: String
    let driveVehicle: String
    let windows: String
    let volumeTank: Int
    let zeroToOneHundred: Double
}

var SportCar = Car(name: "Ferrari", year: 2018, volumeTrunk: 400, engineWork: "Start", volumeEngine: 3500, transmission: "Manual", driveVehicle: "full drive", windows: "closed", volumeTank: 55, zeroToOneHundred: 3.8)

print("SportCar")
print(SportCar.name)
print(SportCar.transmission)
print(SportCar.volumeEngine)



var TrunkCar = Car(name: "Ford", year: 2005, volumeTrunk: 3000, engineWork: "Stop", volumeEngine: 8000, transmission: "Automat", driveVehicle: "front drive", windows: "open", volumeTank: 140, zeroToOneHundred: 23.8)

print("TrunkCar")
print(TrunkCar.engineWork)
print(TrunkCar.volumeTank)
print(TrunkCar.zeroToOneHundred)


// Задание 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Action {
    case window
    case engine
    case door
    case trunk
}

let Car1 = Action.engine
let Car2 = Action.door

func carAction(the option: Action) {
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

carAction(the: Car1)
carAction(the: Car2)


// Задание 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
enum EngineState {
    case start
    case stop
}

enum WindowState {
    case open
    case close
}

struct Bmw {
    let year: Int
    let volumeTrunk: Int
    var engineWork: EngineState {
        willSet {
            if newValue == .start {
                print("Двигатель заведен")
            } else {
                print("Двигатель не заведен")
            }
        }
    }
    let volumeEngine: Int
    var speed: Int{
        didSet {
            let rate = speed - oldValue
            print("Ваша скорость увеличилась на \(rate)")
        }
    }
    var windows: WindowState {
        willSet {
            if newValue == .open {
                print("Окно открыто")
            } else {
                "Окна закрыты"
            }
        }
    }
}

var car2 = Bmw(year: 2021, volumeTrunk: 500, engineWork: .start, volumeEngine: 3000, speed: 0, windows: .close)

car2.speed = 120
car2.speed = 150
car2.speed = 160
car2.windows = .open
car2.engineWork = .stop

//Задание 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Задание 6. Вывести значения свойств экземпляров в консоль.


struct AllWay {
    var way1: Double
    var way2: Double
    var way3: Double
    var way4: Double

    var sumWay: Double{
    get {
        return way1 + way2 + way3 + way4
    }
}
    init() {
        way1 = 20
        way2 = 12
        way3 = 34
        way4 = 9
    }
        init(way1: Double, way2: Double, way3: Double, way4: Double) {
            self.way1 = way1
            self.way2 = way2
            self.way3 = way3
            self.way4 = way4
        }

}
var f = AllWay()
var m = AllWay(way1: 10, way2: 8, way3: 6, way4: 3)

print("Длина пройденного рнасстояния составляет \(f.sumWay) км")
print("Длина пройденного рнасстояния составляет \(m.sumWay) км")

