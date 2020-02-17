Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38350161845
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 17:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgBQQzj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 11:55:39 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:17082 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgBQQzj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 11:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581958537;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ex+tP/S3jJM/1n8mzovxtL99ooZIHpji+z8Ck9o3ixM=;
        b=BC+LE7ZCAZveaAFoluYtb4Q3baSJX5raqCmebCJfRBHA81Z4xWBNhmHNxuV2VQu8bL
        CbVTsOFh1QY3fPDznpjmCjYpCDgD9bUeYeSKH2usPSqUxVXxBGll/970irVOG4zJwp+i
        +SbJTRRl3DtHb/O7qFqHzqvKUWrL25BxTzyJSdie3DuzgiVPZShzG3mHNEywGrhhjeyo
        M2HitpNrNCb702vgmy7KhTo5XW2iJh+eC9nvxsCuPo+NZNvTemC/NSiMpMskc+tyGr3I
        8POIbz/SSwrHFSYXBF9h8/oLSyxqpYu5AmF56RFJP6rWVPxGsZkmvZyVd2Pk47hh4WMd
        fbhA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HGtYOqv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 17:55:34 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
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
Subject: [RFC v4 6/6] MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the default MAC address
Date:   Mon, 17 Feb 2020 17:55:30 +0100
Message-Id: <1c124c43c0cd96274cb0386d68aa01ad8ef8b2cb.1581958529.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581958529.git.hns@goldelico.com>
References: <cover.1581958529.git.hns@goldelico.com>
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

