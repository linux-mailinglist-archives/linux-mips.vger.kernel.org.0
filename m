Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07CF17CB41
	for <lists+linux-mips@lfdr.de>; Sat,  7 Mar 2020 03:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCGCkA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 21:40:00 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51906 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgCGCkA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 21:40:00 -0500
Received: by mail-pj1-f66.google.com with SMTP id l8so1833345pjy.1
        for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2020 18:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/PYJGRzQmimSAvSQHaGo5LMuhfMKUlOC/rsfnayuWw=;
        b=IcrO2js9BYfDwQNS1d+iWMcQANomCVxyKwhkdQrac+YTAUxL+1SQhmipVv/PFLaLkX
         +ag7g/3wxhBzWpvPOz5Ez+QgYb+DCOvw650jy0XYzB8a7/VCFtvAYpzb60E5hWD4g8y+
         KlB9rUKWTH0vkzv1rHDhERQTVPOCWIjdwuGj806GoRLokcgOjKSl+2cTtLGdN+0OvO89
         yIm7ObUh0RsVF/KbV44mi7Ut/hjbVyhPsi8cl1LfxJUlkTMxeMS+lG/caxaid6qbd3Zk
         bHw+z+brd7pY1now0NO8J0Vcn2DP6yohvnUam3L43aedu+mder9yIZgNYl+ENkYSsp+z
         sHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=H/PYJGRzQmimSAvSQHaGo5LMuhfMKUlOC/rsfnayuWw=;
        b=fM3OB6ZFU5ni/0C6scmyonrQKM1T8lGOdZgl5MNdIR70Vmzv8NketqJgYrrT2wa5Cc
         rDOMaf5Qne36zIX270e8NgeOhMAHb9lAWiw21ybb2Y6W4YwQfOatv04PlZ6xYn8gg0Q4
         5uXgHxgtgCste1655nKNZAZg3Rk8gWrTYtyKNvijbVG42MrccDHv4cgs99CqmiZsf2U7
         1GNInaraYh46yOcJLqoSXuG7XjyxdDQLGL8FbcBwlh/9r0uIHiuCG6ZR28A8xlW7ptsx
         guZITAxbU5FQSxK+xCoiDMFG/k7x6KTL5NiFsORhT/No2Fv0nntDleMq8ex7F8d+lhlH
         63KA==
X-Gm-Message-State: ANhLgQ21j6x5upykyBKk2Ag3ZI/7y3fDM5kPdMZLzkthf5Z0Z3AS6Hli
        T1rCbrtisEJKJrGiQCvxax4=
X-Google-Smtp-Source: ADFU+vtc0bjF38ptrCYErMkIfrc1bNR36cp+0jH2PH7WRmXHxktbcg29ENSG7eigf2p5NYgAEPu5BA==
X-Received: by 2002:a17:90a:198e:: with SMTP id 14mr6957277pji.44.1583548799100;
        Fri, 06 Mar 2020 18:39:59 -0800 (PST)
Received: from xps.vpn2.bfsu.edu.cn ([103.125.232.133])
        by smtp.gmail.com with ESMTPSA id 13sm36803205pfi.78.2020.03.06.18.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 18:39:58 -0800 (PST)
From:   YunQiang Su <syq@debian.org>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, YunQiang Su <syq@debian.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3] Use ELF_BASE_PLATFORM to pass ISA level
Date:   Sat,  7 Mar 2020 10:39:45 +0800
Message-Id: <20200307023945.191663-1-syq@debian.org>
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

v2->v3:
  no need to init static data with 0.
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
index 6ab6b03d35ba..82577d4e4ba1 100644
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
+const char *__elf_base_platform;
 
 void cpu_probe(void)
 {
-- 
2.25.1

