package model;

import java.sql.Date;

public class UserBean 
{
	private Boolean isValid;
	private String email; 
	private String username;//primary key
	private String password;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private String telefono;
	private int livello;
	
	
	//SETS
	public void setIsValid(Boolean isValid) {
		this.isValid = isValid;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public void setData(Date data) {
		this.dataNascita = data;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public void setLivello(int livello) {
		this.livello = livello;
	}
	
	//da implementare livelli esperienza che incrementano il livello??
	
	
	//GETS
	public Boolean getIsValid() {
		return isValid;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getUsername() {
		return username;
	}
	public String getNome() {
		return nome;
	}
	public String getCognome() {
		return cognome;
	}
	public Date getDataNascita() {
		return dataNascita;
	}
	public int getLivello() {
		return livello;
	}
	public String getTelefono() {
		return telefono;
	}
}
