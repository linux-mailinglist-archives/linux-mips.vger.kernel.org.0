Return-Path: <linux-mips+bounces-617-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8A80A868
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A461C2097F
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6034D374D5;
	Fri,  8 Dec 2023 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a1XWrhBw"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C396B19B9;
	Fri,  8 Dec 2023 08:13:05 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DD5F1C0002;
	Fri,  8 Dec 2023 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7xLfxUYcwv7Riq1WHIn/RhOYVTg87eiUqaEEpdrB/s=;
	b=a1XWrhBwy2U42+CHAI15N1pZZw64nKtcKOiF8/HzhGMSh3OlhtYU+v4OGR/MAbSdRCYtjY
	CTKh835lzvz4q15lYwWofmlQtxpo38uRt6hfmdhfr6kPOegVhjQ0ifchkoVP8/dTeSS1Ni
	Fm0116kMeAZdB5zU/TZuNT4iawBv1ByuXdgEhFxX4U1ODavMIxAu3J9Xy0eobLBsTisl6u
	XzcSpRkr7i1y0wtKIpcVnAeKW/CGqa4zJ/L4rkRpwibpe/nT99NSdlJDjxWdeJ0hDorjfE
	bD/Liomt/UKYSKiZZ3nTqb7XtNX7mBH3w+fa3ip6ToGQ3XHwfAzjLPBLWnY5xw==
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
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v4 13/22] MIPS: traps: Give more explanations if ebase doesn't belong to KSEG0
Date: Fri,  8 Dec 2023 17:12:29 +0100
Message-ID: <20231208161249.1827174-14-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Now that we support having the kernel in XPHYS and not only in KSEG0,
the case where ebase doesn't belong to KSEG0 is more likely to
occur. However, in this scenariowe encounter a significant and
intimidating stack dump without any explanation. To address this, we
should eliminate the uninformative stack dump and replace it with a
warning that provides a clear explanation of the issue.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 68f1dd54cde1c..ec0cebfd2ef7b 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2420,10 +2420,13 @@ void __init trap_init(void)
 		 * EVA is special though as it allows segments to be rearranged
 		 * and to become uncached during cache error handling.
 		 */
-		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
+		if (!IS_ENABLED(CONFIG_EVA) && ebase_pa < 0x20000000)
 			ebase = CKSEG0ADDR(ebase_pa);
 		else
 			ebase = (unsigned long)phys_to_virt(ebase_pa);
+		if (ebase_pa >= 0x20000000)
+			pr_warn("ebase(%pa) should better be in KSeg0",
+				&ebase_pa);
 	}
 
 	if (cpu_has_mmips) {
-- 
2.42.0


