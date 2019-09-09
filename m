Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0BA9AD23D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 05:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfIIDgx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Sep 2019 23:36:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33151 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfIIDgx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Sep 2019 23:36:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so8279409pfl.0
        for <linux-mips@vger.kernel.org>; Sun, 08 Sep 2019 20:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=o3Pj806WuG4KiLhBo5pGEu1Mrepp1o3jDsBnP/wiDqI=;
        b=MkWHcGngi8jctib0h84FDNJGSntGhae+KBo3tjUsnePGR2WvR+dVsG1iekQ7Dbrqx9
         fxl7Aj1DKI/Spwtnnefj4SJG6bODTlovMfO+O8aZr2BG96CSVzlfPcU/22zgybf66SP2
         VxQ3PT3P3HpgpH/t+mR5ivOI2V6SqHo8Ff+aBz63r/3VEJ+IMa6oiArBIO6RUEFXohxn
         T0k6etGsqPx6b5K2k3rBLQFrFJTfvDJgANA+y3ZF+4pp9nGE3AGw1FglS47SQfOGzAWB
         cU7++FozQHoZ7SrO0sFHt2+Zn3JzGG5IrV04XqKPApNXsma9KAiUDdYVLyUO8Utnk2XE
         odSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=o3Pj806WuG4KiLhBo5pGEu1Mrepp1o3jDsBnP/wiDqI=;
        b=CjT0HienGTR88/JX50ZtI4+Pi1xAQ34kD/BHeAs0gSudMPUSPj2UE8EDkEbD9KJlS1
         RoxELDL0rIcCmnMxxTXqmjh/5t9Sq41PQLh5qxekC7Tf/Ffbqdz8wdyCslN2xvsRVLj6
         bqspE++wFEbfv1D+9v7XjENATKxV8Wo46ZDOBVF64cAzYomOCgXm6hxaMq1zxfq3rBPF
         wD3RsYM4fAj+iHGZtepa6x81BlmOA5qO0/I8BJjbUzfmSSot71eC4F0HYWmCfAGb1f0N
         T27FAS5gu0Tm5Fp3lK3l+zox76yPcqRpnlm0B9qKcXX6gVmTbSJsjVpCaQIMwu3q+qES
         6sIQ==
X-Gm-Message-State: APjAAAVBXCVGYxZBkWzfL4XfziFCVPMBwkVcBNdkBOfy/LiBFoXd/H1d
        QGM77V0w+/iecLJCj2aaSpQ=
X-Google-Smtp-Source: APXvYqxc6ZqP85mv+S7aIGNIRqz/fNH6fVxMHBV8/YY5zzl+XuPq2nh16rjYV1bdzdP7JsVGMTaljw==
X-Received: by 2002:a63:5823:: with SMTP id m35mr19963788pgb.329.1568000210897;
        Sun, 08 Sep 2019 20:36:50 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id b24sm13939437pfi.75.2019.09.08.20.36.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 20:36:50 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH V1 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Date:   Mon,  9 Sep 2019 11:38:21 +0800
