Return-Path: <linux-mips+bounces-14222-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGjdJH7352kVDgIAu9opvQ
	(envelope-from <linux-mips+bounces-14222-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:17:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68918440148
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CD59301B173
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D7A30E0D6;
	Tue, 21 Apr 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="aqNtR/xN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893D73A5E71
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809826; cv=none; b=fCC3w7dtgxNM0zrfnysW+2duPGxOJ15l2+IeTMC2sD2zfXcFUOq+DxmsRw8z2rFuRRBMms45pZuFnGPLMlqpgQL4G5O10WTblikcC5ytU3Pw67VQHl0GkqqWM88dy8B8CjF8Hos6vBsDIjxn88kJjAy6wJYHsa3c3Bs3XJ1cmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809826; c=relaxed/simple;
	bh=SN7y5u1UHlPrW3+Ij4lqOW/DHw1WVQ87jFM+vEHumKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLZsBkhDYaP+/9oUhWPGmY1YaE7xG4knpJSkzZPTJNPU4+DrtjB6/phFgRHO0fSt/j7H1LvJjC4oLmzH/T3J1mSUlfonOhF56sCITQZ2ZnjYN//gYjBbRHKScHD8JiROcylTNRG46uy6DuWI2qjFK6NEbGglVSo4TaZ54asdMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=aqNtR/xN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3689943eec.1
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776809821; x=1777414621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn2lKNM8ZbGs52oI2dTR8+56uoXwooahMoMCtzCSErg=;
        b=aqNtR/xNdgH3RITbbMOIWAxHXJKF5VxdkpV+V1Q4Z3uOPpaPVeWf1g0UeqcCSgxOPK
         TUlxRMzbCIasTBsT84mbaKH7uo5iNG37QvR5+BybDI5NG69tguTXqZAQNVoiSpm4Pn12
         yv4iK1bZbQJCx9pHof3O9DyUX2WZk9rqmCM/ro6Wzpj8SM/o7m3nDV0FaTjD0HmMXI8p
         1rG5t5A+lMv37FgYIpoVcCI67nP48UFPVV998CTZv3hWkDGstVuJctQpuKDMnYdk3qjK
         d+w4TrXbhWu1kh9WyLQqBZnlQV34VKxYkTvX0XS1MOiHIE1OnHY31upSSwvP2CPVN35c
         9mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809821; x=1777414621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pn2lKNM8ZbGs52oI2dTR8+56uoXwooahMoMCtzCSErg=;
        b=spZwUY6M2nKy3IpYAcOZZnJQHuGat5AYI6DhXchEy+ede+E0nqmQOcGeBMYqoc0pzs
         qygegQYst2b3YLoNNmwq7SAarZr7wpO6D61llzX0aIxtuU0ndQrQtukkzWRlVcS0cBVO
         7fEH7bopF5GH0LjkoE6yDBNjzuv8DzpuHQTggJDnrsKsiDdxJDa1K/CKvRBLb9xS0iQh
         WLR/MZqOmjsEruBdSSBYYUrQy6kdaLKm9MiPvWtdjj8M+9S9md3sF8f54A3ZUDpgjQ24
         FJKEDpHn//iAfshvfYRYmxJX8DS9N6jpwc6Lpk2LeK2pJP9XtsoGMjdQ9TZMJq3Nbtty
         W2vw==
X-Forwarded-Encrypted: i=1; AFNElJ/KHgOmQk66Vcz3ZZo68XlkFSi+aWpmDxLrTzd/JbinuLfaHGhUwkKe+CwWM68n16Cqg598yY6iZj/O@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLYEjU5CCNusJN4SmR0dBnFCuzj9ehCxukBFPFdJrZS5yQRGb
	uI0pBBGFyDw4q3IK0qcPgHNrSAEYp55uJpy+1DCg1Taab07COiWW/fAqcFDD2N2D5e4=
X-Gm-Gg: AeBDietNy5GyMyWDOGaDKLAQ2RB1jXkIwrBwLNgHN/YwTSSVD9mGqVX239PArvJ6GIv
	1wFXph8THregFPHmRnTvp3NVfWfuy69NLtcgyrPmjULuJGUCkVFwxPPGZ2jJiRc5/Vn6aytGPFX
	iwEedQPJXq4U6P7LcTOm9WW7M8ZSJOg9tMZoF3OBMHFxXcfFIzFkUJkwKMy6170GFvUwExVCcHP
	faIcEzJNlMm7ETOmpTuitXq1z6YLoitSzK3WRBuKl8c/URPK9dkNlkAGMNkZsI3GFaAdRptWtCl
	/EfQh+uvM4ZHjOvFKChc9ZxcIeetZ6hP1SEfMhoaQwu0wbqbsurIvPuBKNo2CFJxuVYAfnAqBhD
	0YEiD5FupwkG70vNujtrAHh+5GYyarq4sPv84fzPiHvPI8qLr0CtYbChXBJicmV7s5HdVpUQN5P
	Oczm9bhqflRCUU381F8t1bmWSt4Pajc3Wj2KGdtYi0y7WBRUHLVDmsKc4BwMMxPG9OPriAfnHuZ
	5Odik7QVazN
X-Received: by 2002:a05:7301:9f10:b0:2d4:532e:7e45 with SMTP id 5a478bee46e88-2e47930fdf6mr10921058eec.23.1776809821343;
        Tue, 21 Apr 2026 15:17:01 -0700 (PDT)
Received: from felipe-ThinkPad-E14-Gen-4.. (201-92-135-6.dsl.telesp.net.br. [201.92.135.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm19827980eec.24.2026.04.21.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:17:00 -0700 (PDT)
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
Subject: [PATCH v3 2/2] iio: adc: ingenic-adc: use guard()() to handle synchronisation
Date: Tue, 21 Apr 2026 19:14:59 -0300
Message-ID: <20260421221629.70401-3-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421221629.70401-1-felipers@ime.usp.br>
References: <20260421221629.70401-1-felipers@ime.usp.br>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14222-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ciziks.com:email]
X-Rspamd-Queue-Id: 68918440148
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
  - Split out ingenic_adc_read_chan_info_raw() logic to helper function
---
 drivers/iio/adc/ingenic-adc.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 81ed92f4490cd..733f0276bb0b1 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/iio/adc/ingenic,adc.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -115,7 +116,7 @@ static void ingenic_adc_set_adcmd(struct iio_dev *iio_dev, unsigned long mask)
 {
 	struct ingenic_adc *adc = iio_priv(iio_dev);
 
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 
 	/* Init ADCMD */
 	readl(adc->base + JZ_ADC_REG_ADCMD);
@@ -162,8 +163,6 @@ static void ingenic_adc_set_adcmd(struct iio_dev *iio_dev, unsigned long mask)
 
 	/* We're done */
 	writel(0, adc->base + JZ_ADC_REG_ADCMD);
-
-	mutex_unlock(&adc->lock);
 }
 
 static void ingenic_adc_set_config(struct ingenic_adc *adc,
@@ -172,13 +171,11 @@ static void ingenic_adc_set_config(struct ingenic_adc *adc,
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
@@ -201,9 +198,8 @@ static void ingenic_adc_enable(struct ingenic_adc *adc,
 			       int engine,
 			       bool enabled)
 {
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	ingenic_adc_enable_unlocked(adc, engine, enabled);
-	mutex_unlock(&adc->lock);
 }
 
 static int ingenic_adc_capture(struct ingenic_adc *adc,
@@ -218,7 +214,7 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 	 * probably due to the switch of VREF. We must keep the lock here to
 	 * avoid races with the buffer enable/disable functions.
 	 */
-	mutex_lock(&adc->lock);
+	guard(mutex)(&adc->lock);
 	cfg = readl(adc->base + JZ_ADC_REG_CFG);
 	writel(cfg & ~JZ_ADC_REG_CFG_CMD_SEL, adc->base + JZ_ADC_REG_CFG);
 
@@ -229,7 +225,6 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 		ingenic_adc_enable_unlocked(adc, engine, false);
 
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
-	mutex_unlock(&adc->lock);
 
 	return ret;
 }
@@ -635,7 +630,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
 	int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
 
 	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
+	guard(mutex)(&adc->aux_lock);
 
 	if (adc->soc_data->has_aux_md && engine == 0) {
 		switch (chan->channel) {
@@ -655,7 +650,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
 
 	ret = ingenic_adc_capture(adc, engine);
 	if (ret)
-		goto out;
+		return ret;
 
 	switch (chan->channel) {
 	case INGENIC_ADC_AUX0:
@@ -668,11 +663,7 @@ static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
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


