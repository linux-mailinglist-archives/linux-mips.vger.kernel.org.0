Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F40739FBB9
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbhFHQIT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhFHQIS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA60C061789;
        Tue,  8 Jun 2021 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=a0gQtMimMgFZkaRSJSMQd1xbl4hg7tfa68M4/BUo4Ec=; b=23QHAQjdmpqdrgvfV2Nqv8i+pX
        fv36/MifQp7tIqwRmuOJQltpdBibebdN4y1g/lDPGjVJdnfFo0Ai1yX4LuFYDt51OeKYJAct22PSV
        MZzHh5TcHPurFnhWBjLEf36wf+0GByKkXs64SzggvDu6x4f3/9OnpvTKHFNFHgWhh1ZPt+pDYXjIG
        4y+/TDZwvZOasKtW5wEa6zwG7GIVWCfEWvk6nM1/lKNL93ZO4LkGZFou98UXBH1Hw7xQm1J8CqrJg
        bRj2Qqokxg8x8xr0ZLvkPtNDtAsPj3sfnI7j6GhEWS75RH8teIRav9EiBeEO5oyqxpKc042L0aIbM
        IfF+/mzw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeF4-009Rac-8Y; Tue, 08 Jun 2021 16:06:14 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
Subject: [PATCH 02/16] MIPS: don't include <linux/genhd.h> in <asm/mach-rc32434/rb.h>
Date:   Tue,  8 Jun 2021 18:05:49 +0200
Message-Id: <20210608160603.1535935-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no need to include genhd.h from a random arch header, and not
doing so prevents the possibility for nasty include loops.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/mach-rc32434/rb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-rc32434/rb.h b/arch/mips/include/asm/mach-rc32434/rb.h
index d502673a4f6c..34d179ca020b 100644
--- a/arch/mips/include/asm/mach-rc32434/rb.h
+++ b/arch/mips/include/asm/mach-rc32434/rb.h
@@ -7,8 +7,6 @@
 #ifndef __ASM_RC32434_RB_H
 #define __ASM_RC32434_RB_H
 
-#include <linux/genhd.h>
-
 #define REGBASE		0x18000000
 #define IDT434_REG_BASE ((volatile void *) KSEG1ADDR(REGBASE))
 #define UART0BASE	0x58000
-- 
2.30.2