Message-Id: <1568000303-771-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3A R4+ (Loongson-3A4000 and newer) has CPUCFG (CPU config) and
CSR (Control and Status Register) extensions. This patch add read/write
functionalities for them.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson64/loongson_regs.h    | 227 +++++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/loongson_regs.h

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
new file mode 100644
index 0000000..6e3569a
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -0,0 +1,227 @@
+/*
+ * Read/Write Loongson Extension Registers
+ */
+
+#ifndef _LOONGSON_REGS_H_
+#define _LOONGSON_REGS_H_
+
+#include <linux/types.h>
+#include <linux/bits.h>
+
+#include <asm/mipsregs.h>
+#include <asm/cpu.h>
+
+static inline bool cpu_has_cfg(void)
+{
+	return ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G);
+}
+
+static inline u32 read_cpucfg(u32 reg)
+{
+	u32 __res;
+
+	__asm__ __volatile__(
+		"parse_r __res,%0\n\t"
+		"parse_r reg,%1\n\t"
+		".insn \n\t"
+		".word (0xc8080118 | (reg << 21) | (__res << 11))\n\t"
+		:"=r"(__res)
+		:"r"(reg)
+		:
+		);
+	return __res;
+}
+
+/* Bit Domains for CFG registers */
+#define LOONGSON_CFG0	0x0
+#define LOONGSON_CFG0_PRID GENMASK(31, 0)
+
+#define LOONGSON_CFG1 0x1
+#define LOONGSON_CFG1_FP	BIT(0)
+#define LOONGSON_CFG1_FPREV	GENMASK(3, 1)
+#define LOONGSON_CFG1_MMI	BIT(4)
+#define LOONGSON_CFG1_MSA1	BIT(5)
+#define LOONGSON_CFG1_MSA2	BIT(6)
+#define LOONGSON_CFG1_CGP	BIT(7)
+#define LOONGSON_CFG1_WRP	BIT(8)
+#define LOONGSON_CFG1_LSX1	BIT(9)
+#define LOONGSON_CFG1_LSX2	BIT(10)
+#define LOONGSON_CFG1_LASX	BIT(11)
+#define LOONGSON_CFG1_R6FXP	BIT(12)
+#define LOONGSON_CFG1_R6CRCP	BIT(13)
+#define LOONGSON_CFG1_R6FPP	BIT(14)
+#define LOONGSON_CFG1_CNT64	BIT(15)
+#define LOONGSON_CFG1_LSLDR0	BIT(16)
+#define LOONGSON_CFG1_LSPREF	BIT(17)
+#define LOONGSON_CFG1_LSPREFX	BIT(18)
+#define LOONGSON_CFG1_LSSYNCI	BIT(19)
+#define LOONGSON_CFG1_LSUCA	BIT(20)
+#define LOONGSON_CFG1_LLSYNC	BIT(21)
+#define LOONGSON_CFG1_TGTSYNC	BIT(22)
+#define LOONGSON_CFG1_LLEXC	BIT(23)
+#define LOONGSON_CFG1_SCRAND	BIT(24)
+#define LOONGSON_CFG1_MUALP	BIT(25)
+#define LOONGSON_CFG1_KMUALEN	BIT(26)
+#define LOONGSON_CFG1_ITLBT	BIT(27)
+#define LOONGSON_CFG1_LSUPERF	BIT(28)
+#define LOONGSON_CFG1_SFBP	BIT(29)
+#define LOONGSON_CFG1_CDMAP	BIT(30)
+
+#define LOONGSON_CFG2 0x2
+#define LOONGSON_CFG2_LEXT1	BIT(0)
+#define LOONGSON_CFG2_LEXT2	BIT(1)
+#define LOONGSON_CFG2_LEXT3	BIT(2)
+#define LOONGSON_CFG2_LSPW	BIT(3)
+#define LOONGSON_CFG2_LBT1	BIT(4)
+#define LOONGSON_CFG2_LBT2	BIT(5)
+#define LOONGSON_CFG2_LBT3	BIT(6)
+#define LOONGSON_CFG2_LBTMMU	BIT(7)
+#define LOONGSON_CFG2_LPMP	BIT(8)
+#define LOONGSON_CFG2_LPMPREV	GENMASK(11, 9)
+#define LOONGSON_CFG2_LAMO	BIT(12)
+#define LOONGSON_CFG2_LPIXU	BIT(13)
+#define LOONGSON_CFG2_LPIXUN	BIT(14)
+#define LOONGSON_CFG2_LZVP	BIT(15)
+#define LOONGSON_CFG2_LZVREV	GENMASK(18, 16)
+#define LOONGSON_CFG2_LGFTP	BIT(19)
+#define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
+#define LOONGSON_CFG2_LLFTP	BIT(23)
+#define LOONGSON_CFG2_LLFTPREV	GENMASK(24, 26)
+#define LOONGSON_CFG2_LCSRP	BIT(27)
+#define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
+
+#define LOONGSON_CFG3 0x3
+#define LOONGSON_CFG3_LCAMP	BIT(0)
+#define LOONGSON_CFG3_LCAMREV	GENMASK(3, 1)
+#define LOONGSON_CFG3_LCAMNUM	GENMASK(11, 4)
+#define LOONGSON_CFG3_LCAMKW	GENMASK(19, 12)
+#define LOONGSON_CFG3_LCAMVW	GENMASK(27, 20)
+
+#define LOONGSON_CFG4 0x4
+#define LOONGSON_CFG4_CCFREQ	GENMASK(31, 0)
+
+#define LOONGSON_CFG5 0x5
+#define LOONGSON_CFG5_CFM	GENMASK(15, 0)
+#define LOONGSON_CFG5_CFD	GENMASK(31, 16)
+
+#define LOONGSON_CFG6 0x6
+
+#define LOONGSON_CFG7 0x7
+#define LOONGSON_CFG7_GCCAEQRP	BIT(0)
+#define LOONGSON_CFG7_UCAWINP	BIT(1)
+
+static inline bool cpu_has_csr(void)
+{
+	if (cpu_has_cfg())
+		return (read_cpucfg(LOONGSON_CFG2) & LOONGSON_CFG2_LCSRP);
+
+	return false;
+}
+
+static inline u32 csr_readl(u32 reg)
+{
+	u32 __res;
+
+	/* RDCSR reg, val */
+	__asm__ __volatile__(
+		"parse_r __res,%0\n\t"
+		"parse_r reg,%1\n\t"
+		".insn \n\t"
+		".word (0xc8000118 | (reg << 21) | (__res << 11))\n\t"
+		:"=r"(__res)
+		:"r"(reg)
+		:
+		);
+	return __res;
+}
+
+static inline u64 csr_readq(u32 reg)
+{
+	u64 __res;
+
+	/* DWRCSR reg, val */
+	__asm__ __volatile__(
+		"parse_r __res,%0\n\t"
+		"parse_r reg,%1\n\t"
+		".insn \n\t"
+		".word (0xc8020118 | (reg << 21) | (__res << 11))\n\t"
+		:"=r"(__res)
+		:"r"(reg)
+		:
+		);
+	return __res;
+}
+
+static inline void csr_writel(u32 val, u32 reg)
+{
+	/* WRCSR reg, val */
+	__asm__ __volatile__(
+		"parse_r reg,%0\n\t"
+		"parse_r val,%1\n\t"
+		".insn \n\t"
+		".word (0xc8010118 | (reg << 21) | (val << 11))\n\t"
+		:
+		:"r"(reg),"r"(val)
+		:
+		);
+}
+
+static inline void csr_writeq(u64 val, u32 reg)
+{
+	/* DWRCSR reg, val */
+	__asm__ __volatile__(
+		"parse_r reg,%0\n\t"
+		"parse_r val,%1\n\t"
+		".insn \n\t"
+		".word (0xc8030118 | (reg << 21) | (val << 11))\n\t"
+		:
+		:"r"(reg),"r"(val)
+		:
+		);
+}
+
+/* Public CSR Register can also be accessed with regular addresses */
+#define CSR_PUBLIC_MMIO_BASE 0x1fe00000
+
+#define MMIO_CSR(x)		(void *)TO_UNCAC(CSR_PUBLIC_MMIO_BASE + x)
+
+#define LOONGSON_CSR_FEATURES	0x8
+#define LOONGSON_CSRF_TEMP	BIT(0)
+#define LOONGSON_CSRF_NODECNT	BIT(1)
+#define LOONGSON_CSRF_MSI	BIT(2)
+#define LOONGSON_CSRF_EXTIOI	BIT(3)
+#define LOONGSON_CSRF_IPI	BIT(4)
+#define LOONGSON_CSRF_FREQ	BIT(5)
+
+#define LOONGSON_CSR_VENDOR	0x10 /* Vendor name string, should be "Loongson" */
+#define LOONGSON_CSR_CPUNAME	0x20 /* Processor name string */
+#define LOONGSON_CSR_NODECNT	0x408
+#define LOONGSON_CSR_CPUTEMP	0x428
+
+/* PerCore CSR, only accessable by local cores */
+#define LOONGSON_CSR_IPI_STATUS	0x1000
+#define LOONGSON_CSR_IPI_EN	0x1004
+#define LOONGSON_CSR_IPI_SET	0x1008
+#define LOONGSON_CSR_IPI_CLEAR	0x100c
+#define LOONGSON_CSR_IPI_SEND	0x1040
+#define CSR_IPI_SEND_IP_SHIFT	0
+#define CSR_IPI_SEND_CPU_SHIFT	16
+#define CSR_IPI_SEND_BLOCK	BIT(31)
+
+static inline u64 drdtime(void)
+{
+	int rID = 0;
+	u64 val = 0;
+
+	__asm__ __volatile__(
+		"parse_r rID,%0\n\t"
+		"parse_r val,%1\n\t"
+		".insn \n\t"
+		".word (0xc8090118 | (rID << 21) | (val << 11))\n\t"
+		:"=r"(rID),"=r"(val)
+		:
+		);
+	return val;
+}
+
+#endif
-- 
2.7.0

