Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EE9A4A28
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbfIAPsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:22 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57478 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfIAPsW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EB2774041C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:41:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WdbLCjR3cars for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:41:10 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0A94C4040E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:41:09 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:41:09 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 014/120] MIPS: R5900: Install final length of TLB refill
 handler rather than 256 bytes
Message-ID: <3eb0ba899a344ff9e83f1c5495010e7b1ee474f0.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The R5900 TLB refill handler is limited to 128 bytes, corresponding
to 32 instructions.

Installing a 256 byte TLB refill handler for the R5900 at address
0x80000000 overwrites the performance counter handler at address
0x80000080, according to the TX79 manual[1]:

        Table 5-2. Exception Vectors for Level 1 exceptions

             Exceptions      |      Vector Address
                             |   BEV = 0  |   BEV = 1
        ---------------------+------------+-----------
        TLB Refill (EXL = 0) | 0x80000000 | 0xBFC00200
        TLB Refill (EXL = 1) | 0x80000180 | 0xBFC00380
        Interrupt            | 0x80000200 | 0xBFC00400
        Others               | 0x80000180 | 0xBFC00380
        ---------------------+------------+-----------

        Table 5-3. Exception Vectors for Level 2 exceptions

             Exceptions      |      Vector Address
                             |   DEV = 0  |   DEV = 1
        ---------------------+------------+-----------
        Reset, NMI           | 0xBFC00000 | 0xBFC00000
        Performance Counter  | 0x80000080 | 0xBFC00280
        Debug, SIO           | 0x80000100 | 0xBFC00300
        ---------------------+------------+-----------

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. 5-7, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/mm/tlbex.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 1caa0214d57a..d356953509e6 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1502,9 +1502,9 @@ static void build_r4000_tlb_refill_handler(void)
 	pr_debug("Wrote TLB refill handler (%u instructions).\n",
 		 final_len);
 
-	memcpy((void *)ebase, final_handler, 0x100);
-	local_flush_icache_range(ebase, ebase + 0x100);
-	dump_handler("r4000_tlb_refill", (u32 *)ebase, (u32 *)(ebase + 0x100));
+	memcpy((void *)ebase, final_handler, 4 * final_len);
+	local_flush_icache_range(ebase, ebase + 4 * final_len);
+	dump_handler("r4000_tlb_refill", (u32 *)ebase, (u32 *)(ebase + 4 * final_len));
 }
 
 static void setup_pw(void)
-- 
2.21.0

