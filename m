Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C9424255A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgHLGbu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgHLGbr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:47 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80C9C06174A;
        Tue, 11 Aug 2020 23:31:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r2so919652wrs.8;
        Tue, 11 Aug 2020 23:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TX8IXzrcv/xGU3VpzsK8e7YzUUV+UsBwTqcWB7csBrk=;
        b=iDM5x2tWqi6Hif32PHOIsgRlDPVRzwujecnmaqkvZYDlH3z3gP89Uw/QxDtPXbZS03
         xf8bAs1M0neBswUB8kHHPgfKs46iEYpfOwHKFYNhn4w23LbLy1d9sN7qFTSPuQ063+pa
         m26xGJyoW1GWjsfLNlJdS8KyuWmICpw4IZugzrF2DfH5q6zRFSl2og0HulkFe+2AJcmU
         C+FuEmz4eHkjcam8MHV6QCyXzhRvEWww3vbK4Y9OVyUS1MUMIk3DCJPiwAFXsfvkkmcv
         dHMKSfYIcxd/Iszmv5/xbpTMYFJSkF811gUcsAJ8IdGh4VywPv62ej+X9up7ZbQYfVCZ
         BzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TX8IXzrcv/xGU3VpzsK8e7YzUUV+UsBwTqcWB7csBrk=;
        b=BudXXTADQv/4hIaKYl/C0BKBEL9s3gXJw2wH3v8uxzxc0h2V1Jnr3vxN/bGz9EqxlC
         WfWaF9r1kwtxsIjtSfflwi8tdoZJlj08aA8A99+dQUp99j0pJ6NkQ2FFXxMt+8vwdZD2
         AhJUsxhzXrpNqAg6GzrjBLwGx78I3wEbVKanxB8rhtbHqTvcpTEUj7VJs5NtJX+jMTBb
         jKR+kcXKByOikCdKzl1D95clmXqQcfRsP1t1N5BrYr3DcFNw+wITQRQVa7atqCKgP/JV
         4z/6QKrcKiqTF2P+phaEuYmP5GRytqBsxDj8VZkIF/ytL80VZePJgBYuEFinM0IMqGNu
         o8GA==
X-Gm-Message-State: AOAM531YZHiJOOgnkNs+7Eyn4lOzLrLDStt3XG9QtggjFq7iIxHAW11c
        UouQhfLo0GrDBZWS/4r+j5w=
X-Google-Smtp-Source: ABdhPJzDI0AqA5Lf3vbNVjOsSn/JnA0ScfCkMKiDyQm/jIQU496gdbS+Ne+wANL6Ss6PoDHTLQ+5qw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr31452998wrg.406.1597213905567;
        Tue, 11 Aug 2020 23:31:45 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:45 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 12/14] mips: bmips: bcm6362: include and use dt-bindings
Date:   Wed, 12 Aug 2020 08:31:27 +0200
Message-Id: <20200812063129.361862-13-noltari@gmail.com>
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
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..e6ec366818a9 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6362-clock.h"
+#include "dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -87,7 +91,7 @@ uart0: serial@10000100 {
 			reg = <0x10000100 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <3>;
+			interrupts = <BCM6362_IRQ_UART0>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -100,7 +104,7 @@ uart1: serial@10000120 {
 			reg = <0x10000120 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <4>;
+			interrupts = <BCM6362_IRQ_UART1>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -123,7 +127,7 @@ ehci: usb@10002500 {
 			big-endian;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <10>;
+			interrupts = <BCM6362_IRQ_EHCI>;
 
 			status = "disabled";
 		};
@@ -135,7 +139,7 @@ ohci: usb@10002600 {
 			no-big-frame-no;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <9>;
+			interrupts = <BCM6362_IRQ_OHCI>;
 
 			status = "disabled";
 		};
-- 
2.28.0

