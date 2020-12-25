import UIKit

enum ButtonDTO {
    case primaryButtonDTO
    case secondaryButtonDTO
    case actionButtonActiveDTO
    case actionButtonNotActiveDTO

    var dto: CalcButtonDTO {
        switch self {
        case .primaryButtonDTO:
            return CalcButtonDTO.primaryButtonDTO
        case .secondaryButtonDTO:
            return CalcButtonDTO.secondaryButtonDTO
        case .actionButtonActiveDTO:
            return CalcButtonDTO.actionButtonActiveDTO
        case .actionButtonNotActiveDTO:
            return CalcButtonDTO.actionButtonNotActiveDTO
        }
    }
}

struct CalcButtonDTO {
    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
    
    static var primaryButtonDTO: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.primaryButton)
    }
    
    static var secondaryButtonDTO: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.secondaryButton)
    }
    
    static var actionButtonActiveDTO: CalcButtonDTO {
        return CalcButtonDTO(backgroundColor: Colors.actionButtonActive)
    }
    
    static var actionButtonNotActiveDTO: CalcButtonDTO {
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
