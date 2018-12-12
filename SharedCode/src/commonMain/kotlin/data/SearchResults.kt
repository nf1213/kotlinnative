package org.kotlin.mpp.mobile.data

import kotlinx.serialization.Serializable

// todo find a way to not capitalize val names
@Serializable
data class SearchResults(val Search: List<Movie>)