Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E56A4A2C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbfIAPs1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:27 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57538 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIAPs1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 52EA640386
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:39:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UiPntJFwqv29 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:39:02 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 6A5FC4036B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:39:02 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:39:02 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 007/120] MIPS: R5900: Add the SYNC.P instruction
Message-ID: <829485da9abba9367b953c7d5756356a58e8a638.1567326213.git.noring@nocrew.org>
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

The SYNC.P instruction is a pipeline barrier. All instructions prior to
the barrier are completed before the instructions following the barrier
are fetched[1].

However, the barrier operation doesn't wait for any prior instructions
to retire, for example multiply, divide, multicycle COP1 operations or
a pending load issued before the barrier operation.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. A-125, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/uasm.h | 1 +
 arch/mips/mm/uasm-mips.c     | 1 +
 arch/mips/mm/uasm.c          | 5 +++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index f7effca791a5..71ddf155ef85 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -171,6 +171,7 @@ Ip_u3u2u1(_srlv);
 Ip_u3u1u2(_subu);
 Ip_u2s3u1(_sw);
 Ip_u1(_sync);
+Ip_0(_syncp);
 Ip_u1(_syscall);
 Ip_0(_tlbp);
 Ip_0(_tlbr);
diff --git a/arch/mips/mm/uasm-mips.c b/arch/mips/mm/uasm-mips.c
index 7154a1d99aad..725c6fe1e317 100644
--- a/arch/mips/mm/uasm-mips.c
+++ b/arch/mips/mm/uasm-mips.c
@@ -191,6 +191,7 @@ static const struct insn insn_table[insn_invalid] = {
 	[insn_subu]	= {M(spec_op, 0, 0, 0, 0, subu_op),	RS | RT | RD},
 	[insn_sw]	= {M(sw_op, 0, 0, 0, 0, 0),  RS | RT | SIMM},
 	[insn_sync]	= {M(spec_op, 0, 0, 0, 0, sync_op), RE},
+	[insn_syncp]	= {M(spec_op, 0, 0, 0, 0x10, sync_op), 0},
 	[insn_syscall]	= {M(spec_op, 0, 0, 0, 0, syscall_op), SCIMM},
 	[insn_tlbp]	= {M(cop0_op, cop_op, 0, 0, 0, tlbp_op),  0},
 	[insn_tlbr]	= {M(cop0_op, cop_op, 0, 0, 0, tlbr_op),  0},
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index c56f129c9a4b..32c7a5827ba8 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -64,8 +64,8 @@ enum opcode {
 	insn_scd, insn_seleqz, insn_selnez, insn_sd, insn_sh, insn_sll,
 	insn_sllv, insn_slt, insn_slti, insn_sltiu, insn_sltu, insn_sra,
 	insn_srav, insn_srl, insn_srlv, insn_subu, insn_sw, insn_sync,
-	insn_syscall, insn_tlbp, insn_tlbr, insn_tlbwi, insn_tlbwr, insn_wait,
-	insn_wsbh, insn_xor, insn_xori, insn_yield,
+	insn_syncp, insn_syscall, insn_tlbp, insn_tlbr, insn_tlbwi, insn_tlbwr,
+	insn_wait, insn_wsbh, insn_xor, insn_xori, insn_yield,
 	insn_invalid /* insn_invalid must be last */
 };
 
@@ -369,6 +369,7 @@ I_u2u1u3(_rotr)
 I_u3u1u2(_subu)
 I_u2s3u1(_sw)
 I_u1(_sync)
+I_0(_syncp)
 I_0(_tlbp)
 I_0(_tlbr)
 I_0(_tlbwi)
-- 
2.21.0

