Return-Path: <linux-mips+bounces-6177-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01159A55A8
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2024 20:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD73C1C20BC9
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2024 18:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E404182866;
	Sun, 20 Oct 2024 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEucNOOO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1AAFC0A;
	Sun, 20 Oct 2024 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729447420; cv=none; b=fK1xBju0Zp+tx4uyNlEJVnlY2AGpwKbtgsijSJfoWY7qp+2yAmAtQCZbtJoI5E0vxLsY1h9uaNEHrjGyJQLcbnVJIHwyEVWURfGmWAA2Uez8pxWn8DQDv7XzWyu52r/08z+2n5gbNRsSTUvhF4w4KmeEcf8iOa4AjcDuwaZs7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729447420; c=relaxed/simple;
	bh=yJYMK3br6K6gsuyUqnxzPXiUZcPS5ZVEBLXA4w+Y3c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfFGyYLG9fE91OzgiB0lNyVKDGJvpFyRROnpCzagSbffRebdOZ9qoTLA9blbypKCSwMKPeSzI26a6DbrGF+9TQBLB/5VahMCSywpDvf2zlFYln7MXG6bDIvPEZX1PnOjn9YxWtlyWNURTjV0znaja70MULi24qv7ppGKnTQq5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEucNOOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E4C4CEC6;
	Sun, 20 Oct 2024 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729447420;
	bh=yJYMK3br6K6gsuyUqnxzPXiUZcPS5ZVEBLXA4w+Y3c8=;
	h=From:To:Cc:Subject:Date:From;
	b=eEucNOOOYQ0RVLGjWecOUXBo4CP+2OpDBxdojng8LdBfIO5vYh+QX8u7Ms3qyP8dn
	 vT+91RKWiBkKpgBRDyVIQIrt+w9oGW9f+FDJwRBdeY6mrsBvC9ebJ/G59OSjIC0vFE
	 cBZYIBd5Z4+IdJr5Zs4P/OoxR9/pKj8OCI6s9vybB58SXdxFbQTf+ljFKzPL2V7Lc9
	 Tk6Xmi7pgJ/6PqhdJloA7+enW9yFvskFRAgO9Nb42XdWFGMUJ47zzIjl5htQWJ2+sg
	 yA9qhfDzKiXhQVtVpmPdpuktRaBQdr+VRnnlY8OX51Eo8U1f1XTGKti3YAO3FFeO59
	 c1AOKCBY/VONA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guan Wentao <guanwentao@uniontech.com>,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] crypto: mips/crc32 - fix the CRC32C implementation
Date: Sun, 20 Oct 2024 11:02:58 -0700
Message-ID: <20241020180258.8060-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Commit ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment
operations") changed crc32c_mips_le_hw() to use the instructions that
use the "regular" CRC32 polynomial instead of the Castagnoli polynomial.
Therefore it can't be computing CRC32C values correctly anymore.

I haven't been successful in running a MIPS kernel in QEMU, but based on
code review this is the fix that is needed.

Fixes: ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment operations")
Cc: Guan Wentao <guanwentao@uniontech.com>
Cc: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This is a regression in 6.12, so it should be fixed in a 6.12-rc.

 arch/mips/crypto/crc32-mips.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
index a7a1d43a1b2ca..90eacf00cfc31 100644
--- a/arch/mips/crypto/crc32-mips.c
+++ b/arch/mips/crypto/crc32-mips.c
@@ -121,24 +121,24 @@ static u32 crc32c_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
 
 	if (IS_ENABLED(CONFIG_64BIT)) {
 		for (; len >= sizeof(u64); p += sizeof(u64), len -= sizeof(u64)) {
 			u64 value = get_unaligned_le64(p);
 
-			CRC32(crc, value, d);
+			CRC32C(crc, value, d);
 		}
 
 		if (len & sizeof(u32)) {
 			u32 value = get_unaligned_le32(p);
 
-			CRC32(crc, value, w);
+			CRC32C(crc, value, w);
 			p += sizeof(u32);
 		}
 	} else {
 		for (; len >= sizeof(u32); len -= sizeof(u32)) {
 			u32 value = get_unaligned_le32(p);
 
-			CRC32(crc, value, w);
+			CRC32C(crc, value, w);
 			p += sizeof(u32);
 		}
 	}
 
 	if (len & sizeof(u16)) {

base-commit: 7fa4be6d6752512278c4cbf2d2745568626e7369
-- 
2.47.0


