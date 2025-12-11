Return-Path: <linux-mips+bounces-12452-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F935CB6A5D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 18:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62ED830202F0
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 17:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B499315D46;
	Thu, 11 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lSu/qdQp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C431771E
	for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473372; cv=none; b=h3FnTBBtmZDcm0rlxjACPnFWH35Eej1g9a4a1ElqzvLAn988cmswCfQj6kNPKx3cnxFLmCyEpELb7sdzS66NrPMznw9szy+Jb51Po3igqz/MSQrVmO9cLf7xCvrbrWJDednzokZjM+cdiRMiqy4Dak3wtosRujqV8/mZLRfoWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473372; c=relaxed/simple;
	bh=u+iIVeAYKLIIY8APv+qwbM4v5dD7Dwi5f/EPantu/m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQ107t1D9BidKPIgtJFm5QFAHeaWVFlOxFlelAwjxiHSfmFiAK9ZSeJt/oZPo++l6ZNeQo0uHR+gKL2Y8oJmcuxT409G27a1Gkynv1qwYJyrguXBLgh36RSwOrEY63ddYzyAMg3wk+EmI/nYwRqxr5CZxVGljpaDPIfZhDBipRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lSu/qdQp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so2995565e9.1
        for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473367; x=1766078167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diZjdouzEEhILOHSiCyNRKR9P2lTi1L2KPZWsItgxqs=;
        b=lSu/qdQpWZsfSa6uNvVqgshjoix4KLW8sDq6IJ6SPVA64qeA/pQvivR4agi8pua8yb
         wnW4evN0uCkz7VqEg07eb5Ay6VJvdGJMCZjr/EShYIjgHF3E7lmAmEQRzCczG3Jg2TWy
         km73bkQk2Tt6F8EbYdgpt9CgRM790kLTFZN9OvI68t8gQPNN4HcXEqc+O2Yia2d0w2+c
         glkLlMtaMhLaJheI2RPKDiVitzUeI1+vKJ269gaICs3AlMxPc+64Vrnd+p8Gl4azn5hb
         Y9oGhU/9M1/AhGAFGOJvVC0qVDo2MQjKBiDjWvyj+mLuRyXu7y0L15nitMLZ3jHvkgDu
         x/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473367; x=1766078167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diZjdouzEEhILOHSiCyNRKR9P2lTi1L2KPZWsItgxqs=;
        b=AhZCl7m0j6K5EZSEnyVHZ6A2CCkbrmnxi3t5lNeymI9viyRXNJmcjaSjEwRlGa51TK
         BlVPYLKj3zRPmkndOCsAKYpFXD2n7FJsSgp4IbWBH3ar39ONEepbaObAzvim2d3cglrD
         0k4A3+BH4b5McBzZbD0OE5nusAL+upCAr0mtPmCfgHhHBfy0QaX82aHEDZnKOMNIo8Ro
         edCpqLx+fcXK6CxBNglyplLR6k008no+dSY9/wfB7wFofmI32MA3XjvNr4FCc1e8W3s5
         auIA2q4f4iiVrrckGADYfFncnInDST4WQlsHdibV5WG5MUJxGEquqbITa5ocQw9nU2Af
         yiaA==
X-Forwarded-Encrypted: i=1; AJvYcCXXwX5v0Gxa6LrkuPwnNl+brBigt+mWxdIKlf8/RjQj0v4SlcAP4aMc9IvB+vS1ak/kwlioqHwbEV48@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrerRbpkzYU9wCi6SGX73tI26eWdkOZgWKnoQbwjvJOn/+vUu
	5BSBiBLNYi8JC6ocPhEUxlGZW6CVyajErbfMKTjM4w3AGUEuSkBd1DZfOhgw/eZE+8U=
