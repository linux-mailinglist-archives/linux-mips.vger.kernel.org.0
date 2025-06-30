Return-Path: <linux-mips+bounces-9568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCAAEE3E4
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67FC189FCD3
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CAC295DAF;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFhWefsH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030D295D90;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299761; cv=none; b=EMwPbkoD5WChCVAldS2hUeEumHIAH5aPYaQUaAQiST0GVuGZC5VKuSL1H0CkvdtY3epoZkaWDKRSc919h6jm7MpuBhqGdIS6bsbZC5GKKP/FhrK8pujQbkvMWlTdCxhY1oxrWv6SyV0VuTvONmZlwMJtO+bUf5ZcR8WsPJ7IYsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299761; c=relaxed/simple;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZqre/YjqWikwrO0HuWQu8na2/llozlmjdLRV8XI+wIZzoecWf3A1Y9PMmzhiHdkmOtohmgWub11l5BeFpFWklgvd4H7IOZAjv60UGHnPXzXT+QR6KHu8xd8u6FVyiYaWIbp4MGc5Q8Rz4UI2jtkfCI67n2kejWATc4W1fboZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFhWefsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258CAC4CEF3;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299761;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFhWefsH1fRXhIkYKGeZupotUIuzQK0mHzeRtMkQRgdXPsGlkhpPRKQobnQvGKuGT
	 7PnPapOh93KHn6MH4/WuOrwHL2xVOcpK28cyBs6+yH63i0K+m/eh3SvOmAcFeq4kxI
	 ytKgB/RYasfDuHhowfiLEeDwE87VFQr62Fm8GOL/0SHcZODK/rDekuBg57dxIvGfRV
	 nhfM4qJVirbVxiqe2/U+pyUjo6po/3IlrnKZeXL/oo5RjjQ94CZbiYjI3Vrm6Q8Qev
	 NQVMh2AOzs2cg7eK1PcomkfvEIHncEcPRawm+yQBRlbaqBJ+ws+8cn9ct24/SMfzFx
	 rTjzEXS2tfbtQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 02/14] cxl/test: Simplify fw_buf_checksum_show()
Date: Mon, 30 Jun 2025 09:06:33 -0700
Message-ID: <20250630160645.3198-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First, just use sha256() instead of a sequence of sha256_init(),
sha256_update(), and sha256_final().  The result is the same.

Second, use *phN instead of open-coding the conversion of bytes to hex.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 tools/testing/cxl/test/mem.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 0f1d91f57ba34..d533481672b78 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1826,31 +1826,14 @@ static DEVICE_ATTR_RW(security_lock);
 static ssize_t fw_buf_checksum_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
 	u8 hash[SHA256_DIGEST_SIZE];
-	unsigned char *hstr, *hptr;
-	struct sha256_state sctx;
-	ssize_t written = 0;
-	int i;
-
-	sha256_init(&sctx);
-	sha256_update(&sctx, mdata->fw, mdata->fw_size);
-	sha256_final(&sctx, hash);
-
-	hstr = kzalloc((SHA256_DIGEST_SIZE * 2) + 1, GFP_KERNEL);
-	if (!hstr)
-		return -ENOMEM;
-
-	hptr = hstr;
-	for (i = 0; i < SHA256_DIGEST_SIZE; i++)
-		hptr += sprintf(hptr, "%02x", hash[i]);
 
-	written = sysfs_emit(buf, "%s\n", hstr);
+	sha256(mdata->fw, mdata->fw_size, hash);
 
-	kfree(hstr);
-	return written;
+	return sysfs_emit(buf, "%*phN\n", SHA256_DIGEST_SIZE, hash);
 }
 
 static DEVICE_ATTR_RO(fw_buf_checksum);
 
 static ssize_t sanitize_timeout_show(struct device *dev,
-- 
2.50.0


