package appPregunta3.dao

import appPregunta3.dominio.Usuario
import org.springframework.data.repository.CrudRepository
import java.util.Optional
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.stereotype.Repository

@Repository
interface RepoUsuario extends CrudRepository<Usuario, Long> {

	def Optional<Usuario> findByUserNameAndPassword(String userName, String password);
	
	def Optional<Usuario> findByUserName(String userName);
	
	@EntityGraph(attributePaths=#["amigos"])
	override findAll()
	
	@EntityGraph(attributePaths=#["respuestas","amigos"])
	override findById(Long id)
	
//	def List<Pregunta> search(String value, String activa, Usuario user) {
//		val preguntas = preguntasNoRespondidasPor(user).filter[object | object.cumpleCondicionDeBusqueda(value)].toList
//		if(activa == "true") {
//			return preguntasActivas(preguntas)
//		} else {			
//			return preguntas
//		}
//	}


//	
//	def searchAmigo(String ami) {
//		objects.findFirst[obj | ami.contains(obj.nombre) && ami.contains(obj.apellido)]
//	}
//	
//	def modificar(Usuario usuario) {
//		val usuarioAActualizar = getById(usuario.id.toString)
//		usuarioAActualizar =>[
//			nombre = usuario.nombre
//			apellido = usuario.apellido
//			fechaDeNacimiento= usuario.fechaDeNacimiento
//		]
//	}
	
}
