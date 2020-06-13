Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166991F81CE
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFMIWA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgFMIVw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:52 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FADC08C5C3;
        Sat, 13 Jun 2020 01:21:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c71so9892451wmd.5;
        Sat, 13 Jun 2020 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3R3IcX5VRxh6jZ4lyLZsasKIXBEDH8AgtJHvT67+p7Y=;
        b=u8Qbtpx7nKpCKSFfL0DenqTmg2sXyyXo7pD8VRz1Qswm06HAp6kA2YB8qMZH2SSZSx
         LiaG3eZzsSPSYkpvBFvlEr5Xk55ejPV2OBP3sfFJ7rbgwVVdPupfeygveY9pBC6v0yuR
         T2HsQD1jBDF6mlpF9WTbDsr8q1+lia7WYKmEt9r1URFynKd72UPvlzRvhRmwml/yLehJ
         OFdj+Zv+btWJDl/Xp2gOdNA3ec/JP+2htmz16KXMUhcej4IvXxHLhvCL6SFHtpMPuLJN
         vvCR5dil1zq43OtbqtbjyUbDukRXgQfRtIEELRJbrw2U+z3+ixSAMNGzBjZZSqa+6GI1
         gYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3R3IcX5VRxh6jZ4lyLZsasKIXBEDH8AgtJHvT67+p7Y=;
        b=mz4+02cTaH19kU2h6CgmnhD5MX9iwmeMqr6U+DCOv2X6X6qG2LOtYkRyZz3De3wO0J
         m5+HbtnFoZJEwQLR9hVTqgZ63A5Uu44Y2LXY6CKTWR8iE4P0sQl9wawoy7nADV8X+RyD
         7LRfOU7MnLtDI+WHdowUlWsQL5IdZ2Fe54S/fp+m5DoFKMenYZa4v1QOncIOSz+5DpL0
         lc0PY3c39ePiV483NsL/gBU4U+LBt+7y2E4UPVCqdBQApsNQWDyYUBueKKv3I9AZHuyx
         3pf1bwmGxpBNV3bPSABnnHDE/aCivezpWkuRb91Y01FPMJh3T6mzLwVRxQflRIoCy7oV
         OD1w==
X-Gm-Message-State: AOAM531Oph5NkGjY1PQbWaPVGiEchfuTvfL+qPY7Sn2A3PKqXMaTVKmG
        u4Re0iblaRUj475SU8a+05Y=
X-Google-Smtp-Source: ABdhPJwfZEl2kJ8mxVWxwjqag+ttdrRGfjRXx/LSWOtwclninU40g8Lk1Qp1z66b78fpbFQElCMDDg==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr3111530wmt.154.1592036511036;
        Sat, 13 Jun 2020 01:21:51 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:50 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 7/9] mips: bmips: dts: add BCM6328 power domain support
Date:   Sat, 13 Jun 2020 10:21:38 +0200
Message-Id: <20200613082140.2009461-8-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6328 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: no changes.
 v3: Separate dt-bindings definitions from power domain .dtsi support.
 v2: Add dt-bindings header files.

 arch/mips/boot/dts/brcm/bcm6328.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index af860d06def6..1f9edd710392 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -110,6 +110,12 @@ leds0: led-controller@10000800 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@10001848 {
+			compatible = "brcm,bcm6328-power-controller";
+			reg = <0x10001848 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		ehci: usb@10002500 {
 			compatible = "brcm,bcm6328-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
-- 
2.27.0

