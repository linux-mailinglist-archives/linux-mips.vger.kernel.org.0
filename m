Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8049138BDD1
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 07:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhEUFPJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 May 2021 01:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhEUFPI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 May 2021 01:15:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22195C061574;
        Thu, 20 May 2021 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=cPuODHn3Uj81CuVdCh94AAqqpvQg+E4P822iNSf3Cpc=; b=xwbgJ5kHBE1m5bZU/wfA018OiZ
        kq9KLm+uWUqkAevhmWnsOPYH3kAwl9GxClubDV+bd7hE/vBwYNmctJZ03ukCSMqdoA4qkxo4jKrXk
        Lkn7M1LXEV/nGskZVhDsrhJ/fCfbALc0q+PyKoVQqMG7imQc+9DaYBgYqGJrwOvJYAK9IXwbsA2s1
        bre1wzv+xCbxzGx4i/wgGfUEECykvA8YhwwJowPYglVx8DU3OGMHINSj6U54uERKeQ62taVr0psVx
        jDN5z9qg5SN3TZQgo/z9BP5Nxdpg2CP7n9EgZjp0RNeOkFBMYm9Lohx/4/zq/qA+9Kg+S1MHFBa8B
        p4I0WKEw==;
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1ljxTk-00Gp89-Kf; Fri, 21 May 2021 05:13:44 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH] MIPS: launch.h: add include guard to prevent build errors
Date:   Thu, 20 May 2021 22:13:43 -0700
Message-Id: <20210521051343.20059-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/include/asm/mips-boards/launch.h needs an include guard
to prevent it from being #included more than once.
Prevents these build errors:

In file included from ../arch/mips/mti-malta/malta-amon.c:16:
../arch/mips/include/asm/mips-boards/launch.h:8:8: error: redefinition of 'struct cpulaunch'
    8 | struct cpulaunch {
      |        ^~~~~~~~~
In file included from ../arch/mips/include/asm/mips-cps.h:13,
                 from ../arch/mips/include/asm/smp-ops.h:16,
                 from ../arch/mips/include/asm/smp.h:21,
                 from ../include/linux/smp.h:114,
                 from ../arch/mips/mti-malta/malta-amon.c:12:
../arch/mips/include/asm/mips-boards/launch.h:8:8: note: originally defined here
    8 | struct cpulaunch {
      |        ^~~~~~~~~
make[3]: [../scripts/Makefile.build:273: arch/mips/mti-malta/malta-amon.o] Error 1 (ignored)

Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/mips-boards/launch.h |    5 +++++
 1 file changed, 5 insertions(+)

--- linux-next-20210520.orig/arch/mips/include/asm/mips-boards/launch.h
+++ linux-next-20210520/arch/mips/include/asm/mips-boards/launch.h
@@ -3,6 +3,9 @@
  *
  */
 
+#ifndef _ASM_MIPS_BOARDS_LAUNCH_H
+#define _ASM_MIPS_BOARDS_LAUNCH_H
+
 #ifndef _ASSEMBLER_
 
 struct cpulaunch {
@@ -34,3 +37,5 @@ struct cpulaunch {
 
 /* Polling period in count cycles for secondary CPU's */
 #define LAUNCHPERIOD	10000
+
+#endif /* _ASM_MIPS_BOARDS_LAUNCH_H */
