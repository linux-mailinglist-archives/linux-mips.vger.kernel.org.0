Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CB023EE77
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 15:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgHGNxE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 09:53:04 -0400
Received: from rnd-relay.smtp.broadcom.com ([192.19.229.170]:53622 "EHLO
        rnd-relay.smtp.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726155AbgHGNxD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 09:53:03 -0400
Received: from mail-irv-17.broadcom.com (mail-irv-17.lvn.broadcom.net [10.75.242.48])
        by rnd-relay.smtp.broadcom.com (Postfix) with ESMTP id 758DF30C0FE;
        Fri,  7 Aug 2020 06:51:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 rnd-relay.smtp.broadcom.com 758DF30C0FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
        s=dkimrelay; t=1596808279;
        bh=tGx/rX9q9g90/gKcnXViGFt5JZcPsprp9pEqIAGHWrg=;
        h=From:To:Cc:Subject:Date:From;
        b=HCkl2wKm3M07Wx2cO8ia4Y9gCs3H8AfVX8V49ovatQqPwV7RIFwms8MgfWrce0z3T
         sxrLl/j4lvXM6x+UqFHsrZLubj29EiRg0eV+3eCUiWmx+M6ujkzFziOgClpbi5dB43
         V0eyDND3RzPpjnoArEyk4QsixeII2WmeqHJtVGec=
Received: from stbsrv-and-01.and.broadcom.net (stbsrv-and-01.and.broadcom.net [10.28.16.211])
        by mail-irv-17.broadcom.com (Postfix) with ESMTP id ACD5A140093;
        Fri,  7 Aug 2020 06:53:00 -0700 (PDT)
From:   Jim Quinlan <james.quinlan@broadcom.com>
To:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        james.quinlan@broadcom.com
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] MIPS: uasm: false warning on use of uasm_i_lui()
Date:   Fri,  7 Aug 2020 09:52:45 -0400
Message-Id: <20200807135251.32148-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the example uasm code

	uasm_i_lui(p, tmp, 0xa000);

issues a warning at Linux boot when the code is "assembled".  This is
because the "lui" instruction is defined by the macro "Ip_u1s2(_lui)" -- I
believe it should be Ip_u1u2(_lui) -- and its definition is associated with
the SIMM macro -- I believe it should be the UIMM macro.  The current code
takes a 32bit number and checks that it can be converted to a 16bit signed
immediate.  This check fails of course for an immediate such as 0x0000a000.

This is fixed.  However, there are two uses of uasm_i_lui() in
UASM_i_LA_mostly() which use 16bit signed immediates in the form of a
sign-extended 32 bit number.  Left alone these may now cause a warning when
being processed by build_imm().  These two uses have been modified by first
calling build_simm() on the argument to uasm_i_lui() as to convert it to a
proper 16 bit unsigned integer.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 arch/mips/include/asm/uasm.h  | 2 +-
 arch/mips/mm/uasm-micromips.c | 2 +-
 arch/mips/mm/uasm-mips.c      | 2 +-
 arch/mips/mm/uasm.c           | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index f7effca791a5..7ea1d338570b 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -127,7 +127,7 @@ Ip_u2s3u1(_lh);
 Ip_u2s3u1(_lhu);
 Ip_u2s3u1(_ll);
 Ip_u2s3u1(_lld);
-Ip_u1s2(_lui);
+Ip_u1u2(_lui);
 Ip_u2s3u1(_lw);
 Ip_u2s3u1(_lwu);
 Ip_u3u1u2(_lwx);
diff --git a/arch/mips/mm/uasm-micromips.c b/arch/mips/mm/uasm-micromips.c
index 75ef90486fe6..86ee1499e120 100644
--- a/arch/mips/mm/uasm-micromips.c
+++ b/arch/mips/mm/uasm-micromips.c
@@ -82,7 +82,7 @@ static const struct insn insn_table_MM[insn_invalid] = {
 	[insn_lh]	= {M(mm_lh32_op, 0, 0, 0, 0, 0), RT | RS | SIMM},
 	[insn_ll]	= {M(mm_pool32c_op, 0, 0, (mm_ll_func << 1), 0, 0), RS | RT | SIMM},
 	[insn_lld]	= {0, 0},
-	[insn_lui]	= {M(mm_pool32i_op, mm_lui_op, 0, 0, 0, 0), RS | SIMM},
+	[insn_lui]	= {M(mm_pool32i_op, mm_lui_op, 0, 0, 0, 0), RS | UIMM},
 	[insn_lw]	= {M(mm_lw32_op, 0, 0, 0, 0, 0), RT | RS | SIMM},
 	[insn_mfc0]	= {M(mm_pool32a_op, 0, 0, 0, mm_mfc0_op, mm_pool32axf_op), RT | RS | RD},
 	[insn_mfhi]	= {M(mm_pool32a_op, 0, 0, 0, mm_mfhi32_op, mm_pool32axf_op), RS},
diff --git a/arch/mips/mm/uasm-mips.c b/arch/mips/mm/uasm-mips.c
index 7154a1d99aad..b45c15111d68 100644
--- a/arch/mips/mm/uasm-mips.c
+++ b/arch/mips/mm/uasm-mips.c
@@ -132,7 +132,7 @@ static const struct insn insn_table[insn_invalid] = {
 	[insn_ll]	= {M6(spec3_op, 0, 0, 0, ll6_op),  RS | RT | SIMM9},
 	[insn_lld]	= {M6(spec3_op, 0, 0, 0, lld6_op),  RS | RT | SIMM9},
 #endif
-	[insn_lui]	= {M(lui_op, 0, 0, 0, 0, 0),	RT | SIMM},
+	[insn_lui]	= {M(lui_op, 0, 0, 0, 0, 0),	RT | UIMM},
 	[insn_lw]	= {M(lw_op, 0, 0, 0, 0, 0),  RS | RT | SIMM},
 	[insn_lwu]	= {M(lwu_op, 0, 0, 0, 0, 0),  RS | RT | SIMM},
 	[insn_lwx]	= {M(spec3_op, 0, 0, 0, lwx_op, lx_op), RS | RT | RD},
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index c56f129c9a4b..ca5d47da3bd1 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -327,7 +327,7 @@ I_u2s3u1(_lh)
 I_u2s3u1(_lhu)
 I_u2s3u1(_ll)
 I_u2s3u1(_lld)
-I_u1s2(_lui)
+I_u1u2(_lui)
 I_u2s3u1(_lw)
 I_u2s3u1(_lwu)
 I_u1u2u3(_mfc0)
@@ -457,7 +457,7 @@ UASM_EXPORT_SYMBOL(uasm_rel_lo);
 void UASM_i_LA_mostly(u32 **buf, unsigned int rs, long addr)
 {
 	if (!uasm_in_compat_space_p(addr)) {
-		uasm_i_lui(buf, rs, uasm_rel_highest(addr));
+		uasm_i_lui(buf, rs, build_simm(uasm_rel_highest(addr)));
 		if (uasm_rel_higher(addr))
 			uasm_i_daddiu(buf, rs, rs, uasm_rel_higher(addr));
 		if (uasm_rel_hi(addr)) {
@@ -468,7 +468,7 @@ void UASM_i_LA_mostly(u32 **buf, unsigned int rs, long addr)
 		} else
 			uasm_i_dsll32(buf, rs, rs, 0);
 	} else
-		uasm_i_lui(buf, rs, uasm_rel_hi(addr));
+		uasm_i_lui(buf, rs, build_simm(uasm_rel_hi(addr)));
 }
 UASM_EXPORT_SYMBOL(UASM_i_LA_mostly);
 
-- 
2.17.1

