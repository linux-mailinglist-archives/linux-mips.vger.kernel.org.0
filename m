Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E25332784F
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 08:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhCAHjW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 02:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbhCAHjS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 02:39:18 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92383C061786
        for <linux-mips@vger.kernel.org>; Sun, 28 Feb 2021 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=pTg7XeV4HygMYuhkzRp456cK9V+Vvbulc9It/FI5o2M=; b=NJcHmb34FR5ZCfn/tiwkLSR82S
        AxXVYuAelz7cTk9/otfDEgRl64RKjpphqwXm3OCybWLRqbqUR+1IKx3w99Gj1pkPs7bNOjd1zZ4ys
        +8VdT9cKh7QaWzCkkHW58//sAst3gadBdD0XH7ZhMg8hG/nH5o6NCt5mWENKo0QHqMQccVGSUOfSa
        7Ipb+mug1swpCnx1NufU3m4lt4T2mX8eCAQkWTmfSoZ8XCGTP6tglPdLXv5XPKBMPFNGsWOUcxzil
        k4n+QBeIyREz9bBEZpntWtPdn6VitZPKER/83i8hg63Cyr3GFVKLD7VHPGZCmuLalbJuMin9DfKTo
        sozBibHw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGd8c-00FQlZ-Cd; Mon, 01 Mar 2021 07:38:43 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 1/3] MIPS: pci-ar2315: include <linux/dma-direct.h> for phys_to_dma
Date:   Mon,  1 Mar 2021 08:38:30 +0100
Message-Id: <20210301073832.919371-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301073832.919371-1-hch@lst.de>
References: <20210301073832.919371-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ensure this file has a prototype for phys_to_dma and dma_to_phys.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/pci/pci-ar2315.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index f741b8c528e480..c1a655aee599a1 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -31,6 +31,7 @@
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/dma-direct.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/bitops.h>
-- 
2.29.2

