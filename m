Return-Path: <linux-mips+bounces-5095-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC395EAA1
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 09:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2260287314
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 07:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5F0131E4B;
	Mon, 26 Aug 2024 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="UssJl6wd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BC8129A74;
	Mon, 26 Aug 2024 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657770; cv=none; b=Lxe+fTvKnMbN3B5EeWWeiKEqw729miqGb0EOX/cFPTphEmq+f5GuA4qPTSa4JASKlwqBEB6aMKjGaeVkUf0BvF7UtbfolV40LJ5DIMupUp6bFSbZ7RAYAASqYc5HFdAGmwnUytas/fiD0rUdpNyh7rf7DzLkFUYHCqNopmcrmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657770; c=relaxed/simple;
	bh=gvY8AH4a88MP1lz2m4OgJjyz6KDbapZwsTzDMYuixg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9e6f2b3jHBoAH8BpIvMHkHVknrXEDoBEKzh4pEzKhMVQSYALa6l3BR6Z/8N+97rFlIZ1Ye/kM6XUsvrACGrVjcKvfo+fxvW8prd31fqSImTI7l8yosWlSJtmbgqvBn6aMpcOxWj/HEMovetPnfs4nPx0vdXulDiDBBwwqJlCik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=UssJl6wd; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1724657731;
	bh=BHo9Isz2T8wnA4FQQqg3YttItu9Af8Lpgwwo2oZ48CY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UssJl6wdqsO8BmTIvBZeUKUjMZvAScE+J1fpkkKhc3KcYBXE1CLidqQaYCrrXC6dJ
	 PxuIkgljjw98g6O3oIZH08/UNoDEf73Tt0zFkcinUs9ps/1izE8eogjm7jxtTTHMHc
	 jA81Dhwu6qBchNh7DA0oIizcMSBHyj4+SewSbpjw=
X-QQ-mid: bizesmtpsz1t1724657724t649sll
X-QQ-Originating-IP: uwki6QKLS7//uyngcBsEu/Z1SrjmGyWbJZ5KjC6R5NM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Aug 2024 15:35:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16075421044122579621
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
Subject: [PATCH v2] MIPS: crypto: Clean up useless assignment operations
Date: Mon, 26 Aug 2024 15:35:18 +0800
Message-ID: <E77DE576D872065A+20240826073518.812454-1-wangyuli@uniontech.com>
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


