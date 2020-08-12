Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B42C24255E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHLGbu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgHLGbq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:46 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEB6C06178A;
        Tue, 11 Aug 2020 23:31:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id p14so795473wmg.1;
        Tue, 11 Aug 2020 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEe3JEgfnz2A3kmUc0tM9su+oVl6GCkvwLvkbVj9ZQM=;
        b=Ix49EQpebB3I1Hc1k2ts6iAHUWHAYGwr/TfG28gZJnkN5IgszojXFmOGjuE5EGv2Xn
         7IMKsNaGLJtiNsubcXb7gNj0S07h56gM04iOgqMemeF82SJxC+REsUCrOeaIh7WhAcPI
         /CA4UFWgk9jOWcE36Q+yriBJYDzEUI/CCLcLuTuABXd95BpTq4fqYG8DOsW7oy++C6aS
         1/z+pw9Oatcj3PDK6A2jUWnTM/nnEdVOCbjtEcjY4rfT5J9zUxtGM333i7fNLh2AtAWI
         xeocleiu8HyT3maLyS0/ey6qGJC6GbTrzeE7Gms6WhKVWv8Qpt+HM4B0zYTNYjH0I++a
         7rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEe3JEgfnz2A3kmUc0tM9su+oVl6GCkvwLvkbVj9ZQM=;
        b=oyoX/saFyjM5nEMEdpXnrcLLmPOfbYY81VLh+sO24PJ+AtncAoT0TO1Q2XX460bBx1
         6Nuqziw1VK/UOJf7fJZ0A3hPZ2GzXXpE0o2UyLVU7Qezb6gLRpiwXzWwF9PLo1/qmvKL
         kARmsObpQOQtRieNv8uh/CWC9hx4llu/WDJf+2bsVwsRQcMsQMe6Et/lB1XsoblyGBwf
         oxXfPPP6kv4QqlcmAsFDAcW1kH5MEt9mCgALuP2Rv6vd2/liYT+/VDblyeiIEqn9CDAM
         xnf/7bcZlzj07S2PT5bfoPKD7ekQdXUf3D+IczR0X1o1Yqp3A+TydBj0ceQ4glVwsW9a
         UyvA==
X-Gm-Message-State: AOAM53146JWOrTJLQUcZiKCNbFAaqSit2Il1GKrtsbwSfkhBDr5ylALZ
        IFJlAkzhz/y6IvKZEZvADZo=
X-Google-Smtp-Source: ABdhPJyJnpF3wsEHm9PE9MkvpC1XShd5/s2KHvOKdG/H/fbMyiujb5ZGw3W7la1ZlIqoPlcmCWspzA==
X-Received: by 2002:a1c:b487:: with SMTP id d129mr7468739wmf.185.1597213904542;
        Tue, 11 Aug 2020 23:31:44 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:44 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 11/14] mips: bmips: bcm6358: include and use dt-bindings
Date:   Wed, 12 Aug 2020 08:31:26 +0200
Message-Id: <20200812063129.361862-12-noltari@gmail.com>
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
 arch/mips/boot/dts/brcm/bcm6358.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f21176cac038..d149d062be80 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6358-clock.h"
+#include "dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -96,7 +100,7 @@ uart0: serial@fffe0100 {
 			reg = <0xfffe0100 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <2>;
+			interrupts = <BCM6358_IRQ_UART0>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -109,7 +113,7 @@ uart1: serial@fffe0120 {
 			reg = <0xfffe0120 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <3>;
+			interrupts = <BCM6358_IRQ_UART1>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -122,7 +126,7 @@ ehci: usb@fffe1300 {
 			reg = <0xfffe1300 0x100>;
 			big-endian;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <10>;
+			interrupts = <BCM6358_IRQ_EHCI>;
 			status = "disabled";
 		};
 
@@ -132,7 +136,7 @@ ohci: usb@fffe1400 {
 			big-endian;
 			no-big-frame-no;
 			interrupt-parent = <&periph_intc>;
-			interrupts = <5>;
+			interrupts = <BCM6358_IRQ_OHCI>;
 			status = "disabled";
 		};
 	};
-- 
2.28.0

