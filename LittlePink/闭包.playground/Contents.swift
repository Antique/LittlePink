import UIKit

//MARK: - 语法--代码执行块

//MARK: 使用场景1--全局函数
let label:UILabel={
    let label=UILabel()
    label.text="xxx"
    return label
}()

let learn={(lan:String)->String in
    "学习\(lan)"
}
learn("ios")

//和函数区别
func learn1(_ lan:String)->String{
    "学习\(lan)"
}
learn1("ios")

//定义类型
let aa:Int?
let bb:(()->())?

//MARK: 使用场景2--嵌套函数（重要）
func codingSwift(day:Int,appName:()->String){
    print("学习Swift\(day)天了，写了\(appName())App")
}

codingSwift(day: 40, appName: {()->String in
    "天气"
})
//传参时已经写好了的闭包‘名’
let appName={()->String in
    "Todos"
}
codingSwift(day: 60, appName: appName)
//传参时写已经写好了的函数名（需参数和返回值的格式和类型完全一样）
func appName1()->String{
    "计算器"
}
codingSwift(day: 100, appName: appName1)

//MARK: 闭包简写1--尾随闭包
codingSwift(day: 130) { ()->String in
    "机器学习"
}
//MARK: 闭包简写2--根据上下文推断类型
func codingSwift(day:Int,appName:String, res:(Int,String)->String){
    print("学习swift\(day)天，\(res(1,"Alamofire")),做成了\(appName)App")
}

codingSwift(day: 40, appName: "天气") { takeDay, use in
    "用了\(takeDay)天，使用了\(use)技术"
}

//MARK: 系统函数案例--sorted
let arr=[3,5,1,2,4]
let sortedArr=arr.sorted (by: < )

//MARK: 闭包捕获
func makeIncrementer(forIncrement amount:Int)->()->Int{
    var runningTotal=0
    func incrementer()->Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()//10
incrementByTen()//20
incrementByTen()//30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()//7
incrementByTen()//40

//MARK: 闭包是引用类型
let alsoIncrementByTen=incrementByTen
alsoIncrementByTen()//50
incrementByTen()//60

//MARK: 逃逸闭包(@escaping)
var completionHandlers=[()->Void]()
func someFunctionWithEscapingClosure(completionHandler:@escaping()->Void){
    //开启某个网络耗时任务（异步），在耗时任务执行完之后需要调用闭包,此处为模拟
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure:()->Void){
    closure()
}

class SomeClass{
    var x=10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x=100
        }
        someFunctionWithNonescapingClosure {
            x=200
        }
    }
}
let instance=SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//实际应用
class SomeVC{
    func getData(finished:@escaping(String)->()){
        print("外层函数开始执行")
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                finished("我是数据")
            }
        }
        print("外层函数执行结束")
    }
}
let someVC=SomeVC()
someVC.getData { data in
    print("逃逸闭包执行,拿到了耗时任务传来的数据--\(data)，可以做一些其他处理了")
}



