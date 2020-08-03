Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC5323AB42
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgHCRCd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:33 -0400
Received: from crapouillou.net ([89.234.176.41]:37538 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474108; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jwO91iiuPTuXpNbxHCsVIyuahOuBQ1BXXQfnaXbN04I=;
        b=cb05zsHFw61TfMZB9VyYByQ6X7IboU7C/xFYzv4JF4Mm/D/L+CkAEV+v89p7eMVZVrs1xU
        sxBqUQii1TYKMW6sz6R2fF1WREjFvc9IZ8nTVwgRQLky3ZoD9YjMCq5nmZ3OXQCGgomtfM
        Bdtj3ITJ/pwltRkQpWaCa3h7VtsuI30=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 06/13] MIPS: generic: Call the machine's .get_system_type callback if provided
Date:   Mon,  3 Aug 2020 19:01:17 +0200
Message-Id: <20200803170124.231110-7-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Call the machine's .get_system_type callback in the global
get_system_type() function, if it was provided by the mips_machine
implementation.

The get_system_type() function had to be moved within init.c to be able
to use the static variable "mach". Therefore the proc.c, now empty, has
been removed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/generic/Makefile |  1 -
 arch/mips/generic/init.c   | 19 +++++++++++++++++++
 arch/mips/generic/proc.c   | 25 -------------------------
 3 files changed, 19 insertions(+), 26 deletions(-)
 delete mode 100644 arch/mips/generic/proc.c

diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
index 2384a6b09e4c..f49aeede93c2 100644
--- a/arch/mips/generic/Makefile
+++ b/arch/mips/generic/Makefile
@@ -6,7 +6,6 @@
 
 obj-y += init.o
 obj-y += irq.o
-obj-y += proc.o
 
 obj-$(CONFIG_YAMON_DT_SHIM)		+= yamon-dt.o
 obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+= board-sead3.o
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 805d0135a9f4..7d82b436939e 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -207,3 +207,22 @@ void __init arch_init_irq(void)
 void __init prom_free_prom_memory(void)
 {
 }
+
+const char *get_system_type(void)
+{
+	const char *str;
+	int err;
+
+	if (mach && mach->get_system_type)
+		return mach->get_system_type(of_root);
+
+	err = of_property_read_string(of_root, "model", &str);
+	if (!err)
+		return str;
+
+	err = of_property_read_string_index(of_root, "compatible", 0, &str);
+	if (!err)
+		return str;
+
+	return "Unknown";
+}
diff --git a/arch/mips/generic/proc.c b/arch/mips/generic/proc.c
deleted file mode 100644
index 4c992809cc3f..000000000000
--- a/arch/mips/generic/proc.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 Imagination Technologies
- * Author: Paul Burton <paul.burton@mips.com>
- */
-
-#include <linux/of.h>
-
-#include <asm/bootinfo.h>
-
-const char *get_system_type(void)
-{
-	const char *str;
-	int err;
-
-	err = of_property_read_string(of_root, "model", &str);
-	if (!err)
-		return str;
-
-	err = of_property_read_string_index(of_root, "compatible", 0, &str);
-	if (!err)
-		return str;
-
-	return "Unknown";
-}
-- 
2.27.0

