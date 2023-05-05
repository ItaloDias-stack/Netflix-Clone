package main

import (
	"api/movie_controller"
	"fmt"

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

	r.POST("/users", movie_controller.CreateUser)
	r.GET("/users", movie_controller.GetAllUsers)
	r.POST("/login", movie_controller.Login)

	// Start server
	if err := r.Run(":8080"); err != nil {
		fmt.Println("Error starting server:", err)
	}

}
