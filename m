Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A175C7EF43
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404153AbfHBI2p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 04:28:45 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25588 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404152AbfHBI2p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Aug 2019 04:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564734480; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=K4YPf8BbkekWzsJBdqypN0JZO8w45AMEuh9V8fVUwzAqJ7p4MdlbbgsYlJfOMAjEuwy7JuKOXuTnpqbxCtRxT2SBzxffXac93nR4i7CP156U1TTigSzsYrzwd4X/iX/cX7qJdFqxullm05LvzBKyvRBOGRw6INK6bJbhbegjX+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564734480; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=PCPvMtgwI7YymWHtU3P5pq3i16qnpFDI6NTvI4dHUbE=; 
        b=f50TVeGSAd4g8pHsriPTF45D61qPoZyn7qy3+eAcuOgNDrzVx1SrTIWS8jn3Wuvyr2DOK/Vb0NEyhWfhvC9eX00cCz5jOHy3KCBAuMUjXYW4KD4N2gJUBBCyoRCMI5Vscqi1Sn82Rin/byljm6hF2FC3Fvi6UJ9/+9/iOY86DDQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=PGwKfdJsDr8ibKz4W65JzVC2iLb/RfdjvLQUH6ALxaIm9sJsYdX2p8ZBq/MFCfMOQHUX/xjyV/BV
    SCrgD0rTJEaqsFAs/S71VGaXvLOVn1JMNscy96q8WQ9Z5Vb5uOpx  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564734480;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1305; bh=PCPvMtgwI7YymWHtU3P5pq3i16qnpFDI6NTvI4dHUbE=;
        b=lIroAuI1pb1MaEYLeQX6Ho8fHAM7qCU/sldk+/0/1bq43Y4y9hysjbbRlHavRIkg
        skamL/sibLO/2rHbRvzqfd6bCa4mTXVXm8lZwhQHD9GLraxk68xk6T3G0NVb96tlY4F
        2AfM35JOrHbeM4tjVjIDzVhDmmZEVjUB+uSUqAOQ=
Received: from localhost.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1564734479346989.5209055678341; Fri, 2 Aug 2019 01:27:59 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Subject: [PATCH 1/2 v4] MIPS: Ingenic: Fix bugs when detecting X1000's L2 cache.
Date:   Fri,  2 Aug 2019 16:27:36 +0800
Message-Id: <1564734457-48801-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564734457-48801-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564734457-48801-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.fix bugs when detecting L2 cache sets value.
2.fix bugs when detecting L2 cache ways value.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/mm/sc-mips.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 9385ddb..dbdbfe5 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -221,13 +221,26 @@ static inline int __init mips_sc_probe(void)
 	else
 		return 0;
 
-	/*
-	 * According to config2 it would be 5-ways, but that is contradicted
-	 * by all documentation.
-	 */
-	if (current_cpu_type() == CPU_XBURST &&
-				mips_machtype == MACH_INGENIC_JZ4770)
-		c->scache.ways = 4;
+	if (current_cpu_type() == CPU_XBURST) {
+		switch (mips_machtype) {
+		/*
+		 * According to config2 it would be 5-ways, but that is
+		 * contradicted by all documentation.
+		 */
+		case MACH_INGENIC_JZ4770:
+			c->scache.ways = 4;
+			break;
+
+		/*
+		 * According to config2 it would be 5-ways and 512-sets,
+		 * but that is contradicted by all documentation.
+		 */
+		case MACH_INGENIC_X1000:
+			c->scache.sets = 256;
+			c->scache.ways = 4;
+			break;
+		}
+	}
 
 	c->scache.waysize = c->scache.sets * c->scache.linesz;
 	c->scache.waybit = __ffs(c->scache.waysize);
-- 
2.7.4


