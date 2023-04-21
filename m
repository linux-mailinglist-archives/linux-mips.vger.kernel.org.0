Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D8B6EB2ED
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 22:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjDUUbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 16:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDUUbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 16:31:22 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B53919B3
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 13:31:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ed8d:a29e:2b31:5e96])
        by albert.telenet-ops.be with bizsmtp
        id nYXB2900E3ESaBb06YXB6H; Fri, 21 Apr 2023 22:31:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1ppxPT-000CKc-HJ;
        Fri, 21 Apr 2023 22:31:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pps9Z-000FzO-6K;
        Fri, 21 Apr 2023 16:54:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] libgcc: Add forward declarations for generic library routines
Date:   Fri, 21 Apr 2023 16:54:24 +0200
Message-Id: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With W=1 on platforms that use the generic gcc library routines
(csky/loongarch/mips/riscv/sh/xtensa):

    lib/ashldi3.c:9:19: warning: no previous prototype for '__ashldi3' [-Wmissing-prototypes]
	9 | long long notrace __ashldi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/ashrdi3.o
    lib/ashrdi3.c:9:19: warning: no previous prototype for '__ashrdi3' [-Wmissing-prototypes]
	9 | long long notrace __ashrdi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/cmpdi2.o
    lib/cmpdi2.c:9:19: warning: no previous prototype for '__cmpdi2' [-Wmissing-prototypes]
	9 | word_type notrace __cmpdi2(long long a, long long b)
	  |                   ^~~~~~~~
      CC      lib/lshrdi3.o
    lib/lshrdi3.c:9:19: warning: no previous prototype for '__lshrdi3' [-Wmissing-prototypes]
	9 | long long notrace __lshrdi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/muldi3.o
    lib/muldi3.c:49:19: warning: no previous prototype for '__muldi3' [-Wmissing-prototypes]
       49 | long long notrace __muldi3(long long u, long long v)
	  |                   ^~~~~~~~
      CC      lib/ucmpdi2.o
    lib/ucmpdi2.c:8:19: warning: no previous prototype for '__ucmpdi2' [-Wmissing-prototypes]
	8 | word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
	  |                   ^~~~~~~~~

Fix this by adding forward declarations to the common libgcc header
file.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/libgcc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
index b8dc75f0c8308bd4..fc388da6a027faaf 100644
--- a/include/linux/libgcc.h
+++ b/include/linux/libgcc.h
@@ -27,4 +27,11 @@ typedef union {
 	long long ll;
 } DWunion;
 
+long long notrace __ashldi3(long long u, word_type b);
+long long notrace __ashrdi3(long long u, word_type b);
+word_type notrace __cmpdi2(long long a, long long b);
+long long notrace __lshrdi3(long long u, word_type b);
+long long notrace __muldi3(long long u, long long v);
+word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b);
+
 #endif /* __ASM_LIBGCC_H */
-- 
2.34.1

