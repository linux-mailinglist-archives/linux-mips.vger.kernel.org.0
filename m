Return-Path: <linux-mips+bounces-5377-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FE96EAD4
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 08:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4541F256D2
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 06:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92A213A865;
	Fri,  6 Sep 2024 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="QAqkJYoi"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F1130A47;
	Fri,  6 Sep 2024 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604902; cv=none; b=HqoDFXk6lzfeoBWYVE2ZfdJ65PhoPoPzZyJ3nYVqQsTrfBV/6rtEvKzP6wQOYfQsC/kAKM+zCsShJWVmaNqpTDPFsEUMpTdRKR0oVBDxppM61t1ytF1x5TqFKDfJpNclG8ngK3gJBEoZoDylyOxcE8FGAyBhbcAPJOek30aUqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604902; c=relaxed/simple;
	bh=0/GAUh9+vr5dSsV/KCoFiCdKVPCmYu2BnbiNLdKPFs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVBg/4xnAAZHGJDIpYGoA6FDlc9HTgJ1ZDO9qRE63mzZBdbrz+cS68mHXUO53ISbKlrOV+7sUN3pdd4Yjrv5EAXI70O5OBSuPIzcBvaFHJeSb3FJi0nvHKrjKoRUXgT+UGGKob9fTC/25XLQ0oc28wxxxfzBdoKihhKv2B3UPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=QAqkJYoi; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725604834;
	bh=5mzqLfW7T+9KCT/Eu0R8VmSjmBF0RsE3ZlF9EWCDd+E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QAqkJYoi/KeSx3lJTUPiYnk3p7PqGvH+IkOS1pjYmAea0tEXhIB8eILsAlXKewn/d
	 vRTIYAYTP1tlfwlCA2iTDabyHou5VEObURHHpfVjgWisf7NOqJity2NNv2XoRGuzza
	 kcA26Z1c8Gg5qgf2ZObQOpXmxJzGNluJJXadxFzg=
X-QQ-mid: bizesmtp86t1725604827tsooev16
X-QQ-Originating-IP: ooAcqUZ7t+lXQteNLEkJIX42EB788EaNuNw+PwgZ1js=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Sep 2024 14:40:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3138750108479780127
From: WangYuli <wangyuli@uniontech.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	tsbogend@alpha.franken.de
Cc: linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyuli@uniontech.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	Guan Wentao <guanwentao@uniontech.com>
Subject: [PATCH v3] MIPS: crypto: Clean up useless assignment operations
Date: Fri,  6 Sep 2024 14:40:02 +0800
Message-ID: <C4F76EB9DD3AEFEB+20240906064002.404538-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

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


