Return-Path: <linux-mips+bounces-14221-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFPVMbL352kVDgIAu9opvQ
	(envelope-from <linux-mips+bounces-14221-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:18:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE104401AE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6145303A929
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 22:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA33A6412;
	Tue, 21 Apr 2026 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="XtNu6QDc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC635B125
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809817; cv=none; b=AOft7V0AVZPlx/8ygVESg+ACyN0xPbnwp9VYpXAQXgQN/XIuR4U6y4/xjHjfruq3aZVDSgVTEB+gEEuhwp1364nMx0JlbldH9kFrWbVD5AvNUf3evXa+w+iDipVrH9YzK0UptifWmCIk+doeBzoeE19aSeGhoBC/IClGZLnDUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809817; c=relaxed/simple;
	bh=6AKe2j+ZTiyHFGANGBS7sRDCWEU5fxVETQ/G5/4Y/NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac+EbCwRMYwSGjxK9evpdXjvwYomhumbKVgVjHaiyRf0Z5WGWTb3MEv151/Q0LKnJR8uaUJnfWujr1loxiqkMeNIgMteOAY39MN6VMro1Ce2J0rgWq9za7mI3QyK/4fP+DVRcAa5tnianiVDGYzERqriO0TcDtwu21ekY8ZQCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=XtNu6QDc; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so6192414eec.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776809813; x=1777414613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIra/b+6e7aLoRcFqQoUS7o9Au+O2oAnllj7azZoDCI=;
        b=XtNu6QDckGMjfCVqkkcnOul8hGw/BupPbDf/pNYKSapjPqTifKpON27oEdkCuvA/fa
         HjYGjXyTkd5y+or7ZqrEsKDjaQuqBlU/w7nLgdP3rN7h84oNcKmzXxiAL4IffCwhtmHS
         YNBAKVbr0tNXIm+PbJn7KPm6tO4fViNsjklB5A5+LM9+VZdqTZbkOKw7bNYMZumcpzxT
         EpH8u0HvbxpKRXO4b/YXtrxai9rf3JvlDp/QaQXkq7RKc6Klde1cSL3jraupM6EZEVhl
         PDuzY4TGvh4dTapMx69GkmUmmBpLFcHD9QAGfGGDJnZqWs7qHV5gYYIRC6UO7H/WL8NC
         p8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809813; x=1777414613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NIra/b+6e7aLoRcFqQoUS7o9Au+O2oAnllj7azZoDCI=;
        b=an0bAatYuB/1jMF7KrA1wy+eRGX0RiRyJjgxZVuOm3cegWrw9CrrBjKsTywtt7cMPf
         ROugFfyOBahtE26DzzUjIURj4q5f8j4DSwvdbtdR9Oxl7aOCIYg9AlyZS3VGxV7KmIRr
         xGNZd7rXeL6hkqttcD2VO4+Hc6TNF7/wVLWfRYXLPyPlJBUMDurRQmNb8dEIIei/A9tO
         ySWUJTr7OmPwpma9yIs6HXCyI/s/yNSM3E75rM0MHjm8sgPfWpxXSCV95ZHxNLHbbGGA
         rtX2YTz5KzWEC3dmKbeUKMdqaTSAiv0R+qulIrVdP0Vhr3+MOajAl/EiZcoh8bS60Urp
         PHRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VcbLUYodcUM1xmIaDS+blkilbbWSZAaUBZ0xJejGZkAFn91wdkoADyzLacqXwdX/dE1nf3kpFi1G4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7C8biW/U2e7K5I/NP7gkhWoWD1rUYeYYSxaIWQr3TZEuefIW
	AmvFxUBLmo/TE30Sg9fLL/SPJOZ9es2j+PA7DTkFgRrLGUc/czxJgZ4rMB1fT0ZkKyk=
X-Gm-Gg: AeBDieusE3qRF7X1SyZCA12+ETrHGNwR/A4Cj9Tgk+wqk6DfchD0Lf2VE2lsIcOoKoF
	Og/T6G7WpcyG4RQtoZNIHj4Izc9ewnoIS7vxw4rsAlbNHaze4V/pLlHkJ2kavJQqmwTlknLc1AE
	d7X8vk/SWp/3yymnOOvFzYUmQZNfnP+x2k2QX/WSYua1c5GNWUdkHelXZYbIBjbk+PcZDFuvcD9
	Y/ajuAwq0B/suYm9Rtd8fpwR3JORZDxMPBPYl0IWVw6a4OdFKGGg/XS4vDWz1yL+3X2A2uCRDa5
	CNlBqnJNy+AJ88WrzxlAUE6/ezffJRWMYSe0V7CgJFEGYhAHzui+LzzYaMangQLw/9QBLkncoJ9
	7aIf6PZ64oOxXwGf1bez5vYOAXXj2PNqWaQuZNk6UNsX0TQjC7sGUJvHO6eWsfCiMC3MMNnT2VY
	44EUvhaOyu7VGxB9zV/TTzJRnZYcn14xvQGet3ch6MC2eSyRM0TeMJhc8CHty0bm3HhoLPC2u4H
	fDmeMdn4oTkGBb8Vz6x9Tc=
X-Received: by 2002:a05:7300:dc93:b0:2da:45f8:1b41 with SMTP id 5a478bee46e88-2e478c1f80fmr10076497eec.19.1776809813351;
        Tue, 21 Apr 2026 15:16:53 -0700 (PDT)
Received: from felipe-ThinkPad-E14-Gen-4.. (201-92-135-6.dsl.telesp.net.br. [201.92.135.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm19827980eec.24.2026.04.21.15.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:16:52 -0700 (PDT)
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
Subject: [PATCH v3 1/2] iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
Date: Tue, 21 Apr 2026 19:14:58 -0300
Message-ID: <20260421221629.70401-2-felipers@ime.usp.br>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14221-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ciziks.com:email,ime.usp.br:mid,usp.br:dkim,usp.br:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AE104401AE
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
  - Split out ingenic_adc_read_chan_info_raw() logic to helper function
---
 drivers/iio/adc/ingenic-adc.c | 36 ++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 1e802c8779a4c..81ed92f4490cd 100644
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
@@ -678,6 +671,27 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
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
+	int ret;
+	struct ingenic_adc *adc = iio_priv(iio_dev);
+
+	ret = clk_enable(adc->clk);
+
+	if (ret) {
+		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = ingenic_adc_read_chan_locked(adc, chan, val);
+
 	clk_disable(adc->clk);
 
 	return ret;
-- 
2.43.0


