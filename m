Return-Path: <linux-mips+bounces-14475-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BMVKKum+mm7QwMAu9opvQ
	(envelope-from <linux-mips+bounces-14475-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9B4D5A7D
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D9593007F7A
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 02:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CCA1DF27F;
	Wed,  6 May 2026 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="lCFf2P3k"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1D279DCA
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034316; cv=none; b=NQOQIJQq0DosZlkoW6FFMwDcAa36w1TP+9i9tRRJ98es1T/ivacnA43umv3CkISgQfFLtDvHmWxUt5V4nS9eyDUTdOBBNqXBkQpfadFwaVUMI5IiHkoqtfRwLQ4H/J1Ld7zMnoalK8u4aNLEj4K+oIu2bUoTVMpjqw/8B3J7No0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034316; c=relaxed/simple;
	bh=bPaCfOo7Jza/gA/NBqWf9P7UDT6hOs3InWd7/OvZ1zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvo+cE1u6U2uu4e4zx7jNNKQPbDoHMEUBM3XnYEndg3aBm8qBhDF7KFhKJ8Jn8VwpW+zEmxp7zljdr2xrc41LEzBov8niN1+KQLrN4iiHTbxkZvWD25HvlKnz8odLppFgt/s2gbGGaVT4Kf9sWHm6jhp0zRXBmMka81ARjvIqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=lCFf2P3k; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso367725eec.0
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 19:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778034314; x=1778639114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kyJpuOtQ8ZWddySKSeNDHVlMxiqYgQi/4o8AcQNP10=;
        b=lCFf2P3knsqubCN8amgLQWkXq034kR5Yz0HwpYRm6XqUbO8FKOEvl27xt2kxomWfum
         bc/mWzlZ5PbevGYm1r7QeWAuXbqxoKpQiNZNGpZcax06AAhsEHmIAp87Z5pe6pfNO3Oz
         nfCqXx2gUcsu/BpVGRzzDnFjBnFev5vA4jttno0woWjVmSHQYVSaIODEetg1qTfc/v4j
         5zuOf0p9zkWDTI+iBl9vpPmxN8LhORIKWy4dOusbwJJfF9+9IfqmRAb8Ef1DEKz5Fkfq
         sa0pX3mLOxFuARDNFwlqAhUhxlEAb4cko/BIX803QRU3eOhK8JA/ZX99lqcdlXMtiW25
         +Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034314; x=1778639114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kyJpuOtQ8ZWddySKSeNDHVlMxiqYgQi/4o8AcQNP10=;
        b=O2LCp492nea2qvac4gaIUFTMiG+R6vM73PqSpuKnGLVrjw4yw5D1kTP+fAY3wOTiWG
         v9CxSdl398TNtx1xTsnOY2LkDQnwdy4hbD7eJJt4X2z7xrzjyvVSCtZAF+lu9CiZoGfp
         inLun/swqnICENK+4xfT1yzyoZQrcPUejcjcqKe/kUQBqY1GHi2if34MHUAWnQih6aFx
         qqwkvHhlucGtWsSSjV8zshCap96sgZRomBGnanIxII15NKuwCx3mM/FeklFvEUKvBopF
         ISrNo8yW1c3cF8ibw7FKYvLr7cOawtJa5qDH0XYwHGoQTS4pzffxql7fGt7dXpL6OFkm
         GG/w==
X-Forwarded-Encrypted: i=1; AFNElJ8G0ATKHzqtmKd3f7D87BxmCyuaW81251CWjmqjnSf3nl5UxdpagB2hKm7bAeb3cnOQXl3dMsi66I3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKbcjlYwsJEEV3aHhD5jRpm0skE/Wb3Dibb74wu2m1aR5gfF5
	/ww6TqXG1KJUMegF93JC1fyoIeNzsunb701VmbNuWl2nvWWZTSjRiLPghrEeOt+oeLw=
X-Gm-Gg: AeBDieuDFJO0atdzLwbi3YRMMyIT+lfOMF1CtIsg/X+yB7bjwlIT1KojhJgK2d3CVuJ
	5Np6Zv52PM6wWGo6r74OXltQZlNYcEKwWKzbqma07EpZs76d0VilOiAm2zuqcef67HFC7+4fLUn
	jfu5vX9L414rol0zRoUQ9SlrsMReb5+i3tY+0Mmy4ZeA6SWwF0AIwWvVTYRmzkxoU0f2KLI5ILV
	YTmNXLj0Oz7EdE4F4h16snen2z7pn9kWl8fXN+esodqPKYkqHID1rar5oWX9n6fcCkH6jB8JQZw
	nDXTA3qXBHRI1DNLzK2DGeNYWCss4wypZtEx3Gq/yaRlUj87Z5Xe10veIaF162kRQsu/LgzxaQp
	hi9ehGJ5f2Vr+BL9eoCpndPYa2ndZU3qErv0eWLUwN2YqKTwexMGaUcitE1EGZK9q4SqI3b25lD
	Yxc/ORwmkwizIE70ls34/SlJNYqmMNdcW1NUWZssKN05YZFQ==
X-Received: by 2002:a05:7300:320a:b0:2f1:8f09:702a with SMTP id 5a478bee46e88-2f3d079b31amr2795010eec.13.1778034313619;
        Tue, 05 May 2026 19:25:13 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d5c3783sm1669552eec.11.2026.05.05.19.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 19:25:13 -0700 (PDT)
From: Felipe Ribeiro de Souza <felipers@ime.usp.br>
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	nuno.sa@analog.com,
	paul@crapouillou.net
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>,
	Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v5 1/3] iio: adc: ingenic-adc: rename ingenic_adc_enable_unlocked() function
