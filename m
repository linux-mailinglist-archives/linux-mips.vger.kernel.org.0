Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CA7284CC8
	for <lists+linux-mips@lfdr.de>; Tue,  6 Oct 2020 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgJFOAL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 10:00:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:40072 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgJFOAL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 10:00:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8DB3DB25C;
        Tue,  6 Oct 2020 14:00:09 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: dec: fix section mismatch
Date:   Tue,  6 Oct 2020 16:00:03 +0200
Message-Id: <20201006140003.10046-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop inline for memory setup functions and mark them __init to
fix section mismatch of pmax_setup_memory_region.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/dec/prom/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
index 5073d2ed78bb..df8e1af20eb7 100644
--- a/arch/mips/dec/prom/memory.c
+++ b/arch/mips/dec/prom/memory.c
@@ -28,7 +28,7 @@ volatile unsigned long mem_err;		/* So we know an error occurred */
 
 #define CHUNK_SIZE 0x400000
 
-static inline void pmax_setup_memory_region(void)
+static __init void pmax_setup_memory_region(void)
 {
 	volatile unsigned char *memory_page, dummy;
 	char old_handler[0x80];
@@ -58,7 +58,7 @@ static inline void pmax_setup_memory_region(void)
  * Use the REX prom calls to get hold of the memory bitmap, and thence
  * determine memory size.
  */
-static inline void rex_setup_memory_region(void)
+static __init void rex_setup_memory_region(void)
 {
 	int i, bitmap_size;
 	unsigned long mem_start = 0, mem_size = 0;
-- 
2.16.4

