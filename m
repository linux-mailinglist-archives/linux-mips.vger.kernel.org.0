Return-Path: <linux-mips+bounces-4899-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C66951925
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33E282817E2
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E082212EBCA;
	Wed, 14 Aug 2024 10:42:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA5481A7
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632121; cv=none; b=mADNnCOOOfA5InrGAlNoQU6w1fwcltZEqZ1GSmuTYE2+SuGNR/eonOQ7HKNBW1admEtzeCQBS7pClSZ9NMVkWCUH/Gj8iDyvoZjM9Fq+viJUtz510zpz8/4Bvge6YPtklRkXjX8zQVpu399wIrabHkwYbQBDXT0cQ1SI4wBhD+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632121; c=relaxed/simple;
	bh=aUnBy9WrNWfeMy2+s/pwCXOofwei0Bk0lUAHeKtchUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qxXE01iRnNg8ubS/rmGyrnqmXuFMGEesXJ4oXyd4xXK+P/YvrQX6pL+hu0MYvtnN24jUjf1czkhMVRt8rNQQ6JcWuvHkj/Dvsm23y08JoRmtTpcyIeaOn8OVmYfaqFCfgpaVJVvwRdU/0QUzXUVE/VO3Yq5r3j8e1Dn29WoNc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WkPns30j4z1j6P1
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:37:05 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 3BC8B14013B
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:41:57 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:41:56 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: Remove unused mips_display/_scroll_message() declarations
Date: Wed, 14 Aug 2024 18:41:56 +0800
Message-ID: <20240814104156.2055924-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The mips_display/_scroll_message() have been removed since
commit 0b0037490f37 ("MIPS: malta: Use img-ascii-lcd driver for LCD
display"), so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/mips-boards/generic.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/mips-boards/generic.h b/arch/mips/include/asm/mips-boards/generic.h
index c904c24550f6..5befba569c9f 100644
--- a/arch/mips/include/asm/mips-boards/generic.h
+++ b/arch/mips/include/asm/mips-boards/generic.h
@@ -73,7 +73,4 @@ extern void mips_pcibios_init(void);
 #define mips_pcibios_init() do { } while (0)
 #endif
 
-extern void mips_scroll_message(void);
-extern void mips_display_message(const char *str);
-
 #endif	/* __ASM_MIPS_BOARDS_GENERIC_H */
-- 
2.25.1


