##
## “BlueKitchen” shall refer to BlueKitchen GmbH.
## “Raspberry Pi” shall refer to Raspberry Pi Ltd.
## “Product” shall refer to Raspberry Pi hardware products Raspberry Pi Pico W or Raspberry Pi Pico WH.
## “Customer” means any purchaser of a Product.
## “Customer Products” means products manufactured or distributed by Customers which use or are derived from Products.
##
## Raspberry Pi grants to the Customer a non-exclusive, non-transferable, non-sublicensable, irrevocable, perpetual
## and worldwide licence to use, copy, store, develop, modify, and transmit BTstack in order to use BTstack with or
## integrate BTstack into Products or Customer Products, and distribute BTstack as part of these Products or
## Customer Products or their related documentation or SDKs.
##
## All use of BTstack by the Customer is limited to Products or Customer Products, and the Customer represents and
## warrants that all such use shall be in compliance with the terms of this licence and all applicable laws and
## regulations, including but not limited to, copyright and other intellectual property laws and privacy regulations.
##
## BlueKitchen retains all rights, title and interest in, to and associated with BTstack and associated websites.
## Customer shall not take any action inconsistent with BlueKitchen’s ownership of BTstack, any associated services,
## websites and related content.
##
## There are no implied licences under the terms set forth in this licence, and any rights not expressly granted
## hereunder are reserved by BlueKitchen.
##
## BTSTACK IS PROVIDED BY RASPBERRY PI "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED TO THE FULLEST EXTENT
## PERMISSIBLE UNDER APPLICABLE LAW. IN NO EVENT SHALL RASPBERRY PI OR BLUEKITCHEN BE LIABLE FOR ANY DIRECT, INDIRECT,
## INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
## GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
## LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
## OUT OF THE USE OF BTSTACK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##

import std/os, std/macros
import ../private

import futhark

import ./btstack
export btstack

importc:
  compilerArg "--target=arm-none-eabi"
  compilerArg "-mthumb"
  compilerArg "-mcpu=cortex-m0plus"

  sysPath armNoneEabiIncludePath
  sysPath picoSdkPath / "lib/btstack/src"
  sysPath cmakeSourceDir
  sysPath getProjectPath()

  renameCallback futharkRenameCallback

  "le-audio/gatt-service/audio_input_control_service_server.h"
  "le-audio/gatt-service/broadcast_audio_scan_service_client.h"
  "le-audio/gatt-service/broadcast_audio_scan_service_server.h"
  "le-audio/gatt-service/broadcast_audio_scan_service_util.h"
  "le-audio/gatt-service/microphone_control_service_client.h"
  "le-audio/gatt-service/microphone_control_service_server.h"
  "le-audio/gatt-service/volume_control_service_server.h"
  "le-audio/gatt-service/volume_offset_control_service_server.h"
  "le-audio/le_audio_base_builder.h"
  "le-audio/le_audio_base_parser.h"
  "le-audio/le_audio.h"
  "le-audio/le_audio_util.h"
