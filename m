Return-Path: <linux-mips+bounces-12463-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 359ADCBEA15
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1786C3053C84
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 15:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A5B33F8B2;
	Mon, 15 Dec 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LBjmBYOw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142C33F36D
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808282; cv=none; b=Q+y31jcrOqOtj36M1dDNulxUhNyDh6E2Qug6CP1kIWznkkOQQPXJx4Sa+RubrziPVqg6InqthZvjh5lwuqjpDcRL906GgjIQx0t6je5cWZpl1qV9ZWuw3QdIjCbnpGVOWNLqxsp3BrfcLYT93k1eFtu5hcbxnLF+kOXWz5TxqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808282; c=relaxed/simple;
	bh=Kkjk2HQyXaBvr0FeLY8PHK1oOoMWNcJDWQq+WFZGpZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8BQadjnpsQ4Aw8oOjy/S/ij7feONlKXcjBUtvy7d2Ej/561mv1Tya93Y4vKWq594DDwsaKH8PqNFfvBixJm9muXz8vOKGj80RtTbNkVhxEr9fBQ4PNUTQ1jzFwqEDWKmDe6VOUESlNGq4e2xPhopoVLls9+elA9Y7au8jHfKmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LBjmBYOw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b725ead5800so534784066b.1
        for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808277; x=1766413077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iqJF7orvlMqhIrghvfFQasl/uMqZ7gfWiSQOSJzmXI=;
        b=LBjmBYOw/a1epGCKyuNDnRTSqpAXSOdCu2WsyKxvKWCjjxDlfYSNvYCYC7BnJmOoMG
         LHw1tY5MqS11eoZD6IOIGMH5nMs7bdLI/nmAK3+pqzj3YFYNsPwL8qY9KnvzBWzbyBno
         DbxUfdxtr36sCNu8aheqQoyRuC1YTAv5JLZaxs19V2O6QMeD0i8Fxi+acdkjFkODE1CA
         x08I7v/U3afCPwGBLuQn3w6wTS6DzUp4AJhVXYR/YFlytKw+pqtG7L4p6T7UZHXHTUH6
         CeCzAjNqn9lEjoRCq9mk9knpv8mA/k5KmyDUc8hVof2JC3O6o8o3O0cFxXPHw8mVSvFT
         Wt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808277; x=1766413077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7iqJF7orvlMqhIrghvfFQasl/uMqZ7gfWiSQOSJzmXI=;
        b=hAIQnRWHtkxjx7cfse3TD7JIdvPbaRovi6PqQ7vrR4OeN5Vvp6l/ON0P5u30w1tQY6
         0X8xE2fC6ClfHa4gHMD89X2qDddIYUq5nhbgPyY/OFax8JzPgU7qBRyb9GkjTf+gkKzy
         701pxT0VwXtW73DIeDpxmy0qoQiSojiVPMCZgrpTtXan+h9kUr7BTcUpjxjdb+kSURXS
         a/vIJYToed1A5Yi2mmWiB6gFj5CzZtl7zAaXuirRdmy8Lr+tsby9tcpWt/IJHyt4EO8i
         PlBOro2nV5PqgDhu/KxTblH6VNDKl9S9oJHqO0thfAqU9SHgk4Wd18g/PJYQUyPCNaFr
         E/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0avvgyE1/zuO/8stuq2/ww1Pc7ep6vtOTy87rBLyTx0VMxJxK10jrQm4j+o/tZL8IY4M0GHFBSGP@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI40t6u43QoI5GxRoN/Z8xAWTgbgQRXwpnhWb+fFWCRd5qYiE
	6YTmORATIn19j+ogzTiRcWEPZu5DSQuwu7H9RJfwx47qkIAVU20cIeoInbuh7HKe/n4=
X-Gm-Gg: AY/fxX5RJuFlTzjihgX25ok+gB+HsWEUtNSEh4Ji+4/1wNg4zOZH9vjpK+NbBwquR5Y
	F8b/scA79rVE/m2RjIgFckbxUYr1jbcmUP70DC8dpJBsKl2OBu/UB70yFsGzNP0aNk9FD7O/PYZ
	maiAe7w3ABvfktjZSzZszfKVbcBnIGLVfSjx8dqmAT9FYfGzR1PrA2qnqzuGNTDqHzYC4Dg9feL
	TZ5BLTRhetX17P/KyHEmZX+58Ui1X4X6BnZy7rC5peUi3Si9xrdoBYysJlUO8Sg28cYVU0wjII5
	aqmBtZkG9EsuNDWc0W+DzVBi4AerbM7d9z9j/W3/YYjSGkaz55v8g/51gflhlqy41gmKK7WkowD
	qJj8V07PYx3lc+wJELTKk7CNhx+v/lD9g9HllZREw38/VcfuQWTVoF6MQDXA1aAVaRAM2KBA8gk
	QX1nw6ng+OghOgwh1NhTPuQHugfWL0ARLDmabbnejbsEb4LMWpCwgoH1/arg==
