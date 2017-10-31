class Operation
  attr_accessor :unit_price,:volume,:type,:sale,:created_at
  def initialize(unit_price,volume,type,sale,created_at=Time.now.strftime("%m/%d/%Y"))
    @unit_price=unit_price
    @volume=volume
    @type=type
    @sale=sale
    @created_at=created_at
  end

  def to_s
    hash= {
      unit_price:@unit_price,
      volume:@volume,
      type:@type,
      sale:@sale,
      created_at:@created_at
    }
  end
end


class Inventary
  def create_array
    arr=[]

    operation=Operation.new(80,4,"venta",100)
    arr<<operation.to_s
    operation=Operation.new(60,3.5,"compra",80)
    arr<<operation.to_s
    operation=Operation.new(100,45,"venta",120)
    arr<<operation.to_s

    operation=Operation.new(20,5,"venta",40)
    arr<<operation.to_s
    operation=Operation.new(40,5,"compra",60)
    arr<<operation.to_s
    operation=Operation.new(120,7,"venta",140)
    arr<<operation.to_s

    arr
  end


  def profit_margin
    sum_expenses=0
    sum_income=0
    arr= create_array
    arr_unitprice=[]
    arr_sale=[]

    count=arr.length

    count.times do |x|

      if arr[x][:type]=="venta"
        uprice=arr[x][:unit_price]
        sale=arr[x][:sale]
        volu=arr[x][:volume]
        arr_unitprice<<  uprice * volu
        arr_sale<<  sale* volu
      end
    end

    arr_unitprice.map {|y|sum_expenses+=y}
    arr_sale.map {|z|sum_income+=z}

    total=sum_income - sum_expenses
    margin=total/ sum_income.to_f
" La diferencia es : $ #{total} . Margen de utilidad : #{margin.round(2)}% "

  end

  def inventory_rotation

    arr= create_array
    arr_unitprice=[]
    sum_expenses=0
    count=arr.length

    count.times do |x|

      if arr[x][:type]=="venta"

        volu=arr[x][:volume]
        arr_unitprice <<  volu
      end
    end
    arr_unitprice.map {|y|sum_expenses+=y}
    media=sum_expenses/count
    rotacion= sum_expenses/media
    "la rotacion de inventario es de: #{rotacion}"
  end
end

inven=Inventary.new
p inven.create_array
p inven.profit_margin
p inven.inventory_rotation

#rotación del inventario = costo de la mercancía vendida/promedio de inventarios.
