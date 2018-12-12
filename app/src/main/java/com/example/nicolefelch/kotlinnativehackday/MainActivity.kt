package com.example.nicolefelch.kotlinnativehackday

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.Dispatchers
import org.kotlin.mpp.mobile.presentation.MainPresenter
import org.kotlin.mpp.mobile.presentation.MainView

class MainActivity : AppCompatActivity(), MainView {

    private val presenter: MainPresenter by lazy { MainPresenter(this, Dispatchers.Main) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        presenter.search("Frozen")
    }

    override fun showMovie(displayText: String) {
        main_text.text = displayText
    }

    override fun showError(error: Throwable) {
        // todo show an error
    }
}
