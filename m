Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54E25150A
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 11:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbgHYJJY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 05:09:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:50024 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbgHYJJN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 05:09:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 99C6FB009;
        Tue, 25 Aug 2020 09:09:42 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] MIPS: Loongson2ef: Remove specific mc146818rtc.h
Date:   Tue, 25 Aug 2020 11:09:05 +0200
Message-Id: <20200825090907.66681-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200825090907.66681-1-tsbogend@alpha.franken.de>
References: <20200825090907.66681-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loonson2ef's mc146818rtc.h is the same as the generic one -> remove it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 .../include/asm/mach-loongson2ef/mc146818rtc.h     | 36 ----------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h

diff --git a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
deleted file mode 100644
index 00d602629a55..000000000000
--- a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle (ralf@linux-mips.org)
- *
- * RTC routines for PC style attached Dallas chip.
- */
-#ifndef __ASM_MACH_LOONGSON2EF_MC146818RTC_H
-#define __ASM_MACH_LOONGSON2EF_MC146818RTC_H
-
-#include <linux/io.h>
-
-#define RTC_PORT(x)	(0x70 + (x))
-#define RTC_IRQ		8
-
-static inline unsigned char CMOS_READ(unsigned long addr)
-{
-	outb_p(addr, RTC_PORT(0));
-	return inb_p(RTC_PORT(1));
-}
-
-static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
-{
-	outb_p(addr, RTC_PORT(0));
-	outb_p(data, RTC_PORT(1));
-}
-
-#define RTC_ALWAYS_BCD	0
-
-#ifndef mc146818_decode_year
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1970)
-#endif
-
-#endif /* __ASM_MACH_LOONGSON2EF_MC146818RTC_H */
-- 
2.16.4

