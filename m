Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EE71DF5EB
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387735AbgEWICx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 04:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387736AbgEWICx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 04:02:53 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CF4C061A0E;
        Sat, 23 May 2020 01:02:51 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t11so6094590pgg.2;
        Sat, 23 May 2020 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zi8l47zNPiY5rSd29JQY43XqurNOrMQgcDIj/XqejdA=;
        b=JxB7e+n/++AxKjglr3DEzqviak6FRDKOrVr8cLWurkSZvh1U4jP0mbbmVXrZgF7g7w
         261S9dTWejErdJ47/6dhotqvNGVy4AOHUL+e/QN9zpfbhAfY1xkCS0ouqV5CshkQiWpm
         sZ+jnAMeTorz452v4vI851wVtjCdHgMiPnQTMVlZAEgwo0KH30NqPBQA8P8pDSJPuk4t
         a2liR0oi6KEilAVv9YOMyYzSEkgQB2W9z1Nuvb3oCywPrQTTQj4kNQPX3O4jRQwXua7R
         wViOLK89qWozKH8QNF2HnZJ+ALnGGx2q8nEVkNLfOr93d510qDx/BSE9lPaVGKCx+O8/
         O6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=zi8l47zNPiY5rSd29JQY43XqurNOrMQgcDIj/XqejdA=;
        b=BEtm/qGq6leSExFAPJmE3bUyEHJYG4gPSDWGzEYe/Fpq4d6/M+uYhImIQRf7cpgm3F
         ogYWjCs4w5JX35Zt9BOV1pi1hQ3OjMq27l9lPRjm77tRk2yPh9Inhv89pFtX8YFVlyhc
         uAlXurxfA0dW55/r1etqExt6K1IsE+nieg9ak/KErAigCE4stsjnljnpcTFvclPgKN/I
         eiqKI/ffm/HQ9xYEgx4rP7SJKSC3UER4c0IMcB+5uOZNmLfOg1tMZoMo88eU16kpIa0p
         KdFtmQnUSE0/MBHPmliNV6PztjudQOjHdrUYZOehwfpn+5xcojkjrMyKUr4J7mERdRfn
         AM3A==
X-Gm-Message-State: AOAM533jllbYjtRKtm4f27d61h2miTNg3hZ6KoRDODEULSyvbI5Rxrwg
        9x+p98h815WlaF/giEDVbt0+ZsE3jDH/JA==
X-Google-Smtp-Source: ABdhPJyu5mVeC10FnGnJDfnpq1U6HNgHhgFiIyWQ6ZVfkcrbApUcB04YF2i8bSOzb0TfW4xlGJZDPg==
X-Received: by 2002:aa7:946d:: with SMTP id t13mr7357316pfq.84.1590220970758;
        Sat, 23 May 2020 01:02:50 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id w7sm678491pfu.117.2020.05.23.01.02.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 01:02:50 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 11/15] KVM: MIPS: Add CPUCFG emulation for Loongson-3
