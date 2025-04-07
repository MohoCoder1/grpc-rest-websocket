import 'package:get/get.dart';
import 'package:task_hub/data/datasources/grpc/hello_grpc_service.dart';
import 'package:task_hub/data/datasources/rest/todo_rest_service.dart';
import 'package:task_hub/data/datasources/websocket/echo_socket_service.dart';
import 'package:task_hub/data/repositories/echo_socket_repository.dart';
import 'package:task_hub/data/repositories/hello_grpc_repository.dart';
import 'package:task_hub/data/repositories/todo_rest_repository.dart';
import 'package:task_hub/domain/repositories/i_echo_socket_repository.dart';
import 'package:task_hub/domain/repositories/i_hello_grpc_repository.dart';
import 'package:task_hub/domain/repositories/i_todo_rest_repository.dart';
import 'package:task_hub/domain/usecases/get_todos_use_case.dart';
import 'package:task_hub/domain/usecases/say_hello_use_case.dart';
import 'package:task_hub/domain/usecases/send_echo_message_use_case.dart';
import 'package:task_hub/presentation/controllers/echo_socket_controller.dart';
import 'package:task_hub/presentation/controllers/hello_grpc_controller.dart';
import 'package:task_hub/presentation/controllers/todo_rest_controller.dart';
import 'grpc_config.dart';

class DependencyInjection {
  static void init() {
    //gRPC
    Get.lazyPut<GrpcConfig>(() => GrpcConfig(), fenix: true);
    Get.lazyPut<HelloGrpcService>(
      () => HelloGrpcService(grpc: Get.find()),
      fenix: true,
    );
    Get.lazyPut<IHelloGrpcRepository>(() => HelloGrpcRepository(service: Get.find()));
    Get.lazyPut(() => SayHelloUseCase(repository: Get.find()));
    Get.lazyPut(()=> HelloGrpcController(sayHelloUseCase: Get.find()));


    //REST
    Get.lazyPut(() => TodoRestService());
    Get.lazyPut<ITodoRestRepository>(
      () => TodoRestRepository(apiService: Get.find()),

    );
    Get.lazyPut(() => GetTodosUseCase(Get.find()));
    Get.lazyPut(() => TodoRestController(getTodosUseCase: Get.find()));


    //WebSocket
    Get.lazyPut(() => EchoSocketService());
    Get.lazyPut<IEchoSocketRepository>(
      () => EchoSocketRepository(service: Get.find()),
    );
    Get.lazyPut(() => SendEchoMessageUseCase(Get.find()));
    Get.lazyPut(
      () => EchoSocketController(
        sendEchoMessageUseCase: Get.find(),
        echoSocketRepository: Get.find(),
      ),
    );
  }
}
