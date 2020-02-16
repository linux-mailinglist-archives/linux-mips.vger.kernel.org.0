Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65FF16064C
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 21:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgBPUVN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 15:21:13 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:20114 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgBPUVM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 15:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581884470;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VEEfWHHyq9WgZwXb3jwjztdop9r9n8E/QSOLXxJz8lU=;
        b=aEiL40/fzwRl69BnESLZPm75U8rZcokjTH9o/18USk6QsqiwrdwoinCEFjwZMAw3ED
        BKoEwIOfiuo4m/TrxLZdWqTP3YVOqNkwpsn7UYlVhDhNtAF6th1+So2bqtRKuv+DAYJi
        6b2QXuqd6mCo9my6McKWYV+5Ybrb7UXQVsNSJfWpgaL9Z8aqNEmmyqxQg8KKFzoHYKfD
        r1BaXYf0X9VbPhatIYdT1FGM/yJyEaSc5ZsUVrzDCtZ2SlV+jFk77g/yvPyva6gOjxlj
        nsoStChVGtfgUURhBIIxIrx/XlwKdKgh21Wol89+B3eSdiDAf+I1FTG8DnJyrfQYWFqM
        4z4w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GKL1Jr1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 21:21:01 +0100 (CET)
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
        kernel@pyra-handheld.com
Subject: [PATCH v3 1/6] MIPS: DTS: jz4780: add #includes for irq.h and gpio.h
Date:   Sun, 16 Feb 2020 21:20:55 +0100
Message-Id: <043d2e1f931ea85769c0932657e18f2808caa35b.1581884459.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581884459.git.hns@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The constants from irq.h and gpio.h can and should be
used in the jz4780.dtsi and derived DTS like ci20.dts.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..112a24deff71 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/jz4780-cgu.h>
 #include <dt-bindings/dma/jz4780-dma.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	#address-cells = <1>;
-- 
2.23.0

