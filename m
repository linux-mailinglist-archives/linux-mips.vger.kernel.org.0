Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F002A1F3CEE
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgFINnM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729041AbgFINmn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:43 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E571C08C5C3;
        Tue,  9 Jun 2020 06:42:42 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r7so21402122wro.1;
        Tue, 09 Jun 2020 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Px6UzAZwbVw3Z5FRDEdcwvRYqXqCCIR0IEJ6CFWAt+U=;
        b=SSG8hNeYNoc0oUDYRSPlk7M2DtGt6O648NiDkmgG8SECJHePjn+QKSoArzKGTshG60
         wjHHhkLNLQyfHaqiX/JMbNKhtSGx+Tx7e9ePRFh8Aj75AcKZi93ejZWd+idyaMMEMXcq
         TUvKKFsAf/6KJVHUOaQ553ts5AGWM55bgVSReUhdCGCBuHcQKqNcUTDd8hyDhzBQFVe2
         0xiyII4vwrcSgSAqC1nnJgqt2GC8cyfQx4R/oVs7ou+I9auGxXlUG3pbeB28KaxgXenF
         ji3OdjXSYEL7a/YUTaN47kI+KtPjbib57lWgGas3GictdjXZkDGS4L1ZN/SojdG66Z14
         6Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Px6UzAZwbVw3Z5FRDEdcwvRYqXqCCIR0IEJ6CFWAt+U=;
        b=iZmugZdiuDalTQ+6f/RJ7Mtnq3VFd9h7GyxVat6JKoB7SCX5yjJn0d+hf6c1i3ae0e
         YLaEC5pvf9OVwEnTel3GnjD/Y0Li9YyY4Yjc2m1V+m270za/XsuuKRS54nQI/UZ8nUpd
         ucDTLvhJ7HqAtlOSE0L/t6DWVvHZiM2VOU4eXqM5QnUXZyhFitaSd1q3irDccnUnmDE/
         QY1B4njqoFyh2M7fqRvVBuOeEHX+a9D7sH0IisP+hHMWIZy8obXyUFs3rdnWaUTkaI3F
         klHStRi/x2EwAVOzQydO+cEF15JujXiCj29JJuNZcnvaPtajxsk6ugIhz8kMxIXIWYZ+
         7Z4Q==
X-Gm-Message-State: AOAM532sZSoQANagS/OC5jcSx4O477Ew5negt0Vf0oWDwo3mh/e6vneg
        k1hGT6vtUozD35I1cHu6wx4=
X-Google-Smtp-Source: ABdhPJw00Or7ugggrWF/69aXspjvgjFPIwjSkAltH5WjOSQEBFLjFof094rW6V6y0wKiE4ywhpgJSw==
X-Received: by 2002:adf:f8cc:: with SMTP id f12mr4452866wrq.418.1591710160795;
        Tue, 09 Jun 2020 06:42:40 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:40 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 6/7] mips: bmips: dts: add BCM6362 reset controller support
Date:   Tue,  9 Jun 2020 15:42:31 +0200
Message-Id: <20200609134232.4084718-7-noltari@gmail.com>
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

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..443af6b4c838 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -70,6 +70,12 @@ reboot: syscon-reboot@10000008 {
 			mask = <0x1>;
 		};
 
+		periph_rst: reset-controller@10000010 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0x10000010 0x4>;
+			#reset-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
-- 
2.26.2

