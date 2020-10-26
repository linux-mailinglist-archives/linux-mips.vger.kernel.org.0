Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4CD298F12
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 15:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781268AbgJZOUH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 10:20:07 -0400
Received: from relaygw3-24.mclink.it ([195.78.211.244]:35751 "EHLO
        relaygw3-24.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781257AbgJZOUG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 10:20:06 -0400
X-Greylist: delayed 900 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 10:20:05 EDT
Received: from [172.24.30.46] (HELO cgp-esgout03-rm.mail.irds.it)
  by relaygw3-24.mclink.it (CommuniGate Pro SMTP 6.0.6)
  with ESMTPS id 179185249 for linux-mips@vger.kernel.org; Mon, 26 Oct 2020 15:05:03 +0100
X-Envelope-From: <mc5686@mclink.it>
Received: from cinderella.condarelli.it (host-79-55-229-238.retail.telecomitalia.it [79.55.229.238])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mc5686@mclink.it)
        by cgp-esgout03-rm.mail.irds.it (Postfix) with ESMTPSA id 3B29141B14;
        Mon, 26 Oct 2020 15:04:56 +0100 (CET)
From:   Mauro Condarelli <mc5686@mclink.it>
To:     linux-mips@vger.kernel.org
Cc:     Valeria De Fonzo <valeria.defonzo@gmail.com>,
        Mauro Condarelli <mc5686@mclink.it>
Subject: [PATCH] Restore USB-OHCI node
Date:   Mon, 26 Oct 2020 15:04:55 +0100
Message-Id: <20201026140455.469444-1-mc5686@mclink.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: 3B29141B14.A91D2
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1604325897.19996@saOnzGelwmadxJI1VneOwg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Valeria De Fonzo <valeria.defonzo@gmail.com>

This node was taken from OpenWRT mt7628an.dtsi
The OHCI controller described is *not* to be found in "MT7628 DATASHEET",
but it is needed to have any low-speed USB (e.g.: keyboard) working.

I am unsure how to handle this situation (undocumented feature).

Without this patch Linux sees only one USB device:
  # lsusb
  Bus 001 Device 001: ID 1d6b:0001
  # cat /sys/bus/usb/devices/usb1/product
  EHCI Host Controller
and low-speed peripherals (I tested with keyboard and a couple of USB
barcode scanners) are not recognized.
Moreover pluggin in one of the "unrecognizable" devices seems to block
USB completely (i.e.: plugging in a "working peripheral like a memory
device or a USB-serial does *not* work) till next reboot.
Apparently  EHCI tries to hand-over peripheral to OHCI and gets stuck.

With this patch everything works as expected (kernel was compiled  with
both OHCI and EHCI support as modules):
  # lsusb
  Bus 001 Device 001: ID 1d6b:0001
  Bus 002 Device 001: ID 1d6b:0002
  # cat /sys/bus/usb/devices/usb1/product
  Generic Platform OHCI controller
  # cat /sys/bus/usb/devices/usb2/product
  EHCI Host Controller
  <----- insert keybord
  [340060.245767] usb 1-1: new low-speed USB device number 3 using ohci-platform
  [340060.518484] usb 1-1: New USB device found, idVendor=0461, idProduct=0010, bcdDevice= 1.04
  [340060.527103] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
  [340060.534432] usb 1-1: Product: USB Keyboard
  [340060.546236] usb 1-1: Manufacturer: NOVATEK
  [340060.585973] input: NOVATEK USB Keyboard as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.0/0003:0461:0010.0002/input/input1
  [340060.677988] hid-generic 0003:0461:0010.0002: input,hidraw0: USB HID v1.10 Keyboard [NOVATEK USB Keyboard] on usb-101c1000.ohci-1/input0
  [340060.718911] input: NOVATEK USB Keyboard System Control as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.1/0003:0461:0010.0003/input/input2
  [340060.797867] input: NOVATEK USB Keyboard Consumer Control as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.1/0003:0461:0010.0003/input/input3
  [340060.818325] hid-generic 0003:0461:0010.0003: input,hidraw1: USB HID v1.10 Device [NOVATEK USB Keyboard] on usb-101c1000.ohci-1/input1
No other changes were made neither to kernel nor rootfs (modules were
compiled also in kernel without this patch).


Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index bf6b6a459bd6..b4ac008fdfdf 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -323,6 +323,17 @@ ehci@101c0000 {
 		interrupts = <18>;
 	};
 
+	ohci@101c1000 {
+		compatible = "generic-ohci";
+		reg = <0x101c1000 0x1000>;
+
+		phys = <&usb_phy>;
+		phy-names = "usb";
+
+		interrupt-parent = <&intc>;
+		interrupts = <18>;
+	};
+
 	ethernet: ethernet@10100000 {
 		compatible = "ralink,rt5350-eth";
 		reg = <0x10100000 0x10000>;
-- 
2.25.1

