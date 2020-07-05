package com.example.condominvsplus;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.github.dhaval2404.imagepicker.ImagePicker;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class MoradoresActivity extends AppCompatActivity {
    private ImageView fotoPicker;
    private File imageFile;
    private StorageReference storageReference;
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

        fotoPicker = findViewById(R.id.fotoPicker);
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
        storageReference = FirebaseStorage.getInstance().getReference();
    }

    public void salvarMorador(View view) {
        String nome = editNome.getText().toString().trim();
        String bloco = editBloco.getText().toString().trim();
        String apart = editApart.getText().toString().trim();
        String fone = editFone.getText().toString().trim();
        String carro = editCarro.getText().toString().trim();
        String placa = editPlaca.getText().toString().trim();

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
                        salvaFoto();
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        Toast.makeText(MoradoresActivity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                });
    }

    public void menu(View view) {
        Intent menu = new Intent(MoradoresActivity.this,DashActivity.class);
        startActivity(menu);
        finish();
    }

    public void addFoto(View view) {
        Intent addfoto = new Intent(MoradoresActivity.this,FotosActivity.class);
        startActivity(addfoto);
        finish();
    }

    public void selecionarFoto(View view) {
        ImagePicker.Companion.with(this)
                .compress(1024)
                .maxResultSize(1080,1080)
                .start();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode== Activity.RESULT_OK){
            Uri uri = data.getData();
            fotoPicker.setImageURI(uri);

            imageFile = ImagePicker.Companion.getFile(data);
        }else if (resultCode == ImagePicker.RESULT_ERROR){
            Toast.makeText(this, ImagePicker.Companion.getError(data), Toast.LENGTH_SHORT).show();
        }else{
            Toast.makeText(this, "CANCELADO!", Toast.LENGTH_SHORT).show();
        }
    }

    public void salvaFoto(){
        FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
        String userPath = "Fotos/" + user.getUid() + "/";
        StorageReference imageRef = storageReference.child(userPath+"foto.png");
        UploadTask task = imageRef.putFile(Uri.fromFile(imageFile));

        task.addOnFailureListener(new OnFailureListener() {
            @Override
            public void onFailure(@NonNull Exception e) {
                Toast.makeText(MoradoresActivity.this, "Falha ao Salvar a Foto", Toast.LENGTH_SHORT).show();
            }
        }).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                Toast.makeText(MoradoresActivity.this, "", Toast.LENGTH_SHORT).show();
            }
        });
    }
}