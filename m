Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D544E8766
	for <lists+linux-mips@lfdr.de>; Sun, 27 Mar 2022 13:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiC0Lkn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Mar 2022 07:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbiC0Lkm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Mar 2022 07:40:42 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA7E645AEB;
        Sun, 27 Mar 2022 04:39:01 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:60662.210632910
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id 7DA54100199;
        Sun, 27 Mar 2022 19:38:48 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id 514bf9d62b8d488c9dbce10218197a13 for mripard@kernel.org;
        Sun, 27 Mar 2022 19:39:00 CST
X-Transaction-ID: 514bf9d62b8d488c9dbce10218197a13
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v12 0/6] drm/loongson: add drm driver for loongson display controller
Date:   Sun, 27 Mar 2022 19:38:40 +0800
Message-Id: <20220327113846.2498146-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is a display controller in loongson's LS2K1000 SoC and LS7A1000
bridge chip, the display controller is a PCI device in those chips. It
has two display pipes but with only one hardware cursor. Each way has
a DVO interface which provide RGB888 signals, vertical & horizontal
synchronisations, data enable and the pixel clock. Each CRTC is able to
scanout from 1920x1080 resolution at 60Hz, the maxmium resolution is
2048x2048 according to the hardware spec. Loongson display controllers
are simple which require scanout buffers to be physically contiguous.

For LS7A1000 bridge chip, the DC is equipped with a dedicated video RAM
which is typically 64MB or more. In this case, VRAM helper based driver
is intend to be used even through the DC can scanout form system memory.

While LS2K1000 is a SoC which is a typically UMA device, only system
memory is available. Therefore CMA helper based driver is intend to be
used. It is possible to use VRAM helper based driver on LS2K1000 by
carving out part of system memory as VRAM though.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space, They are used to emulate two way i2c.
One for DVO0, another for DVO1. LS2K1000 and LS2K0500 SoC don't have such
GPIO hardwared, they grab i2c adapter from other module, either general
purpose GPIO emulated i2c or hardware i2c adapter.

    +------+            +-----------------------------------+
    | DDR4 |            |  +-------------------+            |
    +------+            |  | PCIe Root complex |   LS7A1000 |
       || MC0           |  +--++---------++----+            |
  +----------+  HT 3.0  |     ||         ||                 |
  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
  +----------+          | +--------+  +-+--+-+    +---------+   +------+
       || MC1           +---------------|--|----------------+
    +------+                            |  |
    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
                      +-------+                      +------+

The above picture give a simple usage of LS7A1000, note that the encoder
is not necessary adv7125 or tfp410, other candicates can be ch7034b,
sil9022, ite66121 and lt8618 etc.

v2: Fixup warnings reported by kernel test robot

v3: Fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
    more details about lsdc.

v4:
   1) Add dts required and explain why device tree is required.
   2) Give more description about lsdc and VRAM helper based driver.
   3) Fix warnings reported by kernel test robot.
   4) Introduce stride_alignment member into struct lsdc_chip_desc, the
      stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500.

v5:
   1) Using writel and readl replace writeq and readq, to fix kernel test
      robot report build error on other archtecture.
   2) Set default fb format to XRGB8888 at crtc reset time.

v6:
   1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty update implement based
      on CMA helper.

v7:
   1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not ready now
   2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
   3) Remove lsdc_pixpll_print(), part of it move to debugfs.
   4) Set prefer_shadow to true if vram based driver is in using.
   5) Replace double blank lines with single line in all files.
   6) Verbose cmd line parameter is replaced with drm_dbg()
   7) All warnnings reported by ./scripts/checkpatch.pl --strict are fixed
   8) Get edid from dtb support is removed as suggested by Maxime Ripard
   9) Fix typos and various improvement

v8:
   1) Drop damage update implement and its command line.
   2) Drop DRM_LSDC_VRAM_DRIVER config option as suggested by Maxime.
   3) Deduce DC's identification from its compatible property.
   4) Drop the board specific dts patch.
   5) Add documention about the display controller device node.

v9:
   1) Fix the warnings reported by checkpatch script and fix typos

v10:
   1) Pass `make dt_binding_check` validation
   2) Fix warnings reported by kernel test robot

v11:
   1) Convert the driver to use drm bridge and of graph framework.
   2) Dump register value support through debugfs.
   3) Select DRM_TTM and DRM_TTM_HELPER in Kconfig which fix linkage
      problem when built it into the kernel.
   4) Non 64 pixel(256 bytes aligned) horiziontal resolutons got
      supported by hacking, default is disabled, enable it by using
      'loongson.relax_alignment=1' on kernel cmd line.
   5) Various improvement as required by Maxime.

v12:
   1) Add gammma support, it is broken because hardware engineer
      does not implement this correctly. Using 'loongson.gamma=1' on
      the kernel cmd line to enable this and see what will happen.
      We implemlent this for IC varification.
   2) Separate debugfs related code from lsdc_drv.c
   3) Built-in GPIO emulate i2c refinement.
   4) Various improvement as required by Rob.

Sui Jingfeng (6):
  MIPS: Loongson64: dts: update the display controller device node
  MIPS: Loongson64: introduce board specific dts and add model property
  dt-bindings: display: Add Loongson display controller
  MIPS: Loongson64: defconfig: enable display bridge drivers
  drm/loongson: add drm driver for loongson display controller
  MAINTAINERS: add maintainers for DRM LSDC driver

 .../loongson/loongson,display-controller.yaml | 322 ++++++++++
 MAINTAINERS                                   |   9 +
 arch/mips/boot/dts/loongson/Makefile          |   4 +
 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  96 +++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 +
 .../boot/dts/loongson/ls2k1000_pai_udb.dts    | 107 ++++
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 138 +++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  24 +-
 arch/mips/configs/loongson2k_defconfig        |   5 +
 arch/mips/configs/loongson3_defconfig         |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/loongson/Kconfig              |  25 +
 drivers/gpu/drm/loongson/Makefile             |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c          | 395 ++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c       | 176 ++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.h       |  17 +
 drivers/gpu/drm/loongson/lsdc_drv.c           | 417 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h           | 155 +++++
 drivers/gpu/drm/loongson/lsdc_i2c.c           | 285 +++++++++
 drivers/gpu/drm/loongson/lsdc_i2c.h           |  38 ++
 drivers/gpu/drm/loongson/lsdc_irq.c           |  57 ++
 drivers/gpu/drm/loongson/lsdc_irq.h           |  17 +
 drivers/gpu/drm/loongson/lsdc_output.c        | 261 ++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  21 +
 drivers/gpu/drm/loongson/lsdc_pci_drv.c       | 346 +++++++++++
 drivers/gpu/drm/loongson/lsdc_plane.c         | 447 ++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c           | 573 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h           |  87 +++
 drivers/gpu/drm/loongson/lsdc_regs.h          | 221 +++++++
 30 files changed, 4270 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls2k1000_pai_udb.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h

-- 
2.25.1

