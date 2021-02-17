Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21AB231D701
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 10:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhBQJ21 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 04:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhBQJ2Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 04:28:25 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364DFC06174A;
        Wed, 17 Feb 2021 01:27:44 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id t29so8026106pfg.11;
        Wed, 17 Feb 2021 01:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0UGJQalN7/cBobqsh6Rf+LOklyIALB5R2j/v4H6e5Xo=;
        b=DHcuLYe3k5U30T1QUzJDgkwesfyuhw8/kqsP3/ZCFUWK5IjlvoxOAvnQGxy3w84EGZ
         73drMrhmIk/Bz1HFmlN8F8cGcqLZLOsvXOKPlyCKjGaMq5sXxxDIEt6DpnFhKUe6mwEk
         AoGoir/ny4ZDft/tqzYykGQRNV4slDGQBrVf5Icr2GB/dy52misfD7YG11C71eA7nr//
         hojdSPHJ4hbgmnyGDpPjraHJsP68UJ0zhQj0TZP6Wjv3lMhZXq+r4K5tmHwO0e0V2+DL
         N1P6pj58/e+NKzMhDP/Hu+GL6ffN+BNuNwH49+18CJIOvnd0ofYsuTnH574ro06tlKeo
         W1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UGJQalN7/cBobqsh6Rf+LOklyIALB5R2j/v4H6e5Xo=;
        b=HTIdk1kbcu80dpEMeWcqDrrI8fulDz5pUUjNfHtyLjAkeKKZfgzmJdO94fTvMGGS2E
         MC+8TFgliZiquSqW6HVKXTloArjjLOdSmuHLpBCEElzhLixmXXLfsr7gTLHqPVGMU9PI
         9ErhEzZKB9DOgNEwOy/D8wOSLds0I4OTO5CSnMXRgI2LTsgAGPpvpC7kB9RPwKKLma6X
         7QLjWFOhbZl41RMyqzjvS3TsbyqcsvZ5U4EC7Vgp6lrFGBr+it/onOrt3Nm6vyqW6hRt
         ZxKjGjsfBE4e1OtXNeEjnilhO3tFWLwwKRL1IaCzm6bNw3h0BbzJ41/5TCl4YeTYv9Xr
         dS7A==
X-Gm-Message-State: AOAM533EW+4Es7Mv2mSd1NgFE8G1a31+fHkjFz/Luao/Y6DvMklHuJdb
        8eOuH9EpOILtbwvorSCfOtY=
X-Google-Smtp-Source: ABdhPJwRx0Y7w8gIVvafHbphfsQ/MgD6yMzxGD9u8Lok8gi/Y3x4PeF11nOVspKl7e0BJZdRTEWw+A==
X-Received: by 2002:a62:2bc6:0:b029:1d2:f224:d91e with SMTP id r189-20020a622bc60000b02901d2f224d91emr23377397pfr.26.1613554063831;
        Wed, 17 Feb 2021 01:27:43 -0800 (PST)
Received: from localhost.localdomain ([49.207.204.196])
        by smtp.gmail.com with ESMTPSA id n11sm1571412pjk.38.2021.02.17.01.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 01:27:43 -0800 (PST)
From:   Allen Pais <allen.lkml@gmail.com>
To:     jens.wiklander@linaro.org, zajec5@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Allen Pais <apais@linux.microsoft.com>
Subject: [PATCH 1/2] optee: fix tee out of memory failure seen during kexec reboot
Date:   Wed, 17 Feb 2021 14:57:13 +0530
Message-Id: <20210217092714.121297-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217092714.121297-1-allen.lkml@gmail.com>
References: <20210217092714.121297-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

The following out of memory errors are seen on kexec reboot
from the optee core.

[    0.368428] tee_bnxt_fw optee-clnt0: tee_shm_alloc failed
[    0.368461] tee_bnxt_fw: probe of optee-clnt0 failed with error -22

tee_shm_release() is not invoked on dma shm buffer.

Implement .shutdown() method to handle the release of the buffers
correctly.

More info:
https://github.com/OP-TEE/optee_os/issues/3637

Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/tee/optee/core.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index cf4718c6d35d..b402e5eace7b 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -582,36 +582,64 @@ static optee_invoke_fn *get_invoke_func(struct device *dev)
 	return ERR_PTR(-EINVAL);
 }
 
-static int optee_remove(struct platform_device *pdev)
+static int __optee_shutoff(struct platform_device *pdev, bool shutdown)
 {
 	struct optee *optee = platform_get_drvdata(pdev);
 
-	/*
-	 * Ask OP-TEE to free all cached shared memory objects to decrease
-	 * reference counters and also avoid wild pointers in secure world
-	 * into the old shared memory range.
-	 */
-	optee_disable_shm_cache(optee);
+	if (shutdown) {
+		optee_disable_shm_cache(optee);
+	} else {
+		/*
+		 * Ask OP-TEE to free all cached shared memory
+		 * objects to decrease reference counters and
+		 * also avoid wild pointers in secure world
+		 * into the old shared memory range.
+		 */
+		optee_disable_shm_cache(optee);
 
-	/*
-	 * The two devices have to be unregistered before we can free the
-	 * other resources.
-	 */
-	tee_device_unregister(optee->supp_teedev);
-	tee_device_unregister(optee->teedev);
+		/*
+		 * The two devices have to be unregistered before
+		 * we can free the other resources.
+		 */
+		tee_device_unregister(optee->supp_teedev);
+		tee_device_unregister(optee->teedev);
 
-	tee_shm_pool_free(optee->pool);
-	if (optee->memremaped_shm)
-		memunmap(optee->memremaped_shm);
-	optee_wait_queue_exit(&optee->wait_queue);
-	optee_supp_uninit(&optee->supp);
-	mutex_destroy(&optee->call_queue.mutex);
+		tee_shm_pool_free(optee->pool);
+		if (optee->memremaped_shm)
+			memunmap(optee->memremaped_shm);
+		optee_wait_queue_exit(&optee->wait_queue);
+		optee_supp_uninit(&optee->supp);
+		mutex_destroy(&optee->call_queue.mutex);
 
-	kfree(optee);
+		kfree(optee);
+	}
 
 	return 0;
 }
 
+/* optee_remove - Device Removal Routine
+ * @pdev: platform device information struct
+ *
+ * optee_remove is called by platform subsystem to alter the driver
+ * that it should release the device
+ */
+static int optee_remove(struct platform_device *pdev)
+{
+	return __optee_shutoff(pdev, false);
+}
+
+/* optee_shutdown - Device Removal Routine
+ * @pdev: platform device information struct
+ *
+ * platform_shutdown is called by the platform subsystem to alter
+ * the driver that a shutdown/reboot(or kexec) is happening and
+ * device must be disabled.
+ */
+static void optee_shutdown(struct platform_device *pdev)
+{
+	__optee_shutoff(pdev, true);
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -738,6 +766,7 @@ MODULE_DEVICE_TABLE(of, optee_dt_match);
 static struct platform_driver optee_driver = {
 	.probe  = optee_probe,
 	.remove = optee_remove,
+	.shutdown = optee_shutdown,
 	.driver = {
 		.name = "optee",
 		.of_match_table = optee_dt_match,
-- 
2.25.1

