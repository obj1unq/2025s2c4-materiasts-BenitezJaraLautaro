class Carrera {
    const property materias = #{}

    method agregarMateria(nuevaMateria) {
        materias.add(nuevaMateria)
      
    }
  
}


class Materia {
    var property requisitos = #{}
    var property carrera  

    method agregarRequisito(maRequisito) {
        requisitos.add(maRequisito)
      
    }
  
}

class HistorialAprobacion {
    var property materia
    var property nota  
  
}

class Estudiante {
    const property materiasAprobadas = #{}
    const property carreras = #{}

    method incribirCarrera(carrea) {
        carreras.add(carrea)
      
    }

    method aprobar(materia_, nota_) {
        materiasAprobadas.add(new HistorialAprobacion(materia = materia_, nota = nota_))
      
    }

    method tieneMateriaAprobada(materia_) {
        return materiasAprobadas.any( {ma => ma.materia() == materia_} )
      
    }

    method promedio() {
        return ((materiasAprobadas.sum({ma => ma.nota()})) / 2)
      
    }  
  
}


