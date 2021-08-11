Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E0B3E8DC9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 11:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236881AbhHKJ67 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 05:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236904AbhHKJ6h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 05:58:37 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBE9C06179B
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 02:58:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id g9y52500K1gJxCh019y5qP; Wed, 11 Aug 2021 11:58:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzs-001zgH-Tp; Wed, 11 Aug 2021 11:58:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzr-005NO7-6d; Wed, 11 Aug 2021 11:58:03 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v5 00/19] auxdisplay: ht16k33: Add character display support
Date:   Wed, 11 Aug 2021 11:57:40 +0200
Message-Id: <20210811095759.1281480-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	Hi all,

The Holtek HT16K33 LED controller is not only used for driving
dot-matrix displays, but also for driving segment displays.
The current auxdisplay driver is limited to dot-matrix displays, which
are exposed as a frame buffer device.

This patch series extends the driver to 4-digit 7-segment and quad
14-segment alphanumeric displays, allowing the user to display and
scroll text messages.

List of patches:
  - Patch 1 provides font data for displaying ASCII characters on
    14-segment displays,
  - Patch 2 updates the HT16K33 DT bindings for segment displays,
  - Patches 3-5 contain a bug fix and small improvements for the
    Imagination Technologies ASCII LCD Display driver,
  - Patch 6 extracts the character line display core support from the
    Imagination Technologies ASCII LCD Display driver, for reuse,
  - Patches 7-8 contain cleanups and improvements for the character line
    display core driver,
  - Patches 9-16 contain a bug fix, cleanups and improvements for the
    HT16K33 driver, to prepare for segment display support,
  - Patch 17 adds support for 7/14-segment displays to the HT16K33
    driver,
  - Patch 18 updates the HT16K33 DT bindings to document an LED subnode,
  - Patch 19 adds segment display LED support to the HT16K33 driver,
    to make use of hardware blinking, and to expose display color.

Changes compared to v4[1]:
  - Add Reviewed-by,
  - Add missing select NEW_LEDS.

Changes compared to v3[2]:
  - Combine compatible values for 7/14 segment displays into an enum,
  - Add Reviewed-by,
  - Add missing select LEDS_CLASS.

Changes compared to v2[3]:
  - Drop color property from display node,
  - Use compat_only_sysfs_link_entry_to_kobj() instead of cooking our
    own helper on top of kernfs_create_link(),
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,
  - Pass "dev" instead of "client" to ht16k33_fbdev_probe() and
    ht16k33_seg_probe(),
  - Drop local variable "node",
  - Remove unneeded inclusion of <linux/leds.h> and <linux/of_device.h>,
  - Document LED subnode,
  - Remove unneeded C++ comment,
  - Make the creation of the LED device dependent on the presence of the
    "led" subnode in DT, so it can be used in dot-matrix mode too.
  - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
    all LED properties from DT, instead of manual LED name construction
    based on just the "color" property.

Changes compared to v1[4]:
  - Fix type of color to uint32,
  - "refresh-rate-hz" is still required for dot-matrix displays.
  - Move "select LINEDISP" for HT16K33 symbol to correct patch,
  - Add backwards compatibility "message" symlink to img-ascii-lcd,
  - Connect backlight to fbdev in ht16k33 dot-matrix mode,
  - Set "err = -EINVAL" in switch() case that cannot happen,
  - Use "auxdisplay" instead of DRIVER_NAME in LED name.

This series has been tested using an Adafruit 0.54" Quad Alphanumeric
Red FeatherWing Display, connected to an OrangeCrab ECP5 FPGA board
running a 64 MHz VexRiscv RISC-V softcore.
7-segment display support is based purely on schematics, and has not
been tested on actual hardware.  The changes to img-ascii-lcd.c are also
untested, due to lack of hardware.

Thanks!

[1] "[PATCH v4 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210727140459.3767788-1-geert@linux-m68k.org/
[2] "[PATCH v3 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210714151130.2531831-1-geert@linux-m68k.org/
[3] "[PATCH v2 00/18] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210625125902.1162428-1-geert@linux-m68k.org/
[4] "[PATCH 00/17] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210322144848.1065067-1-geert@linux-m68k.org/

Geert Uytterhoeven (19):
  uapi: Add <linux/map_to_14segment.h>
  dt-bindings: auxdisplay: ht16k33: Document Adafruit segment displays
  auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
  auxdisplay: img-ascii-lcd: Add helper variable dev
  auxdisplay: img-ascii-lcd: Convert device attribute to sysfs_emit()
  auxdisplay: Extract character line display core support
  auxdisplay: linedisp: Use kmemdup_nul() helper
  auxdisplay: linedisp: Add support for changing scroll rate
  auxdisplay: ht16k33: Connect backlight to fbdev
  auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
  auxdisplay: ht16k33: Remove unneeded error check in keypad probe()
  auxdisplay: ht16k33: Convert to simple i2c probe function
  auxdisplay: ht16k33: Add helper variable dev
  auxdisplay: ht16k33: Move delayed work
  auxdisplay: ht16k33: Extract ht16k33_brightness_set()
  auxdisplay: ht16k33: Extract frame buffer probing
  auxdisplay: ht16k33: Add support for segment displays
  dt-bindings: auxdisplay: ht16k33: Document LED subnode
  auxdisplay: ht16k33: Add LED support

 .../bindings/auxdisplay/holtek,ht16k33.yaml   |  31 +-
 drivers/auxdisplay/Kconfig                    |  10 +
 drivers/auxdisplay/Makefile                   |   1 +
 drivers/auxdisplay/ht16k33.c                  | 473 ++++++++++++++----
 drivers/auxdisplay/img-ascii-lcd.c            | 205 ++------
 drivers/auxdisplay/line-display.c             | 261 ++++++++++
 drivers/auxdisplay/line-display.h             |  43 ++
 include/uapi/linux/map_to_14segment.h         | 239 +++++++++
 8 files changed, 996 insertions(+), 267 deletions(-)
 create mode 100644 drivers/auxdisplay/line-display.c
 create mode 100644 drivers/auxdisplay/line-display.h
 create mode 100644 include/uapi/linux/map_to_14segment.h

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
