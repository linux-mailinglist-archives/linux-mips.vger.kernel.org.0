Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A65168E3A
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgBVK0P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:26:15 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:16448 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgBVK0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 05:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582367157;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=UhK6kPx1izFEDwGPZRQ8Vz3EeWwMJdEuEzrh1rnL18s=;
        b=g3Ldxpr+Vf+GgTpIVu6HJWcbvZMrD4POZOedoFvAJgaopY3fMNa/ynn7zcrYMrlyen
        A4t9d9r5Y4tgwdA2LOa397ZQAPBTNrOwzx9gKeMbSZSN5fu2ebFGg33C44v9sxV+E7BN
        PlBuQSb8YirhEsRXXx/WBOpVeLpqKMeq40vXZrfZ+P132wAFHS0SGt4OKpyG1FyMWuuA
        C3rOSgwjmJGw2PUmnQsYDcBCot4XdVJ1haEh2H0MIkxL/NWTB55qtyS7lVxF4E6+p9Ly
        D2coNTWtwLuZ6m4iXL9VC9nkd2oY2ajSdXBOhbAkSm7wWKdCjSVkB0SSOKoOtW5DuKCI
        Gn2g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAz7pC6Q5M"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MAPkjMd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 11:25:46 +0100 (CET)
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
Subject: [PATCH v5 4/6] nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
Date:   Sat, 22 Feb 2020 11:25:39 +0100
Message-Id: <2ccdf9e354e12a10cb5f5c6cda9f81065306471e.1582367141.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
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
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..5bab216d8fe9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8270,6 +8270,11 @@ M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
 S:	Maintained
 F:	drivers/dma/dma-jz4780.c
 
+INGENIC JZ4780 EFUSE Driver
+M:	PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+S:	Maintained
+F:	drivers/nvmem/jz4780-efuse.c
+
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.23.0

