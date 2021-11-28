//
//  main.swift
//  Lesson 2
//
//  Created by Дмитрий on 28.11.2021.
//

import Foundation


print("Задание 1")
//Написать функцию, которая определяет, четное число или нет.

func evenUneven(digit: Int) {

    if digit % 2 == 0 {
        print("Число \(digit) четное")
    } else {
        print("Число \(digit) нечетное")
    }
}

evenUneven(digit: 5)


print("Задание 2")
//Написать функцию, которая определяет, делится ли число без остатка на 3.

func splitByThree(digit1: Int) {

    if digit1 % 3 == 0 {
        print("Число \(digit1) делится на 3 без остатка")
    } else {
        print("Число \(digit1) не делится на 3 без остатка")
    }
}

splitByThree(digit1: 5)


print("Задание 3")
//Создать возрастающий массив из 100 чисел.

//Способ 1

var array: [Int] = []
var i = 1

for i in 1...100 {
    array.append(i)
}
print(array)

//Способ 2
var numbers = Array (1...100)
print(numbers)

//Способ 3
var numbers1 = Array (1..<101)
print(numbers1)


print("Задание 4")
//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var filteredNums = numbers.filter({$0 % 2==1})
var filteredNums1 = filteredNums.filter({$0 % 3==0})
print(filteredNums1)


print("Задание 5")
//* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func number() -> Int {
    var Fn = Int.random(in: 1..<50)
    return (Fn-1 + Fn-2)
}

var array1: [Int] = []
var x = 0

repeat {
    var i = number()
    array1.append(i)
    x+=1
} while x < 50

print(array1)


print("Задание 6")
//* Заполнить массив из 100 элементов различными простыми числами.

func Prime (num: Int) -> Bool {

for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }

    return results
}
print (PrimeArray())
