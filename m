Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92880160638
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 21:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgBPUVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 15:21:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:8509 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgBPUVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 15:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581884466;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0lwRY9T/vQcOBJYlZ2p0ZLpMFPC/FqS0O8Fyu7RLxI4=;
        b=eS2G6TKU296YQNZhwodX8gnsgXk5a0GH76x1PXHcptDc94cTINB8fw6mSru6FXYWYL
        hIuZFAv3Qw6vc4KArCj2ATSTmZPVlpd/dWXMWsvmi9Dzrs2LfPuGl4X/NvSazUf9vIsG
        JRg65PoM6rhYxkm1XJhrhwK7my0cwSL4YtBTMb/6tD/OeDGLcYQYXcMQIifizZTbBy+6
        QCDUuWABxMLGmDW9dvfhxfeU+ufeiQ40EJ9NMEx2lFFz5pugokv+tv5vA9k8nJfege1Q
        8Y88GLgUoUQx1ZEjlGbaRQ2GbSgzP2imVyYgGxlyPnO+aGEfVR3Wgf5jFbwhzAdhIw/2
        qyfQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GKL2Jr2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 21:21:02 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH v3 2/6] MIPS: DTS: CI20: add DT node for IR sensor
Date:   Sun, 16 Feb 2020 21:20:56 +0100
Message-Id: <c18873d6502f2d69f4d02e7d615bd8012c0b0f3d.1581884459.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581884459.git.hns@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

The infrared sensor on the CI20 board is connected to a GPIO and can
be operated by using the gpio-ir-recv driver. Add a DT node for the
sensor to allow that driver to be used.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 37b93166bf22..59c104289ece 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -60,6 +60,11 @@
 		enable-active-high;
 	};
 
+	ir: ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpe 3 GPIO_ACTIVE_LOW>;
+	};
+
 	wlan0_power: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan0_power";
-- 
2.23.0

