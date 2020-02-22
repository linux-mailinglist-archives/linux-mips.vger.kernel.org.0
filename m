Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF4A168E28
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgBVK0B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:26:01 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:16511 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgBVK0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 05:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582367158;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ex+tP/S3jJM/1n8mzovxtL99ooZIHpji+z8Ck9o3ixM=;
        b=N4w343kENoioT8Zh9eiIb/W69ahujIM+joZhXM2rLO1Z3gIiPlXsSCqYjJBKabLnlw
        h5GUKDQGQbpOtm8W83TEDMn8wgvVEReM3SMg1453tnRZTneVSh1NK2gxjxg05odniiot
        ivthAYIAd7SX7qWBwmxZwzTibZMtVdjJQVfG922muChI/CDFhDFyR4MKNexi1ryBAO3X
        OIpeL3KJMHlz9q4CWWujjE9Kx39GRXnhoWEz/E/ebwCsLldJRCNGEhGvjkKIp46cxKdh
        Zhuq2b2FOWxIko91F4IL2OhmEMlzT5wNAkhKMgME4zbdKUKC9YZTU47N/O0K0RaPUnt9
        Vr8Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAz7pC6Q5M"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MAPljMg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 11:25:47 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v5 6/6] MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the default MAC address
Date:   Sat, 22 Feb 2020 11:25:41 +0100
Message-Id: <aa411ab2b57443b405372cc54c95bffc326aff98.1582367141.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is a unique MAC address programmed into the eFuses
of the JZ4780 chip in the CI20 factory. By using this
for initializing the DM9000 Ethernet controller, every
CI20 board has an individual - but stable - MAC address
and DHCP can assign stable IP addresses.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 37b93166bf22..6dc1f9eeff00 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -355,6 +355,9 @@
 
 		interrupt-parent = <&gpe>;
 		interrupts = <19 4>;
+
+		nvmem-cells = <&eth0_addr>;
+		nvmem-cell-names = "mac-address";
 	};
 };
 
-- 
2.23.0

