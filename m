Return-Path: <linux-mips+bounces-6835-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D79E073E
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 16:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623802813F5
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 15:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19316209F43;
	Mon,  2 Dec 2024 15:40:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A87208978;
	Mon,  2 Dec 2024 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154005; cv=none; b=aDkUOncqBvOsSyLJPNmBc3VwvgqaspYznOoH1/7H0A/Qy1dWg2k/77OyKf8r4EtX3WbWpcBTX42L9YUkEi3p+oY5ziOVlM00GegG1zhnKwU1Qdf6SsKdzkZcAT/dKZJmraL7iEPysJ12GwfbCI/3cUE4k/F0QE8K0LMbqtAkfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154005; c=relaxed/simple;
	bh=CLMPfAtaiDr2I8PTcXssVMWT0ETo3B7jRCFUqi5vW/Q=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=c/ln5saUxw+67uoOQ9cGDTE2vePk23SHLy9RF1YjB3hdnGlvAPYjbCrrpQlMKHAqUlGRW5EgBygmu3RQjYOXAfAwQ4i7DlubIY3KoPdqONQ5TsHi1owXciO+w4Nx8vQStJCMdwRYR6Mff70XGjvjcvvcz/3W3QWBdWFyvCSfSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5F411F442;
	Mon,  2 Dec 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1B1D139C2;
	Mon,  2 Dec 2024 15:39:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5YkpL83UTWc9NQAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Mon, 02 Dec 2024 15:39:57 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: Rename read/write_c0_ecc to read/writec0_errctl
Date: Mon,  2 Dec 2024 16:39:36 +0100
Message-Id: <20241202153937.27640-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

