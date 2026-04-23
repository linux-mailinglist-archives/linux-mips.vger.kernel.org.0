Return-Path: <linux-mips+bounces-14236-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKmyJvhz6WlbaAIAu9opvQ
	(envelope-from <linux-mips+bounces-14236-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:20:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EFC44C18D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7263D30060B8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 01:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FC23164BB;
	Thu, 23 Apr 2026 01:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="KsmppuDC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670C2820AC
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907250; cv=none; b=LI6vaq8MO4E0Bsrrr+znWg6I/FRWdZbAgqvlgggpqMPwGDF7DMXuLLBKhzQQ2NgWLXXhAHJvOhKTPxQYr3FFTpS2O8SWSjB5udRd1oXYezn0+h7tO789jJKrESdxkRfQYrUMm7Z3tUF1yi3tqAiiQZBY07RTOIJ0vuKm3y4/v6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907250; c=relaxed/simple;
	bh=ii1o11+bJleLQbIf0IzWcB8eQPNGW4qwDC6++JDm43Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeUysRZ08c/oKePhzwVFykOhFqvsSsR2jhhecyHAyt6qT6Rb+dL57H//K0Mued41OCaxfLTyN0G8Z49tPIc1Kvi8X6D31Ts9yquJbNPnXhFqT6IDWQnem9feBSxUTmKDTd0h9wFqP2LpA1CRlBm6uqKCpQz0h+jziOel3UXqsdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=KsmppuDC; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c7212836bso16061753c88.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 18:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776907248; x=1777512048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeSe76m5JOq4TxmOghOzbF5DZ8GPv4in/IzlHhZA4qI=;
        b=KsmppuDCyVe3Z+ma/NmRaoGbOIaEtay1zAycXdEpcmsG1Nhb7BqnEMNw2a6wf/J8Rf
         gmVMKQLCzgTIllPfJYDk1qqjL5A9O1jPKMtyYomkPIklbAKHDQMdgXcuHKYdGZTwcADC
         Z43YmqojBMLSbDucJwzL+qWJFLIvxN4P7AHtX0bJ8gnt8gVMgySI8LQhTvWrh4lphkua
         H+h0ldev98dA47vh59d+NG7H48n59Ye1oG0RFTQCW5ypIZxlJETfHPLU/4w+kE4Ny2dC
         PTv42YvGqzCgZoJLnf0pntWuUhObj9qBs3ijysjkawNHnesx3Z/jq5YIy+2DHX/qdD9I
         TM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776907248; x=1777512048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yeSe76m5JOq4TxmOghOzbF5DZ8GPv4in/IzlHhZA4qI=;
        b=suCGd+RmGToPoSK+rR1yPL/Zf1OB1QCoETbNY4/tqJQ3XaYj9QpnUWASulOwQUeAjD
         ywP5VK7CDS4s48KIxg15/szLcJ0wA0mU8LFVzt1dbaSyFjo+hXSXmHfPV5Y5mYP506JR
         Q1LWSMitZe06Aw2EJY1LOe1FUhSzA0ey9ayDYKPWfTlft6uQcPZV2fym8QTkNItAjVEx
         GL1dCewo3mesOeHlgA6Tuz3lTFLe6KylfOdtW1X6o5S5JUhs5JKy771iLnDgOBHya9XA
         fltBsw1P+boOJ7ds6oTxNAK5xfjJErrbuCmfQHOB3eCDDaQcyGoZp3sm4O/lKSO9kH1B
         7/5w==
X-Forwarded-Encrypted: i=1; AFNElJ+yxhA2fj4SwoAEIlGckm1E9YtLVvNoBaC7gXuGr+IziIfGg7sk5C1U/KOHVtcxtQ8oMpQN25Dh4/44@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJpchSxyA6OKwHQv0Z9NcWVGOWF9hiNu31H+DwqD9YL4iasFu
	BA1lk5o4o3CxgxGeAUfz9D1UzU/+hqAIfCNvbjWlmtLmZpVDv4KiOELR0m1V7UjlY6c=
X-Gm-Gg: AeBDievs46571y0aygraETFLGc2l2cHRAXhbIKQ9MzNKGWcKUiRbYdrEydirtmO/Bc2
	yCM5momV7C0owvZ7jKrW+A5z175XQntXEvRxfjuNKZUCpTDlx9/OfEM5X9u/wxklfTtXKYx66d3
	ZlRNaIamCCLscDkEFKVRU71CAwtMT3GQKBRFzQIL6vLBXtcl4QAHALHKITZKjohJnKVM+Le9Ckv
	D9G6nZIAUAOP06atEWJSayj0pEs+OyTOLMXDJab8PqTcANgsOIGTqJPhckQnE3ftMQtEjAPgTLs
	GV56t75x+HLn8M1gUILt9enSHYecAWms1CUvCJ2CmHmuCJJ23jNGAxI07szpVndDBwl91USTKn8
	TcSBUGhl6rTMOLijHUlzKuf3bSxRoitfNUGFj63qpsxfS0mCF8BcfMlyyxQkFX+G7RSesUKhM+f
	ubwdzGHeoHPrUeOKMEcL/Vjbu/MJKs7ljrxkOO+tRWuKI/ahHQu/rkbyvp
X-Received: by 2002:a05:7022:f9c:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12c73fa5bf6mr13388981c88.28.1776907247649;
        Wed, 22 Apr 2026 18:20:47 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm18139235c88.1.2026.04.22.18.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:20:47 -0700 (PDT)
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
Subject: [PATCH v4 1/2] iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
Date: Wed, 22 Apr 2026 22:18:30 -0300
Message-ID: <20260423012011.41001-2-felipers@ime.usp.br>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14236-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,usp.br:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95EFC44C18D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extract the sample logic from ingenic_adc_read_chan_info_raw() into
a new helper function ingenic_adc_read_chan_locked() to improve code
readability and modularity.

The helper handles the mutex-protected section for sampling channels,
while the main function manages clock enabling/disabling.

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
 drivers/iio/adc/ingenic-adc.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c8779a4c..ad1b7bbc059a4 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -628,22 +628,15 @@ static int ingenic_adc_read_avail(struct iio_dev *iio_dev,
 	}
 }
 
-static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
-					  struct iio_chan_spec const *chan,
-					  int *val)
+static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
+					struct iio_chan_spec const *chan,
+					int *val)
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
 
 	/* We cannot sample the aux channels in parallel. */
 	mutex_lock(&adc->aux_lock);
+
 	if (adc->soc_data->has_aux_md && engine == 0) {
 		switch (chan->channel) {
 		case INGENIC_ADC_AUX0:
@@ -678,6 +671,25 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 	ret = IIO_VAL_INT;
 out:
 	mutex_unlock(&adc->aux_lock);
+
+	return ret;
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
+	ret = ingenic_adc_read_chan_locked(adc, chan, val);
+
 	clk_disable(adc->clk);
 
 	return ret;
-- 
2.43.0


