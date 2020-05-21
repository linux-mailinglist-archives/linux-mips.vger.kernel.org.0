Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3A11DCF10
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 16:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgEUOIk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 10:08:40 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38414 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729747AbgEUOIe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 10:08:34 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C4D508029EC9;
        Thu, 21 May 2020 14:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pp0Rkn3Wx630; Thu, 21 May 2020 17:08:29 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/13] mips: Fix cpu_has_mips64r1/2 activation for MIPS32 CPUs
Date:   Thu, 21 May 2020 17:07:16 +0300
Message-ID: <20200521140725.29571-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 1aeba347b3a9 ("MIPS: Hardcode cpu_has_mips* where target ISA
allows") updated the cpu_has_mips* macro to be replaced with a constant
expression where it's possible. By mistake it wasn't done correctly
for cpu_has_mips64r1/cpu_has_mips64r2 macro. They are defined to
be replaced with conditional expression __isa_range_or_flag(), which
means either ISA revision being within the range or the corresponding
CPU options flag was set at the probe stage or both being true at the
same time. But the ISA level value doesn't indicate whether the ISA is
MIPS32 or MIPS64. Due to this if we select MIPS32r1 - MIPS32r5
architectures the __isa_range() macro will activate the
cpu_has_mips64rX flags, which is incorrect. In order to fix the
problem we make sure the 64bits CPU support is enabled by means of
checking the flag cpu_has_64bits aside with proper ISA range and specific
Revision flag being set.

Fixes: 1aeba347b3a9 ("MIPS: Hardcode cpu_has_mips* where target ISA allows")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/include/asm/cpu-features.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 227d7416591c..14532cd25807 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -291,10 +291,12 @@
 # define cpu_has_mips32r6	__isa_ge_or_flag(6, MIPS_CPU_ISA_M32R6)
 #endif
 #ifndef cpu_has_mips64r1
-# define cpu_has_mips64r1	__isa_range_or_flag(1, 6, MIPS_CPU_ISA_M64R1)
+# define cpu_has_mips64r1	(cpu_has_64bits && \
+				 __isa_range_or_flag(1, 6, MIPS_CPU_ISA_M64R1))
 #endif
 #ifndef cpu_has_mips64r2
-# define cpu_has_mips64r2	__isa_range_or_flag(2, 6, MIPS_CPU_ISA_M64R2)
+# define cpu_has_mips64r2	(cpu_has_64bits && \
+				 __isa_range_or_flag(2, 6, MIPS_CPU_ISA_M64R2))
 #endif
 #ifndef cpu_has_mips64r5
 # define cpu_has_mips64r5	(cpu_has_64bits && \
-- 
2.25.1

