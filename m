Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BB744AFF7
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbhKIPE7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:04:59 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:49280 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbhKIPE6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 10:04:58 -0500
X-Greylist: delayed 168096 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Nov 2021 10:04:58 EST
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1A9F1mTt012230;
        Wed, 10 Nov 2021 00:01:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1A9F1mTt012230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636470108;
        bh=/ijbM1TP6K+JTP7BiPh1WBRya5K6GRIV8U9h0I8JScs=;
        h=From:To:Cc:Subject:Date:From;
        b=zXzDGBnDPOrHRZXkE4rN0IXgnOBuTn78Mq9FB2Z1XFV5hHfG1gTxc8xyj4ghBVhmU
         LuErClpZhazvGX/MFWxCQsdxN7VMt3YRoHmLjXZp+uG0VcdGmeT4l86y33HYqZSaYO
         i2oz0xtaD252/fWpG476VgCbx/HwbrWfXxGAIus93Y4ZGRdHATDY+ByX2krFTVAqdY
         IF4RpDywGwf8SVNfG0g49ZXI+RoJCz3o5HkQku50Hpmo9Ce+PCHMaKH2zHBCScHM+b
         zIglKVVC3Etiw5+/NA2B+Pucg37gBjULRoMK76crIK167RviB6jLW7IhF2UmjHQaFA
         KYoerpqWtEu3g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jason Self <jason@bluehome.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: fix *-pkg builds for loongson2ef platform
Date:   Wed, 10 Nov 2021 00:01:45 +0900
Message-Id: <20211109150146.529428-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 805b2e1d427a ("kbuild: include Makefile.compiler only when
compiler is needed"), package builds for the loongson2f platform fail.

  $ make ARCH=mips CROSS_COMPILE=mips64-linux- lemote2f_defconfig bindeb-pkg
    [ snip ]
  sh ./scripts/package/builddeb
  arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.
  cp: cannot stat '': No such file or directory
  make[5]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
  make[4]: *** [Makefile:1558: intdeb-pkg] Error 2
  make[3]: *** [debian/rules:13: binary-arch] Error 2
  dpkg-buildpackage: error: debian/rules binary subprocess returned exit status 2
  make[2]: *** [scripts/Makefile.package:83: bindeb-pkg] Error 2
  make[1]: *** [Makefile:1558: bindeb-pkg] Error 2
  make: *** [Makefile:350: __build_one_by_one] Error 2

The reason is because "make image_name" fails.

  $ make ARCH=mips CROSS_COMPILE=mips64-linux- image_name
  arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.

In general, adding $(error ...) in the parse stage is troublesome,
and it is pointless to check toolchains even if we are not building
anything. Do not include Kbuild.platform in such cases.

Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
Reported-by: Jason Self <jason@bluehome.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e036fc025ccc..ace7f033de07 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -253,7 +253,9 @@ endif
 #
 # Board-dependent options and extra files
 #
+ifdef need-compiler
 include $(srctree)/arch/mips/Kbuild.platforms
+endif
 
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
-- 
2.30.2

