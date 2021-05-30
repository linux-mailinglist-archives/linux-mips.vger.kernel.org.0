Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5CE395237
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhE3RTz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:19:55 -0400
Received: from aposti.net ([89.234.176.197]:37646 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhE3RTz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:19:55 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/8] Misc Ingenic patches
Date:   Sun, 30 May 2021 18:17:54 +0100
Message-Id: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Here is a set of misc patches that don't really have any relation
between themselves. I just thought you'd prefer one patchset than eight
individual patches :)

Cheers,
-Paul

Paul Cercueil (8):
  MIPS: mm: XBurst CPU requires sync after DMA
  MIPS: boot: Support specifying UART port on Ingenic SoCs
  MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
  MIPS: Kconfig: ingenic: Ensure MACH_INGENIC_GENERIC selects all SoCs
  MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
  MIPS: ingenic: jz4780: Fix I2C nodes to match DT doc
  MIPS: ingenic: gcw0: Set codec to cap-less mode for FM radio
  MIPS: ingenic: rs90: Add dedicated VRAM memory region

 arch/mips/Kconfig                      |  3 +++
 arch/mips/Kconfig.debug                |  8 ++++++++
 arch/mips/boot/compressed/uart-16550.c |  4 ++--
 arch/mips/boot/dts/ingenic/gcw0.dts    |  5 ++---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 10 +++++-----
 arch/mips/boot/dts/ingenic/rs90.dts    | 14 ++++++++++++++
 arch/mips/ingenic/Kconfig              |  2 ++
 arch/mips/kernel/cpu-probe.c           |  5 +++++
 arch/mips/mm/dma-noncoherent.c         |  1 +
 9 files changed, 42 insertions(+), 10 deletions(-)

-- 
2.30.2

