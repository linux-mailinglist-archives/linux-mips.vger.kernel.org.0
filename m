Return-Path: <linux-mips+bounces-8970-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D184AAB2A43
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 20:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A683A2A72
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 18:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9ED925F79D;
	Sun, 11 May 2025 18:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpLdqagB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090C1F92E;
	Sun, 11 May 2025 18:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988195; cv=none; b=t4TSRKSUAnKI3TVQkxtFNPlhbvTTSdLkHiEQ86HTnuKDDKqVzXFrFpj1Ir0IvY5/7VDbMRfzGxZVu8/CjLFsQdrtS2j+EtNRJjP1hc4EOqvGe0rYHoFh+o5JrPFnGcWwwEDy/a6RvkybCEKam6AycrxpyJ4CVOid319FaDeujcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988195; c=relaxed/simple;
	bh=P08spHZCqkS+djzmNWpgkloO2IXMuAAmAfbPME2tGQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDg8VogzM9r+YwvK2sHMtc9WDjorLUoyL3IvBmHBi3cH/uyEnFBnGnVJoQUXpiWhhjX80vBNBLV0U1/fjihjbAQR4VTaWWTE6V48+fSXMzmnwLTTliHHCepLWGDkks9Jd8gnC71KD0pn4f8AjorSjbL3UIVK8ZDYyh3iJR6rE9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpLdqagB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC0CC4CEE7;
	Sun, 11 May 2025 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988195;
	bh=P08spHZCqkS+djzmNWpgkloO2IXMuAAmAfbPME2tGQM=;
	h=From:To:Cc:Subject:Date:From;
	b=LpLdqagBM+oB8qUzlV7CHCti//pjdZzMNl0dBFZgqq4BPf2EMbOkib3LpWIimJ2gl
	 6W2na9nPobLe3qPleHFShIhXBgajP4Hno0tsJKToXqugQl2GCAsoZjUVilO5vIFEZK
	 5/lr20gZ7bkV8yyjVMAIOqVHs/6JG0kh7IZdHmweHvC7vlhS+sjAMU5a2R9QzvViS9
	 OMIoVROCueqtzBy8wwxZQZtyW9XsIwojxzZE7E3hw65TETUI/ns2VGXC1PNyG3MQIj
	 bY2J5Dfi+lhcVXhr0ynvedVTWgC0XCdBsYGNyhcI5ZTWaBqqyfW2rIM3LQiTXVwcg8
	 I5XK20edQWZcQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] MIPS: bcm63xx: nvram: avoid inefficient use of crc32_le_combine()
Date: Sun, 11 May 2025 11:28:36 -0700
Message-ID: <20250511182836.21611-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

bcm963xx_nvram_checksum() was using crc32_le_combine() to update a CRC
with four zero bytes.  However, this is about 5x slower than just
CRC'ing four zero bytes in the normal way.  Just do that instead.

(We could instead make crc32_le_combine() faster on short lengths.  But
all its callers do just fine without it, so I'd like to just remove it.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Please consider this patch for the mips tree for 6.16.  If it doesn't
get picked up, I'll take it through the crc tree.

 include/linux/bcm963xx_nvram.h | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/linux/bcm963xx_nvram.h b/include/linux/bcm963xx_nvram.h
index c8c7f01159fed..48830bf180427 100644
--- a/include/linux/bcm963xx_nvram.h
+++ b/include/linux/bcm963xx_nvram.h
@@ -79,29 +79,25 @@ static inline u64 __pure bcm963xx_nvram_nand_part_size(
  */
 static int __maybe_unused bcm963xx_nvram_checksum(
 	const struct bcm963xx_nvram *nvram,
 	u32 *expected_out, u32 *actual_out)
 {
+	const u32 zero = 0;
 	u32 expected, actual;
 	size_t len;
 
 	if (nvram->version <= 4) {
 		expected = nvram->checksum_v4;
-		len = BCM963XX_NVRAM_V4_SIZE - sizeof(u32);
+		len = BCM963XX_NVRAM_V4_SIZE;
 	} else {
 		expected = nvram->checksum_v5;
-		len = BCM963XX_NVRAM_V5_SIZE - sizeof(u32);
+		len = BCM963XX_NVRAM_V5_SIZE;
 	}
 
-	/*
-	 * Calculate the CRC32 value for the nvram with a checksum value
-	 * of 0 without modifying or copying the nvram by combining:
-	 * - The CRC32 of the nvram without the checksum value
-	 * - The CRC32 of a zero checksum value (which is also 0)
-	 */
-	actual = crc32_le_combine(
-		crc32_le(~0, (u8 *)nvram, len), 0, sizeof(u32));
+	/* Calculate the CRC32 of the nvram with the checksum field set to 0. */
+	actual = crc32_le(~0, nvram, len - sizeof(u32));
+	actual = crc32_le(actual, &zero, sizeof(u32));
 
 	if (expected_out)
 		*expected_out = expected;
 
 	if (actual_out)

base-commit: 3ce9925823c7d6bb0e6eb951bf2db0e9e182582d
-- 
2.49.0


