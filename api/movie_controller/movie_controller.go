package movie_controller


import (
    "net/http"
	"api/models"
    "fmt"
    "github.com/gin-gonic/gin"
	"api/data"
    "strconv"
)

// GetMovies returns a list of all Movies
func GetMovies(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{"data": data.Movies})
}

// GetMovieById returns a single movie by ID
func GetMovieById(c *gin.Context) {
    id,err := strconv.Atoi(c.Param("id"))
    if err != nil {
        c.JSON(http.StatusNotFound, gin.H{"error": "Invalid id"})
        return
    }
    for _, movie := range data.Movies {
        if movie.ID == id {
            c.JSON(http.StatusOK, gin.H{"data": movie})
            return
        }
    }

    c.JSON(http.StatusNotFound, gin.H{"error": "Movie not found"})
}

// CreateMovie creates a new movie
func CreateMovie(c *gin.Context) {
    var movie models.Movie

    if err := c.ShouldBindJSON(&movie); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
        return
    }
    movie.ID =  len(data.Movies)+1
    fmt.Println("request", movie.Title, " year", movie.Year)
    data.Movies = append(data.Movies, movie)

    c.JSON(http.StatusCreated, gin.H{"data": movie})
}

// UpdateMovie updates an existing movie by ID
func UpdateMovie(c *gin.Context) {
    id,err := strconv.Atoi(c.Param("id"))
    if err != nil {
        c.JSON(http.StatusNotFound, gin.H{"error": "Invalid id"})
        return
    }

    var updatedMovie models.Movie
    
    if err := c.ShouldBindJSON(&updatedMovie); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
        return
    }
    updatedMovie.ID = id;
    for i, movie := range data.Movies {
        if movie.ID == id {
            data.Movies[i] = updatedMovie
            c.JSON(http.StatusOK, gin.H{"data": updatedMovie})
            return
        }
    }

    c.JSON(http.StatusNotFound, gin.H{"error": "Movie not found"})
}

// DeleteMovieHandler deletes a movie by ID
func DeleteMovie(c *gin.Context) {
    id,err := strconv.Atoi(c.Param("id"))
    if err != nil {
        c.JSON(http.StatusNotFound, gin.H{"error": "Invalid id"})
        return
    }

    for i, movie := range data.Movies {
        if movie.ID == id {
            data.Movies = append(data.Movies[:i], data.Movies[i+1:]...)
            c.JSON(http.StatusOK, gin.H{"data": "Movie deleted"})
            return
        }
    }

    c.JSON(http.StatusNotFound, gin.H{"error": "Movie not found"})
}
