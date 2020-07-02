package com.example.condominvsplus;

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
    private FirebaseFirestore db;
    private FirebaseAuth mAuth;
    private TextView textBemVindo, textResultado;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dash);

        mAuth = FirebaseAuth.getInstance();
        textBemVindo = findViewById(R.id.textBemVindo);
        textResultado=findViewById(R.id.textResultado);
    }

    @Override
    public void onStart() {
        super.onStart();
        FirebaseUser user = mAuth.getCurrentUser();
        textBemVindo.setText("Seja Bem-Vindo, "+user.getEmail());
        db = FirebaseFirestore.getInstance();
    }

    public void sair(View view){
        mAuth.signOut();
        Intent inicio = new Intent(DashActivity.this,MainActivity.class);
        startActivity(inicio);
        finish();
    }

    public void message(View view) {
        Intent message = new Intent(DashActivity.this,MessageActivity.class);
        startActivity(message);
        finish();
    }

    public void morador(View view) {
        Intent morador = new Intent(DashActivity.this,MoradoresActivity.class);
        startActivity(morador);
        finish();
    }

    public void carregarMorador(View view) {
        CollectionReference morador = db.collection("Moradores");

        morador.get()
                .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                    @Override
                    public void onComplete(@NonNull Task<QuerySnapshot> task) {
                        String resultado = "";
                        List<Morador> listMorador = new ArrayList<>();
                        if (task.isSuccessful()){
                            for (QueryDocumentSnapshot document : task.getResult()){
                                resultado += document.getData().toString() + '\n' + '\n';
                                listMorador.add(document.toObject(Morador.class));
                            }
                            resultado="";
                            for(Morador m :listMorador){
                                resultado += m.toString()+'\n';
                            }
                            textResultado.setText(resultado);
                        }
                    }
                });
    }
}