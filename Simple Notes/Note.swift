import UIKit

class Note {
    var title: String = ""
    var body: String = ""
    var createdDate: String = ""
    
    init(title: String, body: String, createdDate: String){
        self.title = title
        self.body = body
        self.createdDate = createdDate
    }
}
