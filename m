Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5241D6E01
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 01:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgEQXYv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 19:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQXYv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 May 2020 19:24:51 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37BCC061A0C
        for <linux-mips@vger.kernel.org>; Sun, 17 May 2020 16:24:51 -0700 (PDT)
From:   Joshua Kinard <kumba@gentoo.org>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v3 2/3] MIPS: SGI-IP30: Remove R5432_CP0_INTERRUPT_WAR from war.h
Date:   Sun, 17 May 2020 19:24:38 -0400
Message-Id: <e1c9ab69e73e7acc2d9c1c4f7d0b299a15e5a936.1589753297.git.kumba@gentoo.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
References: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Joshua Kinard <kumba@gentoo.org>

Remove an old macro that no longer exists anywhere else in the tree
that snuck in when IP30 support was added

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/include/asm/mach-ip30/war.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index a98ba204f183..ad3352d3d203 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -13,7 +13,6 @@
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
 #define MIPS34K_MISSED_ITLB_WAR		0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
 
-- 
2.26.2

