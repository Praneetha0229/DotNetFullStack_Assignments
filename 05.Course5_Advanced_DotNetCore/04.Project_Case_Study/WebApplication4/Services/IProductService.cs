using WebApplication4.Models;

namespace WebApplication4.Services
{
    public interface IProductService
    {
        List<Product> GetAllProducts();
        void CreateProduct(Product obj);
        Product GetProductById(int id);
        List<Product> GetProductsByCategory(string category);
        List<Product> GetOutOfStockProducts();
        List<Product> GetProductsBetweenPriceRange(int lowerPriceLimit, int upperPriceLimit);
        List<string> GetProductsCategoryNames();
        void EditProduct(Product obj);
        string DeleteProductById(int id);
    }
}
