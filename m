Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376B424687
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 06:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbfEUEEQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 00:04:16 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:43888 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfEUEEQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 00:04:16 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x4L43VVg010681;
        Tue, 21 May 2019 13:03:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x4L43VVg010681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558411413;
        bh=ih2ZgqObaUdBXIDdXtMeo+bCR3hhcOxpcDhp2NN3U6o=;
        h=From:To:Cc:Subject:Date:From;
        b=yLwaFzBsZMFY3pUDNfsPLXeEG1WjIBeu6gW7czqLdlKBc2OL/weJLUrEwe740+eCh
         U71t8T5NMJLw+aVWa238Y1vQnbt2+eZSESUNdLizoO49WjGeibChXqnZW+eMR/BMR5
         xnQuj36WWvepgundBru/xONXsknEloGGu1T3E3QmddgjyUC00u3nlPfvAcsDP4cXmX
         hqxZOOC+Ie5BZvEuROyHw7jJ3MzprY78OWoD9SDyBsVHeVvlw23/4BaWQGLyYnBoW6
         mvk8+4SaQeonazNpeO8wBE+Q2CDo4fsmiyGMsi3GU4d/09hvEMXh2WAXg4i/HLo1nK
         T603/ikgWFlvA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: remove a space after -I to cope with header search paths for VDSO
Date:   Tue, 21 May 2019 13:03:27 +0900
Message-Id: <20190521040327.432-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 9cc342f6c4a0 ("treewide: prefix header search paths with
$(srctree)/") caused a build error for MIPS VDSO.

  CC      arch/mips/vdso/gettimeofday.o
In file included from ../arch/mips/vdso/vdso.h:26,
                 from ../arch/mips/vdso/gettimeofday.c:11:
../arch/mips/include/asm/page.h:12:10: fatal error: spaces.h: No such file or directory
 #include <spaces.h>
          ^~~~~~~~~~

The cause of the error is a missing space after the compiler flag -I .

Kbuild used to have a global restriction "no space after -I", but
commit 48f6e3cf5bc6 ("kbuild: do not drop -I without parameter") got
rid of it. Having a space after -I is no longer a big deal as far as
Kbuild is concerned.

It is still a big deal for MIPS because arch/mips/vdso/Makefile
filters the header search paths, like this:

  ccflags-vdso := \
          $(filter -I%,$(KBUILD_CFLAGS)) \

..., which relies on the assumption that there is no space after -I .

Fixes: 9cc342f6c4a0 ("treewide: prefix header search paths with $(srctree)/")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/mips/pnx833x/Platform | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pnx833x/Platform b/arch/mips/pnx833x/Platform
index 6b1a847d593f..287260669551 100644
--- a/arch/mips/pnx833x/Platform
+++ b/arch/mips/pnx833x/Platform
@@ -1,5 +1,5 @@
 # NXP STB225
 platform-$(CONFIG_SOC_PNX833X)	+= pnx833x/
-cflags-$(CONFIG_SOC_PNX833X)	+= -I $(srctree)/arch/mips/include/asm/mach-pnx833x
+cflags-$(CONFIG_SOC_PNX833X)	+= -I$(srctree)/arch/mips/include/asm/mach-pnx833x
 load-$(CONFIG_NXP_STB220)	+= 0xffffffff80001000
 load-$(CONFIG_NXP_STB225)	+= 0xffffffff80001000
-- 
2.17.1

