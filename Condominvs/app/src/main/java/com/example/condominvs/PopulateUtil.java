package com.example.condominvs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class PopulateUtil {

    public static List<Morador> loadMorador() {
        List<Morador> moradores = new ArrayList<>();

        Morador morador = new Morador();
        morador.nome = "Luis Gritz";
        morador.qtde_filhos = 1;
        morador.salario = 4500.50;
        morador.ativo = false;
        morador.pets = Arrays.asList("Muco","Escarro");
        morador.aniversario = new GregorianCalendar(2002, Calendar.MAY,20).getTime();

        moradores.add(morador);

        return moradores;
    }
}