X-Google-Smtp-Source: AGHT+IEPjHTBezRQ3PDr8F60Bso0OUB75ZXwyfvhYmt5eGS3puxlFDVYpAwYmpGEYvObi0dAnABghw==
X-Received: by 2002:a17:907:6e90:b0:b73:78f3:15c1 with SMTP id a640c23a62f3a-b7d23b92012mr1014789266b.52.1765808276856;
        Mon, 15 Dec 2025 06:17:56 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa29eb48sm1444020266b.1.2025.12.15.06.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	linux-mips@vger.kernel.org,
	netdev@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 13/17] firmware: tee_bnxt: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:43 +0100
Message-ID:  <96f7df595a96f631b40c2c0a6fcf8bf7217d02f4.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2314; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Kkjk2HQyXaBvr0FeLY8PHK1oOoMWNcJDWQq+WFZGpZA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhsfHXkwvq5lo/liy5xLt/2zfSDHM/HASEZs rSXC1P7uA6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYbAAKCRCPgPtYfRL+ TjIHCACKt2PBL1ggi18gXW89o2wjtHLVPQLHCVpHjtN5rjdFvrbEnb8GMhyPmXCkVmVoss7QFdW UbeQereVoPtirVXXeCZWy9g9T0WSKPbeURogL5yJ2CUFbRV2xnjlstiWQSVm8Kqzp+SWAZYvYR6 Jztwhm3a/vQfJOJNAs+QMLGr29GLfItZLW+6/mxmfWWm/PF5PYmA21k/UylJImDTGlrdDl7dqRS jWesv1pzELsMZ/EHQnDEoPByjLvWWtbbrLxTZeTrZ+rN3pJcjTYAsDtLb2/VHlwBg2B397iMbbw yyAwbQOxcIWjlvWNJA4Li96zLkxmhy9Rrt6Lw5ZiJ62bSLDC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index fbdf1aa97c82..a706c84eb2b6 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -181,9 +181,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
 }
 
-static int tee_bnxt_fw_probe(struct device *dev)
+static int tee_bnxt_fw_probe(struct tee_client_device *bnxt_device)
 {
-	struct tee_client_device *bnxt_device = to_tee_client_device(dev);
+	struct device *dev = &bnxt_device->dev;
 	int ret, err = -ENODEV;
 	struct tee_ioctl_open_session_arg sess_arg;
 	struct tee_shm *fw_shm_pool;
@@ -231,17 +231,15 @@ static int tee_bnxt_fw_probe(struct device *dev)
 	return err;
 }
 
-static int tee_bnxt_fw_remove(struct device *dev)
+static void tee_bnxt_fw_remove(struct tee_client_device *bnxt_device)
 {
 	tee_shm_free(pvt_data.fw_shm_pool);
 	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
 	tee_client_close_context(pvt_data.ctx);
 	pvt_data.ctx = NULL;
-
-	return 0;
 }
 
-static void tee_bnxt_fw_shutdown(struct device *dev)
+static void tee_bnxt_fw_shutdown(struct tee_client_device *bnxt_device)
 {
 	tee_shm_free(pvt_data.fw_shm_pool);
 	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
@@ -258,12 +256,12 @@ static const struct tee_client_device_id tee_bnxt_fw_id_table[] = {
 MODULE_DEVICE_TABLE(tee, tee_bnxt_fw_id_table);
 
 static struct tee_client_driver tee_bnxt_fw_driver = {
+	.probe		= tee_bnxt_fw_probe,
+	.remove		= tee_bnxt_fw_remove,
+	.shutdown	= tee_bnxt_fw_shutdown,
 	.id_table	= tee_bnxt_fw_id_table,
 	.driver		= {
 		.name		= KBUILD_MODNAME,
-		.probe		= tee_bnxt_fw_probe,
-		.remove		= tee_bnxt_fw_remove,
-		.shutdown	= tee_bnxt_fw_shutdown,
 	},
 };
 
-- 
2.47.3


