Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078AA242569
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgHLGb7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgHLGbs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:48 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F124EC06178B;
        Tue, 11 Aug 2020 23:31:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a15so910481wrh.10;
        Tue, 11 Aug 2020 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxUxT0dnx3HVpCzQf3wWbQyXRNb4CKXHAPGk5+OKM58=;
        b=AYxms+aHCUosJ3SHA2cHns3KhVnqeg6VXSY/vck5ur//Er8U0spDXqbHspOkSZMXsE
         mOww/zzkkSRDHf9hzJ4a421dnDPMVJ6sWzj4oAMyy9owGi/4raLrXoM8bVDDWLjIOB39
         vT92K1/Uw6/BgB6O3LFISVPLa6VR/YvWHr1syV0UF9BfsHsPyWcB0/H5F9tT3o4O5caS
         3QjH/N5G2CKLxSWdpS0wIgcD3aSrzt8mqShGX4QN+JXj1uQAQ7oDyDFgMVLYwa5Q+v/V
         fTZQkl6DCd0p0VLbzwmMVkttH1mZz+qyxvxy2xrs4CMQmzo45Vf6lb2WEHvau+ROrUO/
         ZzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxUxT0dnx3HVpCzQf3wWbQyXRNb4CKXHAPGk5+OKM58=;
        b=BeaF+gceOzO4PTUaqbPsGx8DDDZm73ybBrqPVUKImxnjfIXC0wK/m7EDE8Qjke9Ts5
         b0KPtsMKwAxaP997JG6ebaUkU6BMUylrre9J3KWPHoqZuzBlWoC2sVCVw3iyu2SskNTB
         h0noNow6lNGIKjbj9Nccef6wL5WXCNJ8ECcGyGDUFue2H/eKDqX2h2uwV6c3fvJqzLKn
         CqxQiWv3gZ5sGFdcLNFDIh03n2d7G+hXSItutp6Y5/euV1KTG7op7BwrolRuZbHGAADV
         sk0VfeL+9JEZDpAFW3LOI3oGeRBLL0BE92jY/O87+OBRonuRi72N8px45zRMWRZtLAmS
         LKvg==
X-Gm-Message-State: AOAM532fjVThBE5SVrUKIzSOdRyETdmCTDBcGJirPNg+J8E/595EgCUn
        hmB4yQ6cR1uw5whuWWkZ3fg=
X-Google-Smtp-Source: ABdhPJzWHV+/wfYN9iZPP0h+9Qc7PEzVok4j8yvFv/Pz0eYe6ojo9aLBIMfEqWsLebRnSI5FCgv4tA==
X-Received: by 2002:adf:e911:: with SMTP id f17mr31919274wrm.397.1597213906593;
        Tue, 11 Aug 2020 23:31:46 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:46 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 13/14] mips: bmips: bcm6368: include and use dt-bindings
Date:   Wed, 12 Aug 2020 08:31:28 +0200
Message-Id: <20200812063129.361862-14-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that there are proper device tree bindings we can start using them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6368.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index 449c167dd892..62599d4e6abe 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6368-clock.h"
+#include "dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -94,7 +98,7 @@ uart0: serial@10000100 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000100 0x18>;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <2>;
+			interrupts = <BCM6368_IRQ_UART0>;
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
 			status = "disabled";
@@ -104,7 +108,7 @@ uart1: serial@10000120 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000120 0x18>;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <3>;
+			interrupts = <BCM6368_IRQ_UART1>;
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
 			status = "disabled";
@@ -115,7 +119,7 @@ ehci: usb@10001500 {
 			reg = <0x10001500 0x100>;
 			big-endian;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <7>;
+			interrupts = <BCM6368_IRQ_EHCI>;
 			status = "disabled";
 		};
 
@@ -125,7 +129,7 @@ ohci: usb@10001600 {
 			big-endian;
 			no-big-frame-no;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <5>;
+			interrupts = <BCM6368_IRQ_OHCI>;
 			status = "disabled";
 		};
 	};
-- 
2.28.0

