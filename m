Return-Path: <linux-mips+bounces-14237-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCS/Of5z6WlbaAIAu9opvQ
	(envelope-from <linux-mips+bounces-14237-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:21:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CF44C19C
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0937E301FFA8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 01:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D63358C4;
	Thu, 23 Apr 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="b3g08thV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CE3164BB
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907259; cv=none; b=gnnAOT5btsQkAr8J+PqMGgjDxFOip2dkyxViTUlpzMb7IUALllZXcV6AIJwfX080uUQrJC3KT2UCF4WM8d4VKyUIw/oYMPcontt8/wCdsJWGbhDJDgj1NI4XlHNPzpHdDlhyELIfbte1XZ1GeIaqUylb5APn4baoCPTe28p268A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907259; c=relaxed/simple;
	bh=4DrNjwo8uIwCDNducjAx4yUSrQy5oGs+c+60R2z7No8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeSUUC+F+d19Ed49XV+XQ9zk6rl8mecBd7RQnm/4pRpjjC39c8S0/K9c9fJsXTCBcXmSa+b+3tEuT/OX5Sl69xjvDA2Awvps3cySxwkrK0s7rm+ddtF2yajc8GONhLgBQUvfesrWDkjiOyYhQbdAk3WaB3lkha4DU2p2DVBmWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=b3g08thV; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c726ef332so8525356c88.1
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 18:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776907257; x=1777512057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WacU78F8QYGrv10AUSXrlUWShZ6Ipzv7ZroO0zW8aE=;
        b=b3g08thVq045+owgpUuOgiZ5KFPgNGxZtWIbbS/VElKxymHhjln5sz2FKMpTxuCsH3
         Ey4W78btJB5M7G/FmLmNOvorxDSwNHR5rzRwMRacnFPL7oZZ986KehgbRRybZO+LGVWq
         rtr3mqQwzqTe120kIcLQxOiNYEHdJyZQM2CxnS9RSSGoAJ5RPP3FBIxd3YbfuLY4ZE1V
         wXo1INW9mQ3YX/cBar/Phk/6M/FP2E3/UPxw0gLKMelidtQStx1Na/1Dw9ty9GiZDADo
         JKpL62254+LzvmO0p3CJXntySoPjOaVWrARw33sGVdftgD163sKjx6xFsTujunQuaFZ5
         D61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776907257; x=1777512057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WacU78F8QYGrv10AUSXrlUWShZ6Ipzv7ZroO0zW8aE=;
        b=dlq4/PG7hADpTPizEmMVip5JXfFLC17bP9SmHLCxr0XwdRjcQn2FTBQrlPrsj2bE6j
         iJ+dPlSn/Kv8rW0ivqzzKEUu4t/Y0wTsE/7JdTSJPBxcA64oI2kXTSDJfL479ezxRcdG
         sRPL6X9xDZyO79HnLua27RHJV8oBrpn+TyuyjnVJfSiJwK5StrEsTZN+hQVUvIWe0SW4
         oXMnNvOUV1WnUh/sdweMnER6SyNFxHp96b9HIGYs8aVJpWLIMnoMo+NUqZ4gBSwzzaTP
         VXbMDswOivO84qC1eEYofWB+kzvnH/dTzrQFb5gouwRMzcEm47T6jgmqZ7rrVKyGvC+J
         xtJw==
X-Forwarded-Encrypted: i=1; AFNElJ/022PO8EgevsfsCPAKS7fO+Ds50JHpJG2OLA4Fsv07udawURC2+t9uHSvlLhHPqEfTpFh6rwf/GC2L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LjvYLCYIG/9jDwpNMxbfi+CqM4P3axR3j2N84/PX1DvROdXc
	tdVsE8qrdBgsl3GvbV3AGUyZ7I/fzWizOWH9hzuGyTUkRYP0z6+I8KLG3GWG3A5fqHs=
X-Gm-Gg: AeBDiet/tFaGDQ4osnPUPbjz7enNyRn5oniL4Aq+A4jRlXBsVHFn6O3vQHlth7Nn9pf
	BvXB8zKllbluhvWUQysFWDC73qtHx9nLXvsmdpXXuQYqRguMy7PZkSAOzK/KT316d/LJ+EhZuua
	wwr1sOb4G1bzw2u63cnzL5aspbtrJliN8Yp+XfHW0apX+1C7XlwIkEWXVjvsXXgEHMaOhPZr5Cd
	IYeBcgPfXWNr2JxQEYeLuC0bBSD+iAIX/27RUr1PKGwDfyuWAEw0IzepOhGtjc8ft7B5q4/kHMK
	qwP4GkA9Ue1lybZqvupxuPXIQQ9O+KiZ2tkHUov6zEXUNAPvhVbfvhzEt/svwmK9RwRNfOhYj0Q
	vx9nLPWcsO4cvqWN6qYWJXsYqEdR5CQZCMSCgKiEWKsIq4coTavd7DdEL+4hQR59Bz3nWy+bk0Y
	Oy2af/Fu7RipWnXF32wRyR0dwH9JNEWYf/OEloqwfs22ByhQ==
X-Received: by 2002:a05:7022:223:b0:12c:8e70:c32e with SMTP id a92af1059eb24-12c8e70c78dmr7761080c88.5.1776907257500;
        Wed, 22 Apr 2026 18:20:57 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm18139235c88.1.2026.04.22.18.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:20:57 -0700 (PDT)
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
Subject: [PATCH v4 2/2] iio: adc: ingenic-adc: use guard()() to handle synchronisation
Date: Wed, 22 Apr 2026 22:18:31 -0300
Message-ID: <20260423012011.41001-3-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423012011.41001-1-felipers@ime.usp.br>
References: <20260423012011.41001-1-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14237-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,usp.br:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ime.usp.br:mid]
X-Rspamd-Queue-Id: 965CF44C19C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace mutex_lock() and mutex_unlock() calls with guard()()
in functions ingenic_adc_set_adcmd(), ingenic_adc_set_config(),
ingenic_adc_enable(), ingenic_adc_capture() and
ingenic_adc_read_chan_locked().

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
---
 drivers/iio/adc/ingenic-adc.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index ad1b7bbc059a4..5622b62840e6e 100644
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
 
 static void ingenic_adc_enable_unlocked(struct ingenic_adc *adc,
@@ -201,9 +199,8 @@ static void ingenic_adc_enable(struct ingenic_adc *adc,
 			       int engine,
 			       bool enabled)
 {
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	ingenic_adc_enable_unlocked(adc, engine, enabled);
-	mutex_unlock(&adc->lock);
 }
 
 static int ingenic_adc_capture(struct ingenic_adc *adc,
@@ -218,7 +215,7 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 	 * probably due to the switch of VREF. We must keep the lock here to
 	 * avoid races with the buffer enable/disable functions.
 	 */
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	cfg = readl(adc->base + JZ_ADC_REG_CFG);
 	writel(cfg & ~JZ_ADC_REG_CFG_CMD_SEL, adc->base + JZ_ADC_REG_CFG);
 
@@ -229,7 +226,6 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 		ingenic_adc_enable_unlocked(adc, engine, false);
 
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
-	mutex_unlock(&adc->lock);
 
 	return ret;
 }
@@ -635,7 +631,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
 	int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
 
 	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
+	guard(mutex)(&adc->aux_lock);
 
 	if (adc->soc_data->has_aux_md && engine == 0) {
 		switch (chan->channel) {
@@ -655,7 +651,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
 
 	ret = ingenic_adc_capture(adc, engine);
 	if (ret)
-		goto out;
+		return ret;
 
 	switch (chan->channel) {
 	case INGENIC_ADC_AUX0:
@@ -668,11 +664,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
 		break;
 	}
 
-	ret = IIO_VAL_INT;
-out:
-	mutex_unlock(&adc->aux_lock);
-
-	return ret;
+	return IIO_VAL_INT;
 }
 
 static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
-- 
2.43.0


