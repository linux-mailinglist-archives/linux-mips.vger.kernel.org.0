Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC70393C0F
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 05:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhE1Dtt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 23:49:49 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:45874 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhE1Dtt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 May 2021 23:49:49 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 14S3lbQR031425;
        Fri, 28 May 2021 12:47:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 14S3lbQR031425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622173658;
        bh=BV0Xhzu11ytLpeCNoa7cH4BZNQYYRY20XqustzLMqtw=;
        h=From:To:Cc:Subject:Date:From;
        b=UDTQuIN7y8sRPPl4Jpoku4ALmYQznnc2oqzi3Xg80Z2JM3zZE5+zTUbbjESFHL3tX
         NxFjiPzqv7pxqPwNcB1nCECxtQ1kF2x/4K3d98topILkLSlSGPeMAKGDA2dCksW16L
         fP1SyXQbsl4PYyiNxQR6GehUwtui0NxAZd4PzjvDaFDxsEu79R3i9Av5UU358quZCI
         raa4UId+c37NCMbeaEfgQ+5Jd5E0JVYxHzp1fsibGugJEYgzZXeN5Al0sd9sb0ufqy
         SwHol4hDQHPRj3D32yC+o53DZT86ei/BQXMLnkN6IsT3vwfma//xlRDV8UnF3FWp6j
         98fbENepqb53Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] mips: syscalls: define syscall offsets directly in <asm/unistd.h>
Date:   Fri, 28 May 2021 12:46:14 +0900
Message-Id: <20210528034615.2157002-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no good reason to generate the syscall offset macros by
scripting since they are not derived from the syscall tables.

Define __NR_*_Linux macros directly in arch/mips/include/asm/unistd.h,
and clean up the Makefile and the shell script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/include/asm/unistd.h         | 4 ++++
 arch/mips/kernel/syscalls/Makefile     | 6 +-----
 arch/mips/kernel/syscalls/syscallnr.sh | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/unistd.h b/arch/mips/include/asm/unistd.h
index 5d70babfc9ee..c2196b1b6604 100644
--- a/arch/mips/include/asm/unistd.h
+++ b/arch/mips/include/asm/unistd.h
@@ -17,6 +17,10 @@
 #include <asm/unistd_nr_n64.h>
 #include <asm/unistd_nr_o32.h>
 
+#define __NR_N32_Linux	6000
+#define __NR_64_Linux	5000
+#define __NR_O32_Linux	4000
+
 #ifdef CONFIG_MIPS32_N32
 #define NR_syscalls  (__NR_N32_Linux + __NR_N32_Linux_syscalls)
 #elif defined(CONFIG_64BIT)
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 904452992992..6eee6a3b85df 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -18,8 +18,7 @@ quiet_cmd_syshdr = SYSHDR  $@
 quiet_cmd_sysnr = SYSNR   $@
       cmd_sysnr = $(CONFIG_SHELL) '$(sysnr)' '$<' '$@'		\
 		  '$(sysnr_abis_$(basetarget))'			\
-		  '$(sysnr_pfx_$(basetarget))'			\
-		  '$(sysnr_offset_$(basetarget))'
+		  '$(sysnr_pfx_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
@@ -34,17 +33,14 @@ $(uapi)/unistd_o32.h: $(syscallo32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 sysnr_pfx_unistd_nr_n32 := N32
-sysnr_offset_unistd_nr_n32 := 6000
 $(kapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 sysnr_pfx_unistd_nr_n64 := 64
-sysnr_offset_unistd_nr_n64 := 5000
 $(kapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 sysnr_pfx_unistd_nr_o32 := O32
-sysnr_offset_unistd_nr_o32 := 4000
 $(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
diff --git a/arch/mips/kernel/syscalls/syscallnr.sh b/arch/mips/kernel/syscalls/syscallnr.sh
index 60bbdb3fe03a..c190bbefbfc2 100644
--- a/arch/mips/kernel/syscalls/syscallnr.sh
+++ b/arch/mips/kernel/syscalls/syscallnr.sh
@@ -5,7 +5,6 @@ in="$1"
 out="$2"
 my_abis=`echo "($3)" | tr ',' '|'`
 prefix="$4"
-offset="$5"
 
 fileguard=_UAPI_ASM_MIPS_`basename "$out" | sed \
 	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
@@ -20,7 +19,6 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 		nxt=$((nr+1))
 	done
 
-	printf "#define __NR_%s_Linux\t%s\n" "${prefix}" "${offset}"
 	printf "#define __NR_%s_Linux_syscalls\t%s\n" "${prefix}" "${nxt}"
 	printf "\n"
 	printf "#endif /* %s */" "${fileguard}"
-- 
2.27.0

