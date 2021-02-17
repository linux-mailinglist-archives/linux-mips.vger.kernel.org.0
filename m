Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9288931D702
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 10:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhBQJ2c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 04:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhBQJ21 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 04:28:27 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539A5C061756;
        Wed, 17 Feb 2021 01:27:47 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id a4so6536389pgc.11;
        Wed, 17 Feb 2021 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XDTZ33fjLbE2/tgGk4BUqIi9+Z24fcyTW3i1iRPooGA=;
        b=Ld0WwizmpD7lkB5v0XnKm0pdkBTvqxe1CslPGmlNzbaaRqkyFyoUX2kesGJ36BA6z7
         Ysrabp/0efKfwbvhhCXSVybDL5IX5AU6vUDEGtgzq4OrPetR9F0r/MKoyWflRbxcGT9J
         1USK/CgYONRDBZV1ssg9i+bmDFB8li16XdTW5DfHL86hy23KYS/7yrLFyDsviv76MI1z
         LVTnzpzh69P16eh/XVZC9NNoxXJPL9CJ2Ioqr33MD0h7TBwTx6F0tA0VJsuICKZ3hbhe
         UOtnu9j7SR3cMy27sjJ9dM2CCvVc50OHQEGEUVw+2nLSuDHMhnuIdPoWJCd74MVYM1RO
         zlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XDTZ33fjLbE2/tgGk4BUqIi9+Z24fcyTW3i1iRPooGA=;
        b=oXAO0Q4OzyLE5SuBRQhuIF14npO1Jkc9JEOiEe2Sk7J0A/p4QKezVz1EF4IN9+A5YG
         B9u98LAnshq5Tf7PvWeLO1GaEbUv8bVicbfHSGWHj4hUz1U/FFSGBOFqTdHMsB9Vt0am
         765b1uspwu1X/ayN4/1An8nRefvGiPKq8hvpklTMp+1QtwA1H4cq+wIRAjLgE3FIo/gA
         PBEaT9TIaQIw5lSHbuow254yOQR0UeDS+HaRNQmvoombmFvdztl1Fl2XvZkkmddDUX+d
         cjF6BL6WTBxV6/4d48bvKQmoOXlalQd9GDDZFIbOVVrm4VJXOrjGV06CrXlRDuYAKf4x
         Fxyg==
X-Gm-Message-State: AOAM530L5GXxj8OrmtxTWpG2UKn6WbFPnWRWJDA8SIuKjTwOZ/62gETg
        WXLZeOGZtuUuo6RioFlk09s=
X-Google-Smtp-Source: ABdhPJwP3og/7cpycHbb2mVi4WugURi5kSRz3GA4T88CGQzNlXA4uXbxU5eg8fYWsCFMjlwM2JxnMg==
X-Received: by 2002:a63:515a:: with SMTP id r26mr23471747pgl.257.1613554066999;
        Wed, 17 Feb 2021 01:27:46 -0800 (PST)
Received: from localhost.localdomain ([49.207.204.196])
        by smtp.gmail.com with ESMTPSA id n11sm1571412pjk.38.2021.02.17.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 01:27:46 -0800 (PST)
From:   Allen Pais <allen.lkml@gmail.com>
To:     jens.wiklander@linaro.org, zajec5@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Allen Pais <apais@linux.microsoft.com>
Subject: [PATCH 2/2] firmware: tee_bnxt: implement shutdown method to handle kexec reboots
Date:   Wed, 17 Feb 2021 14:57:14 +0530
Message-Id: <20210217092714.121297-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217092714.121297-1-allen.lkml@gmail.com>
References: <20210217092714.121297-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

 On kexec reboot the firmware driver fails to deallocate
shm memory leading to a memory leak. Implement .shutdown()
method to handle kexec reboots and to release shm buffers
correctly.

Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index ed10da5313e8..4c62e044a99f 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -242,6 +242,14 @@ static int tee_bnxt_fw_remove(struct device *dev)
 	return 0;
 }
 
+static void tee_bnxt_fw_shutdown(struct device *dev)
+{
+	tee_shm_free(pvt_data.fw_shm_pool);
+	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
+	tee_client_close_context(pvt_data.ctx);
+	pvt_data.ctx = NULL;
+}
+
 static const struct tee_client_device_id tee_bnxt_fw_id_table[] = {
 	{UUID_INIT(0x6272636D, 0x2019, 0x0716,
 		    0x42, 0x43, 0x4D, 0x5F, 0x53, 0x43, 0x48, 0x49)},
@@ -257,6 +265,7 @@ static struct tee_client_driver tee_bnxt_fw_driver = {
 		.bus		= &tee_bus_type,
 		.probe		= tee_bnxt_fw_probe,
 		.remove		= tee_bnxt_fw_remove,
+		.shutdown	= tee_bnxt_fw_shutdown,
 	},
 };
 
-- 
2.25.1

