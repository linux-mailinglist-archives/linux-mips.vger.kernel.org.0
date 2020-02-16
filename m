Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF081605B7
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgBPTVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:08 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:18748 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgBPTVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880865;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ube8VBr6jQ46GNcYtt3t/7muF+rpEcuH7jTgqb7/If4=;
        b=OEFPZwUhNwRxALw7zK1OKmlIQoLcvy+XECwgqWA6vu5IHkuiaLQ4Um5Qo0wMkUF1MQ
        6g2v5kOX0MvAHRe1PuKZslSGJ17rwAnaHXP2+y0PO5xSg0MyEpcicLPfsWyZWp3ezaPV
        VeGmz2MndUw6C1AYAP5uKCXWbyeP0WNX8Hxgu7v3WMHq3pEC2lBZIINeL1B8KJAovn6O
        XQco8iL77YDoUkouDQpqKFLz633EoS0RzjuK2FU4gQ6UhGMSAu8Y2bYdgMEWwPI9RIOX
        qKMUgQmsEwPYljPM/8mRGbXxalTEp2T1o71V5M+olSFbBV/TWqATVD1YQxvjOn5LRcY4
        B5Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKuJlc
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:56 +0100 (CET)
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
Subject: [RFC v3 5/9] nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
Date:   Sun, 16 Feb 2020 20:20:47 +0100
Message-Id: <1f956bba79044d8787adb9e00c19e4780f50241a.1581880851.git.hns@goldelico.com>
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
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33f811f517d4..88f247456a48 100644
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

