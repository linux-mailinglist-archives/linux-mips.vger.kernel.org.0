Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A0D3BAFB1
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 01:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhGDXEv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Jul 2021 19:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhGDXEu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Jul 2021 19:04:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24F7C061574;
        Sun,  4 Jul 2021 16:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=qGKjvTeOq2wVieAO64GDRo6lQa4uNDDRgX732R6pMwY=; b=LrPQm0tUyO6JU9ydJtWYfxbsri
        f2P8ZTTr0grwfWXHwdQ9JawjqPOvuT6o1WNSTAYCEgEm8k9SWX0/o+ULsKx7x1/583BMxeHNnb0X8
        QfQRVQTSis5r+YsCOJgTRjPJkO6Kh0o8PRmXLHHhNRWaMXHkKbyM2zLW/saCQ5DLmYMjzwP45svNK
        p705stBc+o46sR0bBWjOA1snQ1OpSPYciZ1EgZ1i+t4I+33V1gAN1OVidyC3g8odUOdCvzh75ag11
        5/CmV8uL6IFddgvUw7YWOTqAYZTdmS3cLvT9IWaSFBKaThY75EkbjqFLZzScUBjFC+ww4hSEjLReD
        LsSIhx9g==;
Received: from [2601:1c0:6280:3f0:7629:afff:fe72:e49d] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m0B7s-006sEi-K5; Sun, 04 Jul 2021 23:02:12 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Kyungsik Lee <kyungsik.lee@lge.com>
Subject: [PATCH] mips: disable branch profiling in boot/decompress.o
Date:   Sun,  4 Jul 2021 16:02:11 -0700
Message-Id: <20210704230211.31257-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use DISABLE_BRANCH_PROFILING for arch/mips/boot/compressed/decompress.o
to prevent linkage errors.

mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `LZ4_decompress_fast_extDict':
decompress.c:(.text+0x8c): undefined reference to `ftrace_likely_update'
mips64-linux-ld: decompress.c:(.text+0xf4): undefined reference to `ftrace_likely_update'
mips64-linux-ld: decompress.c:(.text+0x200): undefined reference to `ftrace_likely_update'
mips64-linux-ld: decompress.c:(.text+0x230): undefined reference to `ftrace_likely_update'
mips64-linux-ld: decompress.c:(.text+0x320): undefined reference to `ftrace_likely_update'
mips64-linux-ld: arch/mips/boot/compressed/decompress.o:decompress.c:(.text+0x3f4): more undefined references to `ftrace_likely_update' follow

Fixes: e76e1fdfa8f8 ("lib: add support for LZ4-compressed kernel")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Kyungsik Lee <kyungsik.lee@lge.com>
---
 arch/mips/boot/compressed/decompress.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20210701.orig/arch/mips/boot/compressed/decompress.c
+++ linux-next-20210701/arch/mips/boot/compressed/decompress.c
@@ -7,6 +7,8 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
+#define DISABLE_BRANCH_PROFILING
+
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
