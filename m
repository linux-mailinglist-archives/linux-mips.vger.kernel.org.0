Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074F71B2DD5
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 19:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDURLo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 13:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725870AbgDURLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 13:11:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA79C061A41
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2020 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=xMLWV9qUz2Kq+HU+SuvKkLN0sIi+JERmUN3FP8EgqbE=; b=BRO4OCuub7TidtMr0d3CfcsE0Q
        aBxPOLXKWRHjvySfrJwNZCX+Te/X8W39/uf6WP1e4upe0YrkJawzY097ZZk0ddaUJ49NQWFw0rYwt
        +UUKiloKolNzbWQnFlpMGF3JQhhJLUFy0S4ams3wgXP+6/Met8SmGBuhwR1o53+cD7feXlupTGLbP
        lQC5O+j5agK6bLaOUwReoKejU25ml3Yq6ol7hqouTDrWi5JMpdAM+NN1cpM/f7Wr2j9uP9U5lFBEt
        b7T5bEhmIdjaTQQWrqlQlhskkUpwS8NgXPyMBXl8VII/YeAcPtoHkAtgbtgoG8rPHJja44p9Jt2GK
        ULHh2syA==;
Received: from [2001:4bb8:191:e12c:c70:4a89:bc61:3] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQwQu-0002rT-PC; Tue, 21 Apr 2020 17:11:41 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     tsbogend@alpha.franken.de
Cc:     broonie@kernel.org, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: txx9: add back the hack for a too small resource_size_t
Date:   Tue, 21 Apr 2020 19:11:36 +0200
Message-Id: <20200421171136.288216-1-hch@lst.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks like I misread the Kconfig magic and this driver can be compiled
into 32-bit kernels.  Add back the hack to extent the range of the
resource_size_t, and include the header with the txx9-specific ioremap
magic for that.

Fixes: acfaaf52ebfd ("ASoC: txx9: don't work around too small resource_size_t")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/soc/txx9/txx9aclc-ac97.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc-ac97.c b/sound/soc/txx9/txx9aclc-ac97.c
index 7402448bdb09..d9e348444bd0 100644
--- a/sound/soc/txx9/txx9aclc-ac97.c
+++ b/sound/soc/txx9/txx9aclc-ac97.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/gfp.h>
+#include <asm/mach-tx39xx/ioremap.h> /* for TXX9_DIRECTMAP_BASE */
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -175,8 +176,6 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	BUILD_BUG_ON(sizeof(drvdata->physbase) > sizeof(r->start));
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -192,6 +191,10 @@ static int txx9aclc_ac97_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drvdata);
 	drvdata->physbase = r->start;
+	if (sizeof(drvdata->physbase) > sizeof(r->start) &&
+	    r->start >= TXX9_DIRECTMAP_BASE &&
+	    r->start < TXX9_DIRECTMAP_BASE + 0x400000)
+		drvdata->physbase |= 0xf00000000ull;
 	err = devm_request_irq(&pdev->dev, irq, txx9aclc_ac97_irq,
 			       0, dev_name(&pdev->dev), drvdata);
 	if (err < 0)
-- 
2.26.1

