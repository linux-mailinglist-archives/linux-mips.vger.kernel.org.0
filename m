Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3DA242563
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgHLGb7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgHLGbo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:44 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9839C061787;
        Tue, 11 Aug 2020 23:31:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 184so859594wmb.0;
        Tue, 11 Aug 2020 23:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9mnSITD9ecklqjtdSzPSamGdK4H0VdJ5bXIPT92SSM=;
        b=QCv1Z1vJiiTtP3cea9yrFYsOHuJnTKhL2X4N7EmzAms302++YuLsD4VHZZvnM5LSNX
         3FeoVWJiW4LCTCM1hK0/w8Y2DRSSO6td8nMnZE4hVPseoLeQ5+RM2/qE0B2NocHCuXk5
         4kdL3I10Gvz+h9A/XAen4kqbWMpXYFihva5QG7/8k11OAgIjiGEfDSg0eIdp4tXmGhYM
         66OBl72RXOtxeZwolwhXod5n7ClHvOmsZVPgyZNLj9fqk9ok4LikKQQ84NonB+njDHzy
         xYuCEAoK2SDtcN1XtYG44qr2SDfETn1rxqYUhNejpxgZnqUnopqcsHRYV4UJBDlg1Bir
         kAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9mnSITD9ecklqjtdSzPSamGdK4H0VdJ5bXIPT92SSM=;
        b=q5tbc8a8yslshKuWKMb3dMRXi0OBTq/IaQGCCipPNLiwqRkeRlB9XUIiKYl02vB1QQ
         ajHbx4QWbCsqfIIsQUlM8DEQM2t+l1liLn3krDlpZsXwFqFOEwUzUCbkKSEeDZ6gmvvS
         lTHsrQ5w6nLJXvPhYGyo8i+NwGrbnVZk1zUpiSyAgNnqJHYeMJTIblLggRCfkrFMsWvK
         6Wp0m09gPbAI+vkI0USOLb/WIuC/qlq8u9sfhqQzmAgQHifXf19aP4xLk72TGRanBpwo
         7s+qX2byeRaOkZICxQjwPj2y52LeOqA0hcgytbR2UjSQOUpxOcPYEKCdUIa6mPBVHwJL
         W7eA==
X-Gm-Message-State: AOAM533stUhh4mZUJqNKJtXe3aAsIR95nxSr3wp1l/bd1c0EXNZ5j/7M
        fvA8LH5uPUbjkF+Z4Q/y3/s=
X-Google-Smtp-Source: ABdhPJzH0YTXzkJRsY5VSGxp6y7aZFcAdBjEKfIDwvlbbPDWEmUlKgU9hbqJzfN9gnYa+w4kceHqqQ==
X-Received: by 2002:a1c:c28b:: with SMTP id s133mr6834776wmf.43.1597213902503;
        Tue, 11 Aug 2020 23:31:42 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 09/14] mips: bmips: bcm3368: include and use dt-bindings
Date:   Wed, 12 Aug 2020 08:31:24 +0200
Message-Id: <20200812063129.361862-10-noltari@gmail.com>
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
 arch/mips/boot/dts/brcm/bcm3368.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index 69cbef472377..63d844601718 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm3368-clock.h"
+#include "dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -86,7 +90,7 @@ uart0: serial@fff8c100 {
 			reg = <0xfff8c100 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <2>;
+			interrupts = <BCM3368_IRQ_UART0>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -99,7 +103,7 @@ uart1: serial@fff8c120 {
 			reg = <0xfff8c120 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <3>;
+			interrupts = <BCM3368_IRQ_UART1>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
-- 
2.28.0

