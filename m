Return-Path: <linux-mips+bounces-5372-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED096E863
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 05:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2286E2868B7
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 03:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC673FEC;
	Fri,  6 Sep 2024 03:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="g4scRZWa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F738DE0;
	Fri,  6 Sep 2024 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594428; cv=none; b=kFsEBNW94Qv5d7g9hA72mIk9KRFsjBYZBtVBgjl7/wqiQo0w67tY2HOc9X0HlTQocCYtdA6ufKClWVQSTbJ+asYgzSk4AkuBGJu8rz/bg5EouwPDTB/maJsYWpvWINwziNmggxGk/Qb8qRlWROJ7RZJMF1TDc6PeGktNIavJJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594428; c=relaxed/simple;
	bh=gvY8AH4a88MP1lz2m4OgJjyz6KDbapZwsTzDMYuixg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4GdmUNcsb088/Jh1HeBQm2FWdl9N4d8P9DPLY6i1HJ+1yJNzTWGFePtj6Gl8CFYsJQmnm7fk8EI3oY9lzpYHTZFq0Ubwi8CCVRGUfeDXJHW4GD+IRXZQSoxPZq6JV1KvKPc0cYi1kWhzA3E6P6ePf3yIBoqrfIBmf4SqsAGgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=g4scRZWa; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725594380;
	bh=BHo9Isz2T8wnA4FQQqg3YttItu9Af8Lpgwwo2oZ48CY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g4scRZWawW7IHe+xqpM2KulTnkm2i6wNfOONB8yF/RRu+hB5EpNcQE61RKRzOT/Ta
	 6U4aZpzfsQ79BkUnFAgwHA1erZE/MptI5PgJCEntC09KH3VLyMdpGcSp6hn6tzn4CG
	 Hl0We5VnzWnMExj165JhpxEG5tJFxD6RaVnfxpbg=
X-QQ-mid: bizesmtp90t1725594372tauikl58
X-QQ-Originating-IP: +xTdcMwz1y4V1nr4HP4Mev0zaP4TBymkPMdR552yAxM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Sep 2024 11:46:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2951222773783350106
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
Subject: [RESEND. PATCH v2] MIPS: crypto: Clean up useless assignment operations
Date: Fri,  6 Sep 2024 11:46:05 +0800
Message-ID: <AB62DAB2DB1B854E+20240906034605.359512-1-wangyuli@uniontech.com>
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
Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/crypto/crc32-mips.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
index ec6d58008f8e..3a80b7576ec3 100644
--- a/arch/mips/crypto/crc32-mips.c
+++ b/arch/mips/crypto/crc32-mips.c
@@ -77,36 +77,29 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 {
 	u32 crc = crc_;
 
-#ifdef CONFIG_64BIT
-	while (len >= sizeof(u64)) {
+#if IS_ENABLED(CONFIG_64BIT)
+	for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
 		u64 value = get_unaligned_le64(p);
-
 		CRC32(crc, value, d);
-		p += sizeof(u64);
-		len -= sizeof(u64);
 	}
 
 	if (len & sizeof(u32)) {
 #else /* !CONFIG_64BIT */
-	while (len >= sizeof(u32)) {
+	for (; len >= sizeof(u32); len -= sizeof(u32)) {
 #endif
 		u32 value = get_unaligned_le32(p);
-
 		CRC32(crc, value, w);
 		p += sizeof(u32);
-		len -= sizeof(u32);
 	}
 
 	if (len & sizeof(u16)) {
 		u16 value = get_unaligned_le16(p);
-
 		CRC32(crc, value, h);
 		p += sizeof(u16);
 	}
 
 	if (len & sizeof(u8)) {
 		u8 value = *p++;
-
 		CRC32(crc, value, b);
 	}
 
@@ -117,38 +110,32 @@ static u32 crc32c_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 {
 	u32 crc = crc_;
 
-#ifdef CONFIG_64BIT
-	while (len >= sizeof(u64)) {
+#if IS_ENABLED(CONFIG_64BIT)
+	for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
 		u64 value = get_unaligned_le64(p);
-
 		CRC32C(crc, value, d);
-		p += sizeof(u64);
-		len -= sizeof(u64);
 	}
 
 	if (len & sizeof(u32)) {
 #else /* !CONFIG_64BIT */
-	while (len >= sizeof(u32)) {
+	for (; len >= sizeof(u32); len -= sizeof(u32)) {
 #endif
 		u32 value = get_unaligned_le32(p);
-
 		CRC32C(crc, value, w);
 		p += sizeof(u32);
-		len -= sizeof(u32);
 	}
 
 	if (len & sizeof(u16)) {
 		u16 value = get_unaligned_le16(p);
-
 		CRC32C(crc, value, h);
 		p += sizeof(u16);
 	}
 
 	if (len & sizeof(u8)) {
 		u8 value = *p++;
-
 		CRC32C(crc, value, b);
 	}
+
 	return crc;
 }
 
-- 
2.43.4


