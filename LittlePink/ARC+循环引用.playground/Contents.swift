import UIKit

//ARC(Automatic Reference Counting)--自动引用计数
//内存管理机制

//会造成不好的现象：REference Cycle--循环引用，从而导致内存泄漏（memory leak）
//解决办法：weak（弱引用）和unowned(无主引用)
class Author{
    var name: String
    weak var video: Video?
    init(name:String){
        self.name=name
    }
    deinit{
        print("author对象被销毁")
    }
}
class Video{
    unowned var author:Author
    init (author:Author){
        self.author=author
    }
    deinit{
        print("video对象被销毁")
    }
}
var author: Author? = Author(name: "cc")
var video: Video? = Video(author: author!)
author?.video=video

author=nil
video=nil


