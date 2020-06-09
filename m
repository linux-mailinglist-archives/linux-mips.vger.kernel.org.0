Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61A41F3CDD
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgFINmu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729000AbgFINmm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B05C05BD1E;
        Tue,  9 Jun 2020 06:42:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j10so21370717wrw.8;
        Tue, 09 Jun 2020 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aeMQ/9K++8bABwRMfUzQMzHyI/wF+s2+iLytwEdjF7g=;
        b=VgU9rYtPf+ULDOOG/RlAzlaAW+2VKcOp7DScStRHPXXaSsfnMtatkYCNavDvbSs1oK
         DmKDzPT+sDkQwjYsKL6CSy2xFesNm8RblolUoiE4qwT4Zgn1zUraSAeOHcV0Vb7HWkEg
         PvYg7ko8+1vZj5xnn8CQR2pFh47DFa1SAu09+V5MCzPpRaX6ZKI9om+65cg7y2Y5VdcR
         aZL1LanPaY+i8jTPAsvnk1drSj793KZW3Sa4XIcfSaywWo1gzv6JGL+xeNVGVXosHUgc
         QxJ06429JXw0sKX6simKCeibZ4ritgXP2e2klpJvXka2haIlr9/lKCMcPSzfusjsxLrV
         6+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aeMQ/9K++8bABwRMfUzQMzHyI/wF+s2+iLytwEdjF7g=;
        b=BgdO3DYgySXNTY25Nvna3AY7nMU2BywbKu4wMU56x68ppXZ0LgpSLhV9sIEdFOsxza
         F5FzZThc1i6rdzSK6HxqNjpxyobcG1P4kYGKfJnqgqqjvx8wxkHMFpKKXHEPOIQViwuu
         CwZRZPkgBYX5cjOPFuvRA73PP07bKsACVqffAnTn8Q3n2SB5JOcstoUsPTX2lTMxMD5O
         oLoN+kHGXTfXGFgvGishJog9AVQJnRFgRjFQm1AawnCNauIC6sVditR9xhtmwq0/5iYR
         dlDujoEEQtF0YH7YSGfzY323jLNFywOZpvhOWUiEBtFsDEPlCbY4vQmucnBm/2r7JTa/
         uGeA==
X-Gm-Message-State: AOAM531nhNdn6lTb65cbswpDtm/snhztT+Z0RMi3qEUCUNCFm39wZ3Rm
        Vix5tbO40h6IhwPMyxy7nAg=
X-Google-Smtp-Source: ABdhPJwHKoygNlapjeXATNpuuOaVewZiX8fyUk9EGbfzmWr3qZQY1e//QrPErOPn2kzRL1JNQN7VAQ==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr4455170wrx.411.1591710159808;
        Tue, 09 Jun 2020 06:42:39 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:39 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 5/7] mips: bmips: dts: add BCM6358 reset controller support
Date:   Tue,  9 Jun 2020 15:42:30 +0200
Message-Id: <20200609134232.4084718-6-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609134232.4084718-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6358 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6358.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f21176cac038..9d93e7f5e6fc 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -82,6 +82,12 @@ periph_intc: interrupt-controller@fffe000c {
 			interrupts = <2>, <3>;
 		};
 
+		periph_rst: reset-controller@fffe0034 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0xfffe0034 0x4>;
+			#reset-cells = <1>;
+		};
+
 		leds0: led-controller@fffe00d0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.2

