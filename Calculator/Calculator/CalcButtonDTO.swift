import UIKit

struct CalcButtonDTO {
    static var primaryButton: CalcButtonDTO {
        return CalcButtonDTO()
    }
    
    static var secondaryButton: CalcButtonDTO {
        return CalcButtonDTO()
    }
    
    static var actionButtonNormal: CalcButtonDTO {
        return CalcButtonDTO()
    }
    
    static var actionButtonFrozen: CalcButtonDTO {
        return CalcButtonDTO()
    }
    
    init(fontSize: CGFloat = 42,
         fontColor: UIColor = Colors.buttonFontColor,
         backgroundColor: UIColor = Colors.primaryButton,
         cornerRadius: CGFloat = 20,
         borderWidth: CGFloat = 3,
         borderColor: UIColor = Colors.buttonBorderColor) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }

    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
}
