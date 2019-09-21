Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1ACB9E1D
	for <lists+linux-mips@lfdr.de>; Sat, 21 Sep 2019 15:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437923AbfIUNsi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Sep 2019 09:48:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40195 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437919AbfIUNsi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Sep 2019 09:48:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so6367149pfb.7
        for <linux-mips@vger.kernel.org>; Sat, 21 Sep 2019 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=VtQBxJDygKX1W4slrZlYYEHfEVdU9F5/y1/YqUHn6fo=;
        b=D/ZTlqVMSOITDB+PGhHLxX0KM52M0tN1Q+xr+Jpyetj2zd0hsO0rhuG7WUAwLGHTSF
         zfW1LS1V9Cbc4asmizTT7BIaWbTtoKAVyRx4UWiOFlhJpLOZb1tUHqtpe725dIl+Lt53
         filHREQrkJnEazmQ0ivLMRFzX7SilZjFDnWK19ULixF9x8TX0wVWhMnuhdeLCqXHEDtB
         C4Qq57noOedI6aI6HbX2+eryWwXYJkkTJfTLPwPL2oMF5FvnqXKBMy/mtgROb/ZTH8m2
         EVrphBRUCLtDxxtYi3l/VbQJ95bp88EOqXgGgM5TLU7aBAC+lUW73KwGrTrS64A05FOc
         2S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=VtQBxJDygKX1W4slrZlYYEHfEVdU9F5/y1/YqUHn6fo=;
        b=k8QmAH+Q5rOHD6kg14G/+3xS+r5e2317h5G9jaVC62TiD/Sz6hB2qAcu5sEN++w5Tx
         UaTSfWWjdMktrL7FkDhVTnxAndF0VOBvNDEjTH1SDXXSOLCDMTT86F/RofhowVbu9Imz
         yjqNDOPnFwAvz25JSddC6iY2laUn/HUKIWlS56dfm+o5t0Uljl12vIUivDAF4EwD1fVF
         mank95SzOQYJ3Eh2PPu0GPEuUFOp0ao/7Npfj/bzq0jLEmYw7XJkfT5Q1WTvdLUcXs76
         who+dqMbYRyqWdi9aEgaReyXY5leR9kR467tS3xE+ZL6JtszIPMJS5lb8YY6b0KJkcBo
         wejw==
X-Gm-Message-State: APjAAAXU4x7O+Fl9rQpFH8u0LAYoGETaSMowEsWIBJAmPCkPWnyf2mbk
        fpLa3YOlgYJO52Z/rPJK6+Y=
X-Google-Smtp-Source: APXvYqzN64nj25sLCPrFkb7Vp5MruNKKOe0UPR8G5vlbEoORVaCfgYkAg6LSSMAZB/TWXgg8876Tig==
X-Received: by 2002:a05:6a00:8c:: with SMTP id c12mr22586768pfj.200.1569073717442;
        Sat, 21 Sep 2019 06:48:37 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id p66sm13700496pfg.127.2019.09.21.06.48.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 21 Sep 2019 06:48:36 -0700 (PDT)
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
Subject: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Date:   Sat, 21 Sep 2019 21:50:26 +0800
Message-Id: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
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
index 00000000..6e3569a
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

