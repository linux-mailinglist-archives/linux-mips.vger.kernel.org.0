Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C481FCB4F
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgFQKuu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgFQKur (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:47 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8FCC06174E;
        Wed, 17 Jun 2020 03:50:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x13so1823965wrv.4;
        Wed, 17 Jun 2020 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C4Sw+ku1MqKilMAFTEguDMUmQ05C8NzwMHl0BLvSaNE=;
        b=YmmcEJ3hQtla6uNTskErX2TD7VcfgHy+wQZ0JCD7KqUNavM44SudtRUKHZI1/NKWOt
         lKA3P9ZmqdvVIjVka/mRNP8eLvEsJuARZoG+gqoI/0CzRUd7iVQpucinbJ+tbbqtIV31
         zj8KwsKYSpwrDMjP8Eez0Emn6qwIf4xmbD31dPXkkAoUza/vn+W34GsOugW6w+sycqvd
         kbTsnWBcg8Uek8SLl9oTQPthkCBXznR3Z7Qy0pDqdqn6DhRGehvr+SY2Wgs5/BkjTV+2
         jsCUGAk5t9Gjn093+bKEyM8aJD3ZEGVYTZBPvIyjFFIvR6lzZlSa++uaCQKhKsNivXre
         AXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4Sw+ku1MqKilMAFTEguDMUmQ05C8NzwMHl0BLvSaNE=;
        b=Yco87Tslxkbl6xAT/n7GfndOVxCkwPjAXC865oZQ4MSd+S3vWKOyXU4Ln51GM0xJhH
         NQ3t/mBEWPo50AMZT5vKDH3YX2kCmPONipddULgmz3L4Cbz7ihFiKQEz+8kCUGHctIqU
         ukzdba+gKhZ/l2T6yJcvldXim6fo4J9QiX0graAR1iKlulTn0ZEOLSO3MQbvuk3nB3AK
         +vnmAaKjsx71Tun1HQtFPrftGaU5Y3vpuKFjENwYT6eeGDOXGCD4SZHVEgNBh12luCSt
         crZP1/LzXDQOb6gzcdZhe1UlNgLClHRstIw2SPh/uy8HLZrbYC+trQsvWNmZ3Wp9GOzu
         XmGg==
X-Gm-Message-State: AOAM531h+J0pnDd7CyD1Y+K+7dapCBhrJQvWqha2hK4iGE2mySJ6GbNQ
        l8g8Eqj9EnlwsfIoZfvTVfU=
X-Google-Smtp-Source: ABdhPJwld4HcBvXosm3C0F0QdYdKEMx3pgK9e7R3B5obH3S3RCvOsc8k0CrUBVGRF3j/yvuThTH2uQ==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr7902838wrs.356.1592391045161;
        Wed, 17 Jun 2020 03:50:45 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:44 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 1/9] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
Date:   Wed, 17 Jun 2020 12:50:33 +0200
Message-Id: <20200617105042.3824116-2-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617105042.3824116-1-noltari@gmail.com>
References: <20200617105042.3824116-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This allows to add reset controllers support.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes
 v6: no changes
 v5: no changes
 v4: no changes
 v3: no changes
 v2: no changes

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..b1840119cb64 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -227,6 +227,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select BOOT_RAW
-- 
2.27.0

