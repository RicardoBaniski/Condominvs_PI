package com.example.condominvsplus;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import com.github.dhaval2404.imagepicker.ImagePicker;

public class FotosActivity extends AppCompatActivity {

    private ImageView fotoPicker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fotos);

        fotoPicker = findViewById(R.id.fotoPicker);
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
        }
    }
}