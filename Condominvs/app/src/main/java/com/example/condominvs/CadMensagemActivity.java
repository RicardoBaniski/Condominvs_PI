package com.example.condominvs;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.QueryDocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;

import java.util.ArrayList;
import java.util.List;

public class CadMensagemActivity extends AppCompatActivity {

    private FirebaseFirestore db;
    //private EditText editAssunto, editTexto, editValor;
    private EditText editAssunto, editTexto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cad_mensagem);

        editAssunto = findViewById(R.id.editAssunto);
        editTexto = findViewById(R.id.editTexto);
        //editValor = findViewById(R.id.editValor);
    }

    @Override
    protected void onStart(){
        super.onStart();
        db = FirebaseFirestore.getInstance();
    }

    public void salvarDados(View view) {
        String assunto = editAssunto.getText().toString();
        String texto = editTexto.getText().toString();
        Mensagem msg = new Mensagem(assunto,texto);

        db.collection("mensagens").add(msg)
                .addOnSuccessListener(new OnSuccessListener<DocumentReference>() {
                    @Override
                    public void onSuccess(DocumentReference documentReference) {
                        String message = "Mensagem Cadastrada!";
                        Toast.makeText(CadMensagemActivity.this, message, Toast.LENGTH_SHORT).show();
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        String message = "Mensagem não Cadastrada!";
                        Toast.makeText(CadMensagemActivity.this, message, Toast.LENGTH_SHORT).show();
                    }
                });
    }
}