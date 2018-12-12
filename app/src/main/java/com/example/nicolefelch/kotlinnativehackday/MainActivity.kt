package com.example.nicolefelch.kotlinnativehackday

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.widget.TextView
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import org.kotlin.mpp.mobile.api.MovieApi
import org.kotlin.mpp.mobile.createApplicationScreenMessage
import org.kotlin.mpp.mobile.data.SearchResults

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val mainText = findViewById<TextView>(R.id.main_text)
        mainText.text = createApplicationScreenMessage()

        GlobalScope.launch(Dispatchers.Main) {
            val searchResults: SearchResults = MovieApi().searchMovies("Frozen")
            val firstResult = searchResults.Search[0]
            mainText.text = "${firstResult.Title} ${firstResult.Year}"

        }
    }
}
