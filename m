Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3FB1751C6
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 03:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgCBCWu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Mar 2020 21:22:50 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46271 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgCBCWu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Mar 2020 21:22:50 -0500
Received: by mail-pf1-f194.google.com with SMTP id o24so4760127pfp.13
        for <linux-mips@vger.kernel.org>; Sun, 01 Mar 2020 18:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7w1gzDH44eI4ETwhiCxZ/qqT/SE8LK26eLjI4GabOro=;
        b=i92UYUT8eASOGAOc1lTMFB6hzlIo0NOXAQkSd7DNC5inJ3OPSR7XExs+xACPyzMcSx
         2w82lZvJuAlAzrVnuw3CqLqChGVvxboCeMuUkLU58FjkVH1v4atF0RF1McY3lLOIlF9J
         eKaXn7XTtxkj5GceSqI5OHezsythnDrfSTuJwBJpgs70fobsn76YDi4a878jeJY2MaXt
         QrroV9k/EHoAtxV8fR09EFhnEiUxtdQ75swjLJhlDLavqvCeVcHkuZMnh+v+mkukVcRn
         8k66Shb0eCJmheoGukleJBUUm/2V9/8lNvVSICLl3P2ZTB4sLv4fsbSS4RneVo03yopo
         yl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=7w1gzDH44eI4ETwhiCxZ/qqT/SE8LK26eLjI4GabOro=;
        b=ogRwuAXul+TiEZS2/xOWEM67RJg8c9PP+khOSHjAhrvBnjHWl+Gi5hYUoGnH11yW2m
         ahsB50dadWnQphTfgCpx8vRwBiQchlHdTVDk0JpNzhDS+k+i58nbfOQHghlazL3C5fHN
         TdRPrGztxTcILYul40Xvu7TFCgxvan/24d8f+Q6mQnjkyR6fcjUxe5av59PpO+f5o6I/
         u1jEcFxpp0G4aj95b1nt8BzpaDW6DKQ9RR/QOTJC3LF9PglF6GNH2/RVwJSR4ex/Fghf
         JCyT9+KZUmSoZQL1YgmTBRiMaf0S6Tlk7okt1w/XEXEHIOWRROKKon7w+OKt8SeRUHxM
         3WRg==
X-Gm-Message-State: APjAAAVLCBNMJgatZBDIYscBGbQiVLmhvnzVyE+Phpj/a7WSDH9Vh6IY
        ebLrOgIuoB9Jxk4kVTTo3Iy02SMO+Ww=
X-Google-Smtp-Source: APXvYqyERwmax0sC1RyTG7KFyXfFZni7qzPa74QcVfX/uknr9GP0QqxL/mjzRx7UwkrSgs8q2NzRVw==
X-Received: by 2002:a63:f455:: with SMTP id p21mr16808730pgk.430.1583115769152;
        Sun, 01 Mar 2020 18:22:49 -0800 (PST)
Received: from xps.vpn2.bfsu.edu.cn ([103.125.232.133])
        by smtp.gmail.com with ESMTPSA id c3sm19749124pfj.159.2020.03.01.18.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 18:22:48 -0800 (PST)
From:   YunQiang Su <syq@debian.org>
To:     linux-mips@vger.kernel.org
Cc:     YunQiang Su <syq@debian.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] Use ELF_BASE_PLATFORM to pass ISA level
Date:   Mon,  2 Mar 2020 10:22:10 +0800
Message-Id: <20200302022209.82874-1-syq@debian.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some userland application/program runtime/dynamic loaded need to
know about the current ISA level to use the best runtime.
While kernel doesn't provides this info.

ELF_PLATFORM only provides some info about the CPU, with very few info,
for example, the value is "mips" for both 24Kc and P6600.

Currently ELF_BASE_PLATFORM is not used by MIPS (only by powerpc).
So we cant set its value as:
  mips2, mips3, mips4, mips5,
  mips32, mips32r2, mips32r6
  mips64, mips64r2, mips64r6
Then in userland, we can get it by:
  getauxval(AT_BASE_PLATFORM)

The only problem is that it seems has different defination than ppc:
  on ppc, it is the mircoarchitecture
while now we use it as ISA level on MIPS.

v1->v2:
  add Signed-off-by and Reviewer-by Jiaxun Yang.

Signed-off-by: YunQiang Su <syq@debian.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/elf.h  |  3 +++
 arch/mips/kernel/cpu-probe.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index f8f44b1a6cbb..5aa29ced6970 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -445,6 +445,9 @@ extern unsigned int elf_hwcap;
 #define ELF_PLATFORM  __elf_platform
 extern const char *__elf_platform;
 
+#define ELF_BASE_PLATFORM  __elf_base_platform
+extern const char *__elf_base_platform;
+
 /*
  * See comments in asm-alpha/elf.h, this is the same thing
  * on the MIPS.
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6ab6b03d35ba..925cc1c9bb04 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -513,6 +513,13 @@ static inline void set_elf_platform(int cpu, const char *plat)
 		__elf_platform = plat;
 }
 
+static inline void set_elf_base_platform(const char *plat)
+{
+	if(__elf_base_platform == NULL) {
+		__elf_base_platform = plat;
+	}
+}
+
 static inline void cpu_probe_vmbits(struct cpuinfo_mips *c)
 {
 #ifdef __NEED_VMBITS_PROBE
@@ -527,36 +534,46 @@ static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 	switch (isa) {
 	case MIPS_CPU_ISA_M64R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2;
+		set_elf_base_platform("mips64r2");
 		/* fall through */
 	case MIPS_CPU_ISA_M64R1:
 		c->isa_level |= MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1;
+		set_elf_base_platform("mips64");
 		/* fall through */
 	case MIPS_CPU_ISA_V:
 		c->isa_level |= MIPS_CPU_ISA_V;
+		set_elf_base_platform("mips5");
 		/* fall through */
 	case MIPS_CPU_ISA_IV:
 		c->isa_level |= MIPS_CPU_ISA_IV;
+		set_elf_base_platform("mips4");
 		/* fall through */
 	case MIPS_CPU_ISA_III:
 		c->isa_level |= MIPS_CPU_ISA_II | MIPS_CPU_ISA_III;
+		set_elf_base_platform("mips3");
 		break;
 
 	/* R6 incompatible with everything else */
 	case MIPS_CPU_ISA_M64R6:
 		c->isa_level |= MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6;
+		set_elf_base_platform("mips64r6");
 		/* fall through */
 	case MIPS_CPU_ISA_M32R6:
 		c->isa_level |= MIPS_CPU_ISA_M32R6;
+		set_elf_base_platform("mips32r6");
 		/* Break here so we don't add incompatible ISAs */
 		break;
 	case MIPS_CPU_ISA_M32R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2;
+		set_elf_base_platform("mips32r2");
 		/* fall through */
 	case MIPS_CPU_ISA_M32R1:
 		c->isa_level |= MIPS_CPU_ISA_M32R1;
+		set_elf_base_platform("mips32");
 		/* fall through */
 	case MIPS_CPU_ISA_II:
 		c->isa_level |= MIPS_CPU_ISA_II;
+		set_elf_base_platform("mips2");
 		break;
 	}
 }
@@ -2113,6 +2130,7 @@ EXPORT_SYMBOL(__ua_limit);
 
 const char *__cpu_name[NR_CPUS];
 const char *__elf_platform;
+const char *__elf_base_platform = NULL;
 
 void cpu_probe(void)
 {
-- 
2.25.1

