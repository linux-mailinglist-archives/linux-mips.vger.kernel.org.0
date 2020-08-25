Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C763251503
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 11:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgHYJJN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 05:09:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:50006 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgHYJJM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 05:09:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 38556B02B;
        Tue, 25 Aug 2020 09:09:42 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] MIPS: SGI-IP27: No need for kmalloc.h
Date:   Tue, 25 Aug 2020 11:09:04 +0200
Message-Id: <20200825090907.66681-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SG -IP27 is always cache coherent so we can use generic kmalloc.h and
remove the ip27 specific one.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-ip27/kmalloc.h | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-ip27/kmalloc.h

diff --git a/arch/mips/include/asm/mach-ip27/kmalloc.h b/arch/mips/include/asm/mach-ip27/kmalloc.h
deleted file mode 100644
index 82c23ce2afa7..000000000000
--- a/arch/mips/include/asm/mach-ip27/kmalloc.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef __ASM_MACH_IP27_KMALLOC_H
-#define __ASM_MACH_IP27_KMALLOC_H
-
-/*
- * All happy, no need to define ARCH_DMA_MINALIGN
- */
-
-#endif /* __ASM_MACH_IP27_KMALLOC_H */
-- 
2.16.4

