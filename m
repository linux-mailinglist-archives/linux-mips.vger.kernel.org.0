Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BAC2BC4E4
	for <lists+linux-mips@lfdr.de>; Sun, 22 Nov 2020 10:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbgKVJ4B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Nov 2020 04:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgKVJ4A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Nov 2020 04:56:00 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAE6C0613CF;
        Sun, 22 Nov 2020 01:56:00 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so14480514wmi.0;
        Sun, 22 Nov 2020 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bpB5U7WrXJG0tJp8kjkcLnHrcdFJU1d+qBzkQwW+pPM=;
        b=Lu80P6vwEwvW9F2w1XhddQXfkTq8hQDPC4hm5ghgIRDky4J9hCiOW1RLupyoHZTs1/
         VZQIFwgSeejs1J0TUObOjEllpw7WJU3L5xikbFYUwOmFKZQWf3Mch7BOQB7STtH8EGyf
         QmUligNJc5ZhJjCBAA9ZE9zdL88crjxvAWPACBGFN1YPJA8bwzyr8AutKsZhT+4zmmEC
         juxq7F93imo5AZXqc/Un7NlC2oEW701tz0P5wi/PTt1C/+Pi0uiMtEmsA1MoVN80fgU9
         9QbQavIGsvce5a4EY86WKPnynBCRsc46/Hc8C7nvj1iz7VXi3OxFoEhQedlT5EzMgryd
         jlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bpB5U7WrXJG0tJp8kjkcLnHrcdFJU1d+qBzkQwW+pPM=;
        b=sD8TZa89aD3w4Bf2qwBAtpzCX7Hfz6Dv2hYf7XtHB5TLik3ZS+jzmYVjIbXIqiYTuJ
         6HXSNk1Wg/VBmMSn75nQRyS+FiLdC8oLL+Nz1kE09QYSFGPzJS/rA5Iart0cu98WYgDY
         vWDKA8IMqteIfoX+Oppq/xMWTVin343HBMSBOGdXwTTgIo7hUw5hYZ6Nrl4ngBP5UN0r
         5HJGTFZB6/SIxeShsSqzQ/LGkqUd2D5eP0ScNwr6NwWpnVkW531G1V/jlRq9+igPw0d0
         yVT8T4D3yybEFb+SdOe93scAQiEBH/IkIRc64KRhYaQJcPMwZV94AcCmHyw0AOCtPh8k
         qvjA==
X-Gm-Message-State: AOAM531sfw7CLXxM46vtTpfEFRkB4K6k2xt1Gv4nbZKn54JwSx27AXC/
        xcHabI99mXKc1Yac51L3AWxqiVtHyDSo0e7T
X-Google-Smtp-Source: ABdhPJwgXES8EYKFuoWd64kYYSdyEqvdGoYwgz+nC/jShSbeiyeokOFNj4MLDaEFJwICZqvKkmFlXg==
X-Received: by 2002:a1c:9a41:: with SMTP id c62mr14742374wme.15.1606038958820;
        Sun, 22 Nov 2020 01:55:58 -0800 (PST)
Received: from localhost.localdomain (196.red-83-40-48.dynamicip.rima-tde.net. [83.40.48.196])
        by smtp.gmail.com with ESMTPSA id p21sm10593570wma.41.2020.11.22.01.55.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:55:58 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
        gch981213@gmail.com, hackpascal@gmail.com,
        linux-clk@vger.kernel.org, evicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v4 0/6] MIPS: ralink: add CPU clock detection and clock driver for MT7621
Date:   Sun, 22 Nov 2020 10:55:50 +0100
Message-Id: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset ports CPU clock detection for MT7621 from OpenWrt
and adds a complete clock plan for the mt7621 SOC.

The documentation for this SOC only talks about two registers
regarding to the clocks:
* SYSC_REG_CPLL_CLKCFG0 - provides some information about boostrapped
refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
* SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
all or some ip cores. 

No documentation about a probably existent set of dividers for each ip
core is included in the datasheets. So we cannot make anything better,
AFAICT.

Looking into driver code, and some openWRT patched there are
another frequences which are used in some drivers (uart, sd...).
According to all of this information the clock plan for this
SoC is set as follows:
 - Main top clock "xtal" from where all the rest of the world is
   derived.
 - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
   register reads and predividers.
 - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
 - Fixed clocks from "xtal":
    * "50m": 50 MHz.
    * "125m": 125 MHz.
    * "150m": 150 MHz.
    * "250m": 250 MHz.
    * "270m": 270 MHz.

