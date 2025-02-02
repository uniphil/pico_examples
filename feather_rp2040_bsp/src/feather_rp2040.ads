--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO; use RP.GPIO;
with RP.PIO.WS2812;
with RP.I2C_Master;
with RP.Device;
with RP.Clock;
with RP.UART;
with RP.SPI;

package Feather_RP2040 is

   A0   : aliased GPIO_Point := (Pin => 26);
   A1   : aliased GPIO_Point := (Pin => 27);
   A2   : aliased GPIO_Point := (Pin => 28);
   A3   : aliased GPIO_Point := (Pin => 29);
   D24  : aliased GPIO_Point := (Pin => 24);
   D25  : aliased GPIO_Point := (Pin => 25);
   SCK  : aliased GPIO_Point := (Pin => 18);
   MOSI : aliased GPIO_Point := (Pin => 19);
   MISO : aliased GPIO_Point := (Pin => 20);
   RX   : aliased GPIO_Point := (Pin => 1);
   TX   : aliased GPIO_Point := (Pin => 0);
   D4   : aliased GPIO_Point := (Pin => 6);

   D13  : aliased GPIO_Point := (Pin => 13);
   D12  : aliased GPIO_Point := (Pin => 12);
   D11  : aliased GPIO_Point := (Pin => 11);
   D10  : aliased GPIO_Point := (Pin => 10);
   D9   : aliased GPIO_Point := (Pin => 9);
   D6   : aliased GPIO_Point := (Pin => 8);
   D5   : aliased GPIO_Point := (Pin => 7);
   SCL  : aliased GPIO_Point := (Pin => 3);
   SDA  : aliased GPIO_Point := (Pin => 2);

   Neopixel_Pin : aliased GPIO_Point := (Pin => 16);
   Neopixel     : aliased RP.PIO.WS2812.Strip
      (Pin => Neopixel_Pin'Access,
       PIO => RP.Device.PIO_0'Access,
       SM  => 0,
       Number_Of_LEDs => 1);

   XOSC_Frequency     : RP.Clock.XOSC_Hertz  := 12_000_000;
   XOSC_Startup_Delay : RP.Clock.XOSC_Cycles := 768_000;
   --  Some boards need to wait a bit longer for the crystal oscillator to
   --  stabilize. This value changes the delay from the default 1ms to 64ms.

   LED  : GPIO_Point renames D13;
   SPI  : RP.SPI.SPI_Port renames RP.Device.SPI_0;
   I2C  : RP.I2C_Master.I2C_Master_Port renames RP.Device.I2C_1;
   UART : RP.UART.UART_Port renames RP.Device.UART_0;

end Feather_RP2040;
