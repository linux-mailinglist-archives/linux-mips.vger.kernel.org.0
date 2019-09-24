Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13506BCB17
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 17:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732502AbfIXPU6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 11:20:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:58744 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728514AbfIXPU6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Sep 2019 11:20:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 28B7CAC52;
        Tue, 24 Sep 2019 15:20:57 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: init: Prevent adding memory before PHYS_OFFSET
Date:   Tue, 24 Sep 2019 17:20:51 +0200
Message-Id: <20190924152052.9635-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On some SGI machines (IP28 and IP30) a small region of memory is mirrored
to pyhsical address 0 for exception vectors while rest of the memory
is reachable at a higher physical address. ARC PROM marks this
region as reserved, but with commit a94e4f24ec83 ("MIPS: init: Drop
boot_mem_map") this chunk is used, when searching for start of ram,
which breaks at least IP28 and IP30 machines. To fix this
add_region_memory() checks for start address < PHYS_OFFSET and ignores
these chunks.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f5c6b4c6de24..5eec13b8d222 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -108,6 +108,9 @@ void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
 		return;
 	}
 
+	if (start < PHYS_OFFSET)
+		return;
+
 	memblock_add(start, size);
 	/* Reserve any memory except the ordinary RAM ranges. */
 	switch (type) {
-- 
2.13.7

