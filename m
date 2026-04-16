Return-Path: <linux-mips+bounces-14162-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EImCNPs44GmDdgAAu9opvQ
	(envelope-from <linux-mips+bounces-14162-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 03:18:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FED4096D0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 03:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA6E530179FF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 01:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C8F13B58C;
	Thu, 16 Apr 2026 01:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="uhsScY13"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D68EEB3
	for <linux-mips@vger.kernel.org>; Thu, 16 Apr 2026 01:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776302318; cv=none; b=YUxuQUlGJPGn4hj+/kZWj4458MaqK+cotg5HHFdwEHYHHgJI31K5lqtxkfOEwG1gt78tehbLyp+q07/uNIMB6w7pkrqqmTPVepGA9NrQFSAFn1yR03J4gl5nVzYFk8XiYNzQH2a+YLHmGWFMcBfRWltT8ePCS5+IUzz7d5qd71I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776302318; c=relaxed/simple;
	bh=ix4MQCZb0a7oEzoizvKx4388P7WPEzrvMfERUWG1iq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpxYuF2cEBNn3i+BM4R9t9kQfrkgsrziq0zE3gKh/hZEK3YZGCibf49SYeJyq7CnmdbczH4qQZv4MFMVOTlaa/d/dsHwtjBYb0ekG8N2tOTNGL40TAqgBSej3OHaIHMKPrn4bjbEInDr79rNTph9DRXQGSwRagQO3H6OpTC1uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=uhsScY13; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so14149982eec.1
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 18:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776302313; x=1776907113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mERTpe6+VkhMm65vrjqdw31z57F7sMaKCjw0DTf6B0=;
        b=uhsScY139xv8hOp7fiJ6iwGD4wtybXEvk3hlvzO+5j21yD5zlSFwxNhqU9prxtPJce
         bBe2vFuOPWPcxvV1l095lCfYFJdzljLj2Gh2qfBXyYOav3LIoQ9J339WTuRdz3pfVf7e
         kB79dmV7cK3g6EFaa0N1kwvJ+b7X+7SMPq+O7/H4qfyP4F1EysZvu7z7d9wDR8mfiAc8
         liYbZYvyAWmgo9t8fz+RsnKhyetrg9Pz7ZUpuWwqhMlMXD/meXlwESc81e5SsCw60XYd
         OxtYpEFbEEDK/X8fAp5MW5M69Qgj5Vnc876o3gCJkeBh/46kbq4Pi4pr7dQ7QLCqV5q4
         1R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776302313; x=1776907113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mERTpe6+VkhMm65vrjqdw31z57F7sMaKCjw0DTf6B0=;
        b=qx/2mKCOTSF40LxW0p4MTByIzwqWOzqZEqZlr7AZDfOoURX1xP4DGBiaTaTrfQ1q2N
         +Y5YzmFa+E4oFmX/4OKKBAA+qkfR0iNhKuW+YMbXdeabK8a/jscmVAoHuxFEEbfo4r0y
         rIzSZZSHuMkZprXH5ZzWpA8XiH/gD5hQZYyyi8JWxQW4hP/Wy6n/yDyWvm7PKJ3aSFzT
         Tc0t7xi3p9ZYqcPfd+KOObj0T0/8tToInjN/zf3qAwpWmcsxv7ijdXwytEWpDCzviQO1
         FlJGmqFkpIm7vLhEGSOIcZEDEHXdHQRtyHU0QNYQm54Ery5N2zEYxZkrXH1LK6fK6S4q
         iwug==
X-Forwarded-Encrypted: i=1; AFNElJ9kEAhxDbZXo6wt1RapHJe1Z3UnbclO5k6FvENJCeniIX/gBM9ME9ouZbpKCsAuN5weaCPqWgP5MqrN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKOvubGlJQlysLwFILEBCgCqH/XOyJ+TnLEQli/Qj50IDRlEcE
	/H5riDcHnsY/LA0bJYiGPIxwFB6fBajI+AFY+ThYQLDCDPrg5vx8FA4QlsXZBR8tSco=
X-Gm-Gg: AeBDievrWQsYCpOvjQlkba0T0QMWQBB61UNCR+m98h5VErCbYmyw0g4O6AAcYrnW3uX
	B1VDMpsnAf620nB/5XK+EXqfAo+eIVWoWkjPZ80GrxevnC21Ckt4D1J1sJT5WA1bpiOFmLvZ4hl
	kmsvYgFWtbHsrqQUrROxLYsK+oerzTj6SsuOKjNRy2K9S09WsZHbr1OwOr9iRfIvocCNrFHXlBK
	vGpAHHN2EsDL3xoPIZQHVhMrudqR+Z2kBzlD0HtBeGo6qez+1Q8fN4/k9i26vibBO//ha3mblJx
	+O55pRtGqyB2YDp4tu3Rc/g2TNx3WMwaKvtdjFzNHNAbrX26B7gzcJWJ8STN/n+oO2j9751IsZ5
	g2sf+ihZwR7fHShm0i7NUrWy8FI3FaTIebm783PMgaP1FlgmBsvCGq09Kunhvt2FIgxCXff3u/d
	lASol1Eo8cFV/WVmxny76AyhgGeJ26D4acSTmhmqMpkFdVpQ==
X-Received: by 2002:a05:7300:a583:b0:2de:9470:5e88 with SMTP id 5a478bee46e88-2de94705f86mr2550130eec.21.1776302313352;
        Wed, 15 Apr 2026 18:18:33 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8919f9a0sm5325973eec.0.2026.04.15.18.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 18:18:32 -0700 (PDT)
From: Felipe Ribeiro de Souza <felipers@ime.usp.br>
To: paul@crapouillou.net,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>,
	Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-mips@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] iio: adc: ingenic-adc: use guard(mutex)(&lock) to handle synchronisation
Date: Wed, 15 Apr 2026 22:18:11 -0300
Message-ID: <20260416011815.9140-1-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14162-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[usp.br:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,usp.br:dkim,usp.br:email,ciziks.com:email]
X-Rspamd-Queue-Id: B4FED4096D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace mutex_lock(&lock) and mutex_unlock(&lock) calls with
guard(mutex)(&lock) in functions ingenic_adc_set_adcmd,
ingenic_adc_set_config, ingenic_adc_enable, ingenic_adc_capture
and ingenic_adc_read_chan_info_raw.

This removes the need to call the unlock function, as the lock is
automatically released when the function return or the scope exits
for any other case.

Signed-off-by: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Co-developed-by: Lucas Ivars Cadima Ciziks <lucas@ciziks.com>
Signed-off-by: Lucas Ivars Cadima Ciziks <lucas@ciziks.com>
---
 drivers/iio/adc/ingenic-adc.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c877..bb7abdcd8 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 
 #define JZ_ADC_REG_ENABLE		0x00
 #define JZ_ADC_REG_CFG			0x04
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
@@ -643,7 +638,8 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 	}
 
 	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
+	guard(mutex)(&adc->lock);
+
 	if (adc->soc_data->has_aux_md && engine == 0) {
 		switch (chan->channel) {
 		case INGENIC_ADC_AUX0:
@@ -677,7 +673,6 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 
 	ret = IIO_VAL_INT;
 out:
-	mutex_unlock(&adc->aux_lock);
 	clk_disable(adc->clk);
 
 	return ret;
-- 
2.43.0


