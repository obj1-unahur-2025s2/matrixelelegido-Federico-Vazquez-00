// PASAJEROS

object neo {
    var energia = 100

    method saltar(){
        energia = energia / 2
    }

    method vitalidad() = energia / 10

    method esElElegido() = true
}

object morfeo {
    var vitalidad = 8
    var estaDescansado = true

    method saltar(){
        if(estaDescansado) {
            estaDescansado = false
        }
        else {
            estaDescansado = true
        }
        vitalidad -= 1
    }

    method esElElegido() = false
}

object trinity {
    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false
}

// NAVE

object nave {
    const pasajeros = []

    method subirPasajero(pasajero){
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero){
        pasajeros.remove(pasajero)
    }

    method cantidadPasajeros() = pasajeros.size()

    method pasajeroMayorVitalidad(){
        return pasajeros.max{p => p.vitalidad()}
    }

    method estaEquilibrada(){
        return pasajeros.all{p1 =>
            pasajeros.all{p2 =>
                p1.vitalidad() <= (p2.vitalidad() * 2)
            }
        }
    }

    method hayElegido(){
        return pasajeros.any{p => p.esElElegido()}
    }

    method chocar(){
        pasajeros.forEach{p => p.saltar()}
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.forEach{p =>
            if(not p.esElElegido()){
                p.saltar()
            }
        }
    }
}