X-Gm-Gg: AY/fxX7AI6H3lUKeErf8aLuwgKCOFix67vxsAs7do1FRoeW+Or75cf8lDiqJxGYZcvU
	fffLnVOOD6oGim2YOfs8JLVQGIWFzX3U343SKSXYiLYSrOrATeuJlochkeET4epPrUupauS3uO5
	RHoiJrVADkA7JqcBKNDS2/ey+Kemu7RXX/c7QVLpUYOXbJJ/X6WdTyRWxJWyjIIfGWmNcKw0rJL
	EbioUz556m2hkvRr5W+6X4pDQ7avUr1LvTd0F5NWRA0Qvv1tTs8kqY0fKV8vea/bHvKE9qpamJX
	hcn0IRtcOiRgHmQd41dtoqSA7XkEsRgdAaJ4wVUhCPGxuaGQ/8nQaj9YrF9MGZK/9VLAPx/ixJi
	viOdPhM+ChZz98+LTC2IkFfR1MSpS/MeBlgqbGORAZx89hkYCGNHazdp5uAN4prp3kcmOaa/RES
	rG9Pm4TaCp7S5xzaujGtVlJcF9JlKlEN45t9xI1DjiorrS4WGYawEH3lYdaPm7GYHoAQoVqDh+G
	aE=
X-Google-Smtp-Source: AGHT+IGUKWVSCHYwBEoDyb8aKAI3xda4j5uLNgFsDdq/ww+IXbbby6vKzmjBu3oTuW9ZdKJm7c1h5Q==
X-Received: by 2002:a05:600c:548f:b0:477:b0b9:3131 with SMTP id 5b1f17b1804b1-47a83745633mr73090605e9.8.1765473367020;
        Thu, 11 Dec 2025 09:16:07 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89d8e680sm16759715e9.6.2025.12.11.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:06 -0800 (PST)
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
Subject: [PATCH v1 12/17] firmware: tee_bnxt: Make use of module_tee_client_driver()
Date: Thu, 11 Dec 2025 18:15:06 +0100
Message-ID:  <5b520fd96f8b385acc280226f548913c9ee98011.1765472125.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=u+iIVeAYKLIIY8APv+qwbM4v5dD7Dwi5f/EPantu/m8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwzZJpnWSisd7DkoPNb7IKu3CNNzmY0kgG26 G88eoSnRsqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8MwAKCRCPgPtYfRL+ Tgg/CACLTMdXNNR7oub78YhSrxPLhhHLys5JO5AfQdc7fc3upwrr/QfvoJ9HBdditXtvbVcJ/oY g/aKUVLH+ObNA20u8STng/Jqr6WmHu3+GJrzaYryu3q8tTvwVJlR7W4K3bCvLeoJlGWghCd0XUd FP0J12bY4/zvrbxOdPrNLXyt+33F/T7KeaRzpGa/tG++NAAEJ9uIRD8FtHdDD93eua0b0/k3H5M oqYEsIJgtT+71HZ99ufbhcjvi/oJ7BIiTodO2UafKakUtFAHlILcJl/OmOUiWWSqY/GlzMbBL8t gI1at+MmI2xPdyew1CWuPWaSSZyKwMElpp8S1sao/LcW0gHv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Reduce boilerplate by using the newly introduced module_tee_client_driver().
That takes care of assigning the driver's bus, so the explicit assigning
in this driver can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index 40e3183a3d11..fbdf1aa97c82 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -261,25 +261,13 @@ static struct tee_client_driver tee_bnxt_fw_driver = {
 	.id_table	= tee_bnxt_fw_id_table,
 	.driver		= {
 		.name		= KBUILD_MODNAME,
-		.bus		= &tee_bus_type,
 		.probe		= tee_bnxt_fw_probe,
 		.remove		= tee_bnxt_fw_remove,
 		.shutdown	= tee_bnxt_fw_shutdown,
 	},
 };
 
-static int __init tee_bnxt_fw_mod_init(void)
-{
-	return driver_register(&tee_bnxt_fw_driver.driver);
-}
-
-static void __exit tee_bnxt_fw_mod_exit(void)
-{
-	driver_unregister(&tee_bnxt_fw_driver.driver);
-}
-
-module_init(tee_bnxt_fw_mod_init);
-module_exit(tee_bnxt_fw_mod_exit);
+module_tee_client_driver(tee_bnxt_fw_driver);
 
 MODULE_AUTHOR("Vikas Gupta <vikas.gupta@broadcom.com>");
 MODULE_DESCRIPTION("Broadcom bnxt firmware manager");
-- 
2.47.3


