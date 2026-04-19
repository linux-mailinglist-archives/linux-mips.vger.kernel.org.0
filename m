Return-Path: <linux-mips+bounces-14201-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH5sKef05Gn3cQEAu9opvQ
	(envelope-from <linux-mips+bounces-14201-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 17:29:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9042478B
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 17:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 743FC30094E1
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 15:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E93237D12D;
	Sun, 19 Apr 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="oXSfuqLL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38F24E4C6
	for <linux-mips@vger.kernel.org>; Sun, 19 Apr 2026 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776612578; cv=none; b=EcI7db4J77NsgsJDPZGCAWShjdseNH6iuFBoWPJSkPL0AM3DIMJaaExBWivkSj7x+KMnFl+vz6F6pLAwXYIlH90MdTZZNI+28EQZP2MgF9yVLOFkF/SlO39Un7I8L0ukidFu1BSPxamtisRR+kTHRop9HlJRTso4zkJiE1TIuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776612578; c=relaxed/simple;
	bh=dZk4AYRSuixTeHEtwFeJ5/QcTEkmu2JXEkI4wa5yfBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVwcw6j6Iax6sAuEmqnFCHHKPx/AEH3VV0Y1hTDOJUwcJwLzn/CZxpVxqMwJpt+DHCvjtM6jS/rLJUPu8u1Q0TDbi1E4EesYD1K5A8WOCSxvF7IMJ2W0qhsqiVpj24PZFAMt7vrUZomBTfQZnc/Xm12JbM53FLQKdIoLenEkIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=oXSfuqLL; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c726ef332so2483959c88.1
        for <linux-mips@vger.kernel.org>; Sun, 19 Apr 2026 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776612575; x=1777217375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/CPL0C+I2VNJFtpTpEIDtJx0mavuJN+qudj0GJw0BM=;
        b=oXSfuqLLY34ObRFDnD3iqBx9cID0Ba1KOsXQClnF7ZxUyUoGdSPna7x6W7qcmM99ir
         hPFxF8QIFjO+xzNeFmO/NCdyRDbFBJYAVhKkxAvD+5S7Vbw5/6LiFKuFiVEZUjazAvN2
         NgGqKj6hkc3uCnKLs8HqXT3b5B/78C9XlQBj84dknX2qn+CZ2TMz80XFcUG13emfKXC2
         Aym3FFPJKohTv7NYtj7jYMVo7oHYbh4Ri3c6B+M9AMbjIDmg2K+EI0QIvYz4SLbWbdzP
         z4tj8zCY8hyN3RPHmtLfXVtcUIDRSEJ5EjLRHDzVZJ5dZKLsVxy7AHWjSAEmhtaFMY+a
         dTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776612575; x=1777217375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/CPL0C+I2VNJFtpTpEIDtJx0mavuJN+qudj0GJw0BM=;
        b=rKCdQmwz4AyW61J1vbj1jQLjVVjqAzxuwq9nSIITbGn61kO+ew2/uatHQbGi5hCZZQ
         zizMXGgYEFhk6/bre/gJjrgDgPtZfLBNSHrDZ1XbuZ3CWZSAKXTov3QMhhJCUk4BSV12
         x7jNm2uodnrkh0EDt5BSN/MLNn2fINTtVJeSXQLNwRnd2OXDqhqNdqldSG+8fUbBcag/
         wDv5YJmILstB4K+RtA4lHY0a4jnJOG2+qzfRlFC/YEdo0nGteYvtp7dCPefSg2VsVRvr
         5f3zO3dKGJGdVojLRjozjdBkNdBZSkGLDDWAzXwxeTNTFqDw0UDVXX7rkubEijTvx/GX
         2TKw==
X-Forwarded-Encrypted: i=1; AFNElJ9w+dkoG9lRsYqyWuoL/BUAytqR36qzTb4FITUKQhOBhVJRLOANIrQJXqCPELVk8qkBDD6OQ3gfAst1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4iADkdOWvy/pzKotljPKl/Jx0+90IctnMT6Gp3uOattLGp4T
	SA7IRLJtfQcCpR4wvs1LaKm++MQf1iO2FA1/0XTOoVSfq5I3Ne/rXH61ROlGZDh8kkA=
X-Gm-Gg: AeBDieui6xnFyI9wzaj+o+tRBZZJGC2VUMLoWhtxO0eiWGt+f6PtIxgrcDGUshpkYf6
	K6nvWG+Z970U4xoMjiNlptyljj5DnfXzWU4DcrtuQMpnXHR/ZqX05NrzR+Y2cpA52EjnSmOw8xF
	kSK7JBlnuIMWXhjucah28Tw1G7tru2OnJZMyotUlS9aonP6BNavXY4KRYWO1N4KfZKjDNGnnCPF
	AfshH9FA6qHYx1ivG+72Niu36CuJwytCl+IJczGUEqNsrGqJ/b7AGo/7FSuvLq86GYtyfDVub+S
	sb2OOlFiBAuvHNpuR0j5+EN1lgc1XaU1UeLfizTPPATBuMPWHxBDDWRngCvZBGjUQfjo/OImNNH
	Ln69eQsjoCttj+Vh7kQHyGy3GAHhJ2BckTuofMNX9Lw3WM1Tfm3tycB5I0rKB2DJJbiRdXK/Eb3
	x70RbXiU/WJu+1jWMQCcUZABvzRllmyZJWa5H6HsbCZkHMR+fTB96Y0NSc+w==
X-Received: by 2002:a05:7022:458d:b0:12b:f616:1a4e with SMTP id a92af1059eb24-12c73fa362emr4062955c88.23.1776612574962;
        Sun, 19 Apr 2026 08:29:34 -0700 (PDT)
Received: from localhost.localdomain ([179.119.81.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm6246038c88.8.2026.04.19.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 08:29:34 -0700 (PDT)
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
Subject: [PATCH v2] iio: adc: ingenic-adc: use guard(mutex)(&lock) to handle synchronisation
Date: Sun, 19 Apr 2026 12:27:34 -0300
Message-ID: <20260419152917.8984-1-felipers@ime.usp.br>
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
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14201-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,usp.br:dkim,usp.br:email]
X-Rspamd-Queue-Id: DDC9042478B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace mutex_lock(&lock) and mutex_unlock(&lock) calls with
guard(mutex)(&lock) in functions ingenic_adc_set_adcmd(),
ingenic_adc_set_config(), ingenic_adc_enable(), ingenic_adc_capture(),
and with scoped_guard(mutex, &lock) in function
ingenic_adc_read_chan_info_raw().

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
---
 drivers/iio/adc/ingenic-adc.c | 69 ++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c8779a4..5f914d5e5362 100644
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
@@ -643,41 +638,41 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 	}
 
 	/* We cannot sample the aux channels in parallel. */
-	mutex_lock(&adc->aux_lock);
-	if (adc->soc_data->has_aux_md && engine == 0) {
+	scoped_guard(mutex, &adc->lock) {
+		if (adc->soc_data->has_aux_md && engine == 0) {
+			switch (chan->channel) {
+			case INGENIC_ADC_AUX0:
+				cmd = 0;
+				break;
+			case INGENIC_ADC_AUX:
+				cmd = 1;
+				break;
+			case INGENIC_ADC_AUX2:
+				cmd = 2;
+				break;
+			}
+	
+			ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
+		}
+	
+		ret = ingenic_adc_capture(adc, engine);
+		if (ret)
+			goto out;
+	
 		switch (chan->channel) {
 		case INGENIC_ADC_AUX0:
-			cmd = 0;
-			break;
 		case INGENIC_ADC_AUX:
-			cmd = 1;
-			break;
 		case INGENIC_ADC_AUX2:
-			cmd = 2;
+			*val = readw(adc->base + JZ_ADC_REG_ADSDAT);
+			break;
+		case INGENIC_ADC_BATTERY:
+			*val = readw(adc->base + JZ_ADC_REG_ADBDAT);
 			break;
 		}
-
-		ingenic_adc_set_config(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
-	}
-
-	ret = ingenic_adc_capture(adc, engine);
-	if (ret)
-		goto out;
-
-	switch (chan->channel) {
-	case INGENIC_ADC_AUX0:
-	case INGENIC_ADC_AUX:
-	case INGENIC_ADC_AUX2:
-		*val = readw(adc->base + JZ_ADC_REG_ADSDAT);
-		break;
-	case INGENIC_ADC_BATTERY:
-		*val = readw(adc->base + JZ_ADC_REG_ADBDAT);
-		break;
+	
+		ret = IIO_VAL_INT;
 	}
-
-	ret = IIO_VAL_INT;
 out:
-	mutex_unlock(&adc->aux_lock);
 	clk_disable(adc->clk);
 
 	return ret;
-- 
2.43.0


