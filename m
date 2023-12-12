Return-Path: <linux-mips+bounces-685-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FA80F2E2
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 17:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24FF81C20CCC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DE578E83;
	Tue, 12 Dec 2023 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MJdEjsFp"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F72710B;
	Tue, 12 Dec 2023 08:35:26 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1185FFF809;
	Tue, 12 Dec 2023 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1EYqlVYF1fJ33cC2a0Mertg3uhTJJ/NIkImZDHepJg=;
	b=MJdEjsFpVJ8ioDiw5His3fbeOd2bjIxm4S8sl0YNzERg/it60cuiPt/dVohY1zArlA7RPd
	J/LPXx9OPkZopk+jPGol+vP9nY2NPZEaFcWrjAF64ytr48w3FwE8H2Tzo7TeFiyHBvI0ML
	0gyE6P1LJySEyPz9tEiKyCR/8DY/1ZgtHdpE/i3buNqi1bbeagMTRUNHutjCyfKwGxUgs7
	ehc+A4gcnYxxG7Swuz36Zc5coOMuvHIMJrMjOzFkJU73Pcpb6KnZamxbPyxqFM3aO+fQtW
	EmHU0yGnK9ZMOCnuJ4XWbjp5h1Ies5nloy/gr64dj0CPMpdrAOtuMWjitwmSZg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH v5 01/22] MIPS: compressed: Use correct instruction for 64 bit code
Date: Tue, 12 Dec 2023 17:34:33 +0100
Message-ID: <20231212163459.1923041-2-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212163459.1923041-1-gregory.clement@bootlin.com>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

The code clearing BSS already use macro or use correct instruction
depending if the CPU is 32 bits or 64 bits. However, a few
instructions remained 32 bits only.

By using the accurate MACRO, it is now possible to deal with memory
address beyond 32 bits. As a side effect, when using 64bits processor,
it also divides the loop number needed to clear the BSS by 2.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/compressed/head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 5795d0af1e1b2..d237a834b85ee 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -25,8 +25,8 @@
 	/* Clear BSS */
 	PTR_LA	a0, _edata
 	PTR_LA	a2, _end
-1:	sw	zero, 0(a0)
-	addiu	a0, a0, 4
+1:	PTR_S	zero, 0(a0)
+	PTR_ADDIU a0, a0, PTRSIZE
 	bne	a2, a0, 1b
 
 	PTR_LA	a0, (.heap)	     /* heap address */
-- 
2.42.0


