
import Foundation

//Extension

extension String {
    var characterCount: Int {
        return self.count
    }
}

let message = "¡Hola, cómo estás?"
print("Número de caracteres: \(message.characterCount)")
