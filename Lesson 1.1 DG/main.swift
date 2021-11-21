//
//  main.swift
//  Lesson 1.1 DG
//
//  Created by Дмитрий on 20.11.2021.
//

import Foundation


print("Задание 1")
//Решить квадратное уравнение a*x^2 + b*x + c = 0



let a: Double = 2.56
let b: Double = 4
let c: Double = 1
let discriminant: Double = pow(b,2)-4*a*c
let x1: Double = (-b+sqrt(discriminant))/(2*a)
let x2: Double = (-b-sqrt(discriminant))/(2*a)
let x3: Double = -b/(2*a)
let x4 = "Нет решений"


if discriminant<0 {
    print("Ответ:",x4)
}
if discriminant==0 {
    print("Ответ:",x3)
}
if discriminant>0 {
    print("Ответ:",x1,x2)
}

print("Задание 2")

//Найти площадь, пиреметр и гипотенузу прямоугольного треугольника

let legOne: Double = 3
let legTwo: Double = 4
let square: Double = a*b/2
let hypotenuse: Double = sqrt((pow(a,2)+pow(b,2)))
let perimeter: Double = a+b+hypotenuse

print("Ответ: площадь =",square)
print("гипотенуза =",hypotenuse)
print("периметр =",perimeter)


print("Задание 3")

//Найти сумму вклада через 5 лет

let depositSumm: Double = 1000
let percent: Double = 5
let depositSummAfterFiveYars: Double = depositSumm*pow((1+percent),5)

print("Ответ: через 5 лет вы получите",depositSummAfterFiveYars)
