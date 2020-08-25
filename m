Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED7F251506
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 11:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgHYJJO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 05:09:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:50056 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgHYJJO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 05:09:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 03DB8B033;
        Tue, 25 Aug 2020 09:09:43 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] MIPS: Remove unused header file m48t37.h
Date:   Tue, 25 Aug 2020 11:09:06 +0200
Message-Id: <20200825090907.66681-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200825090907.66681-1-tsbogend@alpha.franken.de>
References: <20200825090907.66681-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No users -> remove it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/m48t37.h | 36 ------------------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 arch/mips/include/asm/m48t37.h

diff --git a/arch/mips/include/asm/m48t37.h b/arch/mips/include/asm/m48t37.h
deleted file mode 100644
index 3687a02e692b..000000000000
--- a/arch/mips/include/asm/m48t37.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Registers for the SGS-Thomson M48T37 Timekeeper RAM chip
- */
-#ifndef _ASM_M48T37_H
-#define _ASM_M48T37_H
-
-#include <linux/spinlock.h>
-
-extern spinlock_t rtc_lock;
-
-struct m48t37_rtc {
-	volatile u8	pad[0x7ff0];	/* NVRAM */
-	volatile u8	flags;
-	volatile u8	century;
-	volatile u8	alarm_sec;
-	volatile u8	alarm_min;
-	volatile u8	alarm_hour;
-	volatile u8	alarm_data;
-	volatile u8	interrupts;
-	volatile u8	watchdog;
-	volatile u8	control;
-	volatile u8	sec;
-	volatile u8	min;
-	volatile u8	hour;
-	volatile u8	day;
-	volatile u8	date;
-	volatile u8	month;
-	volatile u8	year;
-};
-
-#define M48T37_RTC_SET		0x80
-#define M48T37_RTC_STOPPED	0x80
-#define M48T37_RTC_READ		0x40
-
-#endif /* _ASM_M48T37_H */
-- 
2.16.4

