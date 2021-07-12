Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4294E3C43EB
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 08:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhGLGNx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jul 2021 02:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhGLGNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jul 2021 02:13:53 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98353C0613DD;
        Sun, 11 Jul 2021 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=1YkOQcBdgxi62ZhLA0NtO1y6SKPDgvnlI06PbOB4DUw=; b=cj+KTjXg8AMbD8rtYBj+8r7Cxt
        BIPIRTp20D9LAr4qWIr6U0JC/xVHlXyiIcTpi382wli87gwzL3Ky+H3KogILv29OKGQofxk4HKyqR
        AiEUkF3fz0flDZ/xb4lpGW1WDvCD6qxQc+HkKDLMWs17uNkI25ouMldR4GbfUgdqhRyD1eO7ejeUK
        aRa9JYOKdeAzKqSD8RqQQWjuHagl0GUOGEO14F0eiDyAnchuvTZcMJ5utjbxVMfjBg0n7t7VaNAiA
        Q5H0LUAnMpixjTv1WRiUcuxUg02RkZHPFt7pajAXdDqcjOppur2vp3jUMn2VfXHojK49J5ypV42jW
        60ew9ukQ==;
Received: from [2001:4bb8:184:8b7c:bd9:61b8:39ba:d78a] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m2p8D-00GwBl-3g; Mon, 12 Jul 2021 06:09:34 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: flush_kernel_dcache_page fixes and removal
Date:   Mon, 12 Jul 2021 08:09:22 +0200
Message-Id: <20210712060928.4161649-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

while looking to convert the block layer away from kmap_atomic towards
kmap_local_page and prefeably the helpers that abstract it away I noticed
that a few block drivers directly or implicitly call
flush_kernel_dcache_page before kunmapping a page that has been written
to.  flush_kernel_dcache_page is documented to to be used in such cases,
but flush_dcache_page is actually required when the page could be in
the page cache and mapped to userspace, which is pretty much always the
case when kmapping an arbitrary page.  Unfortunately the documentation
doesn't exactly make that clear, which lead to this misused.  And it turns
out that only the copy_strings / copy_string_kernel in the exec code
were actually correct users of flush_kernel_dcache_page, which is why
I think we should just remove it and eat the very minor overhead in
exec rather than confusing poor driver writers.

Diffstat:
 Documentation/core-api/cachetlb.rst                    |   86 +++++++----------
 Documentation/translations/zh_CN/core-api/cachetlb.rst |    9 -
 arch/arm/include/asm/cacheflush.h                      |    4 
 arch/arm/mm/flush.c                                    |   33 ------
 arch/arm/mm/nommu.c                                    |    6 -
 arch/csky/abiv1/cacheflush.c                           |   11 --
 arch/csky/abiv1/inc/abi/cacheflush.h                   |    4 
 arch/mips/include/asm/cacheflush.h                     |    8 -
 arch/nds32/include/asm/cacheflush.h                    |    3 
 arch/nds32/mm/cacheflush.c                             |    9 -
 arch/parisc/include/asm/cacheflush.h                   |    8 -
 arch/parisc/kernel/cache.c                             |    3 
 arch/sh/include/asm/cacheflush.h                       |    8 -
 block/blk-map.c                                        |    2 
 drivers/block/ps3disk.c                                |    2 
 drivers/mmc/host/jz4740_mmc.c                          |    4 
 drivers/mmc/host/mmc_spi.c                             |    2 
 drivers/scsi/aacraid/aachba.c                          |    1 
 fs/exec.c                                              |    6 -
 include/linux/highmem.h                                |    5 
 lib/scatterlist.c                                      |    5 
 tools/testing/scatterlist/linux/mm.h                   |    1 
 22 files changed, 55 insertions(+), 165 deletions(-)
