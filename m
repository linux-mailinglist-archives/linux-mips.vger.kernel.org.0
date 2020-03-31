Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA7F198A76
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 05:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgCaDZ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 23:25:56 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:39874 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727614AbgCaDZ4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 23:25:56 -0400
Received: from [192.168.1.13] (c-73-173-172-109.hsd1.md.comcast.net [73.173.172.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 0503534EF51;
        Tue, 31 Mar 2020 03:25:54 +0000 (UTC)
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] Add missing ifdefs to SGI Platform files for IP22, IP32
Openpgp: preference=signencrypt
Message-ID: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
Date:   Mon, 30 Mar 2020 23:25:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The attached patch fixes the SGI-specific Platform files to only be
included when their specific platform is actually built.  Both the
IP27 and IP30 Platform files already have such ifdefs in place.  This
patch adds the same to the IP22 and IP32 Platform files.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/sgi-ip22/Platform |    8 +++++---
 arch/mips/sgi-ip32/Platform |    2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
index e8f6b3a42a48..cffd31e3b230 100644
--- a/arch/mips/sgi-ip22/Platform
+++ b/arch/mips/sgi-ip22/Platform
@@ -7,7 +7,8 @@
 # current variable will break so for 64-bit kernels we have to raise the start
 # address by 8kb.
 #
-platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
+ifdef CONFIG_SGI_IP22
+platform-$(CONFIG_SGI_IP22)	+= sgi-ip22/
 cflags-$(CONFIG_SGI_IP22)	+= -I$(srctree)/arch/mips/include/asm/mach-ip22
 ifdef CONFIG_32BIT
 load-$(CONFIG_SGI_IP22)		+= 0xffffffff88002000
@@ -15,6 +16,7 @@ endif
 ifdef CONFIG_64BIT
 load-$(CONFIG_SGI_IP22)		+= 0xffffffff88004000
 endif
+endif
 
 #
 # SGI IP28 (Indigo2 R10k)
@@ -28,7 +30,7 @@ ifdef CONFIG_SGI_IP28
   ifeq ($(call cc-option-yn,-march=r10000 -mr10k-cache-barrier=store), n)
       $(error gcc doesn't support needed option -mr10k-cache-barrier=store)
   endif
-endif
-platform-$(CONFIG_SGI_IP28)		+= sgi-ip22/
+platform-$(CONFIG_SGI_IP28)	+= sgi-ip22/
 cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/include/asm/mach-ip28
 load-$(CONFIG_SGI_IP28)		+= 0xa800000020004000
+endif
diff --git a/arch/mips/sgi-ip32/Platform b/arch/mips/sgi-ip32/Platform
index 589930560088..7db2c1f05d89 100644
--- a/arch/mips/sgi-ip32/Platform
+++ b/arch/mips/sgi-ip32/Platform
@@ -6,8 +6,10 @@
 # a multiple of the kernel stack size or the handling of the current variable
 # will break.
 #
+ifdef CONFIG_SGI_IP32
 platform-$(CONFIG_SGI_IP32)	+= sgi-ip32/
 cflags-$(CONFIG_SGI_IP32)	+= -I$(srctree)/arch/mips/include/asm/mach-ip32
 cflags-$(CONFIG_CPU_R10000)		+= -mr10k-cache-barrier=load-store
 cflags-$(CONFIG_CPU_R12K_R14K_R16K)	+= -mno-fix-r10000 -mr10k-cache-barrier=load-store
 load-$(CONFIG_SGI_IP32)		+= 0xffffffff80004000
+endif
