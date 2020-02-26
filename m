Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE08716FD30
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 12:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgBZLQU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 06:16:20 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176]:8023 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgBZLQT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 06:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582715773;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ex+tP/S3jJM/1n8mzovxtL99ooZIHpji+z8Ck9o3ixM=;
        b=rIr6xdAi6NeHqjeHXL7VFoZgT1foOkC+fGMXzFY7vac77OYl0xMoXGneNQGFXLWfpv
        dg6hiY47YZB/WOM4gH4kGo641EYjPlwUaM85MYS9249oW1bqzTI4q0zcL8aGDTxjaHbC
        zUKVh8OqaDGM4Fc/HdugympXC8lUCDXnFWCD4Gb4N7soCI1LILUGxpVlbjib5P4J4XPm
        Mu7qVNwWdNJg6gmgYJ0/Ybqzv23X8HeUC75cyiyvzV9l6CHh502CUr3xtTOZOWF8GUoF
        XzQmvPopbmWKqBNI4ggKGlTq2YkcS4LXzq5eHjgnKItSaVxZOynALc5ef5CbFLE5oZbz
        kaCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QBG64Cj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 12:16:06 +0100 (CET)
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
Subject: [PATCH v6 6/6] MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the default MAC address
Date:   Wed, 26 Feb 2020 12:16:01 +0100
Message-Id: <c2a0489032033570922ac8c0c5f43bfb7fe8b46f.1582715761.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
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

