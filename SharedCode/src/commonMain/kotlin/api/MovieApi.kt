package org.kotlin.mpp.mobile.api

import io.ktor.client.HttpClient
import io.ktor.client.features.ExpectSuccess
import io.ktor.client.features.json.JsonFeature
import io.ktor.client.features.json.serializer.KotlinxSerializer
import io.ktor.client.request.get
import io.ktor.http.takeFrom
import kotlinx.serialization.json.JSON
import org.kotlin.mpp.mobile.data.Movie
import org.kotlin.mpp.mobile.data.SearchResults

class MovieApi {
    private val client = HttpClient {
        install(JsonFeature) {
            serializer = KotlinxSerializer(JSON.nonstrict).apply {
                setMapper(SearchResults::class, SearchResults.serializer())
                setMapper(Movie::class, Movie.serializer())
            }
        }
        install(ExpectSuccess)
    }

    suspend fun searchMovies(query: String?): SearchResults = client.get {
        url {
            takeFrom("http:///www.omdbapi.com?apikey=$API_KEY&s=$query")
        }
    }
}