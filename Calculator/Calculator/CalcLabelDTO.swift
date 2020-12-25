import UIKit

struct CalcLabelDTO {
    static var resultLabelActive: CalcLabelDTO {
        return CalcLabelDTO()
    }
    
    static var resultLabelNotActive: CalcLabelDTO {
        return CalcLabelDTO()
    }
  
    init(backgroundColor: UIColor = Colors.labelBackgroundColor,
         fontSize: CGFloat = 65,
         fontColor: UIColor = Colors.labelFontColorNormal) {
        self.backgroundColor = backgroundColor
        self.fontSize = fontSize
        self.fontColor = fontColor
    }
    let backgroundColor: UIColor
    let fontSize: CGFloat
    let fontColor: UIColor
}
