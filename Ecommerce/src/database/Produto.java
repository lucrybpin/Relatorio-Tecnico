package database;
public class Produto {
	private int id;
	private String nome;
	private String resumo;
	private String descricao;
	private String categoria;
	private float preco;
	private int estoque;
	private String imagem;
	
	public int getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
	public String getResumo() {
		return resumo;
	}
	public String getDescricao() {
		return descricao;
	}
	public String getCategoria() {
		return categoria;
	}
	public float getPreco() {
		return preco;
	}
	public int getEstoque() {
		return estoque;
	}
	public String getImagem() {
		return imagem;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setResumo(String resumo) {
		this.resumo = resumo;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public void setPreco(float preco) {
		this.preco = preco;
	}
	public void setEstoque(int estoque) {
		this.estoque = estoque;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

}
