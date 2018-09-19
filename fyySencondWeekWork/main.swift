//
//  main.swift
//  fyySencondWeekWork
//
//  Created by fanyunyimac on 2018/9/5.
//  Copyright © 2018年 范云翼. All rights reserved.
//

import Foundation
/*
//homeworkOfSecondWeekSession1
func findZhi1() {
    var zhiArray = [Int]()
    for i in 2...1000{
        var flag = true
        for j in 2..<i {
            if(i%j==0)
            {
                flag = false
                break
            }
        }
        if(flag){
            zhiArray.append(i)
        }
    }
    func compare(x:Int,y:Int) -> Bool {
        return x > y
    }
    zhiArray.sort(by: compare)
}
   //五种闭包方法
    zhiArray.sort(by: {
     (x,y) -> Bool in
     return x > y
     })
    
    zhiArray.sort(by: {
     (x,y) in
     return x < y
     })
 
    //zhiArray.sort(by: {(x,y) in x < y})
    //zhiArray.sort(by: {$0 < $1 })
    //zhiArray.sort { $0 > $1}
    
    //print(zhiArray)
//}
*/

//homeworkOfSencondWeekSession2
//定义枚举
enum Gender : Int{
    case male,female,unknow
    //重载>
    static func > (lhs : Gender,rhs : Gender) -> Bool{
        return lhs.rawValue > rhs.rawValue
    }
}
//公寓枚举
enum Department {
    case first,second,third
}
//学校协议
protocol SchoolProtocol {
    var department : Department { get set }
    func lendBook()
}
//实现person类
class Person : CustomStringConvertible {
    var firstName : String
    var lastName : String
    var age :Int
    var gender :Gender
    var fullName : String { return firstName + lastName }               //计算属性
    init(firstName : String,lastName : String,age : Int,gender : Gender) {      //指定构造函数
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName : String){                               //便利构造函数
        self.init(firstName: firstName, lastName: "", age: 18, gender: Gender.female)
    }
    convenience init(firstName : String,age : Int,gender : Gender){      //便利构造函数
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }

    var description : String {                                          //可以用print输出
        return "name : \(self.fullName) age: \(self.age) gender : \(self.gender)"
    }

    static func == (lhs : Person,rhs : Person) -> Bool {                //重载== ！=
        return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
    }
    static func != (lhs : Person,rhs : Person) -> Bool {
        return !(lhs == rhs)
    }
    func run() {                                                        //输出函数
        print("Person \(self.fullName) is running")
    }
}

var person1 = Person(firstName: "gao")
var person2 = Person(firstName: "gao",age : 20,gender :Gender.male)
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(person1)
print(person1 == person2)
print(person1 != person2)

class Teacher : Person,SchoolProtocol{
    var title : String              //增加的title属性
    var department : Department     //增加的department属性
    init(firstName : String,lastName : String,age : Int,gender : Gender,title : String,department : Department) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //重写父类的计算属性
    override var description : String {
        return "title : \(self.title) , fullName : \(self.fullName),age : \(self.age),gender : \(self.gender)，department: \(self.department)"
    }
    //重载父类run方法
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    //遵循协议
    func lendBook() {
        print("Teacher \(self.fullName) has lent a book!")
    }
}

var t1 = Teacher(firstName: "guiyang",lastName: "li", age : 20,gender : Gender.male,title : "guiyangli",department: Department.first)
print(t1)

