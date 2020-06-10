Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2E21F5A52
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgFJR3I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgFJR3E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:04 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC730C03E96B;
        Wed, 10 Jun 2020 10:29:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so3234749wru.0;
        Wed, 10 Jun 2020 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nsh6zMLsIEmvfAIqh3PVAKemJFb9rNsz80hBW0AXeVU=;
        b=T5SLDpnhIeLUIAwIvWL/BVY1f2OvE+bcpq3YaMwayL30d1dIvxGcgi8elHm+5AELA5
         ffzRqRaqqFUAQsf65wcke/18nnFkPeDvRCcMf18azDAtjYU8PMlIcPDxfFJfWB54ujKL
         NL78XWGLNChbaVfHwaBD3x6HgBx0OUnvtDJzb3WxGnh/Qyoh/SD/YlYjZ2L0yCtsah4q
         d45A1g0vBcTVAZ+cK85pNNg+dQk2qagB2AdK8VAP6cHjIaV2rxB02KnhcQ6SkauxQfSU
         ANDx4ndZo48XLbnyvgGXHcBpSwYha/Tu+DzLRSB9dLkzbThVo7ak5BxV1QKETkZ2Dpcw
         ZOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nsh6zMLsIEmvfAIqh3PVAKemJFb9rNsz80hBW0AXeVU=;
        b=T5OV2OhyZYHbuGhXp0/sL/nCBUVXB3sH2p8Pfs7o8CahMoZwCSAzYSSgS9Glqe2ftu
         +wkcZ9FrZpROGBRTwSBYgnXg6dzNtPiFjYDlBUU1TxLlsj7KQKEYy2AACtxWpgQiGscu
         71KAF1iLVxhUD1kDAxH7ZUP3p53jg32zUvDQg1azKoP1RX0CfgYW/qJ214VcAsB9rIxD
         cHS7eWLPu8lobSxYZkx2PX4h6MLLVh5xpZfNflhBVmwzENJZZMxiz5EgfTgUqH7mJPde
         4+KMFFYjY/PCXOpmIhE5Hdw6TSllfO96vYv99v00enCHwUjUsiajXfQSIDeXaIDJbjGL
         GLvQ==
X-Gm-Message-State: AOAM532yk+Ywft9wQuA7/Mjq5cgYdYiNFBPr7Vpg6et1+hk9XGzYQwYb
        yg0eVjjB4x4QmRLBXUbZckA=
X-Google-Smtp-Source: ABdhPJxkugAoRrexUVpSzrduHVqAnx0k4DFpKPIJ1EC4rH8/K/m//p1l02o19D3Vlt5Vc1dFKvfvSw==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr5254531wrx.55.1591810142297;
        Wed, 10 Jun 2020 10:29:02 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:01 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 1/9] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
Date:   Wed, 10 Jun 2020 19:28:51 +0200
Message-Id: <20200610172859.466334-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610172859.466334-1-noltari@gmail.com>
References: <20200609160244.4139366-1-noltari@gmail.com>
 <20200610172859.466334-1-noltari@gmail.com>
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
 v3: no changes
 v2: no changes

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9dc08ee3d6b9..e82586e7719c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -229,6 +229,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select BOOT_RAW
-- 
2.26.2

