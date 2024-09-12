using WebApplication4.Models;
using WebApplication4.Repositories;

namespace WebApplication4.Services
{
    public class ProductService : IProductService
    {
        public IProductRepository _repository;
        public ProductService(IProductRepository repository)
        {
            _repository = repository;
        }
        public List<Product> GetAllProducts()
        {
            return _repository.GetAllProducts();
        }
        public void CreateProduct(Product obj)
        {
            _repository.CreateProduct(obj);
        }
        public Product GetProductById(int id)
        {
            Product product = _repository.GetProductById(id);
            return product;
        }
        public List<Product> GetProductsByCategory(string category)
        {
            return _repository.GetProductsByCategory(category);
        }
        public List<Product> GetOutOfStockProducts()
        {
            return _repository.GetOutOfStockProducts();
        }
        public List<Product> GetProductsBetweenPriceRange(int lowerPriceLimit, int upperPriceLimit)
        {
            return _repository.GetProductsBetweenPriceRange(lowerPriceLimit, upperPriceLimit);
        }
        public List<string> GetProductsCategoryNames()
        {
            return _repository.GetProductsCategoryNames();
        }
        public void EditProduct(Product obj)
        {
            _repository.EditProduct(obj);
        }
        public string DeleteProductById(int id)
        {
            return _repository.DeleteProductById(id);
        }
    }
}
