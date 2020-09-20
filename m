Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D9C271823
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 23:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgITVNr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 17:13:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:43068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgITVNq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 17:13:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 628ADAC12;
        Sun, 20 Sep 2020 21:14:20 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: malta: remove mach-malta/malta-dtshim.h header file
Date:   Sun, 20 Sep 2020 23:13:42 +0200
Message-Id: <20200920211343.117262-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To clean up mach-* directories move external declaration of malta_dt_shim()
to mips-boards/malta.h and remove malta-dtshim.h.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-malta/malta-dtshim.h | 25 -------------------------
 arch/mips/include/asm/mips-boards/malta.h       |  2 ++
 arch/mips/mti-malta/malta-setup.c               |  1 -
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h

diff --git a/arch/mips/include/asm/mach-malta/malta-dtshim.h b/arch/mips/include/asm/mach-malta/malta-dtshim.h
deleted file mode 100644
index 7c97b710121d..000000000000
--- a/arch/mips/include/asm/mach-malta/malta-dtshim.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2015 Imagination Technologies
- * Author: Paul Burton <paul.burton@mips.com>
- */
-
-#ifndef __MIPS_MALTA_DTSHIM_H__
-#define __MIPS_MALTA_DTSHIM_H__
-
-#include <linux/init.h>
-
-#ifdef CONFIG_MIPS_MALTA
-
-extern void __init *malta_dt_shim(void *fdt);
-
-#else /* !CONFIG_MIPS_MALTA */
-
-static inline void *malta_dt_shim(void *fdt)
-{
-	return fdt;
-}
-
-#endif /* !CONFIG_MIPS_MALTA */
-
-#endif /* __MIPS_MALTA_DTSHIM_H__ */
diff --git a/arch/mips/include/asm/mips-boards/malta.h b/arch/mips/include/asm/mips-boards/malta.h
index 65de4fb06096..254be3d62519 100644
--- a/arch/mips/include/asm/mips-boards/malta.h
+++ b/arch/mips/include/asm/mips-boards/malta.h
@@ -92,4 +92,6 @@ static inline unsigned long get_msc_port_base(unsigned long reg)
 
 #define MALTA_JMPRS_REG		0x1f000210
 
+extern void __init *malta_dt_shim(void *fdt);
+
 #endif /* __ASM_MIPS_BOARDS_MALTA_H */
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index c4ad5a9b4bc1..e1fb8b534944 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -16,7 +16,6 @@
 
 #include <asm/dma-coherence.h>
 #include <asm/fw/fw.h>
-#include <asm/mach-malta/malta-dtshim.h>
 #include <asm/mips-cps.h>
 #include <asm/mips-boards/generic.h>
 #include <asm/mips-boards/malta.h>
-- 
2.16.4

