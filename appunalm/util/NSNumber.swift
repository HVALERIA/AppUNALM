//
//  NSNumber.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/28/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

extension NSNumber {

    public static func getPropotionalValueDevice() -> NSNumber{
            let screenSize: CGRect = UIScreen.main.bounds
            let valueScreen:CGFloat = screenSize.size.height
            let integer:NSInteger = Int(valueScreen)
            switch integer {

            case 480:
                return 0.845;//S
            case 568:
                return 1;//5S
            case 667:
                return 1.174;//6
            case 736:
                return 1.295;//6Plus
    //        case 812:
    //            return 1.174;//iphone x , xs
    //        case 896:
    //            return 1.295
            case 1024:
                return 1;//iPad
            case 1112:
                return 1.0859
            case 1366:
                return 1.334;//iPad Pro
            case 1536:
                return 1.5;
            default:
                return 1;//iPad

            }

        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
