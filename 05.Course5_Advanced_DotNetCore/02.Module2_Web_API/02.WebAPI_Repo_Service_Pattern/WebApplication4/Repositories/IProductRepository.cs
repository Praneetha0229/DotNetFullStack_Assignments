using WebApplication4.Models;
namespace WebApplication4.Repositories
{
    public interface IProductRepository
    {
        List<Product> GetAllProducts();
        void CreateProduct(Product obj);
        Product GetProductById(int id);
        void EditProduct(Product obj);
        string DeleteProductById(int id);
    }
}
