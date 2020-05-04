Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F7C1C34F1
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 10:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgEDIvs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 04:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726515AbgEDIvr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 04:51:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5317AC061A0E
        for <linux-mips@vger.kernel.org>; Mon,  4 May 2020 01:51:46 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d22so2999166pgk.3
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2020 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wWtPP1p2WTWxeradaKjh7IZ+2gOwWW5ARHkTZv0iBdM=;
        b=F+RYr1AAN5zzHBtVlOsTjpHUdxp83PrxH6Ku72WO/1caYGLJB/JzGxR1iqQVEtxhOr
         hnvp1aoXpRn9wrL2DudAiy35Gx5Go/Io582JaLjWMYC67gV8ZmtbI0f1K/gmpeqk/Yva
         fqYOvV7DKjQiGUKLagXZZ3LZDX+4IKPtND2M4iTWAnLNSyujfd8ZWJ+E1GzIGbLgge5Y
         Cp/U4tSJmbb2FbXS7yNFi1YSIj3BqxRgxVEiNzGa642Yiy2VhcEYKLj9y9ivFzfCiE0E
         ns7PvbBzn9VLaqNjVQlwDsunoQCYTzow088xVozaXank5EogzUeqFWUTuE5ygupB2GXj
         o8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wWtPP1p2WTWxeradaKjh7IZ+2gOwWW5ARHkTZv0iBdM=;
        b=AvOkCWKl2qaGGuIQTIJnrr58DRcBiYyQNLxjcdwuUuhOn8tQXtyLvIdBaTZSq9k/xb
         f0o7jAR/ws5W8guh6RjALE3oOe+2Vtny37EsTjMzEjnsJxxXYK+fUjVTxM/GKU0zKbRD
         jvWM3/fBZL/SIQtKAB8NK9SkQYOEzcEuSNRIislz849vGbATlW0m9ZJi32pnN6kPAeH5
         IRy9GM2Y7L4d8zOp7ASp1K++lhEZ5N5Mlb3qxWJXeaT2X94ZlqEPIEeeIhMwme6CuNUk
         HdW9GU5g3mfzSkgibodqB0dFiWqwJ1rdj3cZ1fXbM++cGgLEcPI2kqwX3MwlLkYxhiNC
         /lmA==
X-Gm-Message-State: AGi0PuYa3sTPqttcOksuuqm6TKjg1wpMFF1x7Ik3uAmd6ExhbchC3lrD
        /hKkJjwnmu3IWmETvAgXKvqYHaQhE70=
X-Google-Smtp-Source: APiQypIjH02LjnOaD/vactbsZdtKPxzQC1xzNVc8Fj5P+E2sQIdoTCoCuM7RRKQxwOEqT5RziUd7qw==
X-Received: by 2002:a62:b514:: with SMTP id y20mr16072421pfe.49.1588582305218;
        Mon, 04 May 2020 01:51:45 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id g6sm6219232pjx.48.2020.05.04.01.51.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 01:51:44 -0700 (PDT)
From:   Liangliang Huang <huanglllzu@gmail.com>
X-Google-Original-From: Liangliang Huang <huangll@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: [PATCH] MIPS: Use fallthrough full arch/mips
Date:   Mon,  4 May 2020 16:51:29 +0800
Message-Id: <1588582289-27236-1-git-send-email-huangll@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the various /* fallthrough */ comments to the pseudo-keyword
fallthrough;

Done via script:
https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/

Signed-off-by: Liangliang Huang <huangll@lemote.com>
---
 arch/mips/alchemy/devboards/db1550.c         |  2 +-
 arch/mips/ar7/setup.c                        |  2 +-
 arch/mips/ath79/setup.c                      |  3 +--
 arch/mips/bcm63xx/cpu.c                      |  2 +-
 arch/mips/bcm63xx/dev-flash.c                |  2 +-
 arch/mips/cavium-octeon/executive/cvmx-pko.c |  2 +-
 arch/mips/cavium-octeon/octeon-platform.c    |  4 ++--
 arch/mips/cavium-octeon/octeon-usb.c         |  2 +-
 arch/mips/dec/tc.c                           |  2 +-
 arch/mips/include/asm/fpu.h                  |  2 +-
 arch/mips/include/asm/octeon/cvmx-sli-defs.h |  2 +-
 arch/mips/include/asm/page.h                 |  2 +-
 arch/mips/kernel/branch.c                    | 26 +++++++++++++-------------
 arch/mips/kernel/cpu-probe.c                 | 22 +++++++++++-----------
 arch/mips/kernel/idle.c                      |  2 +-
 arch/mips/kernel/mips-r2-to-r6-emul.c        |  2 +-
 arch/mips/kernel/signal.c                    |  2 +-
 arch/mips/kernel/traps.c                     |  3 +--
 arch/mips/kernel/watch.c                     | 26 +++++++++++++-------------
 arch/mips/kvm/emulate.c                      |  8 ++++----
 arch/mips/math-emu/cp1emu.c                  | 28 ++++++++++++++--------------
 arch/mips/math-emu/dp_add.c                  |  3 +--
 arch/mips/math-emu/dp_div.c                  |  3 +--
 arch/mips/math-emu/dp_fmax.c                 |  6 ++----
 arch/mips/math-emu/dp_fmin.c                 |  6 ++----
 arch/mips/math-emu/dp_maddf.c                |  3 +--
 arch/mips/math-emu/dp_mul.c                  |  3 +--
 arch/mips/math-emu/dp_sqrt.c                 |  5 ++---
 arch/mips/math-emu/dp_sub.c                  |  3 +--
 arch/mips/math-emu/sp_add.c                  |  3 +--
 arch/mips/math-emu/sp_div.c                  |  3 +--
 arch/mips/math-emu/sp_fdp.c                  |  3 +--
 arch/mips/math-emu/sp_fmax.c                 |  6 ++----
 arch/mips/math-emu/sp_fmin.c                 |  6 ++----
 arch/mips/math-emu/sp_maddf.c                |  3 +--
 arch/mips/math-emu/sp_mul.c                  |  3 +--
 arch/mips/math-emu/sp_sub.c                  |  3 +--
 arch/mips/mm/c-r4k.c                         |  6 +++---
 arch/mips/mm/tlbex.c                         |  2 +-
 arch/mips/oprofile/op_model_mipsxx.c         | 26 +++++++++++++-------------
 arch/mips/pci/fixup-sni.c                    |  3 +--
 arch/mips/pci/ops-bcm63xx.c                  |  2 +-
 42 files changed, 112 insertions(+), 135 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 3e0c75c..752b93d 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -225,7 +225,7 @@ static void __init pb1550_nand_setup(void)
 	case 0: case 2: case 8: case 0xC: case 0xD:
 		/* x16 NAND Flash */
 		pb1550_nand_pd.devwidth = 1;
