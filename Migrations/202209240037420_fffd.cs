namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class fffd : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.lstcompras", name: "Proveedores_ProvID", newName: "ProvID");
            RenameIndex(table: "dbo.lstcompras", name: "IX_Proveedores_ProvID", newName: "IX_ProvID");
        }
        
        public override void Down()
        {
            RenameIndex(table: "dbo.lstcompras", name: "IX_ProvID", newName: "IX_Proveedores_ProvID");
            RenameColumn(table: "dbo.lstcompras", name: "ProvID", newName: "Proveedores_ProvID");
        }
    }
}
