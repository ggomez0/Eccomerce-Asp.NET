namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class esc : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.comprobantes", "stringn", c => c.String());
            AddColumn("dbo.comprobantes", "fechacomprobante", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.comprobantes", "fechacomprobante");
            DropColumn("dbo.comprobantes", "stringn");
        }
    }
}
