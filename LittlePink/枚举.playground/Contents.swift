import UIKit

//MARK: 语法
enum CompassPoint{
    case north
    case south
    case east
    case west
}
var directionToHead: CompassPoint = .east
directionToHead = .north
//MARK: 遍历
enum Beverage:CaseIterable{
    case coffee,tea,juice
}
let numberOfChoices=Beverage.allCases.count
print("\(numberOfChoices)beverages available")
for beverage in Beverage.allCases{
    print(beverage)
}
//MARK: 原始值 Raw Values
enum ASCLLControlCharacter: Character{
    case tab="\t"
    case lineFeed="\n"
    case carriageReturn="\r"
}
ASCLLControlCharacter.tab.rawValue
enum Planet: Int{
    case mercury=1,venus,earth,mars
}
Planet.earth.rawValue

//MARK: 关联值Associated Values
