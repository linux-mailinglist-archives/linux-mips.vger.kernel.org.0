Return-Path: <linux-mips+bounces-14476-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC57D6+m+mm7QwMAu9opvQ
	(envelope-from <linux-mips+bounces-14476-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F94D5A8C
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39053014BCE
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 02:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298DC29AAFA;
	Wed,  6 May 2026 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="UGqQRB0N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977D2857F0
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034321; cv=none; b=o0fefu4o+qe9kqp4UD5oRY19P08mnK3UjHFfN0jnKsVvAQ8D4pbguHVZw+GsNKMA1kbXYqHG6ThKT0xOYXSv18FEwL3BBjRNzQ9ZWjsqk3mRb91nd9aVAzORGpPPEQzWaMWBhyfP0SCjuWCSsj3Gb6Bs5SObqqyJLn064GCGlaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034321; c=relaxed/simple;
	bh=37S5U6CY9OuzJ1HXSFD/jSK7WF76mIFw+Q5kHdxMmug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaPytz26xV1JShb8n0TPl4JUCxwgiB9c3lP5kv2L0wRTHbdQkVIEkqGZmkToIpYb2GlYXRBfhCCSPYNjhBF7eg/ce4FmjcbeMqkyTMk2KMMZIdwcmgbEdBzdJauMx5t/GRS5kGrZHXaaXf7T1SrBZRX61I9O+KcB9y48clq6mgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=UGqQRB0N; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f30a4601bbso2911293eec.1
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 19:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778034319; x=1778639119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcxwFVgZ0Mxzf9TM1ThCp8OFBdfEfB6n72sWT9QuoEU=;
        b=UGqQRB0NibNxK4PjFyvrfIP89ebngjPPCdmn5dfx3HjzG/5woyynbJITGgtA5Px6Rv
         L6X7zDPkeuoustJ4lZO21XpHkFlGmKptYhhMvb3VwYQgMTPa7QionjX2CvHlTF5HqaRB
         fiEmGn8lISZ2LUTWUkzqJ2hZ3PIFrXvv0X62sHbh7rYi/Iw19wkBTun2Pkl+5otSczh5
         twHqHcU16phIByukwpsFYJrLTt5D5xG6//GmONWfR/i+Ru6gFpzLxcMN1GGohyRJ7N9L
         oZWJxotQP4hUmC44F1YDnZVGucqEsJFM/1AUGfgTzqkVsJFFDumZH5TdfxsBtysJhi9d
         R4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034319; x=1778639119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcxwFVgZ0Mxzf9TM1ThCp8OFBdfEfB6n72sWT9QuoEU=;
        b=RziUXSN+tPsOX0ay1EZtVI4rzvK41b70cfw81LEHz1KMw47GhCMq8nBsSK8D7oTYQi
         NwqYb2XCYRrkl0avE4PMZOFf1qp0jnAZgcY1Paec4WLUkmRzunyo3DO1NCXU7HVe4ly2
         9wkIEn1mxmBK7VpiObuxmZ/BwwSlltvcQNywU/W0RnkwPQD1lo8HVbai/Cxz5GrTzhe5
         d9FYDRAkv2iQAXGzO4D5C0ghoO0t6XiYHboZ+gi8XcKVuYGGii2XOXCcEcsLI+4N2yBg
         /td4gqyanYJM+y3IwMWAOT0CvWFOihTAOWRg5hAPCf17G9uLUmjZUgZ9Xjke4ax1rOJp
         t+HA==
X-Forwarded-Encrypted: i=1; AFNElJ89lwBfXjIb82lDxa9v8DPnKZKbG6bBWRPbJ1pVF8Wy2uu7zwxgG5p/LWPSHDUJM5BFeever2kfZ6OC@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKq8bZ9lnurirho8ayqIP5CL70qFeZpOqezwfKZjesXWDoLX4
	WBibD8gJKyoJp81E1UT80n8hyTWjSbXG2hRhjzbX2zfcASyKuiCSUeXdY4ycCK6DZ1U=
X-Gm-Gg: AeBDieucB/l8jlDbHmbvzo5iv1JNum77Vtfa0gcQu+02Y2ClzumY+0zLuaIEcKnDAmr
	dRjAlL8Ld3fhPJltwwUuYa2bbBSKg6TG1B5UYYWDTeQsQ6Vgt/3grPdjRVI/MewXeecAPs5ZcW4
	E2cdLafZ6rAO5JfQeGgEkYlhIg+fSKHbvbPe1T+cI7VkXdv6lqwkblodgR8+4Ln58Mi5kW9sH4+
	yHwl+H1O8No0cmHCtEoABR8Ysk/nw6EajiZ92Vv7d/Cvzezs5ycRD1/Akfdbz8DyUpQ2tZjS7C1
	vY7AynFN9etvMRgFu/QvyO/8rrKQPb2zfjh2ULBKcytoduBxaso+slqfHIKTrgHGfNw5gYfVlSB
	NX9VoeX0wv4LjzXKhnLxMmLYefspLVf1Ge0l2/FraUNV9jizzHAGNu/uVAwGbEK3Q8OCXme7cEv
	jqVBT+XnqLAuKatrq2KKQf+lZgkD3VrB0aAEe+wJQkyIMuqg==
X-Received: by 2002:a05:7301:1018:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-2f54e3802ddmr806350eec.29.1778034318606;
        Tue, 05 May 2026 19:25:18 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d5c3783sm1669552eec.11.2026.05.05.19.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 19:25:18 -0700 (PDT)
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
Subject: [PATCH v5 2/3] iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
Date: Tue,  5 May 2026 23:24:29 -0300
Message-ID: <20260506022454.128169-3-felipers@ime.usp.br>
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
X-Rspamd-Queue-Id: CC1F94D5A8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-14476-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ciziks.com:email,usp.br:dkim,usp.br:email,ime.usp.br:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Extract the sample logic from ingenic_adc_read_chan_info_raw() into
a new helper function __ingenic_adc_read_chan() to improve code
readability and modularity.

The helper handles the mutex-protected section for sampling channels,
while the main function manages mutex and clock enabling/disabling.

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
 drivers/iio/adc/ingenic-adc.c | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 231ff8d584c2d..91e3ea6615942 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -627,22 +627,12 @@ static int ingenic_adc_read_avail(struct iio_dev *iio_dev,
 	}
 }
 
