import UIKit

struct CalcLabelDTO {
    static var resultLabelActive: CalcLabelDTO {
        return CalcLabelDTO()
    }
    
    static var resultLabelNotActive: CalcLabelDTO {
        return CalcLabelDTO()
    }
  
    init(fontSize: CGFloat = 65,
         fontColor: UIColor = Colors.labelFontColorNormal,
         backgroundColor: UIColor = Colors.applicationBackgroundColor) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
    }

    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
}
