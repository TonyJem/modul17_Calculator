import UIKit

enum labelDTO {
    case resultLabelActiveDTO
    case resultLabelNotActiveDTO
    
    var dto: CalcLabelDTO {
        switch self {
        case .resultLabelActiveDTO:
            return CalcLabelDTO.resultLabelActiveDTO
        case .resultLabelNotActiveDTO:
            return CalcLabelDTO.resultLabelNotActiveDTO
        }
    }
}

struct CalcLabelDTO {
    static var resultLabelActiveDTO: CalcLabelDTO {
        return CalcLabelDTO()
    }
    
    static var resultLabelNotActiveDTO: CalcLabelDTO {
        return CalcLabelDTO(fontColor: Colors.labelFontColorNotActive)
    }
  
    init(backgroundColor: UIColor = Colors.labelBackgroundColor,
         fontSize: CGFloat = 65,
         fontColor: UIColor = Colors.labelFontColorActive) {
        self.backgroundColor = backgroundColor
        self.fontSize = fontSize
        self.fontColor = fontColor
    }
    
    let backgroundColor: UIColor
    let fontSize: CGFloat
    let fontColor: UIColor
}
