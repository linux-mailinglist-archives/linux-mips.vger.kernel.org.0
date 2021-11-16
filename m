Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD79D452C77
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 09:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhKPINz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 03:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhKPINy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Nov 2021 03:13:54 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF395C061766;
        Tue, 16 Nov 2021 00:10:57 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k4so16685944plx.8;
        Tue, 16 Nov 2021 00:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVF1j1riPLy6CiHf7Z/coZrdiXLUZDzW4iowCSsOhKI=;
        b=INqq9H5dqsEk/jRcaasvw9uXTrxFMrp95lYHFDIsrVBHEjEJuHsOYKaR82pANM92VG
         Z+45dczdE1wCS/XnVEUaGFfPCBjuuHm/YgV2SSJxFrCaj7hWjUPQURcrXR1/SzE7SN3n
         tPYdXaMMyxTW9GaC+4QA3avTNZMpuM3uC+3xVcEv24qT1myYRwyyjGlOnxp01QV6B1GK
         aDsOo8FdNzsYL786rqHv1wk3eodv8mtJgTxR8lTgf2o4u9hmQl49CBAS4AmBfe3Ogkq0
         14B5PiQBSQT5YEkugBwb9jbAdUNzVCyqzQjUT7OdNsoP2yV9dOPuh6f2uqmNSovAxMMk
         QBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVF1j1riPLy6CiHf7Z/coZrdiXLUZDzW4iowCSsOhKI=;
        b=TeL2UgDIM/zL9KuNnwaTWr19wsb2jn+OXdr1h9FgbcOXBU7Fjq4+0Jcke5BJE2vVug
         htYdai6XYuiPKQ4YkHsx5xqlwBmvJe7yKA6gScPrJ1ha5sLot5QndXMVINpJK4czAmtv
         oniG8uXdeOTy/Bc3SA0yJqtWCo3p5GC1F4c/ColngYOc2jpkTeYiZSJy77uj+hZRKupz
         rx59bbJNoyjHiG2i/nvHdF8nmhMIj8rA7xmUpn/OtN7k6oWikO3VAnO37zqrzs5kDVlX
         AIDBUjU2ZbCgtSC5Kl7UTlM0gWoBq1QNgWRHOxM5VPYA6rZlwzKWzHzhGrzNce+fiH+C
         w9QA==
X-Gm-Message-State: AOAM532r98ae75Ae3U3fwZ19jS1HwxNVNPrHJM+i2y+HiC06DfRMvMrU
        di8UjH8eVy5v+O+wmAExU7s=
X-Google-Smtp-Source: ABdhPJyw/6bLsZPO3CF+fFTEQgnjDSlqJm3q2jM7lUlzLUTSQpV1Yur/WRXr9NdwNSGBAVmodr4mkg==
X-Received: by 2002:a17:90b:1650:: with SMTP id il16mr74109918pjb.83.1637050256911;
        Tue, 16 Nov 2021 00:10:56 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id t4sm18903667pfj.13.2021.11.16.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 00:10:56 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To:     tsbogend@alpha.franken.de
Cc:     ye.guojin@zte.com.cn, yangyingliang@huawei.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] MIPS: OCTEON: add put_device() after of_find_device_by_node()
Date:   Tue, 16 Nov 2021 08:10:51 +0000
Message-Id: <20211116081051.155750-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./arch/mips/cavium-octeon/octeon-platform.c, 332, 1-7, ERROR missing
put_device; call of_find_device_by_node on line 324, but without a
corresponding object release within this function.
./arch/mips/cavium-octeon/octeon-platform.c, 395, 1-7, ERROR missing
put_device; call of_find_device_by_node on line 387, but without a
corresponding object release within this function.
./arch/mips/cavium-octeon/octeon-usb.c, 512, 3-9, ERROR missing
put_device; call of_find_device_by_node on line 515, but without a
corresponding object release within this function.
./arch/mips/cavium-octeon/octeon-usb.c, 543, 1-7, ERROR missing
put_device; call of_find_device_by_node on line 515, but without a
corresponding object release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 arch/mips/cavium-octeon/octeon-platform.c | 2 ++
 arch/mips/cavium-octeon/octeon-usb.c      | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index d56e9b9d2e43..a994022e32c9 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -328,6 +328,7 @@ static int __init octeon_ehci_device_init(void)
 
 	pd->dev.platform_data = &octeon_ehci_pdata;
 	octeon_ehci_hw_start(&pd->dev);
+	put_device(&pd->dev);
 
 	return ret;
 }
@@ -391,6 +392,7 @@ static int __init octeon_ohci_device_init(void)
 
 	pd->dev.platform_data = &octeon_ohci_pdata;
 	octeon_ohci_hw_start(&pd->dev);
+	put_device(&pd->dev);
 
 	return ret;
 }
diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 6e4d3619137a..4df919d26b08 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -537,6 +537,7 @@ static int __init dwc3_octeon_device_init(void)
 			devm_iounmap(&pdev->dev, base);
 			devm_release_mem_region(&pdev->dev, res->start,
 						resource_size(res));
+			put_device(&pdev->dev);
 		}
 	} while (node != NULL);
 
-- 
2.25.1

