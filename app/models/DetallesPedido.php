<?php

class DetallesPedido
{
    public $detallePedidoId;
    public $codigoAlfanumerico;
    public $estado;
    public $empleadoId;
    public $productoId;
    public $cantidad;
    public $tiempoPreparacion;
    public $perfil;

    public function crearDetalles()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();

        $consulta = $objAccesoDatos->prepararConsulta("INSERT INTO detallespedidos
        (codigoAlfanumerico, estado, productoId, cantidad, perfil)
        VALUES (:codigoAlfanumerico, :estado, :productoId, :cantidad, :perfil)");

        $consulta->bindValue(':codigoAlfanumerico', $this->codigoAlfanumerico, PDO::PARAM_STR);
        $consulta->bindValue(':estado', $this->estado, PDO::PARAM_STR);
        $consulta->bindValue(':productoId', $this->productoId, PDO::PARAM_INT);
        $consulta->bindValue(':cantidad', $this->cantidad, PDO::PARAM_INT); 
        $consulta->bindValue(':perfil', $this->perfil, PDO::PARAM_STR); 
        
        $consulta->execute();

        return $objAccesoDatos->obtenerUltimoId();
    }

    public static function obtenerTodos()
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();

        $consulta = $objAccesoDatos->prepararConsulta("SELECT pedidoId, 
        codigoAlfanumerico, nombreCliente, mesaId,
        estado FROM detallespedidos where estado != 'cancelado'");

        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
    }

    public static function obtenerDetallesDePedidoPorPerfil($perfil)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();

