#ifndef FLUTTER_PLUGIN_BRAIN_DEV_TOOLS_PLUGIN_H_
#define FLUTTER_PLUGIN_BRAIN_DEV_TOOLS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace brain_dev_tools {

class BrainDevToolsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BrainDevToolsPlugin();

  virtual ~BrainDevToolsPlugin();

  // Disallow copy and assign.
  BrainDevToolsPlugin(const BrainDevToolsPlugin&) = delete;
  BrainDevToolsPlugin& operator=(const BrainDevToolsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace brain_dev_tools

#endif  // FLUTTER_PLUGIN_BRAIN_DEV_TOOLS_PLUGIN_H_
