Return-Path: <linux-mips+bounces-4896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A658951911
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC8C28367F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014411AED5B;
	Wed, 14 Aug 2024 10:37:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B411AED57
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631865; cv=none; b=nqZnZGd27vhMQEYNuMYNqBtfjlVoJf8bGuhz1mJQ93kHbnCbaLFY0szNMJ7kKtiUo9q5qgJoAWgKFds4qIZ3m+RyeKOqCbvqICHV1r5cbKiNjWiFGSppsWNfGQBJh4HDe4I3ZrUEVCPQfAvG9NWOcw6LgMRO2IFvbbKmwaCaS4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631865; c=relaxed/simple;
	bh=zJQmqRGBzEmjefhv3WwQSvPswbi9HCGz5L+vuEydbak=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aXIBktQwa7ZtfpyWvOR9RyzWoplytMJUlkfoVPq9unLgIreKYGueKS1qKVQEog5/QGqOGll6THJIGr7O+hATsS8xD9idAFdkPcLWEsfgVEERjv+0edf/T7vV0BhZTJJKVqwz6MqQnABwYDq7KeI98lJk7RV2aeFN1HfQC7eF/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WkPjG6TqSz20ldf;
	Wed, 14 Aug 2024 18:33:06 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id D440A14037C;
	Wed, 14 Aug 2024 18:37:40 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:37:40 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>,
	<javierm@redhat.com>, <philmd@linaro.org>, <arnd@arndb.de>,
	<dinguyen@kernel.org>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] mips/jazz: remove unused jazz_handle_int() declaration
Date: Wed, 14 Aug 2024 18:37:39 +0800
Message-ID: <20240814103739.2053421-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The jazz_handle_int() has been removed since
commit e4ac58afdfac ("[MIPS] Rewrite all the assembler interrupt
handlers to C."), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/jazz/setup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
index e318ea11c858..d21e5d441f53 100644
--- a/arch/mips/jazz/setup.c
+++ b/arch/mips/jazz/setup.c
@@ -23,8 +23,6 @@
 #include <asm/reboot.h>
 #include <asm/tlbmisc.h>
 
-extern asmlinkage void jazz_handle_int(void);
-
 extern void jazz_machine_restart(char *command);
 
 static struct resource jazz_io_resources[] = {
-- 
2.25.1


