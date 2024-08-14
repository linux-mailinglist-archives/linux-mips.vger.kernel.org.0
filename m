Return-Path: <linux-mips+bounces-4898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67495191F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1432F1C2287C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508741448D4;
	Wed, 14 Aug 2024 10:41:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A80C137772
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632066; cv=none; b=daqQEy0Yq+v7xY3kxy7FGB69ybInLsxBP3L4wkIMppVi+chCxiUMZAyIjBt1Sdd86Ohp6yD+7CFOuFDn/yHT7SuH2bzA9giwX5EAuf2FCVJqO36gf+NNI483ZVTa2WTazbNkp+/PCreH6OXPSfRbyVuBFrblZ3R+j+N2ygLjJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632066; c=relaxed/simple;
	bh=RBB9g0IB5T0d+nP1Dxxm+p3cRzKkzsZSVkKO0uzhRK4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FKkeQalmfChj3t6lxnG88eaCnzQlZ8UizJDigRciqdR+ve6cl1OwQUtI2xY+z5XUvjJTfOwzycqrSnyG7Efm5YUXgncb1+EL+KVN4J0LwgZOSBh2g0ZVFKOUGny0kg9EJO2lxB6FWNKwkmy7szjk7MZ56tOHmTfxSF3anOGA1ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WkPr03mJVzfbR3
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:38:56 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id B6E73180105
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:40:53 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:40:53 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: Remove unused declarations in asm/cmp.h
Date: Wed, 14 Aug 2024 18:40:52 +0800
Message-ID: <20240814104052.2055777-1-cuigaosheng1@huawei.com>
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

These functions have been removed since
commit 7fb6f7b0af67 ("MIPS: Remove deprecated CONFIG_MIPS_CMP"),
so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/cmp.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/cmp.h b/arch/mips/include/asm/cmp.h
index e9e87504bb0c..71e20e6cd38d 100644
--- a/arch/mips/include/asm/cmp.h
+++ b/arch/mips/include/asm/cmp.h
@@ -7,12 +7,4 @@
  */
 struct task_struct;
 
-extern void cmp_smp_setup(void);
-extern void cmp_smp_finish(void);
-extern void cmp_boot_secondary(int cpu, struct task_struct *t);
-extern void cmp_init_secondary(void);
-extern void cmp_prepare_cpus(unsigned int max_cpus);
-
-/* This is platform specific */
-extern void cmp_send_ipi(int cpu, unsigned int action);
 #endif /*  _ASM_CMP_H */
-- 
2.25.1


