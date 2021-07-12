Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319823C440C
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 08:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhGLGP6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jul 2021 02:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhGLGP5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jul 2021 02:15:57 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F4AC0613DD;
        Sun, 11 Jul 2021 23:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=rcv/zrvOW9Bwk+I5ar6SLyzActlaFG3MYXg2Vu2jyTk=; b=CTf+fCyB1qHd5uYE/ElGD7TELs
        AZpgo9xpfeQKZNlIgs0mIDyHcysmC+NnriVkUXmEB8EYf0kl4jOm7q8+bDvaN9z8B9k8Ljxe3NQDd
        GW29K0d0diPxVKEFBPTTkBzXpsKM55pqtwwQTGZjNNmxiLt3MAN5wlmt6TpZsDGeyvpEiUwzaY+aH
        AEr809HfI79Fm7J44VFh0InYBWXHm0Xg4nEKqspAnLWNTVW1s6aakkzb1fkfL9DFccXa5rfWg2/9U
        +xptAGWD/v+t+7slvQEy0EbSd4WYF/NMFpGA7YViXwEpGumWWrc8HXF7dLqpkXvlOb57p7q8LGzJZ
        okFVuOJw==;
Received: from [2001:4bb8:184:8b7c:bd9:61b8:39ba:d78a] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m2p9r-00GwJo-4m; Mon, 12 Jul 2021 06:11:22 +0000
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
Subject: [PATCH 5/6] aacraid: remove an unused include
Date:   Mon, 12 Jul 2021 08:09:27 +0200
Message-Id: <20210712060928.4161649-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
References: <20210712060928.4161649-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

flush_kernel_dcache_page is not used by aacraid, and this header already
comes in through the scatterlist/block headers anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/aacraid/aachba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.c
index 46b8dffce2dd..267934d2f14b 100644
--- a/drivers/scsi/aacraid/aachba.c
+++ b/drivers/scsi/aacraid/aachba.c
@@ -25,7 +25,6 @@
 #include <linux/completion.h>
 #include <linux/blkdev.h>
 #include <linux/uaccess.h>
-#include <linux/highmem.h> /* For flush_kernel_dcache_page */
 #include <linux/module.h>
 
 #include <asm/unaligned.h>
-- 
2.30.2

