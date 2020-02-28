Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0966017393E
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgB1N6p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 08:58:45 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:25729 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgB1N6l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 08:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582898316;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ex+tP/S3jJM/1n8mzovxtL99ooZIHpji+z8Ck9o3ixM=;
        b=ORLXQNZPXtiX6/Ill0agDgRp7mTq0KxUAFxl+hm/Crh/ZnvvXmK+XiN3z2SbhO8vRB
        CvTM/frVoYEoMbZ+++xnqCzy6eEevU09sTz7xljE/1iNNoUItXi8NVK1WjgtBjILxrrW
        FTXa0+H7LTc5EH+BnMC5JbrQXehuT+r0FXEkPvZspsnQBOGIcCXd0HCwu73zEeM10chM
        BZih6rqliGEtn4EYg+vg9wop3ig5l46tryywnukw7otzJa0vzCo4zpNa5EmBdlYX/iRf
        vtIYl+P32WV7zjA1f00t8HfbIwkNynJ3HnlZusS1IezK+H2H4DS8r4bqJy4zmkzkLFxy
        VHCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SDwT1AD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 14:58:29 +0100 (CET)
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
Subject: [PATCH v7 7/7] MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the default MAC address
Date:   Fri, 28 Feb 2020 14:58:23 +0100
Message-Id: <35f6eef643b42f83274923ec4214a35fbc8445a7.1582898302.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582898302.git.hns@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com>
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

