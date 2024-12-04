Return-Path: <linux-mips+bounces-6859-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDD9E3668
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 10:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692BC16917F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 09:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEC019F101;
	Wed,  4 Dec 2024 09:23:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE071AB52F;
	Wed,  4 Dec 2024 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733304229; cv=none; b=tp14rR9aea3+9OkXJhEfyw9Ts0+stuzzpVJNjxucflRUiRYtncE45fEvqVktabPN6yloiUUOl0kOvxSK/RDg5paILEtH4h1PqYZWRMSw6v4ulPKUL1aY+8jy25aHTWRZf1/IxIU6naFKq8nebcyp+ZiUBj7ziZor9zvobi6WxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733304229; c=relaxed/simple;
	bh=aOI4Nf4JqP7CFtrjXW4iqcfEIJAZUKiueejwNHlZuPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MQPPzIPCVViU/yUl/90OvC1N67G0Ljqgs5cPcGTz5PIGIXiFAysus4SVwEaWTTzxqjqhx3J2OQrbDgjDZKpR31Zb9F9orTmM+FNFUIZxgQC70+QZKVBbXi4H83zxTiHTjPpgZxNhocZ/oFflGdcN1tkn92GynCoprexqiJ6Yhgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee867501f9d6af-076fb;
	Wed, 04 Dec 2024 17:23:41 +0800 (CST)
X-RM-TRANSID:2ee867501f9d6af-076fb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from 192.168.28.197 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee467501f9c9bb-638ba;
	Wed, 04 Dec 2024 17:23:41 +0800 (CST)
X-RM-TRANSID:2ee467501f9c9bb-638ba
From: liujing <liujing@cmss.chinamobile.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] MIPS: Fix the wrong format specifier
Date: Wed,  4 Dec 2024 17:23:38 +0800
Message-Id: <20241204092338.6356-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make a minor change to eliminate a static checker warning. The type
of cpu is unsigned int, so the correct format specifier should be
%u instead of %d.

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

diff --git a/arch/mips/kernel/cevt-bcm1480.c b/arch/mips/kernel/cevt-bcm1480.c
index d39a2963b451..2a14dc4ee57e 100644
--- a/arch/mips/kernel/cevt-bcm1480.c
+++ b/arch/mips/kernel/cevt-bcm1480.c
@@ -103,7 +103,7 @@ void sb1480_clockevent_init(void)
 
 	BUG_ON(cpu > 3);	/* Only have 4 general purpose timers */
 
-	sprintf(name, "bcm1480-counter-%d", cpu);
+	sprintf(name, "bcm1480-counter-%u", cpu);
 	cd->name		= name;
 	cd->features		= CLOCK_EVT_FEAT_PERIODIC |
 				  CLOCK_EVT_FEAT_ONESHOT;
-- 
2.27.0




