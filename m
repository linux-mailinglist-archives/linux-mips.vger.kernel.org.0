Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F07271809
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 23:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgITVIk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 17:08:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:41448 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITVIk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 17:08:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 54AEAACDB;
        Sun, 20 Sep 2020 21:09:14 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: malta: remove unused header file
Date:   Sun, 20 Sep 2020 23:08:34 +0200
Message-Id: <20200920210834.116411-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused heasder file asm/mach-malta/malta-pm.h.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-malta/malta-pm.h | 33 -----------------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-malta/malta-pm.h

diff --git a/arch/mips/include/asm/mach-malta/malta-pm.h b/arch/mips/include/asm/mach-malta/malta-pm.h
deleted file mode 100644
index 2a5146d79313..000000000000
--- a/arch/mips/include/asm/mach-malta/malta-pm.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2014 Imagination Technologies
- * Author: Paul Burton <paul.burton@mips.com>
- */
-
-#ifndef __ASM_MIPS_MACH_MALTA_PM_H__
-#define __ASM_MIPS_MACH_MALTA_PM_H__
-
-#include <asm/mips-boards/piix4.h>
-
-#ifdef CONFIG_MIPS_MALTA_PM
-
-/**
- * mips_pm_suspend - enter a suspend state
- * @state: the state to enter, one of PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_*
- *
- * Enters a suspend state via the Malta's PIIX4. If the state to be entered
- * is one which loses context (eg. SOFF) then this function will never
- * return.
- */
-extern int mips_pm_suspend(unsigned state);
-
-#else /* !CONFIG_MIPS_MALTA_PM */
-
-static inline int mips_pm_suspend(unsigned state)
-{
-	return -EINVAL;
-}
-
-#endif /* !CONFIG_MIPS_MALTA_PM */
-
-#endif /* __ASM_MIPS_MACH_MALTA_PM_H__ */
-- 
2.16.4

