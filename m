Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC570A4A19
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfIAPq5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:57 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56632 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728980AbfIAPq5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6405C3F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cMHQ580nK6w4 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:40:12 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6A5503F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:12 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:40:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 011/120] MIPS: R5900: Avoid pipeline hazard with the TLBP
 instruction
Message-ID: <d3b43e48be1b888c4bd675dc4c0633dc1e8fe791.1567326213.git.noring@nocrew.org>
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

On the R5900, the TLBP instruction must be immediately followed by an
ERET or a SYNC.P instruction[1].

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-37, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/mm/tlbex.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 82136c346885..0519e2eafbb8 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -489,6 +489,19 @@ static void __maybe_unused build_tlb_probe_entry(u32 **p)
 		uasm_i_tlbp(p);
 		break;
 
+	case CPU_R5900:
+		/*
+		 * On the R5900, the TLBWP instruction must be immediately
+		 * followed by an ERET or a SYNC.P instruction.
+		 */
+		uasm_i_tlbp(p);
+		uasm_i_syncp(p);
+		uasm_i_nop(p);
+		uasm_i_nop(p);
+		uasm_i_nop(p);
+		uasm_i_nop(p);
+		break;
+
 	default:
 		uasm_i_tlbp(p);
 		break;
-- 
2.21.0

