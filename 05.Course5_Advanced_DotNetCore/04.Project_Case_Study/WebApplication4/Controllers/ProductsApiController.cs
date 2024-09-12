using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication4.Models;
using WebApplication4.Services;

namespace WebApplication4.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsApiController : ControllerBase
    {
        public IProductService _service;
        public ProductsApiController(IProductService service)
        {
            _service = service;
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_service.GetAllProducts());
        }

        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            return Ok(_service.GetProductById(id));
        }

        [HttpGet("bycategory")]
        public IActionResult GetProductsByCategory([FromQuery] string category)
        {
            var products = _service.GetProductsByCategory(category);
            if (products == null || !products.Any())
            {
                return NotFound(new { status = "No products found for the given category." });
            }
            return Ok(products);
        }

        [HttpGet("categoryNames")]
        public IActionResult GetProductsCategoryNames()
        {
            var categoryNames = _service.GetProductsCategoryNames();
            if (categoryNames == null || !categoryNames.Any())
            {
                return NotFound(new { status = "No category names found" });
            }
            return Ok(categoryNames);
        }

        [HttpGet("betweenPriceRange")]
        public IActionResult GetProductsBetweenPriceRange([FromQuery] int lowerPriceLimit, int upperPriceLimit)
        {
            var products = _service.GetProductsBetweenPriceRange(lowerPriceLimit, upperPriceLimit);
            if (products == null || !products.Any())
            {
                return NotFound(new { status = "No products found for the given price range." });
            }
            return Ok(products);
        }

        [HttpGet("outOfStock")]
        public IActionResult GetOutOfStockProducts()
        {
            var products = _service.GetOutOfStockProducts();
            if (products == null || !products.Any())
            {
                return NotFound(new { status = "No products found which are out of stock" });
            }
            return Ok(products);
        }
        [HttpPost]
        public IActionResult CreateProduct(Product obj)
        {
            _service.CreateProduct(obj);
            return Ok(new { status = "New product details added in server." });
        }

        [HttpPut]
        public IActionResult EditProduct(Product obj)
        {
            _service.EditProduct(obj);
            return Ok(new { status = "Product details updated in server." });
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteProductById(int id)
        {
            return Ok(_service.DeleteProductById(id));
        }
    }
}
