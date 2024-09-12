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
        [HttpPost]
        public IActionResult CreateStudent(Product obj)
        {
            _service.CreateProduct(obj);
            return Ok(new { status = "New product details added in server." });
        }

        [HttpPut]
        public IActionResult EditStudent(Product obj)
        {
            _service.EditProduct(obj);
            return Ok(new { status = "Product details updated in server." });
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteStudentById(int id)
        {
            return Ok(_service.DeleteProductById(id));
        }
    }
}
