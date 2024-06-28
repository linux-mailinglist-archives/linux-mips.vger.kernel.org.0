Return-Path: <linux-mips+bounces-4017-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F591BA43
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 10:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC511C21EAB
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 08:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18F614A09E;
	Fri, 28 Jun 2024 08:43:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1C43AC0;
	Fri, 28 Jun 2024 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564193; cv=none; b=jH+HsuMAgEpxKhQKoR9x5Pd3eGWWkE0G/rA4BUjI5ev8JdB+LF9rqno0BvZAcHZeNc1AEZodM7gun04tuugCwNapEytiPR74twUhTlibVAjoVOxMeSLWdTtbU7btHtY8Hyxnfj4bDG0oULNv+p+f8M0wpLGPUNTeA1h+jFdYJUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564193; c=relaxed/simple;
	bh=VPCR6B+q/ze+0k8/a5//nsllEdjBibCOi2hB+YOPY7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YliSfFXdC60gYXBb4QZQcU8gKMJZzBcPg4maYizAyi532XNae7QSRG7uY/PCbBzX77b4Exp8kmeWrynPB4PqZdsEYlnw++QUuDDOSkpY0Vl+wLhM0y5ogzKug6HtSQ5pyK5nhAQEBi4bdslSiT7wdZowI8I7xlzSQNuSnZsGf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz9t1719564106tkrjopl
X-QQ-Originating-IP: f/kOEM2Glu4JL+oCsb/LBSQoNQjNX+nOQd0jJxI2XXc=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Jun 2024 16:41:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2146255387032920080
From: WangYuli <wangyuli@uniontech.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	tsbogend@alpha.franken.de
Cc: linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyuli@uniontech.com>,
	Guan Wentao <guanwentao@uniontech.com>
Subject: [PATCH] MIPS: crypto: Clean up useless assignment operations
Date: Fri, 28 Jun 2024 16:41:17 +0800
Message-ID: <1D248893502B75F5+20240628084117.84264-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

When entering the "len & sizeof(u32)" branch, len must be less than 8.
So after one operation, len must be less than 4.
At this time, "len -= sizeof(u32)" is not necessary for 64-bit CPUs.

A similar issue has been solved at Loongarch.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.10-rc5&id=fea1c949f6ca5059e12de00d0483645debc5b206
Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/crypto/crc32-mips.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
index ec6d58008f8e..505d2d897849 100644
--- a/arch/mips/crypto/crc32-mips.c
+++ b/arch/mips/crypto/crc32-mips.c
@@ -94,7 +94,9 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 
 		CRC32(crc, value, w);
 		p += sizeof(u32);
+#ifndef CONFIG_64BIT
 		len -= sizeof(u32);
+#endif
 	}
 
 	if (len & sizeof(u16)) {
@@ -134,7 +136,9 @@ static u32 crc32c_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 
 		CRC32C(crc, value, w);
 		p += sizeof(u32);
+#ifndef CONFIG_64BIT
 		len -= sizeof(u32);
+#endif
 	}
 
 	if (len & sizeof(u16)) {
-- 
2.43.4


