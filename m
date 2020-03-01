Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E19174AAC
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2020 02:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgCABlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Feb 2020 20:41:35 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52264 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCABlf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Feb 2020 20:41:35 -0500
Received: by mail-pj1-f68.google.com with SMTP id lt1so150419pjb.2
        for <linux-mips@vger.kernel.org>; Sat, 29 Feb 2020 17:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qObNXuCEIaYRypwXl6maXNi95BNqJoi/Ebtt/rzZN10=;
        b=lkDrPPNzfp81kVfpE5kjmv+txJ/N7mE7wyuuoX0InEZ9Re9d/SUKpWNT/PFRlHfiUS
         rt6VjPC5W36ql+eByu4oUxMmnM8fmZ1T8+F8NwfcZ8axx0J3O3if59pMxUj6b4QuQo66
         oIXeG9sB7OOZd5TM8OE8kmneRk4WN72KcGhkXyhlgwWVa3mi53HJLeUv7KGBiSJ/jpwC
         Fwg3bJkxBj95+CcKZb1S2O1kA/lEtuwncKaaO3+dWgJfl7B/OUQatb9WtyV1FalG1OKm
         GmdRL2wIAismh1giYHkMJey0y2DpcSdU1UBjxn+ZMoexNoxmBlrgATUH/AgGaaQ1eZtf
         kcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=qObNXuCEIaYRypwXl6maXNi95BNqJoi/Ebtt/rzZN10=;
        b=Xxhay57CQogCYM8XhPvuRyI4GHoxwEj31rbeJm7Z64ZpQ5d+DYMyBqsQliZzR6DoHn
         w9L3bKJU+XUN/87CenXrs0RukzaYrD6GbA7YSbXfzd4TkAXmZqLWxUkRrjUfL22BgpHB
         Rn6cqQuMsA4wTc3uHc1YKe+jXoS8gfKXm7z6cdo2fP+Rsgmtm9PjqoroOAFUPRmfqtuG
         lGbK8lNjGJzh/BW16W1cTUiPFf6dEMWGANt1NibuZsfshEB0uDudTr/NX3x5ntB9rGTD
         3hDXi0EjyfpmfOIx6ubk3epR/9v/PF1asLq9PHdke22ZvGf4qprgdQl9P12ooqSpPGLN
         1a8Q==
X-Gm-Message-State: ANhLgQ1UrNgXhw1sorbhLV6trIJCAjPQ1DeB6cy44yq3fU3R+W/y/Gfu
        roc8THjkEMYkpivPcEmN/o1ql2FVprpi+g==
X-Google-Smtp-Source: ADFU+vsDV0ztZhx0G9DMlWEr+4kWAZyCfEyr8tIZ5/cFUz+MyoiXkLW2vMY88LbLlNcb6CDvZTU/Og==
X-Received: by 2002:a17:90a:a48:: with SMTP id o66mr6904604pjo.66.1583026893590;
        Sat, 29 Feb 2020 17:41:33 -0800 (PST)
Received: from xps.vpn2.bfsu.edu.cn ([103.125.232.133])
        by smtp.gmail.com with ESMTPSA id a17sm7122777pjv.6.2020.02.29.17.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 17:41:32 -0800 (PST)
From:   YunQiang Su <syq@debian.org>
To:     linux-mips@vger.kernel.org
Cc:     YunQiang Su <syq@debian.org>
Subject: [PATCH] Use ELF_BASE_PLATFORM to pass ISA level
Date:   Sun,  1 Mar 2020 09:41:19 +0800
Message-Id: <20200301014119.62733-1-syq@debian.org>
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

