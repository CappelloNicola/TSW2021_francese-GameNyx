package model;

import java.sql.Date;

public class UserBean 
{
	private Boolean isValid;
	private String email; 
	private String username;//primary key
	private String passwordUtente;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private String telefono;
	
	
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
	public void setPasswordUtente(String password) {
		this.passwordUtente = password;
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
	
	//GETS
	public Boolean getIsValid() {
		return isValid;
	}
	public String getEmail() {
		return email;
	}
	public String getPasswordUtente() {
		return passwordUtente;
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
	public String getTelefono() {
		return telefono;
	}
}
