Return-Path: <linux-mips+bounces-5533-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E1975FC4
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 05:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E681C22939
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 03:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17F01684A5;
	Thu, 12 Sep 2024 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BqkP8XKs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808F14B97E;
	Thu, 12 Sep 2024 03:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112068; cv=none; b=mA1QFDIQ/IsJhqX/5PIHDZYCldlPNj0SanKZ8L7b7tasZz1hBsceMEEhQ5T1AZu+l9rcUfIb44SO9Fc2xZLcxQiGY24SsIgusOrybY2Le+7lmQ1Ucs5oWk7Frw4ddJgAUGC6r7vTTiibDPUIhiOANUlpequk83VyR+boDXynmS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112068; c=relaxed/simple;
	bh=0/GAUh9+vr5dSsV/KCoFiCdKVPCmYu2BnbiNLdKPFs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qo3K6R1HSEEQcXvQW8IrwYOKEXV90hY7b3KyIEVW+7iZc72zYS0I2KmjRjv/8m+1CBJiFI2TaUWk0VbK8MUGgPn2dekoaVsfFwbAag/3LJfuKiyUlfcxRaRjKVttYpjpxOdWOXO1zVnHVvFOl9NLFtt313s/8F8EVMGqnqX29Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BqkP8XKs; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726112061;
	bh=5mzqLfW7T+9KCT/Eu0R8VmSjmBF0RsE3ZlF9EWCDd+E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BqkP8XKsPlR7MmHI94Lpc/LIRCw8+mqE4mWPZxfReC3rKTqMnVPBFR0XHZz267uMO
	 xXzFZrDOVF/xISeplGY9C08EWm8owLXtl3t+1xHcSzv8BZ4BD79fGFNR9OvqQ9+X/o
	 38Vv9IZkwVxKA47EGiWsbtoVb3+hmpWPIYz+iy7g=
X-QQ-mid: bizesmtpsz9t1726112053t4mo9ll
X-QQ-Originating-IP: eroRLnBsJwYsmxRfJ05VprIAIJkhrn2Or2wu0Py9MYE=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 11:34:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11165061773754836062
From: WangYuli <wangyuli@uniontech.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	tsbogend@alpha.franken.de
Cc: linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marcin.nowakowski@mips.com,
	jhogan@kernel.org,
	ralf@linux-mips.org,
	linux-mips@linux-mips.org,
	ebiggers@google.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [RESEND. PATCH v3] MIPS: crypto: Clean up useless assignment operations
Date: Thu, 12 Sep 2024 11:34:03 +0800
Message-ID: <98B4759B69BED4D1+20240912033403.1944625-1-wangyuli@uniontech.com>
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

After that, replace `while' loops with equivalent `for' to make the
code structure a little bit better by the way.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2406281713040.43454@angie.orcam.me.uk/
Suggested-by: Herbert Xu <herbert@gondor.apana.org.au>
Link: https://lore.kernel.org/all/ZtqZpzMH_qMQqzyc@gondor.apana.org.au/
Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/crypto/crc32-mips.c | 70 ++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
index ec6d58008f8e..2a59b85f88aa 100644
--- a/arch/mips/crypto/crc32-mips.c
+++ b/arch/mips/crypto/crc32-mips.c
@@ -77,24 +77,26 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 {
 	u32 crc = crc_;
 
-#ifdef CONFIG_64BIT
-	while (len >= sizeof(u64)) {
-		u64 value = get_unaligned_le64(p);
-
-		CRC32(crc, value, d);
-		p += sizeof(u64);
-		len -= sizeof(u64);
-	}
-
-	if (len & sizeof(u32)) {
-#else /* !CONFIG_64BIT */
-	while (len >= sizeof(u32)) {
-#endif
-		u32 value = get_unaligned_le32(p);
-
-		CRC32(crc, value, w);
-		p += sizeof(u32);
-		len -= sizeof(u32);
+	if (IS_ENABLED(CONFIG_64BIT)) {
+		for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
+			u64 value = get_unaligned_le64(p);
+
+			CRC32(crc, value, d);
+		}
+
+		if (len & sizeof(u32)) {
+			u32 value = get_unaligned_le32(p);
+
+			CRC32(crc, value, w);
+			p += sizeof(u32);
+		}
+	} else {
+		for (; len >= sizeof(u32); len -= sizeof(u32)) {
+			u32 value = get_unaligned_le32(p);
+
+			CRC32(crc, value, w);
+			p += sizeof(u32);
+		}
 	}
 
 	if (len & sizeof(u16)) {
@@ -117,24 +119,26 @@ static u32 crc32c_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 {
 	u32 crc = crc_;
 
-#ifdef CONFIG_64BIT
-	while (len >= sizeof(u64)) {
-		u64 value = get_unaligned_le64(p);
+	if (IS_ENABLED(CONFIG_64BIT)) {
+		for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
+			u64 value = get_unaligned_le64(p);
 
-		CRC32C(crc, value, d);
-		p += sizeof(u64);
-		len -= sizeof(u64);
-	}
+			CRC32(crc, value, d);
+		}
 
-	if (len & sizeof(u32)) {
-#else /* !CONFIG_64BIT */
-	while (len >= sizeof(u32)) {
-#endif
-		u32 value = get_unaligned_le32(p);
+		if (len & sizeof(u32)) {
+			u32 value = get_unaligned_le32(p);
+
+			CRC32(crc, value, w);
+			p += sizeof(u32);
+		}
+	} else {
+		for (; len >= sizeof(u32); len -= sizeof(u32)) {
+			u32 value = get_unaligned_le32(p);
 
-		CRC32C(crc, value, w);
-		p += sizeof(u32);
-		len -= sizeof(u32);
+			CRC32(crc, value, w);
+			p += sizeof(u32);
+		}
 	}
 
 	if (len & sizeof(u16)) {
-- 
2.43.4


