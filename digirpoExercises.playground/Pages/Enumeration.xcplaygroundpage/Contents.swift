import Foundation

//Enumeration

enum WeekDay {
    case lunes
    case martes
    case miercoles
    case jueves
    case viernes
    case sabado
    case domingo
}

let currentDay: WeekDay = .lunes

switch currentDay {
    case .lunes:
        print("Hoy es lunes.")
    case .martes:
        print("Hoy es martes.")
    case .miercoles:
        print("Hoy es miércoles.")
    case .jueves:
        print("Hoy es jueves.")
    case .viernes:
        print("Hoy es viernes.")
    case .sabado:
        print("Hoy es sábado.")
    case .domingo:
        print("Hoy es domingo.")
}
