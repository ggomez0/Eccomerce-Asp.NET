namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ert : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.comprobantes", "Pagado", c => c.Boolean());
        }
        
        public override void Down()
        {
            DropColumn("dbo.comprobantes", "Pagado");
        }
    }
}
