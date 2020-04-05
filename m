Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BCE19E89B
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 04:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgDECv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 22:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgDECv0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Apr 2020 22:51:26 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA4A20672;
        Sun,  5 Apr 2020 02:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586055084;
        bh=428hrrLxGizYnfH4HkarazHDCjrvG1Td0mnE3ucsAuY=;
        h=From:To:Cc:Subject:Date:From;
        b=Bc7UTDRuEj52rjnEs57bgWoC+e2mCZiOxvX0KNY8ZEJPxGk8GcwIKASqSyHqkJJqQ
         MsuQuLU82GKZJHqo7c9US+ROPKQ6vM9fcMvFqd67YMmQ90Xq3ga0Xa/Sl2G9umEFNb
         A+I9rRoQoBfN74UrcFzf5/gfxqmzgezvAE2cBP0c=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Alexander Shiyan <shc_work@mail.ru>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>, chenhc@lemote.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Salter <msalter@redhat.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul@pwsan.com>, Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        uclinux-h8-devel@lists.sourceforge.jp,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 0/9] Allow COMMON_CLK to be selectable
Date:   Sat,  4 Apr 2020 19:51:14 -0700
Message-Id: <20200405025123.154688-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series cleans up a handful of selects that were redundant and
deletes presumably dead code with the goal of making it possible to add
kunit tests for the CCF in the future. To do that, we introduce a
"legacy" clk Kconfig option to mark code that hasn't migrated to the
common clk framework and then make the COMMON_CLK config option visible
in the menuconfig as long as that legacy option isn't enabled. I've also
included a couple patches at the end that may be more controversial but
helped me consolidate all this logic/code.

I haven't done more than compile test a few configs for arm, arm64,
h8300, and mips. More testing is welcome.

The plan is that I'll just merge the whole pile through the clk tree. If
the first five patches or the last three patches are better going
through another tree like arm-soc or architecture trees that's fine too,
but there are potential conflicts between trees so maybe it's better to
just leave it all in one tree.

Stephen Boyd (9):
  ARM: Remove redundant COMMON_CLK selects
  ARM: Remove redundant CLKDEV_LOOKUP selects
  arm64: tegra: Remove redundant CLKDEV_LOOKUP selects
  h8300: Remove redundant CLKDEV_LOOKUP selects
  MIPS: Remove redundant CLKDEV_LOOKUP selects
  clk: Allow the common clk framework to be selectable
  ARM: mmp: Remove legacy clk code
  MIPS: Loongson64: Drop asm/clock.h include
  clk: Move HAVE_CLK config out of architecture layer

Cc: Alexander Shiyan <shc_work@mail.ru>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: <chenhc@lemote.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-c6x-dev@linux-c6x.org>
Cc: <linux-m68k@lists.linux-m68k.org>
Cc: <linux-mips@vger.kernel.org>
Cc: <linux-sh@vger.kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: Rich Felker <dalias@libc.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Tony Prisk <linux@prisktech.co.nz>
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>

 arch/Kconfig                     |   6 --
 arch/arm/Kconfig                 |   5 +-
 arch/arm/mach-actions/Kconfig    |   1 -
 arch/arm/mach-clps711x/Kconfig   |   1 -
 arch/arm/mach-mmp/Kconfig        |   1 -
 arch/arm/mach-mmp/Makefile       |   6 --
 arch/arm/mach-mmp/clock-mmp2.c   | 114 -------------------------------
 arch/arm/mach-mmp/clock-pxa168.c |  94 -------------------------
 arch/arm/mach-mmp/clock-pxa910.c |  70 -------------------
 arch/arm/mach-mmp/clock.c        | 105 ----------------------------
 arch/arm/mach-mmp/clock.h        |  65 ------------------
 arch/arm/mach-vt8500/Kconfig     |   1 -
 arch/arm64/Kconfig.platforms     |   1 -
 arch/c6x/Kconfig                 |   1 +
 arch/h8300/Kconfig               |   1 -
 arch/m68k/Kconfig.cpu            |   2 +-
 arch/mips/Kconfig                |   8 +--
 arch/mips/loongson2ef/Kconfig    |   2 +-
 arch/mips/loongson64/smp.c       |   1 -
 arch/sh/boards/Kconfig           |   5 ++
 arch/unicore32/Kconfig           |   2 +-
 drivers/clk/Kconfig              |  23 +++++--
 22 files changed, 34 insertions(+), 481 deletions(-)
 delete mode 100644 arch/arm/mach-mmp/clock-mmp2.c
 delete mode 100644 arch/arm/mach-mmp/clock-pxa168.c
 delete mode 100644 arch/arm/mach-mmp/clock-pxa910.c
 delete mode 100644 arch/arm/mach-mmp/clock.c
 delete mode 100644 arch/arm/mach-mmp/clock.h


base-commit: 7111951b8d4973bda27ff663f2cf18b663d15b48
-- 
Sent by a computer, using git, on the internet