We also have a buch of gate clocks with their parents:
 - "hsdma": "150m"
 - "fe": "250m"
 - "sp_divtx": "270m"
 - "timer": "50m"
 - "pcm": "270m"
 - "pio": "50m"
 - "gdma": "bus"
 - "nand": "125m"
 - "i2c": "50m"
 - "i2s": "270m"
 - "spi": "bus"
 - "uart1": "50m"
 - "uart2": "50m"
 - "uart3": "50m"
 - "eth": "50m"
 - "pcie0": "125m"
 - "pcie1": "125m"
 - "pcie2": "125m"
 - "crypto": "250m"
 - "shxc": "50m"

There was a previous attempt of doing this here[0] but the author
(Chuanhong Guo) did not wanted to make assumptions of a clock plan
for the platform that time. It seems that now he has a better idea of
how the clocks are dispossed for this SoC so he share code[1] where
some frequencies and clock parents for the gates are coded from a
real mediatek private clock plan.
                                                
I do really want this to be upstreamed so according to the comments
in previous attempt[0] from Oleksij Rempel and the frequencies in
code[1] I have tried to do this by myself.

All of this patches have been tested in a GNUBee PC1 resulting in a
working platform.

Changes in v4:
 - Add Acked-by from Rob Herring for binding headers (PATCH 1/6).
 - Convert bindings to not use syscon phandle and declare clock as
   a child of the syscon node. Update device tree and binding doc
   accordly.
 - Make use of 'syscon_node_to_regmap' in driver code instead of
   get this using the phandle function.
 - Properly unregister clocks for the error path of the function
   'mt7621_clk_init'.
 - Include ARRAY_SIZE of fixed clocks in the 'count' to kzalloc
   of 'clk_data'.
 - Add new patch changing invalid vendor 'mtk' in favour of 'mediatek'
   which is the one listed in 'vendor-prefixes.yaml'. Update mt7621 code
   accordly. I have added this patch inside this series because clk
   binding is referring syscon node and the string for that node was
   with not listed vendor. Hence update and have all of this correct
   in the same series.

Changes in v3:
 - Fix compilation warnings reported by kernel test robot because of
   ignoring return values of 'of_clk_hw_register' in functions
   'mt7621_register_top_clocks' and 'mt7621_gate_ops_init'.
 - Fix dts file and binding documentation 'clock-output-names'.

Changes in v2:
 - Remove the following patches:
   * dt: bindings: add mt7621-pll device tree binding documentation.
   * MIPS: ralink: add clock device providing cpu/ahb/apb clock for mt7621.
 - Move all relevant clock code to 'drivers/clk/ralink/clk-mt7621.c' and
   unify there previous 'mt7621-pll' and 'mt7621-clk' into a unique driver
   and binding 'mt7621-clk'.
 - Driver is not a platform driver anymore and now make use of 'CLK_OF_DECLARE'
   because we need clocks available in 'plat_time_init' before setting up
   the timer for the GIC.
 - Use new fixed clocks as parents for different gates and deriving from 'xtal'
   using frequencies in[1].
 - Adapt dts file and bindings header and documentation for new changes.
 - Change MAINTAINERS file to only contains clk-mt7621.c code and
   mediatek,mt7621-clk.yaml file.

[0]: https://www.lkml.org/lkml/2019/7/23/1044
[1]: https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133


Sergio Paracuellos (6):
  dt-bindings: clock: add dt binding header for mt7621 clocks
  dt: bindings: add mt7621-clk device tree binding documentation
  clk: ralink: add clock driver for mt7621 SoC
  staging: mt7621-dts: make use of new 'mt7621-clk'
  staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid
    'mtk'
  MAINTAINERS: add MT7621 CLOCK maintainer

 .../bindings/clock/mediatek,mt7621-clk.yaml   |  67 +++
 MAINTAINERS                                   |   6 +
 arch/mips/ralink/mt7621.c                     |   6 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/ralink/Kconfig                    |  14 +
 drivers/clk/ralink/Makefile                   |   2 +
 drivers/clk/ralink/clk-mt7621.c               | 434 ++++++++++++++++++
 drivers/staging/mt7621-dts/gbpc1.dts          |  11 -
 drivers/staging/mt7621-dts/mt7621.dtsi        |  85 ++--
 include/dt-bindings/clock/mt7621-clk.h        |  41 ++
 11 files changed, 609 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

-- 
2.25.1