Date: Tue,  5 May 2026 23:24:28 -0300
Message-ID: <20260506022454.128169-2-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506022454.128169-1-felipers@ime.usp.br>
References: <20260506022454.128169-1-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F3F9B4D5A7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14475-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,usp.br:email,ime.usp.br:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ciziks.com:email]

Rename ingenic_adc_enable_unlocked() to __ingenic_adc_enable() to
better reflect that this helper must be called with the lock held.

Signed-off-by: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Co-developed-by: Lucas Ivars Cadima Ciziks <lucas@ciziks.com>
Signed-off-by: Lucas Ivars Cadima Ciziks <lucas@ciziks.com>

---
v2:
  - Adjust order of #include.
  - Replace guard() in ingenic_adc_read_chan_info_raw() by scoped_guard()
    to preserve original behavior.
v3:
  - Split out ingenic_adc_read_chan_info_raw() logic to helper function.
v4:
  - Adjust code style for better readability.
v5:
  - Rename ingenic_adc_enable_unlocked() to __ingenic_adc_enable() and
    ingenic_adc_read_chan_locked() to __ingenic_adc_read_chan() to keep
    the convention about the locked functions name.
  - Move the mutex lock back to ingenic_adc_read_chan_info_raw().
---
 drivers/iio/adc/ingenic-adc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c8779a4c..231ff8d584c2d 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -181,9 +181,8 @@ static void ingenic_adc_set_config(struct ingenic_adc *adc,
 	mutex_unlock(&adc->lock);
 }
 
-static void ingenic_adc_enable_unlocked(struct ingenic_adc *adc,
-					int engine,
-					bool enabled)
+static void __ingenic_adc_enable(struct ingenic_adc *adc, int engine,
+			      bool enabled)
 {
 	u8 val;
 
@@ -202,7 +201,7 @@ static void ingenic_adc_enable(struct ingenic_adc *adc,
 			       bool enabled)
 {
 	mutex_lock(&adc->lock);
-	ingenic_adc_enable_unlocked(adc, engine, enabled);
+	__ingenic_adc_enable(adc, engine, enabled);
 	mutex_unlock(&adc->lock);
 }
 
@@ -222,11 +221,11 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 	cfg = readl(adc->base + JZ_ADC_REG_CFG);
 	writel(cfg & ~JZ_ADC_REG_CFG_CMD_SEL, adc->base + JZ_ADC_REG_CFG);
 
-	ingenic_adc_enable_unlocked(adc, engine, true);
+	__ingenic_adc_enable(adc, engine, true);
 	ret = readb_poll_timeout(adc->base + JZ_ADC_REG_ENABLE, val,
 				 !(val & BIT(engine)), 250, 1000);
 	if (ret)
-		ingenic_adc_enable_unlocked(adc, engine, false);
+		__ingenic_adc_enable(adc, engine, false);
 
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
 	mutex_unlock(&adc->lock);
-- 
2.43.0


