package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New()
	app.Get("/hello/:name", func(c *fiber.Ctx) error {
		return c.JSON(&fiber.Map{
			"message": "Hello, " + c.Params("name"),
		})
	})
	app.Listen(":3000")
}
