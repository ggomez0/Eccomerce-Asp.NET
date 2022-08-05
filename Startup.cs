using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopGaspar.Startup))]
namespace ShopGaspar
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
