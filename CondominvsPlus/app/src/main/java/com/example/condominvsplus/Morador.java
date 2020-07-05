package com.example.condominvsplus;

public class Morador {
    public String nome;
    public String bloco;
    public String apart;
    public String fone;
    public String veiculo;
    public String placa;

    public Morador() {
    }

    public Morador(String nome, String bloco, String apart, String fone, String veiculo, String placa) {
        this.nome = nome;
        this.bloco = bloco;
        this.apart = apart;
        this.fone = fone;
        this.veiculo = veiculo;
        this.placa = placa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getBloco() {
        return bloco;
    }

    public void setBloco(String bloco) {
        this.bloco = bloco;
    }

    public String getApart() {
        return apart;
    }

    public void setApart(String apart) {
        this.apart = apart;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    @Override
    public String toString() {
        return  "Nome: " + nome + "\n" +
                "Bloco: " + bloco + " - Apartamento: " + apart + "\n" +
                "Telefone: " + fone + "\n" +
                "Modelo do Veículo: " + veiculo + " - Placa: " + placa + "\n"+"\n";
    }
}
