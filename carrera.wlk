class Carrera {
    const property materias = #{}

    method agregarMateria(nuevaMateria) {
        materias.add(nuevaMateria)
      
    }
  
}


class Materia {
    const property materiasRequisito = #{}
    const property carrera  

    method agregarRequisito(maRequisito) {
        materiasRequisito.add(maRequisito)
      
    }
  
}

class HistorialAprobacion {
    var property materia
    var property nota  
  
}

class Estudiante {
    const property materiasAprobadas = #{}
    const property carreras = #{}
    const property materiasInscriptas = #{} 

    method cantMateriasAprobadas() {
        return materiasAprobadas.size()
      
    }

    method incribirCarrera(carrea) {
        carreras.add(carrea)
      
    }

    method aprobar(materia_, nota_) {
        self.validarMateriaAprobada(materia_)
        materiasAprobadas.add(new HistorialAprobacion(materia = materia_, nota = nota_))
      
    }
    method validarMateriaAprobada(materia_) {
        if(self.tieneMateriaAprobada(materia_)) {
            self.error("La materia ya fue agregada")
        }

      /* if(carreras.any({ ma => ma.materia() == materia_ })) {
            self.error("La materia ya fue agregada")
        }*/
      
    }

    method tieneMateriaAprobada(materia_) {
        return materiasAprobadas.any( {ma => ma.materia() == materia_} )
      
    }

    method promedio() {
        return ((materiasAprobadas.sum({ma => ma.nota()})) / 2)
      
    }  

    method todasLasMaterias() {
        carreras.map({ c => c.materia() }).flatten()
      
    }

    method InceibirseMateria(materia_) {
        self.PuedeInscribirseAMateria(materia_)
        materiasInscriptas.add(materia_)
      
    }

    method PuedeInscribirseAMateria(materia_) {
        if (! carreras.any({ c => c.contains(materia_) })) {
            self.error("la materia no pertenece a ninguna carrera")
        } else {
            if(self.tieneMateriaAprobada(materia_)) {
                self.error("la materia ya esta aprobada")
            } else {
                if(materiasInscriptas.contains(materia_)) {
                    self.error("ya esta inceipto a esta materia ")
                } else {
                    if(! materia_.materiasInscriptas().all( { req => self.tieneMateriaAprobada(req) } )) {
                        self.error("no estan todas las materias requisito aprobadas")
                    }
                }
            }
        }    
    }
  
}


/*method PuedeInscribirseAMateria(materia_) {
    
    // 1️⃣ Verificar que la materia pertenezca a una carrera del estudiante
    if (!carreras.any({ c => c.materias().contains(materia_) })) {
        self.error("La materia no pertenece a ninguna carrera en la que estás inscripto")
    }

    // 2️⃣ Verificar que no esté aprobada
    if (self.tieneMateriaAprobada(materia_)) {
        self.error("Ya aprobaste esta materia")
    }

    // 3️⃣ Verificar que no esté ya inscripto
    if (materiasInscriptas.contains(materia_)) {
        self.error("Ya estás inscripto en esta materia")
    }

    // 4️⃣ Verificar que todas las materias requisito estén aprobadas
    if (!materia_.materiasRequisito().all({ req => self.tieneMateriaAprobada(req) })) {
        self.error("No cumplís con todos los requisitos para cursar esta materia")
    }

}*/