-static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
-					  struct iio_chan_spec const *chan,
-					  int *val)
+static int __ingenic_adc_read_chan(struct ingenic_adc *adc,
+				   struct iio_chan_spec const *chan,
+				   int *val)
 {
 	int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
-	struct ingenic_adc *adc = iio_priv(iio_dev);
-
-	ret = clk_enable(adc->clk);
-	if (ret) {
-		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n",
-			ret);
-		return ret;
-	}
 
-	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
 	if (adc->soc_data->has_aux_md && engine == 0) {
 		switch (chan->channel) {
 		case INGENIC_ADC_AUX0:
@@ -661,7 +651,7 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 
 	ret = ingenic_adc_capture(adc, engine);
 	if (ret)
-		goto out;
+		return ret;
 
 	switch (chan->channel) {
 	case INGENIC_ADC_AUX0:
@@ -674,9 +664,27 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 		break;
 	}
 
-	ret = IIO_VAL_INT;
-out:
+	return IIO_VAL_INT;
+}
+
+static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
+					  struct iio_chan_spec const *chan,
+					  int *val)
+{
+	struct ingenic_adc *adc = iio_priv(iio_dev);
+	int ret;
+
+	ret = clk_enable(adc->clk);
+	if (ret) {
+		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	/* We cannot sample the aux channels in parallel. */
+	mutex_lock(&adc->aux_lock);
+	ret = __ingenic_adc_read_chan(adc, chan, val);
 	mutex_unlock(&adc->aux_lock);
+
 	clk_disable(adc->clk);
 
 	return ret;
-- 
2.43.0


