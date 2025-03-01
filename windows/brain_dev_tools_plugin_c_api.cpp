#include "include/brain_dev_tools/brain_dev_tools_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "brain_dev_tools_plugin.h"

void BrainDevToolsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  brain_dev_tools::BrainDevToolsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
