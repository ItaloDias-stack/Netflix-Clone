package main

import (
	"fmt"
	"api/movie_controller"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	// Endpoints
	r.GET("/movies", movie_controller.GetMovies)
	r.GET("/movies/:id", movie_controller.GetMovieById)
	r.POST("/movies", movie_controller.CreateMovie)
	r.PUT("/movies/:id", movie_controller.UpdateMovie)
	r.DELETE("/movies/:id", movie_controller.DeleteMovie)

	// Start server
	if err := r.Run(":8080"); err != nil {
		fmt.Println("Error starting server:", err)
	}
}