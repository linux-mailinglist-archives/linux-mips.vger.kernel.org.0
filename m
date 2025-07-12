Return-Path: <linux-mips+bounces-9786-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F03B02E1B
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD69A42A31
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1E8244EA0;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHOgR8/e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842D6244681;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362790; cv=none; b=Se+SaTcFitBS0aJoEquPcUoTQXowYxum9lRCApNoSerT9x97beFkoRoTR0ZtIcptPxbmLR0Z56jZTA1kehRKSTgB4HojetAe5y4gPMLVn218wllzGwnPxws4IJ7X8rZzzeakpuAgVNq7YXPJStbjnhaSCHiXiivNaa6UsM2IicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362790; c=relaxed/simple;
	bh=xZzl/xlzSt8gsN4p0nytxwCdAqxySD8jh31PuuGyOBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s82OCNVuJaTGHATlqfeApi6qm7DDsCKYHWXa+WU0e6UV9DI2w4/7YQ8IpP/RFekSfysl17WvAX8wt/Jmk1Z4tlSRTF11ahoA5M/CjvPuHbb6Afdv2Qnh2xuyAiZz5jYkkdcth7gveiJmz6zIU49l6ZPXiFd2CU7wIF9yTV6dEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHOgR8/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9477C4CEF8;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=xZzl/xlzSt8gsN4p0nytxwCdAqxySD8jh31PuuGyOBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHOgR8/eAUWb+TKPF25TOK6Sliz7m1aUYz+j/MLYKMsxt4rKWRZJGo5hPIHSV64zn
	 7of82OAPvifGLUpuHuFDsjdQA92aH7ZkFpmPXS8OiM9eZNvip/CMvh2gfWUfpsJ3l4
	 CkTk+rCEkdibLqaQH8fh3UiGr6mwjUtiZs07/Qkt+YZg1C0SccjXKZMsmT6RS+7pet
	 /YF/SspJy/r11r/BVbRD6U5wKlFEU4eWNfug2GDWZgxrSSqch+PUOQAWyZXRrUKu2z
	 Vu/ThPYn8ewEdUblbxsMvgsAY7zmfj03U8oqUd9gKkQTaGl7/Z/+oEZXpbIf/sMfr8
	 r38CY8t/o97kQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 21/26] drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:12 -0700
Message-ID: <20250712232329.818226-22-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig      |  3 +--
 drivers/gpu/drm/bridge/ite-it6505.c | 33 ++---------------------------
 2 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..89ac820a13e1e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -118,12 +118,11 @@ config DRM_ITE_IT6505
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select EXTCON
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afea..319d956c0a28c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -19,11 +19,11 @@
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 #include <linux/bitfield.h>
 
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -2105,39 +2105,10 @@ static void it6505_hdcp_part1_auth(struct it6505 *it6505)
 			HDCP_TRIGGER_START);
 
 	it6505->hdcp_status = HDCP_AUTH_GOING;
 }
 
-static int it6505_sha1_digest(struct it6505 *it6505, u8 *sha1_input,
-			      unsigned int size, u8 *output_av)
-{
-	struct shash_desc *desc;
-	struct crypto_shash *tfm;
-	int err;
-	struct device *dev = it6505->dev;
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "crypto_alloc_shash sha1 failed");
-		return PTR_ERR(tfm);
-	}
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
-	if (!desc) {
-		crypto_free_shash(tfm);
-		return -ENOMEM;
-	}
-
-	desc->tfm = tfm;
-	err = crypto_shash_digest(desc, sha1_input, size, output_av);
-	if (err)
-		dev_err(dev, "crypto_shash_digest sha1 failed");
-
-	crypto_free_shash(tfm);
-	kfree(desc);
-	return err;
-}
-
 static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
 	struct device *dev = it6505->dev;
 	u8 binfo[2];
 	int down_stream_count, err, msg_count = 0;
@@ -2203,11 +2174,11 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 	if (i <= 0) {
 		dev_err(dev, "SHA-1 Input length error %d", i);
 		return false;
 	}
 
-	it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
+	sha1(it6505->sha1_input, i, (u8 *)av);
 	/*1B-05 V' must retry 3 times */
 	for (retry = 0; retry < 3; retry++) {
 		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
 				      sizeof(bv));
 
-- 
2.50.1


