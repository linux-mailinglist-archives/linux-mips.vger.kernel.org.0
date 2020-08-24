Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE20250296
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgHXQdr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:33:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:50700 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728116AbgHXQda (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DE1C4AF76;
        Mon, 24 Aug 2020 16:33:57 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH 09/12] MIPS: Replace SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
Date:   Mon, 24 Aug 2020 18:32:51 +0200
Message-Id: <20200824163257.44533-10-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SB1250 uart bug is related to PASS 2 workarounds. Use config
CONFIG_SB1_PASS_2_WORKAROUNDS directly and get rid of SIBYTE_1956_WAR.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-cavium-octeon/war.h | 1 -
 arch/mips/include/asm/mach-generic/war.h       | 1 -
 arch/mips/include/asm/mach-ip22/war.h          | 1 -
 arch/mips/include/asm/mach-ip27/war.h          | 1 -
 arch/mips/include/asm/mach-ip28/war.h          | 1 -
 arch/mips/include/asm/mach-ip30/war.h          | 1 -
 arch/mips/include/asm/mach-ip32/war.h          | 1 -
 arch/mips/include/asm/mach-malta/war.h         | 1 -
 arch/mips/include/asm/mach-rc32434/war.h       | 1 -
 arch/mips/include/asm/mach-rm/war.h            | 1 -
 arch/mips/include/asm/mach-sibyte/war.h        | 2 --
 arch/mips/include/asm/mach-tx49xx/war.h        | 1 -
 arch/mips/include/asm/war.h                    | 7 -------
 drivers/tty/serial/sb1250-duart.c              | 9 ++++-----
 14 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 9aa4ea5522a9..0a2bf6b7af94 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -10,7 +10,6 @@
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
 	OCTEON_IS_MODEL(OCTEON_CN6XXX)
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/asm/mach-generic/war.h
index 4f25636661d5..6b7de91435e3 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MACH_GENERIC_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MACH_GENERIC_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/mach-ip22/war.h
index 09169cfbf932..70de6a5008d3 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_IP22_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_IP22_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/mach-ip27/war.h
index 1c81d5464235..5b01e8fe245f 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_IP27_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_IP27_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/mach-ip28/war.h
index ff66adbaaae5..ba4267e2d34d 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_IP28_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_IP28_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index b00469a39835..f404e22b7798 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -6,6 +6,5 @@
 #define __ASM_MIPS_MACH_IP30_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_IP30_WAR_H */
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/mach-ip32/war.h
index c57a9cd2e50b..01475db746ec 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_IP32_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_IP32_WAR_H */
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm/mach-malta/war.h
index 73c9e6d84a8f..68b204ff59a6 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/asm/mach-rc32434/war.h
index 73c9e6d84a8f..68b204ff59a6 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_MIPS_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_MIPS_WAR_H */
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/mach-rm/war.h
index c396a31706ac..093a3894ae41 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_RM_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_RM_WAR_H */
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/asm/mach-sibyte/war.h
index fa9bbc228dd7..71eff5bc3f53 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -15,12 +15,10 @@ extern int sb1250_m3_workaround_needed(void);
 #endif
 
 #define BCM1250_M3_WAR	sb1250_m3_workaround_needed()
-#define SIBYTE_1956_WAR 1
 
 #else
 
 #define BCM1250_M3_WAR	0
-#define SIBYTE_1956_WAR 0
 
 #endif
 
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/asm/mach-tx49xx/war.h
index 7213d9334f3f..0dc2beb5bf5a 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -9,6 +9,5 @@
 #define __ASM_MIPS_MACH_TX49XX_WAR_H
 
 #define BCM1250_M3_WAR			0
-#define SIBYTE_1956_WAR			0
 
 #endif /* __ASM_MIPS_MACH_TX49XX_WAR_H */
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 4f4d37b3dd07..2ce5cd61a072 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -86,11 +86,4 @@
 #error Check setting of BCM1250_M3_WAR for your platform
 #endif
 
-/*
- * This is a DUART workaround related to glitches around register accesses
- */
-#ifndef SIBYTE_1956_WAR
-#error Check setting of SIBYTE_1956_WAR for your platform
-#endif
-
 #endif /* _ASM_WAR_H */
diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index bd5e7e9938ce..22c7bc90b104 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -35,7 +35,6 @@
 
 #include <linux/refcount.h>
 #include <asm/io.h>
-#include <asm/war.h>
 
 #include <asm/sibyte/sb1250.h>
 #include <asm/sibyte/sb1250_uart.h>
@@ -157,7 +156,7 @@ static unsigned char read_sbdchn(struct sbd_port *sport, int reg)
 	unsigned char retval;
 
 	retval = __read_sbdchn(sport, reg);
-	if (SIBYTE_1956_WAR)
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
 		__war_sbd1956(sport);
 	return retval;
 }
@@ -167,7 +166,7 @@ static unsigned char read_sbdshr(struct sbd_port *sport, int reg)
 	unsigned char retval;
 
 	retval = __read_sbdshr(sport, reg);
-	if (SIBYTE_1956_WAR)
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
 		__war_sbd1956(sport);
 	return retval;
 }
@@ -175,14 +174,14 @@ static unsigned char read_sbdshr(struct sbd_port *sport, int reg)
 static void write_sbdchn(struct sbd_port *sport, int reg, unsigned int value)
 {
 	__write_sbdchn(sport, reg, value);
-	if (SIBYTE_1956_WAR)
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
 		__war_sbd1956(sport);
 }
 
 static void write_sbdshr(struct sbd_port *sport, int reg, unsigned int value)
 {
 	__write_sbdshr(sport, reg, value);
-	if (SIBYTE_1956_WAR)
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
 		__war_sbd1956(sport);
 }
 
-- 
2.16.4

