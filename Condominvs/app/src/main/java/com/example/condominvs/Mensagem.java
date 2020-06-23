package com.example.condominvs;

import java.util.ArrayList;
import java.util.List;

public class Mensagem {
    private String assunto;
    private  String texto;

    public Mensagem(String assunto, String texto) {
        this.assunto = assunto;
        this.texto = texto;
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

    @Override
    public String toString() {
        return "Mensagem{" +
                "assunto='" + assunto + '\'' +
                ", texto='" + texto + '\'' +
                '}';
    }
}
