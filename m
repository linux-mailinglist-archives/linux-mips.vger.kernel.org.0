Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E158C15DFD8
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 17:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391622AbgBNQKq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 11:10:46 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:11483 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391579AbgBNQKp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 11:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696640;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ZBAC50dU0uhRQKdMbm4Q/e7P7wLPrnPuOlslKb4Wgqo=;
        b=X8zoS4OtkByR+9JNCBLPrlB7le9++A+8+OoB3dfwikrywj7q92SuxmXwbRsEq7XCta
        ERMFJVFKt9U/ZrmXZVdQTilrwg1T/4kjaUiliTfygfcDtxfXCsaJ93EQ9p8Q80uJ3M5p
        /ibXs+3xysg//X6GBI29RDwffsNOjRhXiQ+t1ks8+uv404C6n1S9GgLItsZ4aqyy8HIx
        t2+boZwYz/QS3hJ66Qlbcrt/D0Iz6tS3qGLiV/ARVJQf4E8GZ1/p55V2ZVNXcAMGPjzR
        xistHAe8lNhqPPwRIp2GxvIx6GWlL/CS6uA5BrE/hWJaBaOM5lpuxHi7LOIZxef+1LBH
        kN6w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EGAUFl2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 17:10:30 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: [PATCH v2 07/12] MIPS: DTS: CI20: give eth0_power a defined voltage.
Date:   Fri, 14 Feb 2020 17:10:19 +0100
Message-Id: <b72b4c86d2b390844a1ea97885c4b65204bc8872.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a 3.3V power switch (DVNET3.3V ).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index e02a19db7ef1..e1364f941c7d 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -56,6 +56,8 @@
 	eth0_power: fixedregulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "eth0_power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		gpio = <&gpb 25 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
-- 
2.23.0

