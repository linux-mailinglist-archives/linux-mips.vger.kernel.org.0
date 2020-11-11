Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C712AF662
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgKKQaS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKQaS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:18 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8913C0613D1;
        Wed, 11 Nov 2020 08:30:17 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 10so2811130wml.2;
        Wed, 11 Nov 2020 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XGuUtN4IVknkb+lwRB68ysFvPhv+l5uG2dZdrzyDbxM=;
        b=K3JL3N23cLxCnydD3po0sGWLTdktZNPtKZDeq77xo58iqu2twEcWLWY03hZKN8OVn5
         qEdpJ8jFb6yg88O56K1dAiLdD524KQrappzBIYTq6nDskqXppnxK7psrbYFE1V9EJleO
         EDqmTCSgFUsfjclhlUQfJSK/gCV3GhAgKTIGaXB/WHSyVZ/prBv5WHL9cX/ZbNeOhHfj
         gEEg3vIwotXJSYzU5iDQ+uTpB4KVY70wiKU7U389rBoXvz8e6wrqm5vsyPQCwnBMr93R
         kgh8rW1V1SabpR7kJzszSdQOm1zqp2OkrrVqlT6bJTrrVddU/p9du329EGeW8SNanRlk
         Gvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XGuUtN4IVknkb+lwRB68ysFvPhv+l5uG2dZdrzyDbxM=;
        b=V/ABHYEz2s8aY0lYnuEbCBqbJGqdgGdyH2APBV3YSD4MXhAK9Az+trHNGxnaHyP9ed
         HE/og6cD100VcVnaJoqEiwcnzbN3EZIh2GEj3TEY/HkrHHIwGh86Wk/BX+0THrpLwAxh
         qL/wTaV6UQ/pI74SSPmntmAlWrYc9RVS6HPd7thP00uYU9mkeLXK28JINc4fx2hwQ2c3
         vFbRmzlcTbeWXwwBrrnGazSdWg0mvDwFj53qLwF5hcJEsqD+sUUg7xLh9HtsbE2n3V4z
         M7NncnQEQFAsaGtKSSbSwsfIyHc17QKIxAQlfwwSSdCTO8jG330Nr0M6fsWrU/K4M2Dk
         6vhg==
X-Gm-Message-State: AOAM533bFbiwK1+aUDuMFZQpy3S3uxZwwGTDp+lMANI9zRi7EJP5uIPN
        unii9bqoYE8cHAqxDd9HG8s=
X-Google-Smtp-Source: ABdhPJxvkeDKgStqfGw18+d7w57tBjQmKyn2wrOi7vyyg6iYmYfDHwFtAY7vradA/RZ3ObsFOk8S1Q==
X-Received: by 2002:a1c:3907:: with SMTP id g7mr4962791wma.176.1605112216468;
        Wed, 11 Nov 2020 08:30:16 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:15 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate driver for MT7621
Date:   Wed, 11 Nov 2020 17:30:06 +0100
Message-Id: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
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

Looking into driver code, there is another frequency which is used in
some drivers (uart, sd...) which for any reason is always hardcoded to
50 MHz. Taking this into account this patchset provides three main fixed
clocks to the SOC in 'mt7621-pll' which are:
  - "cpu": with detected frequency (900 MHz in my board).
  - "ahb": cpu / 4 = 225 Mhz.
  - "apb": 50 Mhz.

PLL controller cannot be manipulatedbecause there is no info about
how to do it. Because of this, there is nothing related with registers
in the included binding.

It also provides a clock gate driver 'mt7621-clk' as a platform driver
to allow to enable and disable some clocks in the different ip cores.
The parent clocks for this clock gates have also set taking into account
existant device tree and driver code resulting in the followings:
  - "hsdma": "ahb"
  - "fe": "ahb"
  - "sp_divtx": "ahb"
  - "timer": "cpu"
  - "int": "cpu"
  - "mc": "ahb"
  - "pcm": "ahb"
  - "pio": "ahb"
  - "gdma": "ahb"
  - "nand": "ahb"
  - "i2c": "ahb"
  - "i2s": "ahb"
  - "spi": "ahb"
  - "uart1": "apb"
  - "uart2": "apb"
  - "uart3": "apb"
  - "eth": "ahb"
  - "pcie0": "ahb"
  - "pcie1": "ahb"
  - "pcie2": "ahb"
  - "crypto": "ahb"
  - "shxc": "ahb"

There was a previous attempt of doing this here[0] but the author
did not wanted to make assumptions of a clock plan for the platform.

I do really want this to be upstreamed so according to the comments
in previous attempt[0] from Oleksij Rempel I have tried to do this
by myself.

All of this patches have been tested in a GNUBee PC1 resulting in a
working platform.

[0]: https://www.lkml.org/lkml/2019/7/23/1044

Sergio Paracuellos (7):
  dt-bindings: clock: add dt binding header for mt7621 clocks
  dt: bindings: add mt7621-pll device tree binding documentation
  dt: bindings: add mt7621-clk device tree binding documentation
  MIPS: ralink: add clock device providing cpu/ahb/apb clock for mt7621
  clk: ralink: add clock gate driver for mt7621 SoC
  staging: mt7621-dts: make use of new 'mt7621-pll' and 'mt7621-clk'
  MAINTAINERS: add MT7621 CLOCK maintainer

 .../bindings/clock/mediatek,mt7621-clk.yaml   |  52 ++++
 .../bindings/clock/mediatek,mt7621-pll.yaml   |  51 ++++
 MAINTAINERS                                   |   8 +
 arch/mips/include/asm/mach-ralink/mt7621.h    |  20 ++
 arch/mips/ralink/mt7621.c                     |  87 ++++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/ralink/Kconfig                    |  14 +
 drivers/clk/ralink/Makefile                   |   2 +
 drivers/clk/ralink/clk-mt7621.c               | 258 ++++++++++++++++++
 drivers/staging/mt7621-dts/gbpc1.dts          |  11 -
 drivers/staging/mt7621-dts/mt7621.dtsi        |  71 +++--
 include/dt-bindings/clock/mt7621-clk.h        |  39 +++
 13 files changed, 567 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

-- 
2.25.1

