Return-Path: <linux-mips+bounces-9787-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDDB02E22
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939ABA4813D
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF412459F1;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPqiN3o3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4224503C;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362791; cv=none; b=mrowQucoLmHAEOM7ktcpgolEnLcuFdIOGGJz6y26B94PkuGNkInqIbRAgcV7TAfNTI6VEnMJtLEbYqOJRVPRsUnUMUHLNLPM/pb2HH0nbeco1NiU3xNLHcdds6dh1GTX1KYMO4FXo/EDueT6whfPSNrBOXsHSrcydJUO3cFqlP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362791; c=relaxed/simple;
	bh=CDCYvw9FzfgzLkUqSoVUscxv3AohvreIQRjFCF8Awe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrPhFByhvVClfoGCIXe8S+f9rmel8bfwxmNEJ9KIViEyMLazAbUN0+1cAxxysxrrv5lYmOM4eWixBHmU0Cyw0BIRh9MWtzPQXoXUWJ2Di/0nK+2WMP7YbsnVZR9mGvtcLb/56gxzo8/ueUPF090jeRcCieijVodeM2ehRwEhTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPqiN3o3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D7EC4CEF7;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=CDCYvw9FzfgzLkUqSoVUscxv3AohvreIQRjFCF8Awe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPqiN3o3F2CcnU/lSiSEcezOvpLqcfESj5gdIyQXIgp9TcpJNc4+SEOkjA/C+spGj
	 Zfst73HKBkJ3RTDUfFDKvQl7Mmw5pFdQYEglIXAhZC+EODLHKRSiXTX9qIZsb0r+6+
	 1IfmLcXJraIBl0WHAvq6RVh9qLNWkjfrS6B3lhzdE9bVdL3PclsJIcFWKGGHADQexc
	 oT0UaUvZGa0iS8nC0/6k8yEYGLRNGqkkHiXlesa3+yHAYn4wA3zfIhdu47yh0jD44S
	 7YhcfQhrICpQD72yjxbbQ4I94wj4xoa+kWSTHNjoYKh6ovpvEJkyWDNQRcS909kSeF
	 7YLhXtd85zZdA==
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
Subject: [PATCH 22/26] nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:13 -0700
Message-ID: <20250712232329.818226-23-ebiggers@kernel.org>
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
 drivers/nfc/s3fwrn5/Kconfig    |  3 +--
 drivers/nfc/s3fwrn5/firmware.c | 17 +----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index 8a6b1a79de253..96386b73fa2b6 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -1,10 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NFC_S3FWRN5
 	tristate
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  Core driver for Samsung S3FWRN5 NFC chip. Contains core utilities
 	  of chip. It's intended to be used by PHYs to avoid duplicating lots
 	  of common code.
 
diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 781cdbcac104c..64d61b2a715ae 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -6,11 +6,10 @@
  * Robert Baldyga <r.baldyga@samsung.com>
  */
 
 #include <linux/completion.h>
 #include <linux/firmware.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 
 #include "s3fwrn5.h"
 #include "firmware.h"
 
@@ -409,31 +408,17 @@ bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
 	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
 	u8 hash_data[SHA1_DIGEST_SIZE];
-	struct crypto_shash *tfm;
 	u32 image_size, off;
 	int ret;
 
 	image_size = fw_info->sector_size * fw->image_sectors;
 
 	/* Compute SHA of firmware data */
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "Cannot allocate shash (code=%pe)\n", tfm);
-		return PTR_ERR(tfm);
-	}
-
-	ret = crypto_shash_tfm_digest(tfm, fw->image, image_size, hash_data);
-
-	crypto_free_shash(tfm);
-	if (ret) {
-		dev_err(dev, "Cannot compute hash (code=%d)\n", ret);
-		return ret;
-	}
+	sha1(fw->image, image_size, hash_data);
 
 	/* Firmware update process */
 
 	dev_info(dev, "Firmware update: %s\n", fw_info->fw_name);
 
-- 
2.50.1


