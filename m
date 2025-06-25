Return-Path: <linux-mips+bounces-9478-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82900AE77D9
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C3F1688A0
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9C21FF1C9;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFyVXiVi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD21FDE39;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835428; cv=none; b=jR5j5Nki4wnD9+nXVlw9O03eWpO1gQ7O06EkYgc3q7vjmTokZgoC/WpVUKsi0dU0OvC3K6tDwKodaKEoP80oKhf+OwvpVsqLzjUq3i50TuxtOKwJASO5zbVo+sCXsPzRGcp2cR8w+Y7heD1FGWq9KO1KKcIQYFtljMRv7U9IKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835428; c=relaxed/simple;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ8KXpj6/nNvEwYL3mKltoWB9R2ambEcxBJsLQLXFFZ23jybrTJvrwNHX8Cg2rUAsV0hyXT8K4yx26NnAhzHzDE0h226YfPja7ue5o7wlEik3ikbRcliUn3yD+pcGZ8B4gUfMao2YflR78LCQD49wV0K7y9hXVsfUq4xkcEqgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFyVXiVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4181C4CEF4;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835428;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFyVXiVibPF18EO8gj6Jg8HFt9D0dAKEtmgBllL6vS9puXEkLps5gGp8IKQOMYoEU
	 5cIMp+c+4Lw+Md2qvcSaljt6xufjhViD2eHp77C7AyQs1BQx07SSUxJHjp1R0N/16N
	 C9qn8pZxEt5b6NDQUrlVxIrbOHtSyYVwN3KGx7y0MOmYsCFQU2MsU02kMD0HmvZdME
	 yIShdZk23UOa1raxW1EGKtqSRe/5QtI3T6rhPGDi9zx6HVJpqsBfLq3VyQx3ChC4Nn
	 p2b5qocKN78Ox6UeR+WxFAOugP5RqbJOBsLqASFPiHO8G/b6w8RjDlMzNOJo72ptLm
	 N8Lwk1i6vX/Nw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 02/18] cxl/test: Simplify fw_buf_checksum_show()
Date: Wed, 25 Jun 2025 00:08:03 -0700
Message-ID: <20250625070819.1496119-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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


