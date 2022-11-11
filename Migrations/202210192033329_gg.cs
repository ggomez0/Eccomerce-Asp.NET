namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class gg : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.comprobantesdets", "precio", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.comprobantesdets", "precio");
        }
    }
}
