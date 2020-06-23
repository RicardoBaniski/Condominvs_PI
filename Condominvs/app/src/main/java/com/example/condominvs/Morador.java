package com.example.condominvs;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Morador {
    public String nome;
    public int qtde_filhos;
    public double salario;
    public boolean ativo;
    public List<String> pets;
    public Date aniversario;

    @Override
    public String toString() {
        return "Morador{" +
                "nome='" + nome + '\'' +
                ", qtde_filhos=" + qtde_filhos +
                ", salario=" + salario +
                ", ativo=" + ativo +
                ", pets=" + pets +
                ", aniversario=" + aniversario +
                '}';
    }
}
