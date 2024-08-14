Return-Path: <linux-mips+bounces-4900-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781B951936
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB4F283342
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BCE1AE851;
	Wed, 14 Aug 2024 10:43:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C291AE049
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632199; cv=none; b=MMIQ7T48jzG4YpNVy1LhCUC+hvD9/YPml8IjfI3lcz/vvLFjjWC6wzfRNciPfrkJiN7YihZbKUQr69tLg4RjEgh0PAJK6sW1vwaW9RpRRjlrZFJarwtUl86BcI6cZWF6Gr2LUV62DxAyR2IhT/VSQ5vrLw1PbhrhgkR7Ghp1sbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632199; c=relaxed/simple;
	bh=iyabjJRRchrUUIoEpEjokGqhBycvApjIirVxdWW7yjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g2YS6oX2HlqC0VVqsLWt1XNJJnXtWes/yIkXkqn7gnHCG3qoPcpAj8rBz4Bd8b82QZwu3Nu0tbxQLtpSkj3l7CDESX+PHSl9i43qx4bC2c8YdeiMvLdpoC+yqvIe03hdOUj7pMPRFqs7nntJimqllJfHScuOgpZNh9ActPFRawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WkPqf61z9zQpcZ;
	Wed, 14 Aug 2024 18:38:38 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B42F18006C;
	Wed, 14 Aug 2024 18:43:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:43:12 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <macro@orcam.me.uk>, <tsbogend@alpha.franken.de>,
	<cuigaosheng1@huawei.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: dec: prom: Remove unused unregister_prom_console() declaration
Date: Wed, 14 Aug 2024 18:43:12 +0800
Message-ID: <20240814104312.2056096-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The unregister_prom_console() has been removed since
commit 36a885306fdf ("[MIPS] Fix and cleanup the mess that a dozen
prom_printf variants are."), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/dec/prom.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/dec/prom.h b/arch/mips/include/asm/dec/prom.h
index 908e96e3a311..8fcad6984389 100644
--- a/arch/mips/include/asm/dec/prom.h
+++ b/arch/mips/include/asm/dec/prom.h
@@ -160,6 +160,5 @@ extern void prom_identify_arch(u32);
 extern void prom_init_cmdline(s32, s32 *, u32);
 
 extern void register_prom_console(void);
-extern void unregister_prom_console(void);
 
 #endif /* _ASM_DEC_PROM_H */
-- 
2.25.1


