Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4A716FD36
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 12:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgBZLQS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 06:16:18 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:28814 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgBZLQR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 06:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582715773;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GELR2YwBhpj7Jht63ghsU23J1Jj6ZDwKHerFXjUqVS0=;
        b=D3OUHSG0MzAM14+qBZTAsTKjcax98MAS5KgQvYTb4dSnzrrcArBUUSl2Gg/ROyzODB
        OcT3fnZpmXjshB3Vq4Q57D/8NbqkfqCJ0h6MVbqWIk6g2ZSKmiGo3f/2XijfFP616HWH
        /IhzugAqmpDNmaOW67fRalb1eLWh7VxjjJfo6hbzLdZlSIu2K6l1dPXoZB6T2TUNg9C7
        Mdu9zpGEIJ9RB4BYvF/kvXiX1R8KRTUn8Y0vSX+2F3qNse2/IsrlIdM1kg40hWksh3b5
        zIMgol2ILLi8oo8sqC8rRu6gVrGtIrSS1uJwffsVd7GJpvWy1Mcbf46ErRdKBfeEDrWG
        STnA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QBG44Ch
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
Subject: [PATCH v6 4/6] nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
Date:   Wed, 26 Feb 2020 12:15:59 +0100
Message-Id: <6bce187fd0800841754fecdbd67e254ce77a4bac.1582715761.git.hns@goldelico.com>
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
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd79fc38928..fcb8d89c2b2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8271,6 +8271,11 @@ M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
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

