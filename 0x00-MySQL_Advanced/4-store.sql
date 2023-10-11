-- Decrease the quantity of the 
-- ordered item in the items table
DELIMITER //
CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    
    UPDATE items
    SET quantity = quantity - NEW.quantity_ordered
    WHERE item_id = NEW.item_id;
END;
//
DELIMITER ;