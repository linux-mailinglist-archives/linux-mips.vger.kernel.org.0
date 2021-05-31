Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0D039681C
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhEaSvB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230174AbhEaSvB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9F4E6124B;
        Mon, 31 May 2021 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486961;
        bh=C1wH2WfIbNUJFe4kox5BWM12iGOxjbJIjroW8ADDhTI=;
        h=From:To:Cc:Subject:Date:From;
        b=HKCcMJqmChQmpSEHoTdMgwBp0NVe+YPNFb5CIKtBf61Ccar2Bl6Q4ADGJT+AW7PU7
         BWySZmNiFAbMcRHZvAizwWylUR0424Zr6tLEyy8gmb1bvb4+YnVy94pyXzSSo2azLj
         CdeMKysqiRdjUU9vOf0q2qqHgfkgezH8xd+JWH+6+lM6cx9FwgU7B7UTXSwEJTKKHA
         6p3LDr81U/2KPUjngY8tyBEAVjbNHbd0Scb65j3BSSqGtFCTNSdhZqRfgRX6GNLEtv
         QVsp0XPomaDrg+Ez5VCx+Xzl8Y4d9fyjZL6VmZMK0ilnChO7oUjZD2DD1i1Sg4AlMH
         8MBG5iEjwpwOA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: [PATCH 0/7] clk: clean up legacy clock interfaces
Date:   Mon, 31 May 2021 20:47:42 +0200
Message-Id: <20210531184749.2475868-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A recent discussion about legacy clk interface users revealed
that there are only two platforms remaining that provide their own
clk_get()/clk_put() implementations, MIPS ar7 and and m68k coldfire.

I managed to rework both of these to just use the normal clkdev code,
and fold CONFIG_CLKDEV_LOOKUP into CONFIG_HAVE_CLK as it is now shared
among all users.

As I noticed that the ar7 clock implementation and the ralink version
are rather trivial, I ended up converting those to use the common-clk
interfaces as well, though this is unrelated to the other changes.

     Arnd

Link: https://lore.kernel.org/lkml/CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com/

Arnd Bergmann (7):
  mips: ar7: convert to clkdev_lookup
  mips: ar7: convert to CONFIG_COMMON_CLK
  mips: ralink: convert to CONFIG_COMMON_CLK
  m68k: coldfire: use clkdev_lookup on most coldfire
  m68k: coldfire: remove private clk_get/clk_put
  clkdev: remove CONFIG_CLKDEV_LOOKUP
  clkdev: remove unused clkdev_alloc() interfaces

 arch/arm/Kconfig                     |   2 -
 arch/m68k/coldfire/clk.c             |  21 -----
 arch/m68k/coldfire/m5206.c           |  25 +++---
 arch/m68k/coldfire/m520x.c           |  51 +++++------
 arch/m68k/coldfire/m523x.c           |  42 ++++-----
 arch/m68k/coldfire/m5249.c           |  33 +++----
 arch/m68k/coldfire/m525x.c           |  33 +++----
 arch/m68k/coldfire/m5272.c           |  35 +++-----
 arch/m68k/coldfire/m527x.c           |  46 ++++------
 arch/m68k/coldfire/m528x.c           |  42 ++++-----
 arch/m68k/coldfire/m5307.c           |  27 +++---
 arch/m68k/coldfire/m53xx.c           |  80 ++++++++---------
 arch/m68k/coldfire/m5407.c           |  25 +++---
 arch/m68k/coldfire/m5441x.c          | 126 +++++++++++++--------------
 arch/m68k/coldfire/m54xx.c           |  33 +++----
 arch/m68k/include/asm/mcfclk.h       |   5 --
 arch/mips/Kconfig                    |   6 +-
 arch/mips/ar7/clock.c                | 113 ++++++------------------
 arch/mips/include/asm/mach-ar7/ar7.h |   4 -
 arch/mips/pic32/Kconfig              |   1 -
 arch/mips/ralink/Kconfig             |   5 --
 arch/mips/ralink/clk.c               |  64 +-------------
 arch/sh/Kconfig                      |   1 -
 drivers/clk/Kconfig                  |   6 +-
 drivers/clk/Makefile                 |   3 +-
 drivers/clk/clkdev.c                 |  28 ------
 drivers/clocksource/Kconfig          |   6 +-
 drivers/mmc/host/Kconfig             |   4 +-
 drivers/staging/board/Kconfig        |   2 +-
 include/linux/clkdev.h               |   5 --
 sound/soc/dwc/Kconfig                |   2 +-
 sound/soc/rockchip/Kconfig           |  14 +--
 32 files changed, 320 insertions(+), 570 deletions(-)

-- 
2.29.2

Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Florian Fainelli <florian@openwrt.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: John Crispin <john@phrozen.org>
Cc: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
