Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB271605C1
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgBPTVJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:09 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:21592 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgBPTVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880865;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gTk8MRIaL+Zoo6AYmT56Y6jd8ZDzvosVYa8gE1FYjOU=;
        b=T7JQXDBZcIbnomwlB8Y3FhhdxbInHoPy1im1+4E/uo8rhXDGvLiRiwVdmW5wqDBilo
        6N/F5vln542BtN6ROLefQyLi9WpGdTQpe4pT7oMJKbpnA+rppgVTVQc3Tkryr5hfvwul
        fMoWvKUJHAgqfSZk4Ke3eBQmwDHMbsy9ia3UJxkklywrEZLv1lyXzQEiHrzD5EjwceEt
        IVoSloC4tKeG+iG4szvHYd+SDtDQ0gi9tHx5ek2ZGH+QDFZNCGwAd6MaqpzbcDyFJQQD
        04AdQUg9agr0cIy4P3L8484rZiGx7b6tr0ue5qhJX5Cw7LHUyU2gwg4xhaDc4lWs3mRX
        sK7A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKtJlb
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:55 +0100 (CET)
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
Subject: [RFC v3 4/9] Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
Date:   Sun, 16 Feb 2020 20:20:46 +0100
Message-Id: <1b73eead5d7237cddfcbe835bfbf31ae89fb6b61.1581880851.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581880851.git.hns@goldelico.com>
References: <cover.1581880851.git.hns@goldelico.com>
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

