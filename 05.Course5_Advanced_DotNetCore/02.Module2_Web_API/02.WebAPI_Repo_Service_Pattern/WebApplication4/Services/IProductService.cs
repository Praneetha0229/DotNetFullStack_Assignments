using WebApplication4.Models;

namespace WebApplication4.Services
{
    public interface IProductService
    {
        List<Product> GetAllProducts();
        void CreateProduct(Product obj);
        Product GetProductById(int id);
        void EditProduct(Product obj);
        string DeleteProductById(int id);
    }
}