-		/* fallthrough */
+		fallthrough;
 	case 1: case 3: case 9: case 0xE: case 0xF:
 		/* x8 NAND, already set up */
 		platform_device_register(&pb1550_nand_dev);
diff --git a/arch/mips/ar7/setup.c b/arch/mips/ar7/setup.c
index b3ffe7c..352d5db 100644
--- a/arch/mips/ar7/setup.c
+++ b/arch/mips/ar7/setup.c
@@ -57,7 +57,7 @@ const char *get_system_type(void)
 		case TITAN_CHIP_1060:
 			return "TI AR7 (TNETV1060)";
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		return "TI AR7 (unknown)";
 	}
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index acb4fd6..4b7c066 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -153,8 +153,7 @@ static void __init ath79_detect_sys_type(void)
 	case REV_ID_MAJOR_QCA9533_V2:
 		ver = 2;
 		ath79_soc_rev = 2;
-		/* fall through */
-
+		fallthrough;
 	case REV_ID_MAJOR_QCA9533:
 		ath79_soc = ATH79_SOC_QCA9533;
 		chip = "9533";
diff --git a/arch/mips/bcm63xx/cpu.c b/arch/mips/bcm63xx/cpu.c
index f61c16f..8e3e199 100644
--- a/arch/mips/bcm63xx/cpu.c
+++ b/arch/mips/bcm63xx/cpu.c
@@ -304,7 +304,7 @@ void __init bcm63xx_cpu_init(void)
 	case CPU_BMIPS3300:
 		if ((read_c0_prid() & PRID_IMP_MASK) != PRID_IMP_BMIPS3300_ALT)
 			__cpu_name[cpu] = "Broadcom BCM6338";
-		/* fall-through */
+		fallthrough;
 	case CPU_BMIPS32:
 		chipid_reg = BCM_6345_PERF_BASE;
 		break;
diff --git a/arch/mips/bcm63xx/dev-flash.c b/arch/mips/bcm63xx/dev-flash.c
index a109393..f9cc015 100644
--- a/arch/mips/bcm63xx/dev-flash.c
+++ b/arch/mips/bcm63xx/dev-flash.c
@@ -94,7 +94,7 @@ static int __init bcm63xx_detect_flash_type(void)
 		case STRAPBUS_6368_BOOT_SEL_PARALLEL:
 			return BCM63XX_FLASH_TYPE_PARALLEL;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index b077597..b0efc35 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -489,7 +489,7 @@ cvmx_pko_status_t cvmx_pko_config_port(uint64_t port, uint64_t base_queue,
 				config.s.qos_mask = 0xff;
 				break;
 			}
-			/* fall through - to the error case, when Pass 1 */
+			fallthrough;	/* to the error case, when Pass 1 */
 		default:
 			cvmx_dprintf("ERROR: cvmx_pko_config_port: Invalid "
 				     "priority %llu\n",
diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index 51685f8..d56e9b9 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -141,7 +141,7 @@ static void octeon2_usb_clocks_start(struct device *dev)
 	default:
 		pr_err("Invalid UCTL clock rate of %u, using 12000000 instead\n",
 			clock_rate);
-		/* Fall through */
+		fallthrough;
 	case 12000000:
 		clk_rst_ctl.s.p_refclk_div = 0;
 		break;
@@ -1116,7 +1116,7 @@ int __init octeon_prune_device_tree(void)
 				new_f[0] = cpu_to_be32(48000000);
 				fdt_setprop_inplace(initial_boot_params, usbn,
 						    "refclk-frequency",  new_f, sizeof(new_f));
-				/* Fall through ...*/
+				fallthrough;
 			case USB_CLOCK_TYPE_REF_12:
 				/* Missing "refclk-type" defaults to external. */
 				fdt_nop_property(initial_boot_params, usbn, "refclk-type");
diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index cc88a08..1fd85c5 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -398,7 +398,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 	default:
 		dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
 			clock_rate);
