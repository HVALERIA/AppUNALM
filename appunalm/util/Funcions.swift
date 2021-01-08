//
//  General.swift
//  appunalm
//
//  Created by Valeria H. Choque on 10/12/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//
 
import SystemConfiguration

final class Funcions {


    
    public static func isConnectedToNetwork() -> Bool {
 
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
 
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
    
    public static func ConvertirNumero(cadena: String) -> String{
        var retorno:String = ""
        var ciclo = cadena.split(separator: " ")
        
        print("Ciclo: \(ciclo[1])")
        switch ciclo[1] {
        case "Ciclo":
            retorno = "0º"
            break
        case "Primer":
            retorno = "1º"
            break
        case "Segundo":
            retorno = "2º"
            break
        case "Tercer":
            retorno = "3º"
            break
        case "Cuarto":
            retorno = "4º"
            break
        case "Quinto":
            retorno = "5º"
            break
        case "Sexto":
            retorno = "6º"
            break
        case "Septimo":
            retorno = "7º"
            break
        case "Octavo":
            retorno = "8º"
            break
        case "Noveno":
            retorno = "9º"
            break
        case "Decimo":
            retorno = "10º"
            break
        case "Onceavo":
            retorno = "11º"
            break
        case "Doceavo":
            retorno = "12º"
            break
        default:
            break
        }
        return retorno
    }
    
    public static func WS_Respuesta(cadena: String) -> Bool{
        var retorno:Bool = true
        
        print("Ciclo: \(cadena)")
        switch cadena {
        case "NOK":
            retorno = false
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_NOK)
            break
        case "OK":
            retorno = true
            //ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_NOK)
            break
        default:
            retorno = false
            break
        }
        return retorno
    }
    
    public static func NumeroCeroDecimal (valor: Double) -> String {
        var retorno:String = "0"
        let distanceFloat: Float = Float(valor)
        retorno = String(format: "%.0f", distanceFloat)
        return retorno
    }
    
    public static func Separator(cadena: String, valor: String) -> Array<Any> {
        let lista = cadena.components(separatedBy: valor)
        return lista
        
    }
    
}
