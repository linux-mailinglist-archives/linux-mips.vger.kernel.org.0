Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EE7161859
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 17:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgBQQ4B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 11:56:01 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:15422 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbgBQQzj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 11:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581958537;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=x19Yc0lwgVFAHPYdn2uCmqE96DBTXWvCWwEjKHcs+zU=;
        b=r5D9I7OrejNQnWiU6QLV+aIow9I7CZHXQKLtPfsdViKTJL/t/Z7khR/P2SZcCpidKg
        mgrwnxIvhNfzq9ro2b20hNMoVP0GU2jPIC1G/uOyxTdIaMqJIUVZLTuzDhEb9oe/0HtL
        v/nDqdamHeq7yUtenbU4UkR8RqiB3YwJWEma/oClN2wgqQz6EPMebYvtCo5v2hczkReZ
        t2wcSjeoFINroQNemheW35EGKvWV52wDY6fBqgFmindee/lPhCoMw1uVB96Oj4fC0aOX
        U78r9HLndlam8+m22NTo3WYL04m1vfg6FSeOk4lRLM4qFj9RK2ZW5BoTRfflw6E1whgZ
        Zd8w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HGtWOqr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 17:55:32 +0100 (CET)
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
Subject: [RFC v4 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Date:   Mon, 17 Feb 2020 17:55:26 +0100
Message-Id: <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581958529.git.hns@goldelico.com>
References: <cover.1581958529.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

This patch brings support for the JZ4780 efuse. Currently it only expose
a read only access to the entire 8K bits efuse memory.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../bindings/nvmem/ingenic,jz4780-efuse.txt     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
new file mode 100644
index 000000000000..339e74daa9a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
@@ -0,0 +1,17 @@
+Ingenic JZ EFUSE driver bindings
+
+Required properties:
+- "compatible"		Must be set to "ingenic,jz4780-efuse"
+- "reg"			Register location and length
+- "clocks"		Handle for the ahb clock for the efuse.
+- "clock-names"		Must be "bus_clk"
+
+Example:
+
+efuse: efuse@134100d0 {
+	compatible = "ingenic,jz4780-efuse";
+	reg = <0x134100d0 0x2c>;
+
+	clocks = <&cgu JZ4780_CLK_AHB2>;
+	clock-names = "bus_clk";
+};
-- 
2.23.0

