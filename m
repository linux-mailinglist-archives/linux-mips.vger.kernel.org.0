Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE1D01A4247
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 07:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgDJFh2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 01:37:28 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35849 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgDJFh2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 01:37:28 -0400
Received: by mail-pl1-f194.google.com with SMTP id g2so349196plo.3
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WM2Wyny9F6+jS/R2p8EAvShH5/a1oR5X0j92hk3ekh8=;
        b=CbRXJEXf+7aDM938QKGvV718LDl9H+QQx33kCKWMO2YJbgvigWIlj5xkIgqm7RanLu
         my/BjJtVUDrufYW3oNB7w+vZTr9wLiehSmeP7AePnfwufpyj+Fp2CsH0iTEZsFe6kp8p
         vvccHltkprDTyG7ZSHvgqI9IiMbjVW9SqOFdDt64WCSU0RSqb1FbvSzu1x4JdFOmvCI6
         YloXmFp6U7C7x+YGL1T26C7Kp17lRc0RiV7nglOis1fGQutmu3kqYTh1vuo5QHCG8oU5
         uJj9v7tlIfzo6Gh0GA6P+vc70epSddUIY9yNIfL9L08/MeUbeha13rNlGh8ODr80zz4e
         R+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WM2Wyny9F6+jS/R2p8EAvShH5/a1oR5X0j92hk3ekh8=;
        b=E7BPW/yz/8fhjxke5Dm0ZavxTXVSsD8bU2l4B3ECv2D9f9bbBKBFvJ0Gwk9Yc9yGA2
         mvVoMne6elLHtucLHeYaVZIeYxS4h7/AlfNjB82tkRDEBcRFkODXNvGi6abWIvhREn8E
         6RgnfF4N8s/HpdnfEMHyz++kDBeJP/UNbtciDcErl7SeKVRqQwjb3hPrHk/lGroqg+Ou
         mfxiBhAG0vcI0gizCdIsaEbVlR686/Pky/1khUJhCqdgjSYtOsB3CbOsa17nvSM1+Wlr
         tQHW7DnwGYC4yvkF46s4oH7Mx3HrpvCuGlhn1bS0ZSty/njAIvmwQQALUZOlvkkOXawT
         bzFA==
X-Gm-Message-State: AGi0PubFD11whIyPvsBVn6cXrLSHJNOQe0k+9Q5GPEzAyF09H2AZIxSS
        NsDTHOs4/aU+MuuJah5UMrM=
X-Google-Smtp-Source: APiQypLODRWmc+70y7OmLSH/W2hjLoM7IxNKFQbw0OdJrBhQLVIn25Ty7rfa7UI374qjMHykpLTEtA==
X-Received: by 2002:a17:902:ff01:: with SMTP id f1mr291299plj.256.1586497047659;
        Thu, 09 Apr 2020 22:37:27 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
        by smtp.gmail.com with ESMTPSA id c126sm780398pfb.83.2020.04.09.22.37.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 22:37:27 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: [PATCH 3/3] MIPS: Loongson-3: Add some unaligned instructions emulation
Date:   Fri, 10 Apr 2020 13:44:00 +0800
Message-Id: <1586497440-25621-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
References: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1, Add unaligned gslq, gssq, gslqc1, gssqc1 emulation;
2, Add unaligned gsl{h, w, d}x, gss{h, w, d}x emulation;
3, Add unaligned gslwxc1, gsswxc1, gsldxc1, gssdxc1 emulation.

