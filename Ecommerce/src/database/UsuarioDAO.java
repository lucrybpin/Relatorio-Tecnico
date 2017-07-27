package database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

	private Connection conexao;
	
	public UsuarioDAO(Connection con) {
		this.conexao = con;
	}
	
	//CRUD
	//create
	public void Create(Usuario usuario) {
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement("INSERT INTO usuario (login, senha, nome) VALUES (?, ?, ?)");
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			stmt.setString(3, usuario.getNome());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//read
	public List<Usuario> listarTodos() {
		List <Usuario> usuarios = new ArrayList<Usuario>();
		try {
			PreparedStatement p = conexao.prepareStatement("SELECT * FROM usuario");
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setLogin(rs.getString("login"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNome(rs.getString("nome"));
				usuarios.add(usuario);
			}
			rs.close();
			p.close();
			return usuarios;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}
	
	//update
	public void Update(Usuario usuario) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("UPDATE usuario SET login = ?, senha = ?, nome = ? WHERE id = ?");
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			stmt.setString(3, usuario.getNome());
			stmt.setInt(4, usuario.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//delete
	public void Delete(Usuario usuario) {
		try {
			PreparedStatement stmt = conexao.prepareStatement("DELETE FROM usuario WHERE id = ?");
			stmt.setInt(1, usuario.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Find
	public Usuario Access(Usuario usuario){
		Usuario usuarioEncontrado = new Usuario();
		try {
			PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM ecommerce.usuario WHERE login=? AND senha = ?");
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getSenha());
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				//rs.next();
				usuarioEncontrado.setId(rs.getInt("id"));
				usuarioEncontrado.setLogin(rs.getString("login"));
				usuarioEncontrado.setNome(rs.getString("nome"));
				usuarioEncontrado.setSenha(rs.getString("senha"));
				rs.close();
				stmt.close();
			}
			return usuarioEncontrado;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarioEncontrado;
	}
	
	//print
	public void Print() {
		System.out.println("- - - - - - - Usuarios - - - - - - -");
		List<Usuario> usuarios = this.listarTodos();
		for(int i = 0; i<usuarios.size(); i++) {
			System.out.println("ID: " + usuarios.get(i).getId());
			System.out.println("Nome: " + usuarios.get(i).getNome());
			System.out.println("Login: " + usuarios.get(i).getLogin());
			System.out.println("Senha: " + usuarios.get(i).getSenha());
			System.out.println("");
		}
	}
}
