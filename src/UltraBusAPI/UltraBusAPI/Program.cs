using Microsoft.EntityFrameworkCore;
using UltraBusAPI.Configurations;
using UltraBusAPI.Datas;
using UltraBusAPI.Middlewares;

namespace UltraBusAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddDbContext<MyDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
            // Add services to the container.
            builder.Services.AddControllers();
            // Add Repository
            RepositoryConfig.AddRepositorys(builder.Services);
            // Add Services
            ServiceConfig.AddServices(builder.Services);
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            // Add Swagger
            SwaggerConfig.AddSwaggerGen(builder.Services);
            // Add Jwt Config
            JwtConfig.AddJwtConfig(builder.Services, builder.Configuration);
            // Add Cors Config
            CorsConfig.AddCorsConfig(builder.Services);

            var app = builder.Build();
            
            // Auto migrate database
            using (var scope = app.Services.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<MyDBContext>();
                try
                {
                    context.Database.Migrate();
                    Console.WriteLine("Database migration completed successfully.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Database migration failed: {ex.Message}");
                }
            }
            
            // Add public folder
            FileConfig.AddPublicFolder(app);
            // Configure the HTTP request pipeline.
            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseCors("AllowAll");

            app.UseAuthorization();

            app.UseMiddleware<PermissionMiddleware>();

            // Add health check endpoint
            app.MapGet("/health", () => "Healthy");

            // Gọi Seeder
            SeederConfig.Run(app.Services);

            app.MapControllers();

            app.Run();
        }
    }
}