-		/* fall through */
+		fallthrough;
 	case 100000000:
 		mpll_mul = 0x19;
 		if (ref_clk_sel < 2)
diff --git a/arch/mips/dec/tc.c b/arch/mips/dec/tc.c
index 732027c..dba5839 100644
--- a/arch/mips/dec/tc.c
+++ b/arch/mips/dec/tc.c
@@ -52,7 +52,7 @@ int __init tc_bus_get_info(struct tc_bus *tbus)
 	case MACH_DS5900:
 		tbus->ext_slot_base = 0x20000000;
 		tbus->ext_slot_size = 0x20000000;
-		/* fall through */
+		fallthrough;
 	case MACH_DS5000_1XX:
 		tbus->num_tcslots = 3;
 		break;
diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index 9476e04..a9d5123 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -76,7 +76,7 @@ static inline int __enable_fpu(enum fpu_mode mode)
 		/* we only have a 32-bit FPU */
 		return SIGFPE;
 #endif
-		/* fall through */
+		fallthrough;
 	case FPU_32BIT:
 		if (cpu_has_fre) {
 			/* clear FRE */
diff --git a/arch/mips/include/asm/octeon/cvmx-sli-defs.h b/arch/mips/include/asm/octeon/cvmx-sli-defs.h
index cbc7cda..5ef6c38 100644
--- a/arch/mips/include/asm/octeon/cvmx-sli-defs.h
+++ b/arch/mips/include/asm/octeon/cvmx-sli-defs.h
@@ -46,7 +46,7 @@ static inline uint64_t CVMX_SLI_PCIE_MSI_RCV_FUNC(void)
 	case OCTEON_CN78XX & OCTEON_FAMILY_MASK:
 		if (OCTEON_IS_MODEL(OCTEON_CN78XX_PASS1_X))
 			return 0x0000000000003CB0ull;
-		/* Else, fall through */
+		fallthrough;
 	default:
 		return 0x0000000000023CB0ull;
 	}
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index e2f503f..6a77bc4 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -49,7 +49,7 @@ static inline unsigned int page_size_ftlb(unsigned int mmuextdef)
 			return 6;
 		if (PAGE_SIZE > (256 << 10))
 			return 7; /* reserved */
-			/* fall through */
+		fallthrough;
 	case MIPS_CONF4_MMUEXTDEF_VTLBSIZEEXT:
 		return (PAGE_SHIFT - 10) / 2;
 	default:
diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 2c38f75..fb3e203 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -90,7 +90,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			regs->regs[31] = regs->cp0_epc +
 				dec_insn.pc_inc +
 				dec_insn.next_pc_inc;
-			/* Fall through */
+			fallthrough;
 		case mm_bltz_op:
 			if ((long)regs->regs[insn.mm_i_format.rs] < 0)
 				*contpc = regs->cp0_epc +
@@ -106,7 +106,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			regs->regs[31] = regs->cp0_epc +
 					dec_insn.pc_inc +
 					dec_insn.next_pc_inc;
-			/* Fall through */
+			fallthrough;
 		case mm_bgez_op:
 			if ((long)regs->regs[insn.mm_i_format.rs] >= 0)
 				*contpc = regs->cp0_epc +
@@ -144,7 +144,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			unsigned int bit;
 
 			bc_false = 1;
-			/* Fall through */
+			fallthrough;
 		case mm_bc2t_op:
 		case mm_bc1t_op:
 			preempt_disable();
@@ -178,7 +178,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		case mm_jalrs16_op:
 			regs->regs[31] = regs->cp0_epc +
 				dec_insn.pc_inc + dec_insn.next_pc_inc;
-			/* Fall through */
+			fallthrough;
 		case mm_jr16_op:
 			*contpc = regs->regs[insn.mm_i_format.rs];
 			return 1;
@@ -239,7 +239,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case mm_jal32_op:
 		regs->regs[31] = regs->cp0_epc +
 			dec_insn.pc_inc + dec_insn.next_pc_inc;
-		/* Fall through */
+		fallthrough;
 	case mm_j32_op:
 		*contpc = regs->cp0_epc + dec_insn.pc_inc;
 		*contpc >>= 27;
