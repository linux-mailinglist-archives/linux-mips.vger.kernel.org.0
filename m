Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B224D100A
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731434AbfJIN1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47464 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731369AbfJIN1a (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5AB1BB01E;
        Wed,  9 Oct 2019 13:27:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] MIPS: fw: arc: workaround 64bit kernel/32bit ARC problems
Date:   Wed,  9 Oct 2019 15:27:15 +0200
Message-Id: <20191009132718.25346-5-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Pointer arguments for 32bit ARC PROMs must reside in CKSEG0/1. While
the initial stack resides in CKSEG0 the first kernel thread stack
is already placed at a XKPHYS address, which ARC32 can't handle.
The workaround here is to use static variables, which are placed
into BSS and linked to a CKSEG0 address.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/arc/promlib.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/mips/fw/arc/promlib.c b/arch/mips/fw/arc/promlib.c
index be381307fbb0..5e9e840a9314 100644
--- a/arch/mips/fw/arc/promlib.c
+++ b/arch/mips/fw/arc/promlib.c
@@ -11,6 +11,21 @@
 #include <asm/bcache.h>
 #include <asm/setup.h>
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_FW_ARC32)
+/*
+ * For 64bit kernels working with a 32bit ARC PROM pointer arguments
+ * for ARC calls need to reside in CKEG0/1. But as soon as the kernel
+ * switches to it's first kernel thread stack is set to an address in
+ * XKPHYS, so anything on stack can't be used anymore. This is solved
+ * by using a * static declartion variables are put into BSS, which is
+ * linked to a CKSEG0 address. Since this is only used on UP platforms
+ * there is not spinlock needed
+ */
+#define O32_STATIC	static
+#else
+#define O32_STATIC
+#endif
+
 /*
  * IP22 boardcache is not compatible with board caches.	 Thus we disable it
  * during romvec action.  Since r4xx0.c is always compiled and linked with your
@@ -23,8 +38,10 @@
 
 void prom_putchar(char c)
 {
-	ULONG cnt;
-	CHAR it = c;
+	O32_STATIC ULONG cnt;
+	O32_STATIC CHAR it;
+
+	it = c;
 
 	bc_disable();
 	ArcWrite(1, &it, 1, &cnt);
@@ -33,8 +50,8 @@ void prom_putchar(char c)
 
 char prom_getchar(void)
 {
-	ULONG cnt;
-	CHAR c;
+	O32_STATIC ULONG cnt;
+	O32_STATIC CHAR c;
 
 	bc_disable();
 	ArcRead(0, &c, 1, &cnt);
-- 
2.16.4

