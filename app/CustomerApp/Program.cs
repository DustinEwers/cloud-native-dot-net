using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace CustomerApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .ConfigureAppConfiguration((context, config) => {
                    //if (context.HostingEnvironment.IsProduction())
                    //{
                    //    config.AddEnvironmentVariables(prefix: "APP_");
                        
                    //    var builtConfig = config.Build();

                    //    Console.WriteLine($"Key Vault URL: https://{builtConfig["KeyVaultName"]}.vault.azure.net/");

                    //    var azureServiceTokenProvider = new AzureServiceTokenProvider();
                    //    var keyVaultClient = new KeyVaultClient(
                    //        new KeyVaultClient.AuthenticationCallback(
                    //            azureServiceTokenProvider.KeyVaultTokenCallback));

                    //    config.AddAzureKeyVault(
                    //        $"https://{builtConfig["KeyVaultName"]}.vault.azure.net/",
                    //        keyVaultClient,
                    //        new DefaultKeyVaultSecretManager());
                    //}
                })
                .UseStartup<Startup>()
                .Build();
    }
}
