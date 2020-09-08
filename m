Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55804261599
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731712AbgIHQxR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732028AbgIHQsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321FAC061797;
        Tue,  8 Sep 2020 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=qqLaTPZucw5oDcARbFfOdxVBbFJKkf1DfCLZzjkn6K0=; b=QOaAUIFrVFFBjMiPtBwShGGSii
        AfLQaagJtB8aVjJw7OhF/Ht9ngdo/gAEWUZUrTiEDBn5xZqgk3w8MSBaImeDG9le0FkFftx+M/b88
        qssTqDexo3PO80Q3S7qztIKVdBmgkb/baXG9Av7oUJf/02ZCS2Lvw+L7VqIqAALTlNALU4Pfft2Ve
        RFt4zfGcQp9UNTeuOAC0r9EQciwD+CL2DHdEZsveYr5VD9UoSn+f2I21TZ19GLqfRy8JQCans4QVs
        v2wwDl1U6SNwJDAsoMj1LV5zwhr6oyQSFPXRATwoHHL5F0x1X/BjmCvsw2pOhy/FthSuwoOzN6uO9
        wc+KTwuA==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmq-0001Ry-1W; Tue, 08 Sep 2020 16:48:04 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 04/12] dma-mapping: fix DMA_OPS dependencies
Date:   Tue,  8 Sep 2020 18:47:50 +0200
Message-Id: <20200908164758.3177341-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Driver that select DMA_OPS need to depend on HAS_DMA support to
work.  The vop driver was missing that dependency, so add it, and also
add a nother depends in DMA_OPS itself.  That won't fix the issue due
to how the Kconfig dependencies work, but at least produce a warning
about unmet dependencies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/misc/mic/Kconfig | 1 +
 kernel/dma/Kconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
index b9bb086785db48..8a7c2c5711d5f4 100644
--- a/drivers/misc/mic/Kconfig
+++ b/drivers/misc/mic/Kconfig
@@ -35,6 +35,7 @@ config SCIF_BUS
 
 config VOP_BUS
 	tristate "VOP Bus Driver"
+	depends on HAS_DMA
 	select DMA_OPS
 	help
 	  This option is selected by any driver which registers a
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 0ddfb5510fe45f..e7b801649f6574 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -9,6 +9,7 @@ config HAS_DMA
 	default y
 
 config DMA_OPS
+	depends on HAS_DMA
 	bool
 
 #
-- 
2.28.0

