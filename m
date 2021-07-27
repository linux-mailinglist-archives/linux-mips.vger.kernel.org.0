Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D16B3D77CD
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 16:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhG0OFN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 10:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbhG0OFM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 10:05:12 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D78C061765
        for <linux-mips@vger.kernel.org>; Tue, 27 Jul 2021 07:05:11 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
        by albert.telenet-ops.be with bizsmtp
        id aE562500X1fSPfK06E56wa; Tue, 27 Jul 2021 16:05:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8Nhi-001PuI-1G; Tue, 27 Jul 2021 16:05:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8Nhh-00FoBr-AX; Tue, 27 Jul 2021 16:05:05 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 00/19] auxdisplay: ht16k33: Add character display support
Date:   Tue, 27 Jul 2021 16:04:40 +0200
Message-Id: <20210727140459.3767788-1-geert@linux-m68k.org>
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

Changes compared to v3[1]:
  - Combine compatible values for 7/14 segment displays into an enum,
  - Add Reviewed-by,
  - Add missing select LEDS_CLASS.

Changes compared to v2[2]:
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

Changes compared to v1[3]:
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

[1] "[PATCH v3 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210714151130.2531831-1-geert@linux-m68k.org/
[2] "[PATCH v2 00/18] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210625125902.1162428-1-geert@linux-m68k.org/
[3] "[PATCH 00/17] auxdisplay: ht16k33: Add character display support"
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
 drivers/auxdisplay/Kconfig                    |   9 +
 drivers/auxdisplay/Makefile                   |   1 +
 drivers/auxdisplay/ht16k33.c                  | 473 ++++++++++++++----
 drivers/auxdisplay/img-ascii-lcd.c            | 205 ++------
 drivers/auxdisplay/line-display.c             | 261 ++++++++++
 drivers/auxdisplay/line-display.h             |  43 ++
 include/uapi/linux/map_to_14segment.h         | 239 +++++++++
 8 files changed, 995 insertions(+), 267 deletions(-)
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
