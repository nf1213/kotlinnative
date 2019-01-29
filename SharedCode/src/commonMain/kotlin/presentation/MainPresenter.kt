package org.kotlin.mpp.mobile.presentation

import kotlinx.coroutines.launch
import org.kotlin.mpp.mobile.api.MovieApi
import org.kotlin.mpp.mobile.data.SearchResults
import kotlin.coroutines.CoroutineContext

class MainPresenter(val view: MainView, uiContext: CoroutineContext): CoroutinePresenter(uiContext, view) {
    fun search(queryString: String) {
        launch {
            val searchResults: SearchResults = MovieApi().searchMovies(queryString)
            val firstResult = searchResults.Search[0]
            view.showMovie("${firstResult.Title} ${firstResult.Year}")
        }
    }
}