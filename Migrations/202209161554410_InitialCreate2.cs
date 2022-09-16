namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.proveedores", "cuit", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.proveedores", "cuit");
        }
    }
}
