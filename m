Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6E01A630D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 08:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgDMG1T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 02:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbgDMG1S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 02:27:18 -0400
X-Greylist: delayed 3189 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Apr 2020 23:27:19 PDT
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6552FC0A3BE0;
        Sun, 12 Apr 2020 23:27:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 0EDB420D11;
        Mon, 13 Apr 2020 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1586759239; bh=Vr/QKJmn73LsQz9h411hekE4ProVb37szEZ2JtPfMcg=;
        h=From:To:Cc:Subject:Date:From;
        b=mSzmbvslStPKEzYu6kGPH/siw/nx7AViyUvyKLnBiw/cDiwZbiLCJ97To7Aa54/Z4
         W+EWzspz9fxkpcd3FWu1aDZr2bdLHtwCFrJMtD+KVGE1zvcwnDXCE9mkN5C68dKv0N
         7ZxjK4FTBmLSOjzPN0Aqbxsv/VFk+zms6jziMg9om3jonp/idpejbByMMBcI4j0Aws
         qvcureHtpYO1BjqyREl43uLh1vyZKflg1qilTXC/DFjugn3RPrBlYLOlNA1kXhLsu8
         RWaDIkuNWEVlVseGul6aTPrT2t+eI8Do2pCZR4rQGySPDR93YLqAFzl6VknpbY40TK
         WYzgNo3n7Ar+w==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     macro@linux-mips.org, clang-built-linux@googlegroups.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit kernel
Date:   Mon, 13 Apr 2020 14:26:49 +0800
Message-Id: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
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
Cc: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
--
V2: Take MaskRay's shell magic.

V3: After spent an hour on dealing with special character issue in
Makefile, I gave up to do shell hacks and write a util in C instead.
Thanks Maciej for pointing out Makefile variable problem.

v4: Finally we managed to find a Makefile method to do it properly
thanks to Kees. As it's too far from the initial version, I removed
Review & Test tag from Nick and Fangrui and Cc instead.
---
 arch/mips/Makefile             | 12 +++++++++++-
 arch/mips/kernel/vmlinux.lds.S |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..18495568f03e 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -288,9 +288,19 @@ ifdef CONFIG_64BIT
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

