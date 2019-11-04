Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C468BED8D3
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 07:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfKDGGv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 01:06:51 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46291 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 01:06:50 -0500
Received: by mail-pl1-f196.google.com with SMTP id l4so1882570plt.13
        for <linux-mips@vger.kernel.org>; Sun, 03 Nov 2019 22:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Y+K+eizvhtduEPP08+eakUfAqCo51Wj7kF/XllEJDMI=;
        b=V5Ri5uwf+lwVjlgKmFd2w87MiKMSXywRU82G2yFM4qAV58MD7/8kzuly8JJ/oorsl/
         T4fCMMT7a/n6xxrsh8lUYZBA9YzbnezieEs1THYRvZrzUen8yqJ2tNAWLTil9/74aQu+
         hmJAI3V/wE1zuw8XucRcDLjVzqZPsfKdN6xIjTzKs39GKTOPjfG7nfKJ64X8g4ITSAbg
         FnGhA6HrEEfO8aduJORrSjxjBuPQzNrYoQBcuQpskRcRRwufs33JEySU9LGS7Nvo3Bop
         fDLve5Fi6tjozadCTKSav3yfn9IJZJejPHweI6m5rXWyxtzAu9E3IyxkDfilS1jgYr+a
         hMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Y+K+eizvhtduEPP08+eakUfAqCo51Wj7kF/XllEJDMI=;
        b=pTRzidAZ2h2ojap4EyxZngcxdEWzwoohNr675oOHUq2jwa7nYqKHZMfBjC1Cpv34Fy
         5ubM2e+2ukJb7jMTaUNPjmjH9xxPE2fPuuttjSQZlgzuIZvGt+PTtyfvkVIFxS0pOZHl
         j8J+5/zUfbGq75LzFfpLAkD9rZJpckzoQ/xXe8hsM25xlIoqc+4W+XvAkC7Wg6aO9mkX
         MWjqosO6I7p/9QLTGvh89FjjhwxmRiGC8HX7GuAPmhlFqzoqMMi6mHJGDz+KFtamEl/A
         tbz44948NwqC0rBXqn6H1SSE3BQIs0lt/vwcerC+ShOx9eWjcJKcVwdOyH/WNeGH0kwA
         HShQ==
X-Gm-Message-State: APjAAAX2ofVqv+ZAG8E7VxcefkdW9oLp0rNGLwI7eWZWmAxodmd+6gpJ
        6oRXjVR1+v2giyS20NSGG+0=
X-Google-Smtp-Source: APXvYqw+HPr0mkUOk69+9tn0vkn5Ym6Q5FDDTwDLxzmc7jHEx8Bkt4oTkdI7clFvTk3Bu0LqmoqwkQ==
X-Received: by 2002:a17:902:ab91:: with SMTP id f17mr25507831plr.136.1572847610180;
        Sun, 03 Nov 2019 22:06:50 -0800 (PST)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id q184sm15061354pfc.111.2019.11.03.22.06.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 03 Nov 2019 22:06:49 -0800 (PST)
From:   Huacai Chen <chenhc@lemote.com>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2] MIPS: Loongson: Add board_ebase_setup() support
Date:   Mon,  4 Nov 2019 14:09:41 +0800
Message-Id: <1572847781-21652-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Old processors before Loongson-3A2000 have a 32bit ebase register and
have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
register and do have the WG bit. Unfortunately, Loongson processors
which have the WG bit are slightly different from MIPS R2. This makes
the generic ebase setup not suitable for every scenarios.

To make Loongson's kernel be more robust, we add a board_ebase_setup()
hook to ensure that CKSEG0 is always used for ebase. This is also useful
on platforms where BIOS doesn't initialise an appropriate ebase.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/cpu-probe.c       |  6 ++++--
 arch/mips/loongson64/common/init.c | 11 +++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 671bc6f..7312a0d 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1923,7 +1923,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		}
 
 		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV |
+			      MIPS_CPU_LDPTE | MIPS_CPU_EBASE_WG;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
@@ -1934,7 +1935,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
 		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV |
+			      MIPS_CPU_LDPTE | MIPS_CPU_EBASE_WG;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 912fe61..8e2047d 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -15,6 +15,16 @@
 
 #include <loongson.h>
 
+static void __init mips_ebase_setup(void)
+{
+	ebase = CKSEG0;
+
+	if (cpu_has_ebase_wg)
+		write_c0_ebase(ebase | MIPS_EBASE_WG);
+
+	write_c0_ebase(ebase);
+}
+
 static void __init mips_nmi_setup(void)
 {
 	void *base;
@@ -48,6 +58,7 @@ void __init prom_init(void)
 	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
 
 	register_smp_ops(&loongson3_smp_ops);
+	board_ebase_setup = mips_ebase_setup;
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
-- 
2.7.0

