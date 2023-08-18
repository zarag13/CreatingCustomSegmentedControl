//
//  CreatingCustomImage.swift
//  CreatingCustomSegmentedControl
//
//  Created by Kirill on 09.08.2023.
//

import UIKit

class CustomImage: UIImage {
    
    func setopImage(image: UIImage, text: String, isImageBeforeText: Bool, textFount: UIFont? = nil) -> UIImage{
        //отступ
        let offset: CGFloat = 5
        //какой будет размер шрифта
        let fount = textFount ?? UIFont.systemFont(ofSize: 16)
        //для текста указываме, какой будет шрифт
        let expectedTextSize = (text as String).size(withAttributes: [.font: fount])
        //получаем ширину каритинка + текст + отступ
        let width = expectedTextSize.width + image.size.width + offset
        //высота, или текста или картинки(смотря что больше)
        let height = max(expectedTextSize.height, image.size.height)
        //создаем квадрат
        let size = CGSize(width: width, height: height)
        //рисуем в этом квадртае картинку
        let render = UIGraphicsImageRenderer(size: size)
        
        //все что помещаем в эту область с методом draw - объеденяется в одну картинку
        return render.image { context in
            //координа отступа по оси Y - для текста (общая высота - высота текста) / 2
            let fountTopPosition: CGFloat = (height - expectedTextSize.height) / 2
            //положение текста по Х или справа от картинки = ширина картинки + отступ) - (или слева - начало = 0)
            let textOrigin: CGFloat = isImageBeforeText ? image.size.width + offset : 0
            //создаем точку на основе корординат
            let textPoint = CGPoint(x: textOrigin, y: fountTopPosition)
            //рисуем квадрат с текстом внутри
            (text as NSString).draw(at: textPoint, withAttributes: [.font : fount])
            //положение картинки по Х - обратное от текста
            let aligmentX : CGFloat = isImageBeforeText ? 0 : expectedTextSize.width + offset
            //положение картинки по Y
            let aligmentY : CGFloat = (height - image.size.height) / 2
            //где будет картинка и какого размераобъеденяем)
            let rect = CGRect(x: aligmentX, y: aligmentY, width: image.size.width, height: image.size.height)
            //рисуем картинку
            image.draw(in: rect)
        }
    }
}
