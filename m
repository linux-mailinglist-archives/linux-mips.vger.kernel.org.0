Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5C13BAFB3
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 01:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhGDXFP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Jul 2021 19:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhGDXFP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Jul 2021 19:05:15 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF65C061574;
        Sun,  4 Jul 2021 16:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=9B0a3Ztl9RcM60o8edZX+9E+Ii3KrcToRHUi92NLsH4=; b=H4CLLKCjDINbXyoOpOEJGnUdzc
        qQid/R/Wk0VYraiGq0Of2LjXvI8jtrfqg9pkGz1eprIiC8A/LEkn4gvVi3oVNdbfGEqoOPmqZ8YrH
        WkJMRTS8Vqe7bLa7TCx/xYw7u0q7YSO7HxGkdROpRDUo0b1xVuaDM7rv9Qw7YuWwg57Jj6C9K0rVq
        W9XLkC28o8hHM+eiZN6SigivstniUiUUr4YBXSGYe+8K9D13FxN1BCBubCrJKOL5bEucMfzpDIlYU
        G2f4f8GklkfiflQIhq0tC123g0riTF/0i0bO5Xi3c6TRnpJPh+3eCxMSc5GTzHmXl2gjjkpWlqf7d
        Es1vujNA==;
Received: from [2601:1c0:6280:3f0:7629:afff:fe72:e49d] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m0B8I-006sFa-UM; Sun, 04 Jul 2021 23:02:39 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips: CONFIG_KERNEL_LZ4 needs obj/bswapsi.o
Date:   Sun,  4 Jul 2021 16:02:38 -0700
Message-Id: <20210704230238.577-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add obj/bswapsi.o for CONFIG_KERNEL_LZ4 to fix undefined references
during linking.

mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `decompress_kernel':
decompress.c:(.text+0x34e0): undefined reference to `__bswapsi2'
mips64-linux-ld: decompress.c:(.text+0x3504): undefined reference to `__bswapsi2'
mips64-linux-ld: decompress.c:(.text+0x3530): undefined reference to `__bswapsi2'

#Fixes: d0nt0110kn0w ("I couldn't find where __bswapsi2 is used.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/boot/compressed/Makefile |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210701.orig/arch/mips/boot/compressed/Makefile
+++ linux-next-20210701/arch/mips/boot/compressed/Makefile
@@ -55,6 +55,7 @@ $(obj)/uart-ath79.c: $(srctree)/arch/mip
 	$(call cmd,shipped)
 
 vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o $(obj)/bswapsi.o
+vmlinuzobjs-$(CONFIG_KERNEL_LZ4) += $(obj)/bswapsi.o
 
 extra-y += ashldi3.c
 $(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
