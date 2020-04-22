Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0041B4760
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgDVOdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgDVOdf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:33:35 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27401C03C1A9;
        Wed, 22 Apr 2020 07:33:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 28E9220CE6;
        Wed, 22 Apr 2020 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587566003; bh=AZkjRTYvRWUO+/A/Rmcb3WsrGcXYmTEk7WiFNjJa+tw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N8HBeMWyafIUfveHvGcYAliOblIIn2gyhgYRwoses/QbIqLRIMygdUK4aYI1V3Q/F
         tv27rC62GofhAS1BLhTBpoUvLA0wrNnPHUsJZ22hGysVMJaM6iZHfuqpaQXYTkP2NM
         l/qxVdxOBtqx/B1iPn/WF8prur8zSQsg5iDY6uXHLESAvKiRI47LVDOeWold1aoTmY
         8oLTfuHJ54XnfY74wEqq2mdGgWRK81ssiJqrnCOXzwgkT1roUGjUGsjjYfJnnBUl4R
         9+nSE5T06Q/jqWiB1ymvlcvqaYTy+Pe5owRCjlH59C7s7Fu+eC/57AceuQPo5Fakq1
         WzE3x5d/e2GFQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit kernel
Date:   Wed, 22 Apr 2020 22:32:54 +0800
Message-Id: <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLD failed to link vmlinux with 64bit load address for 32bit ELF
while bfd will strip 64bit address into 32bit silently.
To fix LLD build, we should truncate load address provided by platform
into 32bit for 32bit kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/786
Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
--
V2: Take MaskRay's shell magic.

V3: After spent an hour on dealing with special character issue in
Makefile, I gave up to do shell hacks and write a util in C instead.
Thanks Maciej for pointing out Makefile variable problem.

v4: Finally we managed to find a Makefile method to do it properly
thanks to Kees. As it's too far from the initial version, I removed
Review & Test tag from Nick and Fangrui and Cc instead.

v5: Care vmlinuz as well.
---
 arch/mips/Makefile                 | 13 ++++++++++++-
 arch/mips/boot/compressed/Makefile |  2 +-
 arch/mips/kernel/vmlinux.lds.S     |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..68c0f22fefc0 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -288,12 +288,23 @@ ifdef CONFIG_64BIT
   endif
 endif
 
+# When linking a 32-bit executable the LLVM linker cannot cope with a
+# 32-bit load address that has been sign-extended to 64 bits.  Simply
+# remove the upper 32 bits then, as it is safe to do so with other
+# linkers.
+ifdef CONFIG_64BIT
+	load-ld			= $(load-y)
+else
+	load-ld			= $(subst 0xffffffff,0x,$(load-y))
+endif
+
 KBUILD_AFLAGS	+= $(cflags-y)
 KBUILD_CFLAGS	+= $(cflags-y)
-KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y)
+KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DVMLINUX_LINK_ADDRESS=$(load-ld)
 KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
 
 bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y) \
+		  VMLINUX_LINK_ADDRESS=$(load-ld) \
 		  VMLINUX_ENTRY_ADDRESS=$(entry-y) \
 		  PLATFORM="$(platform-y)" \
 		  ITS_INPUTS="$(its-y)"
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 0df0ee8a298d..3d391256ab7e 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -90,7 +90,7 @@ ifneq ($(zload-y),)
 VMLINUZ_LOAD_ADDRESS := $(zload-y)
 else
 VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
-		$(obj)/vmlinux.bin $(VMLINUX_LOAD_ADDRESS))
+		$(obj)/vmlinux.bin $(VMLINUX_LINK_ADDRESS))
 endif
 UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
 
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index a5f00ec73ea6..5226cd8e4bee 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -55,7 +55,7 @@ SECTIONS
 	/* . = 0xa800000000300000; */
 	. = 0xffffffff80300000;
 #endif
-	. = VMLINUX_LOAD_ADDRESS;
+	. = VMLINUX_LINK_ADDRESS;
 	/* read-only */
 	_text = .;	/* Text and read-only data */
 	.text : {
-- 
2.26.0.rc2

