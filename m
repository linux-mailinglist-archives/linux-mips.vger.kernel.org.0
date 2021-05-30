Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F9C395246
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhE3RU3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:29 -0400
Received: from aposti.net ([89.234.176.197]:37814 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhE3RU2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:28 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/8] MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
Date:   Sun, 30 May 2021 18:17:59 +0100
Message-Id: <20210530171802.23649-6-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The clock driving the XBurst CPUs in Ingenic SoCs is integer divided
from the main PLL. As such, it is possible to control the frequency of
the CPU, either by changing the divider, or by changing the rate of the
main PLL.

The XBurst CPUs also lack the CP0 timer; the TCU, a separate piece of
hardware in the SoC, provides this functionality.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 310ce50ad285..80d7c3fde056 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -429,6 +429,8 @@ config MACH_INGENIC_SOC
 	select MIPS_GENERIC
 	select MACH_INGENIC
 	select SYS_SUPPORTS_ZBOOT_UART16550
+	select CPU_SUPPORTS_CPUFREQ
+	select MIPS_EXTERNAL_TIMER
 
 config LANTIQ
 	bool "Lantiq based platforms"
-- 
2.30.2

