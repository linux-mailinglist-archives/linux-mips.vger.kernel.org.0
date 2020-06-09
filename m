Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0889C1F38C6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 12:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgFIKyB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 06:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbgFIKww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 06:52:52 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B11C05BD1E;
        Tue,  9 Jun 2020 03:52:51 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r9so2368392wmh.2;
        Tue, 09 Jun 2020 03:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8RVdDdZ6lI+tdJvWKmgskLx2Vkoy4BLid+J0jKoeDE=;
        b=Ivsw5bR/lq453+cAFa6bKx1kq5+Z+qK/z1X5OZ2ih4IRajv87GqW21W7G+goj2OkgJ
         VaMJE1mKMP+O2w362Bs3VBEohlZ/ClyhjyWoYL86mr2F2SHqcFDBk3zLFj3SFxy+6R/o
         FUgwy0dPN9ktTLtU/4HmALB/pXWLq3L2mEBYC8wq7YmP1LG/zrgX5SveKeDbqZdwX1h2
         4e9lqhZzMwZLuFPQXWn6vJ5w5FgD/BxTbMS6x3aZm7lu3mtNxBqh859GNTIkACGm28sP
         X81q/4ucYAf4/WhVLWnDhFny8jvIAIsub/6v9D4taan64qXX/aFOhd3QW3dUJqfxj5z+
         EObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8RVdDdZ6lI+tdJvWKmgskLx2Vkoy4BLid+J0jKoeDE=;
        b=m2WqUuDsadd3rW6du3qqzNFxn55A42IIGo7pvy/25ONyr845D00BBFssUZymwKtiAH
         Jhpl8IOJzvu1KmaadaIXdipCYKzn9T8vxLTWXKCxvH8MMerTVNnqiKXCItBNiJeLBEFO
         FmQoABuR2rCJUOvdilDai6SRPk/Y813HMkhhVYseXGivzwkRaVDkwCd7fNdybq+FLaKL
         No2g3Urhb/mqr1Aq5WHm9eZwJUL5Si3Lp9h0qdDFQ5Zq5ieTEJA59HrqYxq7w59RlPTr
         PVHwua79Fz28HhZRW8GaEuzmdIqOS7PsNyC9HV9QbO/SOVHzC6SZogNPp98h0k6vMwX+
         ir2Q==
X-Gm-Message-State: AOAM533iyhhF4611tuX8JdbwY/h1Gn8BkezipXvK2KiC9H/gEIPRQ4qV
        g6By/hOX/bitFXorSNlnHKw=
X-Google-Smtp-Source: ABdhPJwA9LIELheHMB5oq2Vt2zKR+24hqfQscgD01puif3yRbJGjUCabEjWqJ+UUCSzlNv85Ghs4ug==
X-Received: by 2002:a1c:e40a:: with SMTP id b10mr3283247wmh.41.1591699969715;
        Tue, 09 Jun 2020 03:52:49 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h5sm2949931wrw.85.2020.06.09.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:52:49 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 3/4] mips: bmips: dts: add BCM6328 power domain support
Date:   Tue,  9 Jun 2020 12:52:43 +0200
Message-Id: <20200609105244.4014823-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609105244.4014823-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
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
---
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
2.26.2

