Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B5639FA65
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 17:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhFHP0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 11:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231934AbhFHPZ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 11:25:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FE1361108;
        Tue,  8 Jun 2021 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623165846;
        bh=n0cuHdEnBZUYW5KoLbhUKaES1lTb5eTER3NCQ2J6Kiw=;
        h=From:To:Cc:Subject:Date:From;
        b=hrDy6QCCLVT/diEm7qbNC76WFH2eKrYJmog6zqI8Bdudt71ZlX6qsapzdsfqQ6032
         XHhqRAR78pJlWwwaYd7a+hjAqXwjvyxJNC2MioEt/DSR0BdPsFOXPsukbJjmwharjQ
         opc4xuLeIlJt6o3xMOAMJqpNMCkuDcKqYKT+7GtjsEPROCsiJqjcedzJht4IJ633Qs
         LRBWv6T2ubJ1cnN1e+zD3YG1IWCslyfMEmQOAG4Qe+M6IY4WSFWq4V1oOgRNv9PdUE
         Bm7+EQY0L89idUqPo9RFR0kXYHLhDEeltfTcTuOqPj2oeatgOGXawmEJcswJ0MW1pU
         VxeSjQIc+bDXQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL v2] clk: clean up legacy clock interfaces
Date:   Tue,  8 Jun 2021 17:22:07 +0200
Message-Id: <20210608152214.1231666-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/clkdev-cleanup

for you to fetch changes up to 84587cb0f9ed09b9b7f787276ef05beda4ae0ba8:

  clkdev: remove unused clkdev_alloc() interfaces (2021-06-02 12:31:10 +0200)

---
clk: clean up legacy clock interfaces

A recent discussion about legacy clk interface users revealed
that there are only two platforms remaining that provide their own
clk_get()/clk_put() implementations, MIPS ar7 and and m68k coldfire.

I managed to rework both of these to just use the normal clkdev code,
and fold CONFIG_CLKDEV_LOOKUP into CONFIG_HAVE_CLK as it is now shared
among all users.

As I noticed that the ar7 clock implementation and the ralink version
are rather trivial, I ended up converting those to use the common-clk
interfaces as well, though this is unrelated to the other changes.

Link: https://lore.kernel.org/linux-clk/20210531184749.2475868-1-arnd@kernel.org/
Link: https://lore.kernel.org/lkml/CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---

Stephen offered to merge these through the clk tree. I was waiting
for an Ack/Nack from the MIPS/ar7/ralink maintainers but got no further
reply, so sending this as a pull request now.

Please pull or apply, assuming there are no further concerns.

     Arnd

Changes since v1:
 - fix two typos on coldfire
 - remove duplicate #include
 - rebased to v5.13-rc1 to avoid backmerge

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
 arch/m68k/coldfire/m527x.c           |  44 ++++------
 arch/m68k/coldfire/m528x.c           |  42 ++++-----
 arch/m68k/coldfire/m5307.c           |  27 +++---
 arch/m68k/coldfire/m53xx.c           |  78 ++++++++---------
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
 32 files changed, 318 insertions(+), 568 deletions(-)

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
Cc: linux-kernel@vger.kernel.org
