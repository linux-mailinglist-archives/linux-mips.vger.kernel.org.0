Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAF116FD31
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 12:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgBZLQT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 06:16:19 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:22387 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728278AbgBZLQS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 06:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582715772;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ay31G7exAkSbg3PL1nOzfK8qqlNf1gmdrl8NmheHFD8=;
        b=aUNXjZo2Nd+EpYX3Tz1SJcxlASPRuSebzbyujJcJ7hr/8aLxiA1vbzhu5jhcNMvMoe
        wD4jF7hR0lV1tcFB6esjhBEH7Uac8qs44/JNDXZz0/x3jX0Xtyg59i6qiIG4UDD+4FD3
        oMN1wu4FrADA3UEr2Lf0+ZNLe2X0uV6K+ApANGhdPli8CwpEDqVKo3oUdVym4RImKabO
        va10GWUQQcSIIXtWGH1JLmYOmp9p1gJEdt4BXXqz1YCD80P45I2eWj209I6hOCv+IrxQ
        uZqPaxeH3+09LU7kJPTG1Vm5ymEJRFbnbswuM/pB9fsovBlJvEN+J9wLCDhisAXd6C8v
        j5og==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QBG44Cg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 12:16:04 +0100 (CET)
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
Subject: [PATCH v6 3/6] Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
Date:   Wed, 26 Feb 2020 12:15:58 +0100
Message-Id: <e346f76db0cc8ff2f69f3eaf2230e354c29407a2.1582715761.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

This patch brings support for the JZ4780 efuse. Currently it only exposes
a read only access to the entire 8K bits efuse memory.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 .../ABI/testing/sysfs-driver-jz4780-efuse        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse

diff --git a/Documentation/ABI/testing/sysfs-driver-jz4780-efuse b/Documentation/ABI/testing/sysfs-driver-jz4780-efuse
new file mode 100644
index 000000000000..bb6f5d6ceea0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-jz4780-efuse
@@ -0,0 +1,16 @@
+What:		/sys/devices/*/<our-device>/nvmem
+Date:		December 2017
+Contact:	PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+Description:	read-only access to the efuse on the Ingenic JZ4780 SoC
+		The SoC has a one time programmable 8K efuse that is
+		split into segments. The driver supports read only.
+		The segments are
+		0x000   64 bit Random Number
+		0x008  128 bit Ingenic Chip ID
+		0x018  128 bit Customer ID
+		0x028 3520 bit Reserved
+		0x1E0    8 bit Protect Segment
+		0x1E1 2296 bit HDMI Key
+		0x300 2048 bit Security boot key
+Users:		any user space application which wants to read the Chip
+		and Customer ID
-- 
2.23.0

