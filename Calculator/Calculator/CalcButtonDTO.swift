import UIKit

struct CalcButtonDTO {
    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
    
    static var primaryButton: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.primaryButton)
    }
    
    static var secondaryButton: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.secondaryButton)
    }
    
    static var actionButtonActive: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.actionButtonActive)
    }
    
    static var actionButtonNotActive: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.actionButtonNotActive)
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
}