CP0 register 26 is used as ECC register for legacy cores, but newer
cores (MIPS32/MIPS64) use it as an ErrCtl register. Since the kernel only
uses CP0 26 as ErrCtl register rename the access functions to the more
fitting name.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mipsregs.h |  4 ++--
 arch/mips/kernel/mips-mt.c       |  7 +++----
 arch/mips/kernel/spram.c         |  4 ----
 arch/mips/kernel/traps.c         | 32 ++++++++++++++++----------------
 4 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 3c6ddc0c2c7a..c025558754d5 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2039,8 +2039,8 @@ do {									\
 #define read_c0_perfcntr3_64()	__read_64bit_c0_register($25, 7)
 #define write_c0_perfcntr3_64(val) __write_64bit_c0_register($25, 7, val)
 
-#define read_c0_ecc()		__read_32bit_c0_register($26, 0)
-#define write_c0_ecc(val)	__write_32bit_c0_register($26, 0, val)
+#define read_c0_errctl()	__read_32bit_c0_register($26, 0)
+#define write_c0_errctl(val)	__write_32bit_c0_register($26, 0, val)
 
 #define read_c0_derraddr0()	__read_ulong_c0_register($26, 1)
 #define write_c0_derraddr0(val) __write_ulong_c0_register($26, 1, val)
diff --git a/arch/mips/kernel/mips-mt.c b/arch/mips/kernel/mips-mt.c
index 37676a44fefb..2ef610650a9e 100644
--- a/arch/mips/kernel/mips-mt.c
+++ b/arch/mips/kernel/mips-mt.c
@@ -122,9 +122,8 @@ void mips_mt_set_cpuoptions(void)
 		unsigned long ectlval;
 		unsigned long itcblkgrn;
 
-		/* ErrCtl register is known as "ecc" to Linux */
-		ectlval = read_c0_ecc();
-		write_c0_ecc(ectlval | (0x1 << 26));
+		ectlval = read_c0_errctl();
+		write_c0_errctl(ectlval | (0x1 << 26));
 		ehb();
 #define INDEX_0 (0x80000000)
 #define INDEX_8 (0x80000008)
@@ -145,7 +144,7 @@ void mips_mt_set_cpuoptions(void)
 		ehb();
 		/* Write out to ITU with CACHE op */
 		cache_op(Index_Store_Tag_D, INDEX_0);
-		write_c0_ecc(ectlval);
+		write_c0_errctl(ectlval);
 		ehb();
 		printk("Mapped %ld ITC cells starting at 0x%08x\n",
 			((itcblkgrn & 0x7fe00000) >> 20), itc_base);
diff --git a/arch/mips/kernel/spram.c b/arch/mips/kernel/spram.c
index 71c7e5e27567..dd31e3fffd24 100644
--- a/arch/mips/kernel/spram.c
+++ b/arch/mips/kernel/spram.c
@@ -26,10 +26,6 @@
 
 #define ERRCTL_SPRAM		(1 << 28)
 
-/* errctl access */
-#define read_c0_errctl(x) read_c0_ecc(x)
-#define write_c0_errctl(x) write_c0_ecc(x)
-
 /*
  * Different semantics to the set_c0_* function built by __BUILD_SET_C0
  */
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index dc29bd9656b0..4515125a93f1 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1705,10 +1705,10 @@ static inline __init void parity_protection_init(void)
 		l2parity &= l1parity;
 
 		/* Probe L1 ECC support */
-		cp0_ectl = read_c0_ecc();
-		write_c0_ecc(cp0_ectl | ERRCTL_PE);
+		cp0_ectl = read_c0_errctl();
+		write_c0_errctl(cp0_ectl | ERRCTL_PE);
 		back_to_back_c0_hazard();
-		cp0_ectl = read_c0_ecc();
+		cp0_ectl = read_c0_errctl();
 
 		/* Probe L2 ECC support */
 		gcr_ectl = read_gcr_err_control();
@@ -1727,9 +1727,9 @@ static inline __init void parity_protection_init(void)
 			cp0_ectl |= ERRCTL_PE;
 		else
 			cp0_ectl &= ~ERRCTL_PE;
-		write_c0_ecc(cp0_ectl);
+		write_c0_errctl(cp0_ectl);
 		back_to_back_c0_hazard();
-		WARN_ON(!!(read_c0_ecc() & ERRCTL_PE) != l1parity);
+		WARN_ON(!!(read_c0_errctl() & ERRCTL_PE) != l1parity);
 
 		/* Configure L2 ECC checking */
 		if (l2parity)
@@ -1761,18 +1761,18 @@ static inline __init void parity_protection_init(void)
 			unsigned long errctl;
 			unsigned int l1parity_present, l2parity_present;
 
-			errctl = read_c0_ecc();
+			errctl = read_c0_errctl();
 			errctl &= ~(ERRCTL_PE|ERRCTL_L2P);
 
 			/* probe L1 parity support */
-			write_c0_ecc(errctl | ERRCTL_PE);
+			write_c0_errctl(errctl | ERRCTL_PE);
 			back_to_back_c0_hazard();
-			l1parity_present = (read_c0_ecc() & ERRCTL_PE);
+			l1parity_present = (read_c0_errctl() & ERRCTL_PE);
 
 			/* probe L2 parity support */
-			write_c0_ecc(errctl|ERRCTL_L2P);
+			write_c0_errctl(errctl|ERRCTL_L2P);
 			back_to_back_c0_hazard();
-			l2parity_present = (read_c0_ecc() & ERRCTL_L2P);
+			l2parity_present = (read_c0_errctl() & ERRCTL_L2P);
 
 			if (l1parity_present && l2parity_present) {
 				if (l1parity)
@@ -1791,9 +1791,9 @@ static inline __init void parity_protection_init(void)
 
 			printk(KERN_INFO "Writing ErrCtl register=%08lx\n", errctl);
 
-			write_c0_ecc(errctl);
+			write_c0_errctl(errctl);
 			back_to_back_c0_hazard();
-			errctl = read_c0_ecc();
+			errctl = read_c0_errctl();
 			printk(KERN_INFO "Readback ErrCtl register=%08lx\n", errctl);
 
 			if (l1parity_present)
@@ -1812,11 +1812,11 @@ static inline __init void parity_protection_init(void)
 	case CPU_5KC:
 	case CPU_5KE:
 	case CPU_LOONGSON32:
-		write_c0_ecc(0x80000000);
+		write_c0_errctl(0x80000000);
 		back_to_back_c0_hazard();
 		/* Set the PE bit (bit 31) in the c0_errctl register. */
 		printk(KERN_INFO "Cache parity protection %sabled\n",
-		       (read_c0_ecc() & 0x80000000) ? "en" : "dis");
+		       (read_c0_errctl() & 0x80000000) ? "en" : "dis");
 		break;
 	case CPU_20KC:
 	case CPU_25KF:
@@ -1887,8 +1887,8 @@ asmlinkage void do_ftlb(void)
 	if ((cpu_has_mips_r2_r6) &&
 	    (((current_cpu_data.processor_id & 0xff0000) == PRID_COMP_MIPS) ||
 	    ((current_cpu_data.processor_id & 0xff0000) == PRID_COMP_LOONGSON))) {
-		pr_err("FTLB error exception, cp0_ecc=0x%08x:\n",
-		       read_c0_ecc());
+		pr_err("FTLB error exception, cp0_errctl=0x%08x:\n",
+		       read_c0_errctl());
 		pr_err("cp0_errorepc == %0*lx\n", field, read_c0_errorepc());
 		reg_val = read_c0_cacheerr();
 		pr_err("c0_cacheerr == %08x\n", reg_val);
-- 
2.35.3


