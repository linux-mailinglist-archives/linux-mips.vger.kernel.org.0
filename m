Return-Path: <linux-mips+bounces-6721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E928C9C4C20
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 02:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83961B21FEC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2024 01:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37192010E1;
	Tue, 12 Nov 2024 01:56:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600A420401F;
	Tue, 12 Nov 2024 01:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376575; cv=none; b=NG/2x0zUa+TwqOlbgrFjUIF4whyByRawUhXDrxMG6O144HJmihYMftWaQ9gmQLLRO0llX452kl54PQqcTUl3iqukBhfSlO0i5ytoKRLaNhE97mO7/3hVjNRTdQC6M1wMdsvE4qBqxqxV7wnIDiAf68mqSOzMAwf5rLxOZbT9WZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376575; c=relaxed/simple;
	bh=1aFwmslW6yualBweTT3uU0BbglFERGitKcdds24t4IA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RXCA5DWQi19sm/G9V4n4+LM04fP5irkWkhBLST+1/Kry44cLXPj7ST+QSLRRwKXTRmqxGoUEMW2cOp/1dqjlJu5OACLJSycbLVP3c5g+/g6813WdCnNlzJ9+340B12Yh6z6q0Dh7deAdRWp/LVgHprDgRBQNW9MgBufPwBu0Lqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16732b5baab5-da3ca;
	Tue, 12 Nov 2024 09:56:10 +0800 (CST)
X-RM-TRANSID:2ee16732b5baab5-da3ca
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86732b5ba482-3db69;
	Tue, 12 Nov 2024 09:56:10 +0800 (CST)
X-RM-TRANSID:2ee86732b5ba482-3db69
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: macro@orcam.me.uk
Cc: ralf@linux-mips.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] TC: Fix the wrong format specifier
Date: Tue, 12 Nov 2024 09:56:08 +0800
Message-Id: <20241112015608.3498-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The format specifier of "unsigned int" in pr_info()
should be "%u", not "%d".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/tc/tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tc/tc.c b/drivers/tc/tc.c
index c5b17dd8f587..0629f277f7b4 100644
--- a/drivers/tc/tc.c
+++ b/drivers/tc/tc.c
@@ -162,7 +162,7 @@ static int __init tc_init(void)
 	if (tc_bus.info.slot_size) {
 		unsigned int tc_clock = tc_get_speed(&tc_bus) / 100000;
 
-		pr_info("tc: TURBOchannel rev. %d at %d.%d MHz "
+		pr_info("tc: TURBOchannel rev. %d at %u.%u MHz "
 			"(with%s parity)\n", tc_bus.info.revision,
 			tc_clock / 10, tc_clock % 10,
 			tc_bus.info.parity ? "" : "out");
-- 
2.33.0




