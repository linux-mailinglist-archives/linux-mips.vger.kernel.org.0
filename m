Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEFB622338
	for <lists+linux-mips@lfdr.de>; Wed,  9 Nov 2022 05:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiKIEt2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Nov 2022 23:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiKIEt0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Nov 2022 23:49:26 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5D1201A7
        for <linux-mips@vger.kernel.org>; Tue,  8 Nov 2022 20:49:25 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id h14so15662864pjv.4
        for <linux-mips@vger.kernel.org>; Tue, 08 Nov 2022 20:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=micron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y8Wfh7oNrDBI5vh/it5Ga9yBwxl1U/92n2cES2wD7Y=;
        b=737BNOf3/mt6q4dGs6ny2VV/fSHNjSlppb47VmWVqRGSp5tNNptS55YFZE4wXmJB7j
         YjPHolgLH4JCSUtYNbZV1mUIgWBQu/rablUbjLbUnFG1pWHeAs0UwH+RVu0kJMhRZMbT
         FE4vTsYC/NeEqREt6MTTcnPidKwqnR9K3eR9AX02EdFryJwUhZjhf9McAEI5f+CUPlUF
         rf2B8Hx0vLugFtQvdGI5rx1MZuv64TOP53WvJuJai9OL5Lo1HIbGts8e+hcm9Ei74aaj
         aK+rRXPIbKsuT+FhHRTuRRPzAbb/6FBDn0Mdd8lvAicWU1hDeIVQj19hVkrh7ye6Kriq
         OOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y8Wfh7oNrDBI5vh/it5Ga9yBwxl1U/92n2cES2wD7Y=;
        b=7bFSU95P+bY7fFyXqLkV40HbzffMs9dxN/UAQ+dL5oxEFYzT5Gh7OralzO3pBrLryq
         sHWWq3UimGe1gcSQOMqNY5rxxjSZb/Keh++fQsfmWx8X2oDxvEN4uMbzJXi3oGLQ21NO
         Cdts1lk0E/9A3MMn4+A15tBZwwfRVQGZTv2F5CxH+WHvHW/qV99eGi+bHELyV05lFJII
         g4WpQV36h7VRMU8XAc2l5l9cDoaU6+m+D4vyRcu3x3Hue8URwqPiHgbkDpKMKkZfZcos
         E7BQeWLEZWn4KcVcJqan/RwAcM04mKtSP9S/c8a0y56dtd6KSRxeS4vwShNPhFJ1Xcjz
         iFhA==
X-Gm-Message-State: ACrzQf1ZaKRZ09U0qfD+JNz4Fn9MZkKk4wPvp7vAog+XTiVCrU46L0zL
        +xfgELyOHYN1Zjk71KlcIeTwkQ==
X-Google-Smtp-Source: AMsMyM6RLUjU8JnEa27vtUOc56N/H9JgJHXYqi5PM1QjGT9kGwO7G9fHqxBfvTQ5pEp2LGjmzKyiMQ==
X-Received: by 2002:a17:902:8643:b0:187:3f0b:a4d7 with SMTP id y3-20020a170902864300b001873f0ba4d7mr40374900plt.15.1667969364980;
        Tue, 08 Nov 2022 20:49:24 -0800 (PST)
Received: from test-HP-EliteDesk-800-G6-Desktop-Mini.. (2001-b011-381d-3a82-c66e-e599-cb4b-6309.dynamic-ip6.hinet.net. [2001:b011:381d:3a82:c66e:e599:cb4b:6309])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b00186b280a441sm7796185plk.239.2022.11.08.20.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 20:49:24 -0800 (PST)
From:   Mike Hsu <hsumike@micron.corp-partner.google.com>
To:     tsbogend@alpha.franken.de, brauner@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mike Hsu <hsumike@micron.corp-partner.google.com>
Subject: [PATCH] Add Micron 2400 SSD VID/DID with disable Write Zero setting
Date:   Wed,  9 Nov 2022 12:48:51 +0800
Message-Id: <20221109044851.3505-1-hsumike@micron.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Mike Hsu <hsumike@micron.corp-partner.google.com>
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 31e577b01257..6914ebc8c1a4 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3491,6 +3491,8 @@ static const struct pci_device_id nvme_id_table[] = {
 				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
 	 { PCI_DEVICE(0x1344, 0x5407), /* Micron Technology Inc NVMe SSD */
 		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN },
+	{ PCI_DEVICE(0x1344, 0x5413),   /* Micron 2400 */
+		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x1c5c, 0x1504),   /* SK Hynix PC400 */
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x1c5c, 0x174a),   /* SK Hynix P31 SSD */
-- 
2.34.1

