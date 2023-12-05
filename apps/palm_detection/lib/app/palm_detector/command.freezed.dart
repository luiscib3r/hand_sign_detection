// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Command {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CommandStartImplCopyWith<$Res> {
  factory _$$CommandStartImplCopyWith(
          _$CommandStartImpl value, $Res Function(_$CommandStartImpl) then) =
      __$$CommandStartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort});
}

/// @nodoc
class __$$CommandStartImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandStartImpl>
    implements _$$CommandStartImplCopyWith<$Res> {
  __$$CommandStartImplCopyWithImpl(
      _$CommandStartImpl _value, $Res Function(_$CommandStartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
  }) {
    return _then(_$CommandStartImpl(
      sendPort: null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
    ));
  }
}

/// @nodoc

class _$CommandStartImpl implements _CommandStart {
  const _$CommandStartImpl({required this.sendPort});

  @override
  final SendPort sendPort;

  @override
  String toString() {
    return 'Command.start(sendPort: $sendPort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandStartImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandStartImplCopyWith<_$CommandStartImpl> get copyWith =>
      __$$CommandStartImplCopyWithImpl<_$CommandStartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return start(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return start?.call(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(sendPort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _CommandStart implements Command {
  const factory _CommandStart({required final SendPort sendPort}) =
      _$CommandStartImpl;

  SendPort get sendPort;
  @JsonKey(ignore: true)
  _$$CommandStartImplCopyWith<_$CommandStartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandRegisterIsolateImplCopyWith<$Res> {
  factory _$$CommandRegisterIsolateImplCopyWith(
          _$CommandRegisterIsolateImpl value,
          $Res Function(_$CommandRegisterIsolateImpl) then) =
      __$$CommandRegisterIsolateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RootIsolateToken rootToken,
      int interpreterAddress,
      List<List<double>> anchors});
}

/// @nodoc
class __$$CommandRegisterIsolateImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandRegisterIsolateImpl>
    implements _$$CommandRegisterIsolateImplCopyWith<$Res> {
  __$$CommandRegisterIsolateImplCopyWithImpl(
      _$CommandRegisterIsolateImpl _value,
      $Res Function(_$CommandRegisterIsolateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootToken = null,
    Object? interpreterAddress = null,
    Object? anchors = null,
  }) {
    return _then(_$CommandRegisterIsolateImpl(
      rootToken: null == rootToken
          ? _value.rootToken
          : rootToken // ignore: cast_nullable_to_non_nullable
              as RootIsolateToken,
      interpreterAddress: null == interpreterAddress
          ? _value.interpreterAddress
          : interpreterAddress // ignore: cast_nullable_to_non_nullable
              as int,
      anchors: null == anchors
          ? _value._anchors
          : anchors // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc

class _$CommandRegisterIsolateImpl implements _CommandRegisterIsolate {
  const _$CommandRegisterIsolateImpl(
      {required this.rootToken,
      required this.interpreterAddress,
      required final List<List<double>> anchors})
      : _anchors = anchors;

  @override
  final RootIsolateToken rootToken;
  @override
  final int interpreterAddress;
  final List<List<double>> _anchors;
  @override
  List<List<double>> get anchors {
    if (_anchors is EqualUnmodifiableListView) return _anchors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anchors);
  }

  @override
  String toString() {
    return 'Command.initService(rootToken: $rootToken, interpreterAddress: $interpreterAddress, anchors: $anchors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandRegisterIsolateImpl &&
            (identical(other.rootToken, rootToken) ||
                other.rootToken == rootToken) &&
            (identical(other.interpreterAddress, interpreterAddress) ||
                other.interpreterAddress == interpreterAddress) &&
            const DeepCollectionEquality().equals(other._anchors, _anchors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rootToken, interpreterAddress,
      const DeepCollectionEquality().hash(_anchors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandRegisterIsolateImplCopyWith<_$CommandRegisterIsolateImpl>
      get copyWith => __$$CommandRegisterIsolateImplCopyWithImpl<
          _$CommandRegisterIsolateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return initService(rootToken, interpreterAddress, anchors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return initService?.call(rootToken, interpreterAddress, anchors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (initService != null) {
      return initService(rootToken, interpreterAddress, anchors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return initService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return initService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (initService != null) {
      return initService(this);
    }
    return orElse();
  }
}

abstract class _CommandRegisterIsolate implements Command {
  const factory _CommandRegisterIsolate(
          {required final RootIsolateToken rootToken,
          required final int interpreterAddress,
          required final List<List<double>> anchors}) =
      _$CommandRegisterIsolateImpl;

  RootIsolateToken get rootToken;
  int get interpreterAddress;
  List<List<double>> get anchors;
  @JsonKey(ignore: true)
  _$$CommandRegisterIsolateImplCopyWith<_$CommandRegisterIsolateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandDetectImplCopyWith<$Res> {
  factory _$$CommandDetectImplCopyWith(
          _$CommandDetectImpl value, $Res Function(_$CommandDetectImpl) then) =
      __$$CommandDetectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraImage frame});
}

/// @nodoc
class __$$CommandDetectImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandDetectImpl>
    implements _$$CommandDetectImplCopyWith<$Res> {
  __$$CommandDetectImplCopyWithImpl(
      _$CommandDetectImpl _value, $Res Function(_$CommandDetectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frame = null,
  }) {
    return _then(_$CommandDetectImpl(
      frame: null == frame
          ? _value.frame
          : frame // ignore: cast_nullable_to_non_nullable
              as CameraImage,
    ));
  }
}

/// @nodoc

class _$CommandDetectImpl implements _CommandDetect {
  const _$CommandDetectImpl({required this.frame});

  @override
  final CameraImage frame;

  @override
  String toString() {
    return 'Command.detect(frame: $frame)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandDetectImpl &&
            (identical(other.frame, frame) || other.frame == frame));
  }

  @override
  int get hashCode => Object.hash(runtimeType, frame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandDetectImplCopyWith<_$CommandDetectImpl> get copyWith =>
      __$$CommandDetectImplCopyWithImpl<_$CommandDetectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return detect(frame);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return detect?.call(frame);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (detect != null) {
      return detect(frame);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return detect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return detect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (detect != null) {
      return detect(this);
    }
    return orElse();
  }
}

abstract class _CommandDetect implements Command {
  const factory _CommandDetect({required final CameraImage frame}) =
      _$CommandDetectImpl;

  CameraImage get frame;
  @JsonKey(ignore: true)
  _$$CommandDetectImplCopyWith<_$CommandDetectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandReadyImplCopyWith<$Res> {
  factory _$$CommandReadyImplCopyWith(
          _$CommandReadyImpl value, $Res Function(_$CommandReadyImpl) then) =
      __$$CommandReadyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommandReadyImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandReadyImpl>
    implements _$$CommandReadyImplCopyWith<$Res> {
  __$$CommandReadyImplCopyWithImpl(
      _$CommandReadyImpl _value, $Res Function(_$CommandReadyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CommandReadyImpl implements _CommandReady {
  const _$CommandReadyImpl();

  @override
  String toString() {
    return 'Command.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommandReadyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _CommandReady implements Command {
  const factory _CommandReady() = _$CommandReadyImpl;
}

/// @nodoc
abstract class _$$CommandBusyImplCopyWith<$Res> {
  factory _$$CommandBusyImplCopyWith(
          _$CommandBusyImpl value, $Res Function(_$CommandBusyImpl) then) =
      __$$CommandBusyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommandBusyImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandBusyImpl>
    implements _$$CommandBusyImplCopyWith<$Res> {
  __$$CommandBusyImplCopyWithImpl(
      _$CommandBusyImpl _value, $Res Function(_$CommandBusyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CommandBusyImpl implements _CommandBusy {
  const _$CommandBusyImpl();

  @override
  String toString() {
    return 'Command.busy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommandBusyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return busy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return busy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return busy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return busy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy(this);
    }
    return orElse();
  }
}

abstract class _CommandBusy implements Command {
  const factory _CommandBusy() = _$CommandBusyImpl;
}

/// @nodoc
abstract class _$$CommandResultImplCopyWith<$Res> {
  factory _$$CommandResultImplCopyWith(
          _$CommandResultImpl value, $Res Function(_$CommandResultImpl) then) =
      __$$CommandResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PalmDetection> detections});
}

/// @nodoc
class __$$CommandResultImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandResultImpl>
    implements _$$CommandResultImplCopyWith<$Res> {
  __$$CommandResultImplCopyWithImpl(
      _$CommandResultImpl _value, $Res Function(_$CommandResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detections = null,
  }) {
    return _then(_$CommandResultImpl(
      detections: null == detections
          ? _value._detections
          : detections // ignore: cast_nullable_to_non_nullable
              as List<PalmDetection>,
    ));
  }
}

/// @nodoc

class _$CommandResultImpl implements _CommandResult {
  const _$CommandResultImpl({required final List<PalmDetection> detections})
      : _detections = detections;

  final List<PalmDetection> _detections;
  @override
  List<PalmDetection> get detections {
    if (_detections is EqualUnmodifiableListView) return _detections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detections);
  }

  @override
  String toString() {
    return 'Command.result(detections: $detections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandResultImpl &&
            const DeepCollectionEquality()
                .equals(other._detections, _detections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_detections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandResultImplCopyWith<_$CommandResultImpl> get copyWith =>
      __$$CommandResultImplCopyWithImpl<_$CommandResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort) start,
    required TResult Function(RootIsolateToken rootToken,
            int interpreterAddress, List<List<double>> anchors)
        initService,
    required TResult Function(CameraImage frame) detect,
    required TResult Function() ready,
    required TResult Function() busy,
    required TResult Function(List<PalmDetection> detections) result,
  }) {
    return result(detections);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort)? start,
    TResult? Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult? Function(CameraImage frame)? detect,
    TResult? Function()? ready,
    TResult? Function()? busy,
    TResult? Function(List<PalmDetection> detections)? result,
  }) {
    return result?.call(detections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort)? start,
    TResult Function(RootIsolateToken rootToken, int interpreterAddress,
            List<List<double>> anchors)?
        initService,
    TResult Function(CameraImage frame)? detect,
    TResult Function()? ready,
    TResult Function()? busy,
    TResult Function(List<PalmDetection> detections)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(detections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommandStart value) start,
    required TResult Function(_CommandRegisterIsolate value) initService,
    required TResult Function(_CommandDetect value) detect,
    required TResult Function(_CommandReady value) ready,
    required TResult Function(_CommandBusy value) busy,
    required TResult Function(_CommandResult value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommandStart value)? start,
    TResult? Function(_CommandRegisterIsolate value)? initService,
    TResult? Function(_CommandDetect value)? detect,
    TResult? Function(_CommandReady value)? ready,
    TResult? Function(_CommandBusy value)? busy,
    TResult? Function(_CommandResult value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommandStart value)? start,
    TResult Function(_CommandRegisterIsolate value)? initService,
    TResult Function(_CommandDetect value)? detect,
    TResult Function(_CommandReady value)? ready,
    TResult Function(_CommandBusy value)? busy,
    TResult Function(_CommandResult value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _CommandResult implements Command {
  const factory _CommandResult(
      {required final List<PalmDetection> detections}) = _$CommandResultImpl;

  List<PalmDetection> get detections;
  @JsonKey(ignore: true)
  _$$CommandResultImplCopyWith<_$CommandResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