@@ -432,7 +432,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		switch (insn.r_format.func) {
 		case jalr_op:
 			regs->regs[insn.r_format.rd] = epc + 8;
-			/* Fall through */
+			fallthrough;
 		case jr_op:
 			if (NO_R6EMU && insn.r_format.func == jr_op)
 				goto sigill_r2r6;
@@ -451,7 +451,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		case bltzl_op:
 			if (NO_R6EMU)
 				goto sigill_r2r6;
-			/* fall through */
+			fallthrough;
 		case bltz_op:
 			if ((long)regs->regs[insn.i_format.rs] < 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
@@ -465,7 +465,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 		case bgezl_op:
 			if (NO_R6EMU)
 				goto sigill_r2r6;
-			/* fall through */
+			fallthrough;
 		case bgez_op:
 			if ((long)regs->regs[insn.i_format.rs] >= 0) {
 				epc = epc + 4 + (insn.i_format.simmediate << 2);
@@ -561,7 +561,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case jalx_op:
 	case jal_op:
 		regs->regs[31] = regs->cp0_epc + 8;
-		/* fall through */
+		fallthrough;
 	case j_op:
 		epc += 4;
 		epc >>= 28;
@@ -578,7 +578,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case beql_op:
 		if (NO_R6EMU)
 			goto sigill_r2r6;
-		/* fall through */
+		fallthrough;
 	case beq_op:
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt]) {
@@ -593,7 +593,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case bnel_op:
 		if (NO_R6EMU)
 			goto sigill_r2r6;
-		/* fall through */
+		fallthrough;
 	case bne_op:
 		if (regs->regs[insn.i_format.rs] !=
 		    regs->regs[insn.i_format.rt]) {
@@ -608,7 +608,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case blezl_op: /* not really i_format */
 		if (!insn.i_format.rt && NO_R6EMU)
 			goto sigill_r2r6;
-		/* fall through */
+		fallthrough;
 	case blez_op:
 		/*
 		 * Compact branches for R6 for the
@@ -644,7 +644,7 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
 	case bgtzl_op:
 		if (!insn.i_format.rt && NO_R6EMU)
 			goto sigill_r2r6;
-		/* fall through */
+		fallthrough;
 	case bgtz_op:
 		/*
 		 * Compact branches for R6 for the
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 4432442..415fbd2 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -535,19 +535,19 @@ static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 	case MIPS_CPU_ISA_M64R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2;
 		set_elf_base_platform("mips64r2");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_M64R1:
 		c->isa_level |= MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1;
 		set_elf_base_platform("mips64");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_V:
 		c->isa_level |= MIPS_CPU_ISA_V;
 		set_elf_base_platform("mips5");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_IV:
 		c->isa_level |= MIPS_CPU_ISA_IV;
 		set_elf_base_platform("mips4");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_III:
 		c->isa_level |= MIPS_CPU_ISA_II | MIPS_CPU_ISA_III;
 		set_elf_base_platform("mips3");
@@ -557,7 +557,7 @@ static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 	case MIPS_CPU_ISA_M64R6:
 		c->isa_level |= MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6;
 		set_elf_base_platform("mips64r6");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_M32R6:
 		c->isa_level |= MIPS_CPU_ISA_M32R6;
 		set_elf_base_platform("mips32r6");
@@ -566,11 +566,11 @@ static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 	case MIPS_CPU_ISA_M32R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2;
 		set_elf_base_platform("mips32r2");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_M32R1:
 		c->isa_level |= MIPS_CPU_ISA_M32R1;
 		set_elf_base_platform("mips32");
-		/* fall through */
+		fallthrough;
 	case MIPS_CPU_ISA_II:
 		c->isa_level |= MIPS_CPU_ISA_II;
 		set_elf_base_platform("mips2");
@@ -850,7 +850,7 @@ static inline unsigned int decode_config4(struct cpuinfo_mips *c)
 				  MIPS_CONF4_VTLBSIZEEXT_SHIFT) * 0x40;
 			c->tlbsize = c->tlbsizevtlb;
 			ftlb_page = MIPS_CONF4_VFTLBPAGESIZE;
-			/* fall through */
+			fallthrough;
 		case MIPS_CONF4_MMUEXTDEF_FTLBSIZEEXT:
 			if (mips_ftlb_disabled)
 				break;
@@ -1753,10 +1753,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 	switch (__get_cpu_type(c->cputype)) {
 	case CPU_I6500:
 		c->options |= MIPS_CPU_SHARED_FTLB_ENTRIES;
-		/* fall-through */
+		fallthrough;
 	case CPU_I6400:
 		c->options |= MIPS_CPU_SHARED_FTLB_RAM;
-		/* fall-through */
+		fallthrough;
 	default:
 		break;
 	}
@@ -2079,7 +2079,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		default:
 			break;
 		}
-	/* fall-through */
+		fallthrough;
 	case PRID_IMP_XBURST_REV2:
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 60d8c2a..5bc3b04 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -202,7 +202,7 @@ void __init check_wait(void)
 		 */
 		if (IS_ENABLED(CONFIG_MIPS_EJTAG_FDC_TTY))
 			break;
-		/* fall through */
+		fallthrough;
 	case CPU_M14KC:
 	case CPU_M14KEC:
 	case CPU_24K:
diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
index b4d210b..a39ec75 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -1109,7 +1109,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
 			err = SIGILL;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case beql_op:
 	case bnel_op:
 		if (delay_slot(regs)) {
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index f6efabc..f926bf3 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -824,7 +824,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 				regs->regs[2] = EINTR;
 				break;
 			}
-		/* fallthrough */
+			fallthrough;
 		case ERESTARTNOINTR:
 			regs->regs[7] = regs->regs[26];
 			regs->regs[2] = regs->regs[0];
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 5efc525..71dc4ad 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1401,8 +1401,7 @@ asmlinkage void do_cpu(struct pt_regs *regs)
 			force_sig(SIGILL);
 			break;
 		}
