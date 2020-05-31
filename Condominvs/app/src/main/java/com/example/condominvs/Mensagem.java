package com.example.condominvs;

public class Mensagem {
    private String assunto;
    private  String texto;
    private double valor;

    public Mensagem(String assunto, String texto, double valor) {
        this.assunto = assunto;
        this.texto = texto;
        this.valor = valor;
    }

    public Mensagem() {
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
}
