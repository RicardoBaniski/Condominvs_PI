package com.example.condominvsplus;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.HashMap;
import java.util.Map;

public class MoradoresActivity extends AppCompatActivity {

    private FirebaseFirestore db;
    private EditText editNome;
    private EditText editBloco;
    private EditText editApart;
    private EditText editFone;
    private EditText editCarro;
    private EditText editPlaca;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_moradores);

        editNome = findViewById(R.id.editNome);
        editBloco = findViewById(R.id.editBloco);
        editApart = findViewById(R.id.editApart);
        editFone = findViewById(R.id.editFone);
        editCarro = findViewById(R.id.editCarro);
        editPlaca = findViewById(R.id.editPlaca);
    }

    @Override
    protected void onStart(){
        super.onStart();
        db = FirebaseFirestore.getInstance();
    }

    public void salvarMorador(View view) {
        String nome = editNome.getText().toString();
        String bloco = editBloco.getText().toString();
        String apart = editApart.getText().toString();
        String fone = editFone.getText().toString();
        String carro = editCarro.getText().toString();
        String placa = editPlaca.getText().toString();

        Map<String,Object> dadosMoradores = new HashMap<>();
        dadosMoradores.put("nome",nome);
        dadosMoradores.put("bloco",bloco);
        dadosMoradores.put("apart",apart);
        dadosMoradores.put("fone",fone);
        dadosMoradores.put("carro",carro);
        dadosMoradores.put("placa",placa);

        FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
        db.collection("Moradores").document(user.getUid())
                .set(dadosMoradores)
                .addOnSuccessListener(new OnSuccessListener<Void>() {
                    @Override
                    public void onSuccess(Void aVoid) {
                        Toast.makeText(MoradoresActivity.this, "Cadastrado com SUCESSO!", Toast.LENGTH_SHORT).show();
//                        limpaCampos();
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        Toast.makeText(MoradoresActivity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                });
    }

//    private void limpaCampos() {
//        editNome = "";
//        editBloco = "";
//        editApart = "";
//        editFone = "";
//        editCarro = "";
//        editPlaca = "";
//    }

    public void menu(View view) {
        Intent menu = new Intent(MoradoresActivity.this,DashActivity.class);
        startActivity(menu);
        finish();
    }
}