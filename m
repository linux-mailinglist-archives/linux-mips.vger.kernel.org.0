Return-Path: <linux-mips+bounces-14477-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPcAGpim+mm7QwMAu9opvQ
	(envelope-from <linux-mips+bounces-14477-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060804D5A68
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6941D3022048
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 02:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6313A29AAFA;
	Wed,  6 May 2026 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="CkCBS827"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD5279DCA
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034326; cv=none; b=oqBuUIJy1y91lbiw6B8CJV5VznQKNWw9ylIwdnw/MXGySmx6f6hQEy/YL2oH08yMetAXKoM3CM5kauKrf3sYsTsj248eau0QaAv5fgBiVMgc9yHjOyQ//scR/kQQGuquHrLyVOw2rRG7zj732R4llk3kjA8hHBzKFm2nZvt48kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034326; c=relaxed/simple;
	bh=lFTm9qEyCAK2nGIpK0rQ1cCJK08Abms4bIKKP+sMSnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBvVlc5fItJW+2fTUYGDL5WBRjKF6O0nL7aSiR1HtxOTjGKydBytlupnlJslb9vQwP2gyp1dxatYPyOsOfeGWvEh/yJ8BYgJcy4KKY6YfCTTzBD1lMhTJkSDqa/JENpstvp7nfKWs5SCEAqyyHhKI0uU1G9ukbNFWAg0L7Z2IfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=CkCBS827; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so14235597eec.1
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 19:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778034324; x=1778639124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DevSjtpLYeeeXCne4nAk0EPcavZXhzZV81kaGXd3EmA=;
        b=CkCBS827efhghJFkb8tQProxN0yfW3+Ehu7+MeXW68YHW8/PfWb7d59n2ZwlgaT0LK
         16c9VfbkRqNYAco3mZnRjOCmXCoiAl1J8dWLZ9ES7+atf4YpH9AhxvqwgKb/YatFSYuE
         eLfz2goenbjBsLz9SUWNBxR9zWaZeh25oe1JmxUclt4M8dTz6o8MBvNEULPknj73z4aw
         0Dr5GJexye/yRbbFsTozGIFJtANUKV8mgJQT1ZBsSnycIy0AycBDp6wvi7GbM6lELfml
         QWlBod7I4Dx+FVInASy1jPzj5/bAR1ab/rbrYZo0H3mDTMQxgLaq10d6XGy7tZXtw0/e
         wD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034324; x=1778639124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DevSjtpLYeeeXCne4nAk0EPcavZXhzZV81kaGXd3EmA=;
        b=ZjPzSDEWzIDlJOwP4eprtoPuktNDF2BWI+1kWN+CSTAyNxGqBfAzrw2fRpgqq9gncp
         S+OaGDVhCi0HkJ7wh7PbQSsfMqGRddX7RSywQUtnLHw4JQBXu6rDNDEHbvn+ki6h8Jon
         0Dx4bhGWjEtJu9zIa+Bh+OdDQPSU+2fX2KRE9sJ4AZYo8kL4QNh4+Q0rQgyewA7Fq887
         6nUeD75YXu0cfiHKy/XVeN9qHA/r72734NC/QI35PFl7WTbkie823txmnWxKR/3kbI45
         hGWS5EleTZUREoFgb9Gs6fuWT2PUCGZqQMdHBIKsjrKZUSM2c7zubTqGvumPMbOK3lvk
         +0pg==
X-Forwarded-Encrypted: i=1; AFNElJ+rMSRyyDx9AmPW4d7e9K6PF5RICs9AUGqJUTpq+wqSNd1QpwB+N582nWAYLu5yCh8C7eNgprHXQzFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37eSO6AbXYCUCP6Xc8iyjzoKtqpEjUN+8YdVj1c2h8GVuORzH
	kj5Vz/N/sD+x/2drKLasBGHSTZHL6IshiLnuQBuCyZR4emhLkNlOmLE6XhaFBqeHqpg=
X-Gm-Gg: AeBDieu+zzvayydAf4jajN1XqEmXoCFCbUbZVyM1nh9s5j4vzK2vP8RNZMZBnu2NZ1t
	5xSb8mgdVse9xV1xZ1DmUMpmgA5P8Ng7PdUKEHRCBYd3Chz5U2+zPU6FhAzy4dEX0dtZH8LfwSy
	kGWfeDlounWVzM9VcYplLfzsN4bObroeOq8dPLswCXVKkzC1UvQWrBSyaVcsCcsoNmi37qF2R0x
	SN2/NCW3k6Gg2CjS+efMDVIByPdK6pUsLAOd40ovjUwEkj6xcD3T+9U067IO2MCOo1ViDMzUJ4R
	EW4Cm1MxPIPOTeOlRRo1/cB4bPFGQI0i6WPcMxu0wEQvt+ReyZ21cwyIpkDDSoPu9TedWkooXFb
	GUfvKGd8+mLbjD+t74zcqmVyd2k/MhFN9NaOH5lsPfaPrBctTvY+jcxfUFJ2sYqz6PNE4aNyPKr
	kENGGjfSmj1YA6vEX6MkQEuuWfth+znOsircFWZxM2L4kgpg==
X-Received: by 2002:a05:7301:3f16:b0:2c9:1943:e7ff with SMTP id 5a478bee46e88-2f54b35fb00mr855079eec.10.1778034324067;
        Tue, 05 May 2026 19:25:24 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d5c3783sm1669552eec.11.2026.05.05.19.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 19:25:23 -0700 (PDT)
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
Subject: [PATCH v5 3/3] iio: adc: ingenic-adc: use guard()() and scoped_guard() to handle synchronisation
Date: Tue,  5 May 2026 23:24:30 -0300
Message-ID: <20260506022454.128169-4-felipers@ime.usp.br>
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
X-Rspamd-Queue-Id: 060804D5A68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14477-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,usp.br:email]