class Student : Person,SchoolProtocol {                 //定义学生类，继承person类，遵守Schoolprotocol协议
    var stuNo : Int
    var department : Department
    init(firstName : String,lastName : String,age : Int,gender : Gender,stuNo : Int,department : Department) {      //指定构造器
        self.department = department
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String {                  //重写方法
        return "stuNo : \(self.stuNo),fullName : \(self.fullName),age : \(self.age),gender : \(self.gender),department : \(self.department)"
    }
    override func run() {
        print("Student \(self.fullName) is running")
    }
    func  lendBook() {                                 //遵守协议
            print("Student \(self.fullName) has lent a book!")
    }
    
}
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
var s1 = Student(firstName: "YUNYI", lastName: "fan", age: 18, gender: Gender.male, stuNo: 0305,department: Department.second)
print(s1)


//创建数组和字典操作
var array = [Person]()
for i in 1...5 {
    let temp = Person(firstName: "张", lastName: "\(i)", age: 20, gender: Gender.male)
    array.append(temp)
}
for i in 1...3 {
    let temp = Teacher(firstName: "高", lastName: "\(i)", age: 30, gender: Gender.female, title: "excellent",department: Department.third)
    array.append(temp)
}
for i in 1..<5 {
    let temp = Student(firstName: "王", lastName: "\(i)", age: 35, gender: Gender.male, stuNo: 2016110301 + i,department: Department.second )
    array.append(temp)
}
//定义一个字典
var dic = ["Person" : 0,"Teacher" : 0,"Student" : 0]
for item in array {
    if item is Teacher {
        dic["Teacher"]! += 1
    }
    else if item is Student {
        dic["Student"]! += 1
    }
    else {
        dic["Person"]! += 1
    }
}
//输出字典值
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
for (key,value) in dic {
    print("\(key) has \(value) object!")
}
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
//原始数组
for item in array {
    print(item)
}
//根据get
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
array.sort {return $0.age > $1.age }
for item in array {
    print(item)
}
//根据fullname
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
array.sort(by : { return $0.fullName > $1.fullName })
for item in array {
    print(item)
}
//根据gender,age
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
array.sort(by: { if $0.age == $1.age {
        return $0.gender > $1.gender
    } else {
        return $0.gender > $1.gender
    }
    
})
for item in array {
    print(item)
}
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
for item in array {
    item.run()
    if let teacher = item as? Teacher {
            teacher.lendBook()
    }else  if let student = item as? Student {
        student.lendBook()
    }
}

/*
//homeworkOfThirdWeekSession1
//(1) map将数组中的每一个元素，通过指定的方法进行转换，返回一个结果数组
let dic = [["name" : "fyy","age" : 18],["name" : "ljl","age" : 19],["name" : "lgh","age" : 20]]
let dicStr = dic.map({ $0["name"]!})
print("第一题:     ",dicStr)

//(2)filter对数组所有元素进行过滤，返回结果数组，不像map函数会改变元素的值
let arr1 = ["fyyfor","ljlfor","123","456"]
let arr2 = arr1.filter({ Int($0) != nil })
print("第二题:     ",arr2)

//(3)reduce将数组中的元素按闭包方法进行整合，第一个参数为初始值，第二个参数为闭包
let arr11 = ["first","second","third"]
var arr22 = arr11.reduce("", { $0 + "," + $1 })
print("第三题:     ",arr22)

//(4)
let intArray = [6,8,5,9]
let tupleInt = intArray.reduce((max: intArray[0],min: intArray[0],sum: 0), { (max: max($0.max,$1),min: min($0.min,$1),sum: $0.sum+$1) })
print("第四题:     ",tupleInt)

//(5)enumerated与for in结合，返回结果可以看作是一个元组（index，value）
func func1(x: Int)->Int {
    return x
}
func func2(x: String) {
    
}
func func3()-> Int{
    return 2
}
func func4(x: Int)-> Int {
    return x+1
}
let funcArray : [Any] = [func1,func2,func3,func4]
for(index,value) in funcArray.enumerated() {
    if value is (Int)-> Int {
        print("第五题:     第\(index+1)个函数符合")
    }
}

//(6)
extension Int {
func sqrt() -> Double {
    return Darwin.sqrt(Double(self))
    }
}

//(7)
func getMaxAndMin<T: Comparable>(array: T...) -> (T,T) {
    var max = array[0]
    var min = array[0]
    for i in array {
        if i > max {
            max = i
        }
        else if i < min {
            min = i
        }
    }
    return (max,min)
}
print(getMaxAndMin(array: 1,5,2,88))
print(getMaxAndMin(array: 1.0,88.0,55.0,2.0))
print(getMaxAndMin(array: "aaa","fyy","bcde","u"))
*/





























