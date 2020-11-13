Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FEE2B17CD
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 10:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgKMJKz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 04:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgKMJKv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 04:10:51 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96624C0613D1;
        Fri, 13 Nov 2020 01:10:50 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so8911105wrb.9;
        Fri, 13 Nov 2020 01:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EICGtdSdBUVTfYQynfx1jthTLvT03AILkfeZoMTfCBA=;
        b=jw+KiuDr2MCpgnurAjQL+7y/5jqx9CRSCS2W2kR3HJ20amCZ2/0qsVaa2UpLdtFYtz
         oVhctDoevJXZJJAjVRwzxzFweHPV0g0kMVCmiy+BhGpnI54RdTHUzExCOFETjpQQHd/N
         XVyGHN02S0hhakUkNc3a1IxM2m7CfvIvDxj2AS/iRKC/7wiviIACJfbhNiQ3x+JG58KQ
         wZTY1B6qFVshdSo1AmTTzaC9Zlr80r8Vw+gJXRCG8Zr5ImrKk+KcIIrnlXx4Zep5SzFO
         4TlcWoJvYg/CSCREZwpdA4KyWyznDcKn/WgxscoC+1+e9cTLCBmtjjmAh3jXw14KOAOg
         N/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EICGtdSdBUVTfYQynfx1jthTLvT03AILkfeZoMTfCBA=;
        b=FMavN7UfvJ7wyT2OmTUjhZyxvyFlsYLXDWGJyifs5EunHTzG/bClXDeGVy1NIV01uA
         yT5uypmJg7/g1ZlLvAHCwI1N75y9Mj0N6RP2hqj8EYfDSM2n3IE8gCalHLJZDZtpLduW
         e6opzv/jF7I/PzdXzzI0ABltFW5frq0EM78sBNdCSrEXPBHoJY0TYPsPrwo6F4ZXAs9V
         tkpKOHTYPXb4G2HAAIA0K3EKvZDwcRWb3wjlBvjxuoitEShrKRouyH8L5NLerJKWNAKz
         v3hWfa7CbL1qhNlYNFckMKfE115fu8wXpVqX98sDOcPdMRMi0/bwB6+2OW3czwCjmMSV
         moHg==
X-Gm-Message-State: AOAM530Km/JIAZSEz3p1Izb4AUg/vDOVPgUZQbeg2RUL8k3l2WSQAugB
        sg6SCbw5Vn9poDKdO0hAYOQ=
X-Google-Smtp-Source: ABdhPJwARQUWT+LL5qd7cHVha5dx9jUOCqUFoy8FspFQSSJ3cgmhpS3edvtOzv47RdlBZwdtHXXC6A==
X-Received: by 2002:adf:8284:: with SMTP id 4mr2166748wrc.386.1605258649314;
        Fri, 13 Nov 2020 01:10:49 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id 15sm9266183wmg.1.2020.11.13.01.10.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 01:10:48 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v2 0/5] MIPS: ralink: add CPU clock detection and clock gate driver for MT7621
Date:   Fri, 13 Nov 2020 10:10:41 +0100
Message-Id: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
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

No documentation about a probably existant set of dividers for each ip
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

Sergio Paracuellos (5):
  dt-bindings: clock: add dt binding header for mt7621 clocks
  dt: bindings: add mt7621-clk device tree binding documentation
  clk: ralink: add clock driver for mt7621 SoC
  staging: mt7621-dts: make use of new 'mt7621-clk'
  MAINTAINERS: add MT7621 CLOCK maintainer

 .../bindings/clock/mediatek,mt7621-clk.yaml   |  61 ++++
 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/ralink/Kconfig                    |  14 +
 drivers/clk/ralink/Makefile                   |   2 +
 drivers/clk/ralink/clk-mt7621.c               | 345 ++++++++++++++++++
 drivers/staging/mt7621-dts/gbpc1.dts          |  11 -
 drivers/staging/mt7621-dts/mt7621.dtsi        |  72 ++--
 include/dt-bindings/clock/mt7621-clk.h        |  41 +++
 10 files changed, 504 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

-- 
2.25.1

