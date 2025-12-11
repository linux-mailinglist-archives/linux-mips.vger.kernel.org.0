Return-Path: <linux-mips+bounces-12453-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E9CB6A8A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 18:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 397A6308973A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 17:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE98316199;
	Thu, 11 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mAfvNkP7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4683195E0
	for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473372; cv=none; b=hird4o3y51cGEo/c7UgdVGYy2FUPnShL0Ei81LRgdrzID6L5vEy+q78Z3Cyrglbw/e2toUEgjcy1YlEMOgUD0XiDVlNyddyw6HpyP7ggqEUgLtd+y3cp1FfS2jt7droqy4ey7pq39lijK4iQSPv78WO72SZNM9zEVUukW7lcb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473372; c=relaxed/simple;
	bh=/zcdGCyO/zJVJHXiHKgniHKKW+1n+is3abvzUXVsx+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4fkNY0KdsY/CDB5sk8Y1D1sRjuHBuQBkQLKBlxZA/eTzmIojRF8mONUoQHXTf5cbB4ou2BUjuIckpBV40wSfShKOShXbaWHGZEhRozA0McOjdR5hU63cX30dDtI5SOD4BXqJOlSCpmYz9ZXdPRika6e9dRMGW/1v0jMavahUcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mAfvNkP7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779a637712so3112745e9.1
        for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473368; x=1766078168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5Ml4HJmxurjzbFHuGXuWnrdRmEuv/7EaCb1T3xZqb4=;
        b=mAfvNkP7P43IGyFu4r7QhTMUtmSve4AMsKLN8i1Rx1goClXjJybGIMLREy0l+Bsmmy
         xko+FllmPzopY0siygA3OVo5PZP1/6zHREVqsPCARbKEIYU9YGiRXhpsb28JDZmPqoZZ
         vUapsgUM7ORbofmr8L0YxWGcy+Ku+cpaHdzyshzJrAVdcbi53pBKTGNqZqk7wU6rvzXf
         IAU/KaJz+mbGdpxxudcZPTdg6lzEO3eTu+YHLrWx7bg7IE2giJpalscR58NYXBYXgDF2
         bAtIFJXNcoZcOO4UPrtzzlqNJ7FQHbUGKhCd7lWOwTR7mC2AaQ12yRjGFXPj1t/1QYU3
         tW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473368; x=1766078168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5Ml4HJmxurjzbFHuGXuWnrdRmEuv/7EaCb1T3xZqb4=;
        b=IYI5vLgqaiimwTwNOI+P58RblT/ThT5fkVmtn4vixg1P+GCb/DbXodZaMsplWexPhq
         5bzm6ml55uc4RT+HpSKxwkXIgDk+IIOXhJN0zLkogqQ1UGr7Oqj1Z7Vc25uSI3Uxe0Vl
         cXlTfp7zEEQ30qhfdW4BjfydiUktwuMHEt58GCTe+hIo0W+hb3jAasJi+FFmHMelhvu1
         kGZI2MNbSinRTcHVuUyoCbgcEPlWwQi97hn5IoWLE0pVkNIih09/qmhTOBA7mT6CXDvS
         HBfAv6DJoTKGbF04btPN7ydi7OB2qmBHzjWL5JGrNK2RjZs2eahROcE/Cc1OO7AIE7xN
         tCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXkS+2ZI96i9pEEOK4pUH5GciX75f3zL7QUJfz4EcoCQoRb6aiBpihwamu2uWqK88utlNXFD/pkmG4+@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWwbn01y8CxBzfH69FkBTq8fcHEPufFK9DhzEma+9+2YzjUUR
	89CQHhM2pwYY98Z7mIDuzDWHfMzr/cdIla0mj7xpdcgNUnBQCVjbprrX0slVqNZPxyA=
X-Gm-Gg: AY/fxX4mQVj+uXc0Vu+Rgx8d/yIPREisrfcPOKg5unVzYs2LFNnw2dauTPjRx2TXZ1F
	G0a0WWvjOdNazpCMmq8HP/ITrY5fBsnOSu2vxi8Vk8XW0sez/noyEuw47K0GaUlJlCC8zJXKxAT
	3gGXS3diw3Xp+2D8HcLW/iQRcY/ZGxCQAK/caGhgQrkA3W+h3Nv6Zj04o22GiPgGmWXbi7weepc
	6rYBZ2XTid3hp8vvFP0r2w450+R8tpyoiufcifaTy6D9sd64ZyPZUUJHuBDrOG76mw/k2NVMvTS
	uyMQcUvVNQKE4u7DUMP4fMHkl61C11jJduLPQCfX3TN2WP5MT30XCyyBWoHxGjj1OQVMELVThBw
	M2OAYuYdwTTr9N6k5ftMBraXR7lPoiM66vFiu0A/TNEhZU1NS1zCTxJkVh0Z94y0TW+PEmX1MHC
	yNN+ihxiSw+vR4KuHe4kwCUH4IKaLg1aY6ro85+OiM4tP0OzgCOjjD2raFaU66O/WNWnRy4VN5m
	C0=
X-Google-Smtp-Source: AGHT+IE0Pak8/lbklEkRDCW8Y7zvjMkJReE6ZBMN8ZhmPk/MHipynV8W1+LPXu/33++KhGMjio+QMA==
X-Received: by 2002:a05:600c:4e49:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47a837a27d0mr82898065e9.33.1765473368108;
        Thu, 11 Dec 2025 09:16:08 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89f1e947sm52522015e9.3.2025.12.11.09.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:07 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/17] firmware: tee_bnxt: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:07 +0100
Message-ID:  <f0b513d92355a53d30d8fdfcbbf7250457ec470e.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/zcdGCyO/zJVJHXiHKgniHKKW+1n+is3abvzUXVsx+4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvw1dE1CQuBYvGVTWVxDbTjDXphCrVIig97hx yKXj9t/eKmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8NQAKCRCPgPtYfRL+ TheQB/4y6MUCe6HoDloGZNlxErv3xbN/7CcKgAqBSZLsIY2AnM58rwFoeQpZtwcQFoh5vJPSjgf JBd0iBFOoJIXWK17LWD7nmG917NzAWX+Wu/btEbP3SY6iMZUDMVV4bJetR0Jc6BsXVSSDctjtvK Wttn4wjRwmSXr37rfytMHye+tBx1MRouulCVZmRT/nlyVKM5exWD/kri89uXya5zgLcg5nCOtv1 YLdPhUPsb+e4eMZCwwGm2Fs9BsRAHgMzTEkvtTFdkMrYQVEW56gsHqQVr1JTTMZIqzxahoq4XxO y42vX36v0uM2lxdFmFJgCeRVpXKcZvCeC4wvz6BzZgdB5Mh7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

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