-		/* Fall through.  */
-
+		fallthrough;
 	case 1: {
 		void __user *fault_addr;
 		unsigned long fcr31;
diff --git a/arch/mips/kernel/watch.c b/arch/mips/kernel/watch.c
index ba73b40..c9263b9 100644
--- a/arch/mips/kernel/watch.c
+++ b/arch/mips/kernel/watch.c
@@ -27,15 +27,15 @@ void mips_install_watch_registers(struct task_struct *t)
 	case 4:
 		write_c0_watchlo3(watches->watchlo[3]);
 		write_c0_watchhi3(watchhi | watches->watchhi[3]);
-		/* fall through */
+		fallthrough;
 	case 3:
 		write_c0_watchlo2(watches->watchlo[2]);
 		write_c0_watchhi2(watchhi | watches->watchhi[2]);
-		/* fall through */
+		fallthrough;
 	case 2:
 		write_c0_watchlo1(watches->watchlo[1]);
 		write_c0_watchhi1(watchhi | watches->watchhi[1]);
-		/* fall through */
+		fallthrough;
 	case 1:
 		write_c0_watchlo0(watches->watchlo[0]);
 		write_c0_watchhi0(watchhi | watches->watchhi[0]);
@@ -58,13 +58,13 @@ void mips_read_watch_registers(void)
 		BUG();
 	case 4:
 		watches->watchhi[3] = (read_c0_watchhi3() & watchhi_mask);
-		/* fall through */
+		fallthrough;
 	case 3:
 		watches->watchhi[2] = (read_c0_watchhi2() & watchhi_mask);
-		/* fall through */
+		fallthrough;
 	case 2:
 		watches->watchhi[1] = (read_c0_watchhi1() & watchhi_mask);
-		/* fall through */
+		fallthrough;
 	case 1:
 		watches->watchhi[0] = (read_c0_watchhi0() & watchhi_mask);
 	}
@@ -91,25 +91,25 @@ void mips_clear_watch_registers(void)
 		BUG();
 	case 8:
 		write_c0_watchlo7(0);
-		/* fall through */
+		fallthrough;
 	case 7:
 		write_c0_watchlo6(0);
-		/* fall through */
+		fallthrough;
 	case 6:
 		write_c0_watchlo5(0);
-		/* fall through */
+		fallthrough;
 	case 5:
 		write_c0_watchlo4(0);
-		/* fall through */
+		fallthrough;
 	case 4:
 		write_c0_watchlo3(0);
-		/* fall through */
+		fallthrough;
 	case 3:
 		write_c0_watchlo2(0);
-		/* fall through */
+		fallthrough;
 	case 2:
 		write_c0_watchlo1(0);
