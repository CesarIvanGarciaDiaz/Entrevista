require "spec_helper"
require "prueba"
describe Operation do
  it "Operation is valid" do
    op=Operation.new(80,4,"venta",100)
    op.to_s.should== {:unit_price=>80, :volume=>4, :type=>"venta", :sale=>100, :created_at=> Time.now.strftime("%m/%d/%Y")}
  end
end

describe Inventary do
  it "Inventary is valid" do
    inv=Inventary.new
    inv.create_array.should == [{:unit_price=>80, :volume=>4, :type=>"venta", :sale=>100, :created_at=>Time.now.strftime("%m/%d/%Y")}, {:unit_price=>60, :volume=>3.5, :type=>"compra", :sale=>80, :created_at=>Time.now.strftime("%m/%d/%Y")}, {:unit_price=>100, :volume=>45, :type=>"venta", :sale=>120, :created_at=>Time.now.strftime("%m/%d/%Y")}, {:unit_price=>20, :volume=>5, :type=>"venta", :sale=>40, :created_at=>Time.now.strftime("%m/%d/%Y")}, {:unit_price=>40, :volume=>5, :type=>"compra", :sale=>60, :created_at=>Time.now.strftime("%m/%d/%Y")}, {:unit_price=>120, :volume=>7, :type=>"venta", :sale=>140, :created_at=>Time.now.strftime("%m/%d/%Y")}]
  end
  
  it "margin is valid" do
    inv=Inventary.new
    inv.profit_margin.should ==" La diferencia es : $ 1220 . Margen de utilidad : 0.17% "
  end

  it "inventory_rotation is valid" do
    inv=Inventary.new
    inv.inventory_rotation.should=="la rotacion de inventario es de: 6"

  end
end
