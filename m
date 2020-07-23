Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845ED22ABE2
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 11:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgGWJmi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 05:42:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:37878 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgGWJmi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Jul 2020 05:42:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 42675AEFA;
        Thu, 23 Jul 2020 09:42:44 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips: traps, add __init to parity_protection_init
Date:   Thu, 23 Jul 2020 11:42:35 +0200
Message-Id: <20200723094235.12706-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It references __initdata and is called only from an __init function:
trap_init. This avoids section mismatches (which I am seeing with gcc
10).

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index f655af68176c..702143ad7b47 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1680,7 +1680,7 @@ __setup("nol2par", nol2parity);
  * Some MIPS CPUs can enable/disable for cache parity detection, but do
  * it different ways.
  */
-static inline void parity_protection_init(void)
+static inline __init void parity_protection_init(void)
 {
 #define ERRCTL_PE	0x80000000
 #define ERRCTL_L2P	0x00800000
-- 
2.27.0

