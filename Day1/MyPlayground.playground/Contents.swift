//: Playground - noun: a place where people can play

import UIKit

func factorial (x :Int)->Int{
    var fact = 1
    for index in 1...x{
        fact*=index
    }
    return fact;
}
print("Factorial of \(5) = \(factorial(x: 5))")




//Power
func calcPowerRecursive(num:Double, power: Double)->Double{
    if power==0 { return 1; }
    if power < 0 {
        return (1 / num) * calcPowerRecursive(num: num, power: power+1);
    }
    return num * calcPowerRecursive(num: num, power: power-1);
}


var powerRecurAns = calcPowerRecursive(num: 2, power: -4)
print("\(2) to the power \(4) = \(powerRecurAns)")


func calcPowerIteration(num: Int, power: Int)-> Int{
    var output = 1
    for _ in 1...power {
        output *= num;
    }
    return output;
}
var powerIterationAns = calcPowerIteration(num: 2, power: 4)
print("\(2) to the power \(4) = \(powerIterationAns)")


//MIN and MAX
var testArray: [Int] = [5,2,8,4,6]
func minMax(data:[Int])->(min: Int, max: Int){
    var currentMin = data[0]
    var currentMax = data[0]
    for i in 0...data.count-1 {
        if data[i] < currentMin {
            currentMin = data[i]
        } else if data[i] > currentMax {
            currentMax = data[i]
        }
    }
    return (currentMin, currentMax)
}
print("MinMaxFunction \(minMax(data: testArray))")


//Sort
func sortArray(input: [Int])->[Int]{
    var returnedArray = input
    for index in 0..<returnedArray.count-1 {
        for secondIndex in index+1..<returnedArray.count{
            if returnedArray[secondIndex] < returnedArray[index] {
                returnedArray.swapAt(index, secondIndex)
            }
        }
    }
    return returnedArray
}

var sortedArray = sortArray(input: testArray)
print(sortedArray)



//Swap
func swapData(num1: inout Int, num2: inout Int){
    let temp = num1
    num1 = num2
    num2 = temp
}
var x = 5, y = 6
swapData(num1:&x , num2:&y)
print("num1 = \(x), num2 = \(y)")
