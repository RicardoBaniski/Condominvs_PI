package com.example.condominvs;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;
import java.util.List;

public class DashActivity extends AppCompatActivity {
    private FirebaseAuth mAuth;
    private TextView textWelcome;
    private FirebaseFirestore db;
    private TextView textResultado;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dash);

        mAuth = FirebaseAuth.getInstance();
        textWelcome = findViewById(R.id.textWelcome);
        textResultado = findViewById(R.id.textResultado);
    }

    @Override
    protected void onStart(){
        super.onStart();
        FirebaseUser user = mAuth.getCurrentUser();
        textWelcome.setText("Seja Bem-Vindo, " + user.getEmail());
        db = FirebaseFirestore.getInstance();
    }

    public void sair(View view){
        mAuth.signOut();
        Intent inicio = new Intent(DashActivity.this,MainActivity.class);
        startActivity(inicio);
        finish();
    }

    public void registrarDados(View view) {
        Intent cadoneactivity = new Intent(DashActivity.this, CadUsuarioActivity.class);
        startActivity(cadoneactivity);
    }

    public void registrarMensagem(View view) {
        Intent cadoneactivity = new Intent(DashActivity.this, CadMensagemActivity.class);
        startActivity(cadoneactivity);
    }

    public void gerarDadosFirebase(View view) {
        List<Morador> moradores = PopulateUtil.loadMorador();
        for(Morador m : moradores){
            db.collection("morador").add(m);
        }
    }

    public void carregarDados(View view) {
        CollectionReference moradores = db.collection("morador");
        moradores.get()
                .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                    @Override
                    public void onComplete(@NonNull Task<QuerySnapshot> task) {
                        if(task.isSuccessful()){
                            String resultado = "";
                            List<Morador> listMoradores = new ArrayList<>();
                            for(QueryDocumentSnapshot document : task.getResult()){
                                resultado += "\nID: " + document.getId() + "\n" +
                                        document.getData().toString() + '\n';
                                listMoradores.add(document.toObject(Morador.class));
                            }
                            resultado = "";
                            for(Morador m : listMoradores){
                                resultado += m.toString() + "\n";
                            }
                            textResultado.setText(resultado);
                        }
                    }
                });
    }

    public void uploadActivity(View view) {
        Intent novaJanela = new Intent(DashActivity.this,ImageActivity.class);
        startActivity(novaJanela);
    }

    public void showImageActivity(View view) {
        Intent novaJanela = new Intent(DashActivity.this,DownloadActivity.class);
        startActivity(novaJanela);
    }

    public void showMapActivity(View view) {
        Intent novaJanela = new Intent(DashActivity.this,MapsActivity.class);
        startActivity(novaJanela);
    }
}