Replace mutex_lock() and mutex_unlock() calls with guard()() in
functions ingenic_adc_set_adcmd(), ingenic_adc_set_config(),
ingenic_adc_enable(), ingenic_adc_capture(), and with scoped_guard()
in function ingenic_adc_read_chan_info_raw().

This removes the need to call the unlock function, as the lock is
automatically released when the function return or the scope exits
for any other case.

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
 drivers/iio/adc/ingenic-adc.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 91e3ea6615942..414f69acab7b3 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -7,6 +7,8 @@
  */
 
 #include <dt-bindings/iio/adc/ingenic,adc.h>
+
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -115,7 +117,7 @@ static void ingenic_adc_set_adcmd(struct iio_dev *iio_dev, unsigned long mask)
 {
 	struct ingenic_adc *adc = iio_priv(iio_dev);
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	/* Init ADCMD */
 	readl(adc->base + JZ_ADC_REG_ADCMD);
@@ -162,8 +164,6 @@ static void ingenic_adc_set_adcmd(struct iio_dev *iio_dev, unsigned long mask)
 
 	/* We're done */
 	writel(0, adc->base + JZ_ADC_REG_ADCMD);
-
-	mutex_unlock(&adc->lock);
 }
 
 static void ingenic_adc_set_config(struct ingenic_adc *adc,
@@ -172,13 +172,11 @@ static void ingenic_adc_set_config(struct ingenic_adc *adc,
 {
 	uint32_t cfg;
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	cfg = readl(adc->base + JZ_ADC_REG_CFG) & ~mask;
 	cfg |= val;
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
-
-	mutex_unlock(&adc->lock);
 }
 
 static void __ingenic_adc_enable(struct ingenic_adc *adc, int engine,
@@ -200,9 +198,8 @@ static void ingenic_adc_enable(struct ingenic_adc *adc,
 			       int engine,
 			       bool enabled)
 {
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	__ingenic_adc_enable(adc, engine, enabled);
-	mutex_unlock(&adc->lock);
 }
 
 static int ingenic_adc_capture(struct ingenic_adc *adc,
@@ -217,7 +214,7 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 	 * probably due to the switch of VREF. We must keep the lock here to
 	 * avoid races with the buffer enable/disable functions.
 	 */
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	cfg = readl(adc->base + JZ_ADC_REG_CFG);
 	writel(cfg & ~JZ_ADC_REG_CFG_CMD_SEL, adc->base + JZ_ADC_REG_CFG);
 
@@ -228,7 +225,6 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 		__ingenic_adc_enable(adc, engine, false);
 
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
-	mutex_unlock(&adc->lock);
 
 	return ret;
 }
@@ -681,9 +677,8 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 	}
 
 	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
-	ret = __ingenic_adc_read_chan(adc, chan, val);
-	mutex_unlock(&adc->aux_lock);
+	scoped_guard(mutex, &adc->aux_lock)
+		ret = __ingenic_adc_read_chan(adc, chan, val);
 
 	clk_disable(adc->clk);
 
-- 
2.43.0