Signed-off-by: Pei Huang <huangpei@loongson.cn>
Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/uapi/asm/inst.h |  26 ++++
 arch/mips/loongson64/cop2-ex.c    | 274 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 299 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index eaa3a80..98f97c8 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -989,6 +989,30 @@ struct mm16_r5_format {		/* Load/store from stack pointer format */
 };
 
 /*
+ * Loongson-3 overridden COP2 instruction formats (32-bit length)
+ */
+struct loongson3_lswc2_format {	/* Loongson-3 overridden lwc2/swc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int fr : 1,
+	__BITFIELD_FIELD(unsigned int offset : 9,
+	__BITFIELD_FIELD(unsigned int ls : 1,
+	__BITFIELD_FIELD(unsigned int rq : 5,
+	;)))))))
+};
+
+struct loongson3_lsdc2_format {	/* Loongson-3 overridden ldc2/sdc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int index : 5,
+	__BITFIELD_FIELD(unsigned int offset : 8,
+	__BITFIELD_FIELD(unsigned int opcode1 : 3,
+	;))))))
+};
+
+/*
  * MIPS16e instruction formats (16-bit length)
  */
 struct m16e_rr {
@@ -1088,6 +1112,8 @@ union mips_instruction {
 	struct mm16_rb_format mm16_rb_format;
 	struct mm16_r3_format mm16_r3_format;
 	struct mm16_r5_format mm16_r5_format;
+	struct loongson3_lswc2_format loongson3_lswc2_format;
+	struct loongson3_lsdc2_format loongson3_lsdc2_format;
 };
 
 union mips16e_instruction {
diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
index 9efdfe4..2269dc5 100644
--- a/arch/mips/loongson64/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -14,17 +14,29 @@
 #include <linux/sched.h>
 #include <linux/notifier.h>
 #include <linux/ptrace.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
 
 #include <asm/fpu.h>
 #include <asm/cop2.h>
+#include <asm/inst.h>
+#include <asm/branch.h>
 #include <asm/current.h>
 #include <asm/mipsregs.h>
 
 static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 	void *data)
 {
-	int fpu_owned;
+	unsigned int res, fpu_owned;
+	unsigned long ra, value, value_next;
+	union mips_instruction insn;
 	int fr = !test_thread_flag(TIF_32BIT_FPREGS);
+	struct pt_regs *regs = (struct pt_regs *)data;
+	void __user *addr = (void __user *)regs->cp0_badvaddr;
+	unsigned int __user *pc = (unsigned int __user *)exception_epc(regs);
+
+	ra = regs->regs[31];
+	__get_user(insn.word, pc);
 
 	switch (action) {
 	case CU2_EXCEPTION:
@@ -49,9 +61,269 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 		preempt_enable();
 
 		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gslq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+
+			LoadDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			regs->regs[insn.loongson3_lswc2_format.rt] = value;
+			regs->regs[insn.loongson3_lswc2_format.rq] = value_next;
+			compute_return_epc(regs);
+		} else {					/* gslqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			LoadDW(addr+8, value_next, res);
+			if (res)
+				goto fault;
+
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt, value);
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq, value_next);
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gssq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			/* write upper 8 bytes first */
+			value_next = regs->regs[insn.loongson3_lswc2_format.rq];
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = regs->regs[insn.loongson3_lswc2_format.rt];
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+		} else {					/* gssqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			value_next = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq);
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt);
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden ldc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gslhx: load 2 bytes to GPR
+		 *   0x2          gslwx: load 4 bytes to GPR
+		 *   0x3          gsldx: load 8 bytes to GPR
+		 *   0x6	  gslwxc1: load 4 bytes to FPR
+		 *   0x7	  gsldxc1: load 8 bytes to FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			LoadHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			LoadW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+			break;
+
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden sdc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gsshx: store 2 bytes from GPR
+		 *   0x2          gsswx: store 4 bytes from GPR
+		 *   0x3          gssdx: store 8 bytes from GPR
+		 *   0x6          gsswxc1: store 4 bytes from FPR
+		 *   0x7          gssdxc1: store 8 bytes from FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
 	}
 
 	return NOTIFY_OK;		/* Let default notifier send signals */
+
+fault:
+	/* roll back jump/branch */
+	regs->regs[31] = ra;
+	regs->cp0_epc = (unsigned long)pc;
+	/* Did we have an exception handler installed? */
+	if (fixup_exception(regs))
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGSEGV);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
+
+sigbus:
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGBUS);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
 }
 
 static int __init loongson_cu2_setup(void)
-- 
2.7.0