-		/* fall through */
+		fallthrough;
 	case 1:
 		write_c0_watchlo0(0);
 	}
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 71316fa..07b123f 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -64,7 +64,7 @@ static int kvm_compute_return_epc(struct kvm_vcpu *vcpu, unsigned long instpc,
 		switch (insn.r_format.func) {
 		case jalr_op:
 			arch->gprs[insn.r_format.rd] = epc + 8;
-			/* Fall through */
+			fallthrough;
 		case jr_op:
 			nextpc = arch->gprs[insn.r_format.rs];
 			break;
@@ -140,7 +140,7 @@ static int kvm_compute_return_epc(struct kvm_vcpu *vcpu, unsigned long instpc,
 		/* These are unconditional and in j_format. */
 	case jal_op:
 		arch->gprs[31] = instpc + 8;
-		/* fall through */
+		fallthrough;
 	case j_op:
 		epc += 4;
 		epc >>= 28;
@@ -1942,14 +1942,14 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 
 	case lhu_op:
 		vcpu->mmio_needed = 1;	/* unsigned */
-		/* fall through */
+		fallthrough;
 	case lh_op:
 		run->mmio.len = 2;
 		break;
 
 	case lbu_op:
 		vcpu->mmio_needed = 1;	/* unsigned */
-		/* fall through */
+		fallthrough;
 	case lb_op:
 		run->mmio.len = 1;
 		break;
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 9701c89..587cf1d 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -439,7 +439,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 					regs->cp0_epc + dec_insn.pc_inc +
 					dec_insn.next_pc_inc;
 			}
-			/* fall through */
+			fallthrough;
 		case jr_op:
 			/* For R6, JR already emulated in jalr_op */
 			if (NO_R6EMU && insn.r_format.func == jr_op)
@@ -459,11 +459,11 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			regs->regs[31] = regs->cp0_epc +
 				dec_insn.pc_inc +
 				dec_insn.next_pc_inc;
-			/* fall through */
+			fallthrough;
 		case bltzl_op:
 			if (NO_R6EMU)
 				break;
-			/* fall through */
+			fallthrough;
 		case bltz_op:
 			if ((long)regs->regs[insn.i_format.rs] < 0)
 				*contpc = regs->cp0_epc +
@@ -483,11 +483,11 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			regs->regs[31] = regs->cp0_epc +
 				dec_insn.pc_inc +
 				dec_insn.next_pc_inc;
-			/* fall through */
+			fallthrough;
 		case bgezl_op:
 			if (NO_R6EMU)
 				break;
-			/* fall through */
+			fallthrough;
 		case bgez_op:
 			if ((long)regs->regs[insn.i_format.rs] >= 0)
 				*contpc = regs->cp0_epc +
@@ -502,12 +502,12 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		break;
 	case jalx_op:
 		set_isa16_mode(bit);
-		/* fall through */
+		fallthrough;
 	case jal_op:
 		regs->regs[31] = regs->cp0_epc +
 			dec_insn.pc_inc +
 			dec_insn.next_pc_inc;
-		/* fall through */
+		fallthrough;
 	case j_op:
 		*contpc = regs->cp0_epc + dec_insn.pc_inc;
 		*contpc >>= 28;
@@ -519,7 +519,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case beql_op:
 		if (NO_R6EMU)
 			break;
-		/* fall through */
+		fallthrough;
 	case beq_op:
 		if (regs->regs[insn.i_format.rs] ==
 		    regs->regs[insn.i_format.rt])
@@ -534,7 +534,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case bnel_op:
 		if (NO_R6EMU)
 			break;
-		/* fall through */
+		fallthrough;
 	case bne_op:
 		if (regs->regs[insn.i_format.rs] !=
 		    regs->regs[insn.i_format.rt])
@@ -549,7 +549,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case blezl_op:
 		if (!insn.i_format.rt && NO_R6EMU)
 			break;
-		/* fall through */
+		fallthrough;
 	case blez_op:
 
 		/*
@@ -587,7 +587,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 	case bgtzl_op:
 		if (!insn.i_format.rt && NO_R6EMU)
 			break;
-		/* fall through */
+		fallthrough;
 	case bgtz_op:
 		/*
 		 * Compact branches for R6 for the
@@ -725,7 +725,7 @@ int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 			return 1;
 		}
 		/* R2/R6 compatible cop1 instruction */
-		/* fall through */
+		fallthrough;
 	case cop2_op:
 	case cop1x_op:
 		if (insn.i_format.rs == bc_op) {
@@ -1217,14 +1217,14 @@ static int cop1Emulate(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
 			case bcfl_op:
 				if (cpu_has_mips_2_3_4_5_r)
 					likely = 1;
-				/* fall through */
+				fallthrough;
 			case bcf_op:
 				cond = !cond;
 				break;
 			case bctl_op:
 				if (cpu_has_mips_2_3_4_5_r)
 					likely = 1;
-				/* fall through */
+				fallthrough;
 			case bct_op:
 				break;
 			}
diff --git a/arch/mips/math-emu/dp_add.c b/arch/mips/math-emu/dp_add.c
index a8f98b8..7850473 100644
--- a/arch/mips/math-emu/dp_add.c
+++ b/arch/mips/math-emu/dp_add.c
@@ -92,8 +92,7 @@ union ieee754dp ieee754dp_add(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/dp_div.c b/arch/mips/math-emu/dp_div.c
index 2b682e9..ac1ecc4 100644
--- a/arch/mips/math-emu/dp_div.c
+++ b/arch/mips/math-emu/dp_div.c
@@ -91,8 +91,7 @@ union ieee754dp ieee754dp_div(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/dp_fmax.c b/arch/mips/math-emu/dp_fmax.c
index 3eda9ff7b..126ec90 100644
--- a/arch/mips/math-emu/dp_fmax.c
+++ b/arch/mips/math-emu/dp_fmax.c
@@ -93,8 +93,7 @@ union ieee754dp ieee754dp_fmax(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
@@ -222,8 +221,7 @@ union ieee754dp ieee754dp_fmaxa(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/dp_fmin.c b/arch/mips/math-emu/dp_fmin.c
index b3594a1..35ded4c 100644
--- a/arch/mips/math-emu/dp_fmin.c
+++ b/arch/mips/math-emu/dp_fmin.c
@@ -93,8 +93,7 @@ union ieee754dp ieee754dp_fmin(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
@@ -222,8 +221,7 @@ union ieee754dp ieee754dp_fmina(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/dp_maddf.c b/arch/mips/math-emu/dp_maddf.c
index e24ef37..931e66f 100644
--- a/arch/mips/math-emu/dp_maddf.c
+++ b/arch/mips/math-emu/dp_maddf.c
@@ -150,8 +150,7 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		if (zc == IEEE754_CLASS_INF)
 			return ieee754dp_inf(zs);
diff --git a/arch/mips/math-emu/dp_mul.c b/arch/mips/math-emu/dp_mul.c
index e8a97d2..8a671bb 100644
--- a/arch/mips/math-emu/dp_mul.c
+++ b/arch/mips/math-emu/dp_mul.c
@@ -89,8 +89,7 @@ union ieee754dp ieee754dp_mul(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		DPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/dp_sqrt.c b/arch/mips/math-emu/dp_sqrt.c
index 06be390..1ee38f8 100644
--- a/arch/mips/math-emu/dp_sqrt.c
+++ b/arch/mips/math-emu/dp_sqrt.c
@@ -52,8 +52,7 @@ union ieee754dp ieee754dp_sqrt(union ieee754dp x)
 
 	case IEEE754_CLASS_DNORM:
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case IEEE754_CLASS_NORM:
 		if (xs) {
 			/* sqrt(-x) = Nan */
@@ -130,7 +129,7 @@ union ieee754dp ieee754dp_sqrt(union ieee754dp x)
 		switch (oldcsr.rm) {
 		case FPU_CSR_RU:
 			y.bits += 1;
-			/* fall through */
+			fallthrough;
 		case FPU_CSR_RN:
 			t.bits += 1;
 			break;
diff --git a/arch/mips/math-emu/dp_sub.c b/arch/mips/math-emu/dp_sub.c
index f08aece..08474ad 100644
--- a/arch/mips/math-emu/dp_sub.c
+++ b/arch/mips/math-emu/dp_sub.c
@@ -94,8 +94,7 @@ union ieee754dp ieee754dp_sub(union ieee754dp x, union ieee754dp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		DPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		/* normalize ym,ye */
 		DPDNORMY;
diff --git a/arch/mips/math-emu/sp_add.c b/arch/mips/math-emu/sp_add.c
index 9af3ec7..715cd05 100644
--- a/arch/mips/math-emu/sp_add.c
+++ b/arch/mips/math-emu/sp_add.c
@@ -92,8 +92,7 @@ union ieee754sp ieee754sp_add(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/sp_div.c b/arch/mips/math-emu/sp_div.c
index fcc285f..2bfa266 100644
--- a/arch/mips/math-emu/sp_div.c
+++ b/arch/mips/math-emu/sp_div.c
@@ -91,8 +91,7 @@ union ieee754sp ieee754sp_div(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/sp_fdp.c b/arch/mips/math-emu/sp_fdp.c
index 9f14561..5641749 100644
--- a/arch/mips/math-emu/sp_fdp.c
+++ b/arch/mips/math-emu/sp_fdp.c
@@ -34,8 +34,7 @@ union ieee754sp ieee754sp_fdp(union ieee754dp x)
 	case IEEE754_CLASS_SNAN:
 		x = ieee754dp_nanxcpt(x);
 		EXPLODEXDP;
-		/* fall through */
-
+		fallthrough;
 	case IEEE754_CLASS_QNAN:
 		y = ieee754sp_nan_fdp(xs, xm);
 		if (!ieee754_csr.nan2008) {
diff --git a/arch/mips/math-emu/sp_fmax.c b/arch/mips/math-emu/sp_fmax.c
index 4ce1d1f..3fb16a1 100644
--- a/arch/mips/math-emu/sp_fmax.c
+++ b/arch/mips/math-emu/sp_fmax.c
@@ -93,8 +93,7 @@ union ieee754sp ieee754sp_fmax(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
@@ -222,8 +221,7 @@ union ieee754sp ieee754sp_fmaxa(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/sp_fmin.c b/arch/mips/math-emu/sp_fmin.c
index 7ad867f..ad2599d 100644
--- a/arch/mips/math-emu/sp_fmin.c
+++ b/arch/mips/math-emu/sp_fmin.c
@@ -93,8 +93,7 @@ union ieee754sp ieee754sp_fmin(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
@@ -222,8 +221,7 @@ union ieee754sp ieee754sp_fmina(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/sp_maddf.c b/arch/mips/math-emu/sp_maddf.c
index 1b85b1a..473ee22 100644
--- a/arch/mips/math-emu/sp_maddf.c
+++ b/arch/mips/math-emu/sp_maddf.c
@@ -119,8 +119,7 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		if (zc == IEEE754_CLASS_INF)
 			return ieee754sp_inf(zs);
diff --git a/arch/mips/math-emu/sp_mul.c b/arch/mips/math-emu/sp_mul.c
index ded17e2..26cfd63 100644
--- a/arch/mips/math-emu/sp_mul.c
+++ b/arch/mips/math-emu/sp_mul.c
@@ -89,8 +89,7 @@ union ieee754sp ieee754sp_mul(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/math-emu/sp_sub.c b/arch/mips/math-emu/sp_sub.c
index f3d26a1..16c8e9a 100644
--- a/arch/mips/math-emu/sp_sub.c
+++ b/arch/mips/math-emu/sp_sub.c
@@ -94,8 +94,7 @@ union ieee754sp ieee754sp_sub(union ieee754sp x, union ieee754sp y)
 
 	case CLPAIR(IEEE754_CLASS_DNORM, IEEE754_CLASS_DNORM):
 		SPDNORMX;
-		/* fall through */
-
+		fallthrough;
 	case CLPAIR(IEEE754_CLASS_NORM, IEEE754_CLASS_DNORM):
 		SPDNORMY;
 		break;
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 85eb62e..54c18b8 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1200,7 +1200,7 @@ static void probe_pcache(void)
 
 	case CPU_VR4133:
 		write_c0_config(config & ~VR41_CONF_P4K);
-		/* fall through */
+		fallthrough;
 	case CPU_VR4131:
 		/* Workaround for cache instruction bug of VR4131 */
 		if (c->processor_id == 0x0c80U || c->processor_id == 0x0c81U ||
@@ -1426,7 +1426,7 @@ static void probe_pcache(void)
 	case CPU_74K:
 	case CPU_1074K:
 		has_74k_erratum = alias_74k_erratum(c);
-		/* Fall through. */
+		fallthrough;
 	case CPU_M14KC:
 	case CPU_M14KEC:
 	case CPU_24K:
@@ -1450,7 +1450,7 @@ static void probe_pcache(void)
 			c->dcache.flags |= MIPS_CACHE_PINDEX;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		if (has_74k_erratum || c->dcache.waysize > PAGE_SIZE)
 			c->dcache.flags |= MIPS_CACHE_ALIASES;
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index da407cd..38c2042 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -576,7 +576,7 @@ void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 	case CPU_R5500:
 		if (m4kc_tlbp_war())
 			uasm_i_nop(p);
-		/* fall through */
+		fallthrough;
 	case CPU_ALCHEMY:
 		tlbw(p);
 		break;
diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index a537bf9..1493c49 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -172,15 +172,15 @@ static void mipsxx_cpu_setup(void *args)
 	case 4:
 		w_c0_perfctrl3(0);
 		w_c0_perfcntr3(reg.counter[3]);
-		/* fall through */
+		fallthrough;
 	case 3:
 		w_c0_perfctrl2(0);
 		w_c0_perfcntr2(reg.counter[2]);
-		/* fall through */
+		fallthrough;
 	case 2:
 		w_c0_perfctrl1(0);
 		w_c0_perfcntr1(reg.counter[1]);
-		/* fall through */
+		fallthrough;
 	case 1:
 		w_c0_perfctrl0(0);
 		w_c0_perfcntr0(reg.counter[0]);
@@ -198,13 +198,13 @@ static void mipsxx_cpu_start(void *args)
 	switch (counters) {
 	case 4:
 		w_c0_perfctrl3(WHAT | reg.control[3]);
-		/* fall through */
+		fallthrough;
 	case 3:
 		w_c0_perfctrl2(WHAT | reg.control[2]);
-		/* fall through */
+		fallthrough;
 	case 2:
 		w_c0_perfctrl1(WHAT | reg.control[1]);
-		/* fall through */
+		fallthrough;
 	case 1:
 		w_c0_perfctrl0(WHAT | reg.control[0]);
 	}
@@ -221,13 +221,13 @@ static void mipsxx_cpu_stop(void *args)
 	switch (counters) {
 	case 4:
 		w_c0_perfctrl3(0);
-		/* fall through */
+		fallthrough;
 	case 3:
 		w_c0_perfctrl2(0);
-		/* fall through */
+		fallthrough;
 	case 2:
 		w_c0_perfctrl1(0);
-		/* fall through */
+		fallthrough;
 	case 1:
 		w_c0_perfctrl0(0);
 	}
@@ -245,7 +245,7 @@ static int mipsxx_perfcount_handler(void)
 
 	switch (counters) {
 #define HANDLE_COUNTER(n)						\
-	/* fall through */						\
+	fallthrough;							\
 	case n + 1:							\
 		control = r_c0_perfctrl ## n();				\
 		counter = r_c0_perfcntr ## n();				\
@@ -307,15 +307,15 @@ static void reset_counters(void *arg)
 	case 4:
 		w_c0_perfctrl3(0);
 		w_c0_perfcntr3(0);
-		/* fall through */
+		fallthrough;
 	case 3:
 		w_c0_perfctrl2(0);
 		w_c0_perfcntr2(0);
-		/* fall through */
+		fallthrough;
 	case 2:
 		w_c0_perfctrl1(0);
 		w_c0_perfcntr1(0);
-		/* fall through */
+		fallthrough;
 	case 1:
 		w_c0_perfctrl0(0);
 		w_c0_perfcntr0(0);
diff --git a/arch/mips/pci/fixup-sni.c b/arch/mips/pci/fixup-sni.c
index adb9a58..de012f8 100644
--- a/arch/mips/pci/fixup-sni.c
+++ b/arch/mips/pci/fixup-sni.c
@@ -151,8 +151,7 @@ int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	case SNI_BRD_PCI_MTOWER:
 		if (is_rm300_revd())
 			return irq_tab_rm300d[slot][pin];
-		/* fall through */
-
+		fallthrough;
 	case SNI_BRD_PCI_DESKTOP:
 		return irq_tab_rm200[slot][pin];
 
diff --git a/arch/mips/pci/ops-bcm63xx.c b/arch/mips/pci/ops-bcm63xx.c
index 925c723..dc6dc27 100644
--- a/arch/mips/pci/ops-bcm63xx.c
+++ b/arch/mips/pci/ops-bcm63xx.c
@@ -474,7 +474,7 @@ static int bcm63xx_pcie_can_access(struct pci_bus *bus, int devfn)
 		if (PCI_SLOT(devfn) == 0)
 			return bcm_pcie_readl(PCIE_DLSTATUS_REG)
 					& DLSTATUS_PHYLINKUP;
-		/* else, fall through */
+		fallthrough;
 	default:
 		return false;
 	}
-- 
2.7.0

