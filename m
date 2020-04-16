Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092161AC7DF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 17:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391171AbgDPPAU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 11:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388921AbgDPPAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B10BC061A0F;
        Thu, 16 Apr 2020 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=+StCyVKVCq0UE0CgHb0xeQ2f1v6WIGLWJIGurS7IV14=; b=poFbNxuZdMO9WGexcKzq87NMkE
        r+GxiiuR1cnjh9NzmZy4MvPzu0G35Qnrv5KxX1WXho7H6P6vMEau3sUUjeUMv0KaOREnyUXZAujHR
        Azze5N6dEDM5J5sPqYiq7bKXrdBac3JAUXswQmbMafKLfcq8Tg5sHG8queUAqb2qEZ3JqX++GdwIw
        OJ0/mfKCNLAWITk9bOcv5EMLXk4l3qkQV9phtdfBuK779em0je9iYPfbkj6mdc9ByBh+w78a2DGRf
        8bVtbtha5WCeC9siEdjpN66KYyMmsArUeGrNFiHrw0suZeZ0ds9rGstenFaAaWFAgLmOvS2sV6ZHc
        I9Ao/djw==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jP600-0001wG-8g; Thu, 16 Apr 2020 15:00:16 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: txx9: don't work around too small resource_size_t
Date:   Thu, 16 Apr 2020 17:00:05 +0200
Message-Id: <20200416150011.820984-2-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416150011.820984-1-hch@lst.de>
References: <20200416150011.820984-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The txx9 sound driver deends on HAS_TXX9_ACLC, which is only set for
three tx49xx SOCs, and thus always has a 64-bit phys_addr_t and
resource_size_t.  Instead of poking into ioremap internals to work
around a potentially too small resource_size_t just add a BUILD_BUG_ON
to catch such a case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/soc/txx9/txx9aclc-ac97.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc-ac97.c b/sound/soc/txx9/txx9aclc-ac97.c
index b1d9615f2375..7402448bdb09 100644
--- a/sound/soc/txx9/txx9aclc-ac97.c
+++ b/sound/soc/txx9/txx9aclc-ac97.c
@@ -175,6 +175,8 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
+	BUILD_BUG_ON(sizeof(drvdata->physbase) > sizeof(r->start));
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -190,10 +192,6 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drvdata);
 	drvdata->physbase = r->start;
-	if (sizeof(drvdata->physbase) > sizeof(r->start) &&
-	    r->start >= TXX9_DIRECTMAP_BASE &&
-	    r->start < TXX9_DIRECTMAP_BASE + 0x400000)
-		drvdata->physbase |= 0xf00000000ull;
 	err = devm_request_irq(&pdev->dev, irq, txx9aclc_ac97_irq,
 			       0, dev_name(&pdev->dev), drvdata);
 	if (err < 0)
-- 
2.25.1

