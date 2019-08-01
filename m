Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736507DB34
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2019 14:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfHAMS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Aug 2019 08:18:28 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25504 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHAMS2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Aug 2019 08:18:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564661870; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=jtm6jxTsOX/aAtoXxAtl64aoaD5tsAp9MfcgFLHbaO5KZys7my90qPn1Hpez4Hd9KN+C5wiOI1WjxPMS5hnIQl1iU4LR2JHdyoic1pJWLXnyeM97yjbpQHg4XE+5DjTT7QVffOT1CLVDV4Uy5HfmV4hfQVCQAQw4crYpqJGH7ug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564661870; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=PCPvMtgwI7YymWHtU3P5pq3i16qnpFDI6NTvI4dHUbE=; 
        b=itytxhVjRPdHaxjt+FfC8SFpZWMcQbpcMfCh1AUzx+oyA3oE3JnHPrGO1rIfa4ZJA1TupOly0vOrBOWORqPnJlR2oKjODa62K+wPpQjty0l4/h6oc1pV3l4cdjZHPsPZ6lCetgWi0Ha9SFRosWJwntLt8xWNDDCgDL7U4Z41DXQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=jM3YudXzMeEqDZ3bJpBuJJfA+30GJP2ljrbGy91JH4zm48mIwqcZ6Z6ndRJ4qUsZbZjYU9yiLMTT
    mQqWkRt1QjFYDsuQWzXZ0+IOzeZX9+JXrQvIxD3PNDGmjUas3+AU  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564661870;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1305; bh=PCPvMtgwI7YymWHtU3P5pq3i16qnpFDI6NTvI4dHUbE=;
        b=ZBto9u9lTjmOyRKoch9H2GP1h/VUbP2RfZjg+XuwZXN7c5gpAxM4DX4gU4r6cZJ3
        maLqxkd2rZQnxcqENRcS3ank9haMTF1FQxEdKA7G8YevPMA22L4S5aNM0I6i/WE8Xpg
        pVfzwKLHqbubbfbVM4nL7spL5mG69mQHLadW5LA0=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 156466186942221.766968742808785; Thu, 1 Aug 2019 05:17:49 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Subject: [PATCH 1/2 v3] MIPS: Ingenic: Fix bugs when detecting X1000's L2 cache.
Date:   Thu,  1 Aug 2019 20:16:30 +0800
Message-Id: <1564661791-47731-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
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