Date:   Sat, 23 May 2020 15:56:38 +0800
Message-Id: <1590220602-3547-12-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1590220602-3547-1-git-send-email-chenhc@lemote.com>
References: <1590220602-3547-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3 overrides lwc2 instructions to implement CPUCFG and CSR
read/write functions. These instructions all cause guest exit so CSR
doesn't benifit KVM guest (and there are always legacy methods to
provide the same functions as CSR). So, we only emulate CPUCFG and let
it return a reduced feature list (which means the virtual CPU doesn't
have any other advanced features, including CSR) in KVM.

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/kvm_host.h  |  3 ++
 arch/mips/include/uapi/asm/inst.h | 11 ++++++
 arch/mips/kvm/mips.c              |  3 ++
 arch/mips/kvm/vz.c                | 77 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index f165902..3fd2f1c 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -173,6 +173,9 @@ struct kvm_vcpu_stat {
 	u64 vz_ghfc_exits;
 	u64 vz_gpa_exits;
 	u64 vz_resvd_exits;
+#ifdef CONFIG_CPU_LOONGSON64
+	u64 vz_cpucfg_exits;
+#endif
 #endif
 	u64 halt_successful_poll;
 	u64 halt_attempted_poll;
diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 98f97c8..43d1faa 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -1012,6 +1012,16 @@ struct loongson3_lsdc2_format {	/* Loongson-3 overridden ldc2/sdc2 Load/Store fo
 	;))))))
 };
 
+struct loongson3_lscsr_format {	/* Loongson-3 CPUCFG&CSR read/write format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int rs : 5,
+	__BITFIELD_FIELD(unsigned int fr : 5,
+	__BITFIELD_FIELD(unsigned int rd : 5,
+	__BITFIELD_FIELD(unsigned int fd : 5,
+	__BITFIELD_FIELD(unsigned int func : 6,
+	;))))))
+};
+
 /*
  * MIPS16e instruction formats (16-bit length)
  */
@@ -1114,6 +1124,7 @@ union mips_instruction {
 	struct mm16_r5_format mm16_r5_format;
 	struct loongson3_lswc2_format loongson3_lswc2_format;
 	struct loongson3_lsdc2_format loongson3_lsdc2_format;
+	struct loongson3_lscsr_format loongson3_lscsr_format;
 };
 
 union mips16e_instruction {
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index ed989ef..9362769 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -68,6 +68,9 @@ struct kvm_stats_debugfs_item debugfs_entries[] = {
 	{ "vz_ghfc",	  VCPU_STAT(vz_ghfc_exits),	 KVM_STAT_VCPU },
 	{ "vz_gpa",	  VCPU_STAT(vz_gpa_exits),	 KVM_STAT_VCPU },
 	{ "vz_resvd",	  VCPU_STAT(vz_resvd_exits),	 KVM_STAT_VCPU },
+#ifdef CONFIG_CPU_LOONGSON64
+	{ "vz_cpucfg",	  VCPU_STAT(vz_cpucfg_exits),	 KVM_STAT_VCPU },
+#endif
 #endif
 	{ "halt_successful_poll", VCPU_STAT(halt_successful_poll), KVM_STAT_VCPU },
 	{ "halt_attempted_poll", VCPU_STAT(halt_attempted_poll), KVM_STAT_VCPU },
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 63d5b35..72a62f1 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -29,6 +29,7 @@
 #include <linux/kvm_host.h>
 
 #include "interrupt.h"
+#include "loongson_regs.h"
 
 #include "trace.h"
 
@@ -1092,6 +1093,77 @@ static enum emulation_result kvm_vz_gpsi_cache(union mips_instruction inst,
 	return EMULATE_FAIL;
 }
 
+#ifdef CONFIG_CPU_LOONGSON64
+static enum emulation_result kvm_vz_gpsi_lwc2(union mips_instruction inst,
+					      u32 *opc, u32 cause,
+					      struct kvm_run *run,
+					      struct kvm_vcpu *vcpu)
+{
+	unsigned int rs, rd;
+	unsigned int hostcfg;
+	unsigned long curr_pc;
+	enum emulation_result er = EMULATE_DONE;
+
+	/*
+	 * Update PC and hold onto current PC in case there is
+	 * an error and we want to rollback the PC
+	 */
+	curr_pc = vcpu->arch.pc;
+	er = update_pc(vcpu, cause);
+	if (er == EMULATE_FAIL)
+		return er;
+
+	rs = inst.loongson3_lscsr_format.rs;
+	rd = inst.loongson3_lscsr_format.rd;
+	switch (inst.loongson3_lscsr_format.fr) {
+	case 0x8:  /* Read CPUCFG */
+		++vcpu->stat.vz_cpucfg_exits;
+		hostcfg = read_cpucfg(vcpu->arch.gprs[rs]);
+
+		switch (vcpu->arch.gprs[rs]) {
+		case LOONGSON_CFG0:
+			vcpu->arch.gprs[rd] = 0x14c000;
+			break;
+		case LOONGSON_CFG1:
+			hostcfg &= (LOONGSON_CFG1_FP | LOONGSON_CFG1_MMI |
+				    LOONGSON_CFG1_MSA1 | LOONGSON_CFG1_MSA2 |
+				    LOONGSON_CFG1_SFBP);
+			vcpu->arch.gprs[rd] = hostcfg;
+			break;
+		case LOONGSON_CFG2:
+			hostcfg &= (LOONGSON_CFG2_LEXT1 | LOONGSON_CFG2_LEXT2 |
+				    LOONGSON_CFG2_LEXT3 | LOONGSON_CFG2_LSPW);
+			vcpu->arch.gprs[rd] = hostcfg;
+			break;
+		case LOONGSON_CFG3:
+			vcpu->arch.gprs[rd] = hostcfg;
+			break;
+		default:
+			/* Don't export any other advanced features to guest */
+			vcpu->arch.gprs[rd] = 0;
+			break;
+		}
+		break;
+
+	default:
+		kvm_err("lwc2 emulate not impl %d rs %lx @%lx\n",
+			inst.loongson3_lscsr_format.fr, vcpu->arch.gprs[rs], curr_pc);
+		er = EMULATE_FAIL;
+		break;
+	}
+
+	/* Rollback PC only if emulation was unsuccessful */
+	if (er == EMULATE_FAIL) {
+		kvm_err("[%#lx]%s: unsupported lwc2 instruction 0x%08x 0x%08x\n",
+			curr_pc, __func__, inst.word, inst.loongson3_lscsr_format.fr);
+
+		vcpu->arch.pc = curr_pc;
+	}
+
+	return er;
+}
+#endif
+
 static enum emulation_result kvm_trap_vz_handle_gpsi(u32 cause, u32 *opc,
 						     struct kvm_vcpu *vcpu)
 {
@@ -1121,6 +1193,11 @@ static enum emulation_result kvm_trap_vz_handle_gpsi(u32 cause, u32 *opc,
 		er = kvm_vz_gpsi_cache(inst, opc, cause, run, vcpu);
 		break;
 #endif
+#ifdef CONFIG_CPU_LOONGSON64
+	case lwc2_op:
+		er = kvm_vz_gpsi_lwc2(inst, opc, cause, run, vcpu);
+		break;
+#endif
 	case spec3_op:
 		switch (inst.spec3_format.func) {
 #ifdef CONFIG_CPU_MIPSR6
-- 
2.7.0

