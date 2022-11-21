<?php
require_once './models/Producto.php';
require_once './interfaces/IApiUsable.php';


class ProductoController extends Producto
{
    public function CargarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $nombre = $parametros['nombre'];
        $precio = $parametros['precio'];
        $perfil = $parametros['perfil'];

        $producto = new Producto();
        $producto->nombre = $nombre;
        $producto->precio = $precio;      
        $producto->perfil = $perfil;      
        
        $producto->crearProducto();

        $payload = json_encode(array("mensaje" => "Producto creado con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function TraerUno($request, $response, $args)
    {
        $nombre = $args['nombre'];
        $producto = Producto::obtenerProducto($nombre);

        if($producto){
          $payload = json_encode($producto);
  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');           
        }else{
          $payload = json_encode(array("mensaje" => "No se encontro al producto: " . $nombre));
    
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');

        }
    }

    public function TraerTodos($request, $response, $args)
    {
        $lista = Producto::obtenerTodos();
        $payload = json_encode(array("listaProductos" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function ModificarUno($request, $response, $args)
    {
      $parametros = $request->getParsedBody();

      $productoId = $args["id"];
      
      if(is_numeric($productoId)){

        $producto = Producto::obtenerProductoPorId($productoId);
  
        if($producto){
          $producto->precio = $parametros['precio'];
    
          if(Producto::modificarProducto($producto)){
    
            $payload = json_encode(array("mensaje" => "Producto modificado con exito"));
      
            $response->getBody()->write($payload);
            return $response
              ->withHeader('Content-Type', 'application/json');
  
          }else{
            $payload = json_encode(array("mensaje" => "No se ha podido modificar el producto. Revise que los datos enviados sean correctos."));  
            $response->getBody()->write($payload);
            return $response
              ->withHeader('Content-Type', 'application/json');
          }
  
        }else{
          $payload = json_encode(array("mensaje" => "No se ha encontrado al producto de id: " . $productoId));  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');
        }
      }else{
        $payload = json_encode(array("mensaje" => "El id debe ser numerico."));
   
        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
       }
    }

    public function BorrarUno($request, $response, $args)
    {
         $productoId = $args["id"];

         if(is_numeric($productoId)){
           if(Producto::borrarProducto($productoId)){
   
             $payload = json_encode(array("mensaje" => "Producto borrado con exito"));
     
             $response->getBody()->write($payload);
             return $response
               ->withHeader('Content-Type', 'application/json');
           }else{
             $payload = json_encode(array("mensaje" => "No se ha encontrado al producto para borrar."));
     
             $response->getBody()->write($payload);
             return $response
               ->withHeader('Content-Type', 'application/json');
           }
         }else{
          $payload = json_encode(array("mensaje" => "El id debe ser numerico."));
     
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');
         }

    }
}