        $consulta = $objAccesoDatos->prepararConsulta("SELECT *
         FROM detallespedidos where estado != 'cancelado' and perfil = :perfil and empleadoId is null");
        $consulta->bindValue(':perfil', $perfil, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
    }

    public static function obtenerPedido($codigoAlfanumerico)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
        $consulta = $objAccesoDatos->prepararConsulta("SELECT *
        FROM detallespedidos WHERE codigoAlfanumerico = :codigoAlfanumerico and estado != 'cancelado'");
      
        $consulta->bindValue(':codigoAlfanumerico', $codigoAlfanumerico, PDO::PARAM_STR);
        $consulta->execute();

        return $consulta->fetchObject('DetallesPedido');
    }

    public static function modificarPedido($pedido)
    {
        try{
            if(isset($pedido)){
     
                $objAccesoDato = AccesoDatos::obtenerInstancia();

                $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos
                 SET estado = :estado WHERE pedidoId = :pedidoId");
               
                $consulta->bindValue(':estado', $pedido->estado, PDO::PARAM_STR);
                $consulta->bindValue(':pedidoId', $pedido->pedidoId, PDO::PARAM_STR);

                $consulta->execute();
    
                return true;
            }
        }catch(Exception $ex){
            echo "Excepcion: " . $ex->getMessage();
        }
        return false;
    }

    public static function borrarPedido($pedidoId)
    {
        try{
            if(Pedido::obtenerPedidoPorId($pedidoId)){            
                $objAccesoDato = AccesoDatos::obtenerInstancia();

                $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos
                 SET estado = 'cancelado' WHERE pedidoId = :pedidoId and estado != 'cancelado'");
               
                $consulta->bindValue(':pedidoId', $pedidoId, PDO::PARAM_INT);

                $consulta->execute();
                
                return true;             
            }
        }catch(Exception $ex){
            echo "Excepcion: " . $ex->getMessage();
        }
        return false;
    }

    public static function obtenerPedidoPorId($pedidoId)
    {
        $objAccesoDatos = AccesoDatos::obtenerInstancia();
       
        $consulta = $objAccesoDatos->prepararConsulta("SELECT * FROM detallespedidos
         WHERE pedidoId = :pedidoId AND estado != 'cancelado'");

        $consulta->bindValue(':pedidoId', $pedidoId, PDO::PARAM_INT);
       
        $consulta->execute();

        return $consulta->fetchObject('DetallesPedido');
    }

    public static function levantarCervecero($empleadoId){
        try{
            if(isset($empleadoId)){
     
                $objAccesoDato = AccesoDatos::obtenerInstancia();
                $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos
                 SET estado = 'en preparacion', empleadoId = :empleadoId, tiempoPreparacion = :tiempoPreparacion WHERE perfil = 'cervecero' 
                 and empleadoId is null");
              
                $tiempoActual =  new DateTime();       
                $tiempoActual = $tiempoActual->getTimestamp();
                $tiempoDePreparacion = $tiempoActual + random_int(10, 30);

                $consulta->bindValue(':empleadoId', $empleadoId, PDO::PARAM_INT);
                $consulta->bindValue(':tiempoPreparacion', $tiempoDePreparacion, PDO::PARAM_INT);

                $consulta->execute();
    
                return true;
            }
        }catch(Exception $ex){
            echo "Excepcion: " . $ex->getMessage();
        }
        return false;
    }

    public static function levantarBartender($empleadoId){
        try{
            if(isset($empleadoId)){
     
                $objAccesoDato = AccesoDatos::obtenerInstancia();
                $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos
                 SET estado = 'en preparacion', empleadoId = :empleadoId, tiempoPreparacion = :tiempoPreparacion WHERE perfil = 'bartender' 
                 and empleadoId is null");
              
                $tiempoActual =  new DateTime();       
                $tiempoActual = $tiempoActual->getTimestamp();
                $tiempoDePreparacion = $tiempoActual + random_int(10, 30);

                $consulta->bindValue(':empleadoId', $empleadoId, PDO::PARAM_INT);
                $consulta->bindValue(':tiempoPreparacion', $tiempoDePreparacion, PDO::PARAM_INT);

                $consulta->execute();
    
                return true;
            }
        }catch(Exception $ex){
            echo "Excepcion: " . $ex->getMessage();
        }
        return false;
    }

    public static function levantarCocinero($empleadoId){
        try{
            if(isset($empleadoId)){
     
                $objAccesoDato = AccesoDatos::obtenerInstancia();
                $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos
                 SET estado = 'en preparacion', empleadoId = :empleadoId, tiempoPreparacion = :tiempoPreparacion WHERE perfil = 'cocinero' 
                 and empleadoId is null");
              
                $tiempoActual =  new DateTime();       
                $tiempoActual = $tiempoActual->getTimestamp();
                $tiempoDePreparacion = $tiempoActual + random_int(10, 30);

                $consulta->bindValue(':empleadoId', $empleadoId, PDO::PARAM_INT);
                $consulta->bindValue(':tiempoPreparacion', $tiempoDePreparacion, PDO::PARAM_INT);

                $consulta->execute();
    
                return true;
            }
        }catch(Exception $ex){
            echo "Excepcion: " . $ex->getMessage();
        }
        return false;
    }



    public static function pendientesPerfil($perfil){
       
        if(isset($perfil)){
    
            $objAccesoDato = AccesoDatos::obtenerInstancia();
            $consulta = $objAccesoDato->prepararConsulta("SELECT * FROM detallespedidos WHERE perfil = :perfil and
            estado = 'pendiente'");              

            $consulta->bindValue(':perfil', $perfil, PDO::PARAM_STR);
            $consulta->execute();

            return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
        }   
    }

    public static function obtenerListasParaServirPerfil($perfil){
       
        if(isset($perfil)){
    
            $tiempoActual =  new DateTime();       
            $tiempoActual = $tiempoActual->getTimestamp();

            $objAccesoDato = AccesoDatos::obtenerInstancia();
            $consulta = $objAccesoDato->prepararConsulta("SELECT * FROM detallespedidos WHERE perfil = :perfil and
            tiempoPreparacion < :tiempoPreparacion and estado != 'listo para servir' and estado != 'terminado'");              

            $consulta->bindValue(':perfil', $perfil, PDO::PARAM_STR);
            $consulta->bindValue(':tiempoPreparacion', $tiempoActual, PDO::PARAM_INT);
            $consulta->execute();

            return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
        }   
    }

    public static function setearListasParaServirPerfil($perfil){
       
        if(isset($perfil)){
    
            $tiempoActual =  new DateTime();       
            $tiempoActual = $tiempoActual->getTimestamp();

            $objAccesoDato = AccesoDatos::obtenerInstancia();
            $consulta = $objAccesoDato->prepararConsulta("UPDATE detallespedidos set estado = 'listo para servir'
             WHERE perfil = :perfil and
            tiempoPreparacion < :tiempoPreparacion and estado != 'listo para servir'");              

            $consulta->bindValue(':perfil', $perfil, PDO::PARAM_STR);
            $consulta->bindValue(':tiempoPreparacion', $tiempoActual, PDO::PARAM_INT);
            $consulta->execute();

            return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
        }   
    }

    public static function obtenerProductosDeUnPedido($codigoAlfanumerico){
        if(isset($codigoAlfanumerico)){   
            $objAccesoDato = AccesoDatos::obtenerInstancia();
            $consulta = $objAccesoDato->prepararConsulta("SELECT * FROM 
            detallespedidos where codigoAlfanumerico = :codigoAlfanumerico");     
            $consulta->bindValue(':codigoAlfanumerico', $codigoAlfanumerico, PDO::PARAM_STR);
            $consulta->execute();

            return $consulta->fetchAll(PDO::FETCH_CLASS, 'DetallesPedido');
        }   
    }
}