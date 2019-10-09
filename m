Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8911DD0FFF
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731432AbfJIN1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47452 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731357AbfJIN1a (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 362E7AF6B;
        Wed,  9 Oct 2019 13:27:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] MIPS: Kconfig: always select ARC_MEMORY and ARC_PROMLIB for platform
Date:   Wed,  9 Oct 2019 15:27:14 +0200
Message-Id: <20191009132718.25346-4-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of having a default y option with depends simply select
options for the platforms where they are needed.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f71699cd9f73..37336d4ab969 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -359,6 +359,8 @@ config MACH_DECSTATION
 
 config MACH_JAZZ
 	bool "Jazz family of machines"
+	select ARC_MEMORY
+	select ARC_PROMLIB
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select FW_ARC
@@ -631,6 +633,7 @@ config RALINK
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
+	select ARC_PROMLIB
 	select FW_ARC
 	select FW_ARC32
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -699,6 +702,7 @@ config SGI_IP27
 
 config SGI_IP28
 	bool "SGI IP28 (Indigo2 R10k)"
+	select ARC_PROMLIB
 	select FW_ARC
 	select FW_ARC64
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -737,6 +741,8 @@ config SGI_IP28
 
 config SGI_IP32
 	bool "SGI IP32 (O2)"
+	select ARC_MEMORY
+	select ARC_PROMLIB
 	select ARCH_HAS_PHYS_TO_DMA
 	select FW_ARC
 	select FW_ARC32
@@ -844,6 +850,8 @@ config SIBYTE_BIGSUR
 
 config SNI_RM
 	bool "SNI RM200/300/400"
+	select ARC_MEMORY
+	select ARC_PROMLIB
 	select FW_ARC if CPU_LITTLE_ENDIAN
 	select FW_ARC32 if CPU_LITTLE_ENDIAN
 	select FW_SNIPROM if CPU_BIG_ENDIAN
@@ -1360,13 +1368,9 @@ config ARC_CONSOLE
 
 config ARC_MEMORY
 	bool
-	depends on MACH_JAZZ || SNI_RM || SGI_IP32
-	default y
 
 config ARC_PROMLIB
 	bool
-	depends on MACH_JAZZ || SNI_RM || SGI_IP22 || SGI_IP28 || SGI_IP32
-	default y
 
 config FW_ARC64
 	bool
-- 
2.16.4

