Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28921F4026
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731172AbgFIQDa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731094AbgFIQCy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5F0C08C5C3;
        Tue,  9 Jun 2020 09:02:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so3345150wmh.4;
        Tue, 09 Jun 2020 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkXTQywx9PF3vwK0jv7kN3fBsLLWJidJCwDrRHudUCg=;
        b=S8CS4VBhTiUHqonX1gjiw6YiumCrsRmI0WbrMARUooGJzfdiom6r2UOIB2Q1TLEQQ3
         UYgt9oeBIEoNlsdoxGYLc2PI5o06RVwx7z9rqpzYFmND4ss1UhUNSM/VsfRE3esUNbT/
         MBTgLgj7v9KKehrtVhjvx7tWuVjjTA3jtuDGAVta6PbaVNWVp5PqiFZQu7B+nQmxgBg3
         DcLsX6vnJRDyRPBR//Y6jtsCeNwBgdhgoPMA2SpoaORnq9DSGMeMbl4pcV8WjtNGNa/f
         ub6y+fqYM70CzxtyDkz/OJZU1UkEs/oAb8FWOQA29W3y1ymAPfla6e1momhGIhFfVWwy
         PkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkXTQywx9PF3vwK0jv7kN3fBsLLWJidJCwDrRHudUCg=;
        b=diqAFTR2fTKwPqJ2MUEX9NNFLBsf+wgWZ1N8WcvzOdhd7ds+RhponpT+gWSvKgTSry
         774Og5+A7Sj6TizxTFZOkuv8FLUWE6t9Py8iFZUSWSZll9LPASu8wJ5nqn8gZQH2ih5J
         j9mHVMWKASXPwJhO5KCYUpl0zZsNPVM3QPUfjwnCKLGjXVO/NVTJ+x05c3qIIXFrjIgr
         Jf1xalB1BEpu3qdiN1SCRSRCidXMimd4kMUP1aTBtrMyGjg7bW8gSyjrRBFZA1A7goMJ
         uykWJ57KViktA1bWnH4U6kJbLHXNoVdpEBr2ClGCyThhTI7gAL93TVDghKoFxcpDZy+Y
         nNLg==
X-Gm-Message-State: AOAM530H3PA97qxeRSzjz45HKvHew2VlZeN+99yJ/HX1bG5L3oittpsa
        cMnakXg3iM2oB0PyXQ1rgTU=
X-Google-Smtp-Source: ABdhPJwE3Oy4prLqrl5TWgRHuXZgjWSGPjSMlXUlPoBmr50ZmfYNyk7LX5fYe7wxFi3M+3CH86Lwaw==
X-Received: by 2002:a1c:254:: with SMTP id 81mr4702080wmc.93.1591718572607;
        Tue, 09 Jun 2020 09:02:52 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:52 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 5/7] mips: bmips: dts: add BCM6358 reset controller support
Date:   Tue,  9 Jun 2020 18:02:42 +0200
Message-Id: <20200609160244.4139366-6-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
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
 v2: no changes.

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

