Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4702777AE5
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbfG0Rxg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33323 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388066AbfG0Rxf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so57654282wru.0;
        Sat, 27 Jul 2019 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1LEdOqVySjMhjvd5mrowppxBPOWjjV6JD50PPHN1vNc=;
        b=epUPXsruD9HD7dBSvTlcQSDB+V4j9DcI0d9EabWfPXVivq26gY6J+hawpeUC0OyBrQ
         L35AdjkJRGjA04pql3KtDaiJF+oBtTjWfMDyRRQ2jal/9Rc6NrFcwAR4e3+RAF3JA1iH
         wCpaUZKbF8ZrWmjb0XAGmjNx1RjVrAO/4xEPZh9NKemwHkiyxcXaMTSRxkwntk2hoKmN
         yO+q7kDNrNeHpNczheSeX4dKsnBMw432z6fWLE9r9gdq61hVk9ITDKHCFwucqM5KpxsZ
         2dA4B/Ns7q9xzZN0uhQE8LUXpAXIFAizXFJN1BSrmzWrNEGnT1HvBDu4+loFPysopVsH
         jrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1LEdOqVySjMhjvd5mrowppxBPOWjjV6JD50PPHN1vNc=;
        b=M7rcpwjPfQA1k9BrOciVOMXJM3M6eRCfWuAILFINeHsCpiVE5XpXwsUdKv9/PT1nZg
         oY+zOfgfyiqu93U5nRPHmNN0jF55uNtEyVxPzarQJPadPy8VY4/+lEKKRahwgDUX5Eko
         1SkjUzo9yyqLiHPYzAJOHevXFAxGlRYRrSfbfj1LmFWUaeTy7G5yKhv4qUnuWDwKAyKm
         AXquI4PW6t0XN8qIUOZhFhAOvCF3HPbJOf7F6PiZSeHWl+CI3r6HZFvKmXf7YOw0FX5m
         LmAgdUTOc/N2WcSPx1/abcImbKPHJ3uvSXlBPX3cNjA3TrON8cRf7KJkMDkimYzTUdR0
         n0AQ==
X-Gm-Message-State: APjAAAVmkdMU3HdRQuUKEBHaGHmTrwgJy2HVm4ZN3mIOni9gv9sNHDdy
        pR+9Kn7ipWmkickEd5zMTDs=
X-Google-Smtp-Source: APXvYqyvilqEjmAO70oKRxz/7y1qkHhr6EBca/psdTkvUL24Q3TaCkBYyU3liUbRofFKb1n+V6f0vQ==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr15434262wru.49.1564250013651;
        Sat, 27 Jul 2019 10:53:33 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:33 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/5] MIPS: dts: lantiq: danube: easy50712: route the PCI_INTA IRQ through EBU
Date:   Sat, 27 Jul 2019 19:53:15 +0200
Message-Id: <20190727175315.28834-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

EBU provides an interrupt line for the PCI_INTA interrupt. Route
easy50712's PCI interrupt to EBU so the interrupt line is configured
correctly (using IRQ_TYPE_LEVEL_LOW, this was previously hardcoded in
the PCI driver) and ACKed properly.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/boot/dts/lantiq/easy50712.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/easy50712.dts b/arch/mips/boot/dts/lantiq/easy50712.dts
index 1ce20b7d05cb..33c26b93cfc9 100644
--- a/arch/mips/boot/dts/lantiq/easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/easy50712.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
+
 /include/ "danube.dtsi"
 
 / {
@@ -105,7 +107,7 @@
 			lantiq,bus-clock = <33333333>;
 			interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
 			interrupt-map = <
-				0x7000 0 0 1 &icu0 29 1 // slot 14, irq 29
+				0x7000 0 0 1 &ebu0 0 IRQ_TYPE_LEVEL_LOW // slot 14
 			>;
 			gpios-reset = <&gpio 21 0>;
 			req-mask = <0x1>;		/* GNT1 */
-- 
2.22.0

