Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC52D8CDD
	for <lists+linux-mips@lfdr.de>; Sun, 13 Dec 2020 12:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406153AbgLMLoc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Dec 2020 06:44:32 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:27577 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406132AbgLMLoc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Dec 2020 06:44:32 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 067113F457;
        Sun, 13 Dec 2020 12:43:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, NO_RELAYS=-0.001, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7M6-GcnapC9c; Sun, 13 Dec 2020 12:43:49 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 87FF23F39A;
        Sun, 13 Dec 2020 12:43:48 +0100 (CET)
Date:   Sun, 13 Dec 2020 12:43:47 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, Andreas Jaeger <aj@suse.de>,
        Nick Clifton <nickc@redhat.com>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an SQ
 address exception
Message-ID: <X9X+c6FNqH1pJSKf@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
 <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
 <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
 <X9SiXnZJLxDCrKMV@sx9>
 <alpine.LFD.2.21.2012121105280.2104409@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2012121105280.2104409@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>  So I think we can safely ignore them, just as we can any ULR access with 
> rt != $3.

The comment is corrected and the conditions on rd and rt are now strict,
as shown in the patch below.

Fredrik

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 92bd2b0f0548..89ce42c60c6f 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -90,6 +90,7 @@
 #include <asm/fpu_emulator.h>
 #include <asm/inst.h>
 #include <asm/mmu_context.h>
+#include <asm/traps.h>
 #include <linux/uaccess.h>
 
 #define STR(x)	__STR(x)
@@ -934,7 +935,46 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		 * interest.
 		 */
 	case spec3_op:
-		if (insn.dsp_format.func == lx_op) {
+		if (IS_ENABLED(CONFIG_CPU_R5900)) {
+			/*
+			 * On the R5900, a valid RDHWR instruction
+			 *
+			 *     +--------+-------+----+----+-------+--------+
+			 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
+			 *     +--------+-------+----+----+-------+--------+
+			 *          6       5      5    5     5        6
+			 *
+			 * having rt $3 (v1) and rd $29 (MIPS_HWR_ULR) is
+			 * interpreted as the R5900 specific SQ instruction
+			 *
+			 *     +--------+-------+----+---------------------+
+			 *     | 011111 |  base | rt |        offset       |
+			 *     +--------+-------+----+---------------------+
+			 *          6       5      5            16
+			 *
+			 * with
+			 *
+			 *     sq v1,-6085(zero)
+			 *
+			 * that asserts an address exception since -6085(zero)
+			 * always resolves to 0xffffe83b in 32-bit KSEG2.
+			 *
+			 * Other legacy values of rd, such as MIPS_HWR_CPUNUM,
+			 * are ignored.
+			 */
+			if (insn.r_format.func == rdhwr_op &&
+			    insn.r_format.rd == MIPS_HWR_ULR &&
+			    insn.r_format.rt == 3 &&
+			    insn.r_format.rs == 0 &&
+			    insn.r_format.re == 0) {
+				if (compute_return_epc(regs) < 0 ||
+				    simulate_rdhwr(regs, insn.r_format.rd,
+						   insn.r_format.rt) < 0)
+					goto sigill;
+				return;
+			}
+			goto sigbus;
+		} else if (insn.dsp_format.func == lx_op) {
 			switch (insn.dsp_format.op) {
 			case lwx_op:
 				if (!access_ok(addr, 4))
