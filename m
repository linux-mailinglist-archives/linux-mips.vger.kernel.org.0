Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94CA2A4A1B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbfIAPq5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:57 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56634 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIAPq5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 438D93F897
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mfyUCjypZbOB for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:40:26 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4A01A3F7B1
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:26 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:40:26 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 012/120] MIPS: R5900: Avoid pipeline hazards with the
 TLBW[IR] instructions
Message-ID: <55596f09de274312357656ee483314ec4ef8c51a.1567326213.git.noring@nocrew.org>
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

On the R5900, the TLBWI[1] and TLBWR[2] instructions must be followed by
an ERET or a SYNC.P instruction to ensure a TLB update.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-39, https://wiki.qemu.org/File:C790.pdf

[2] Ibid. p. C-40.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/mm/tlbex.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 0519e2eafbb8..89ff0eae5397 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -622,6 +622,15 @@ void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 		uasm_i_nop(p);
 		tlbw(p);
 		break;
+	case CPU_R5900:
+		/*
+		 * On the R5900, the TLBWI and TLBWR instructions must be
+		 * followed by an ERET or a SYNC.P instruction to ensure a
+		 * TLB update.
+		 */
+		tlbw(p);
+		uasm_i_syncp(p);
+		break;
 
 	case CPU_JZRISC:
 		tlbw(p);
-- 
2.21.0

