Return-Path: <linux-mips+bounces-9631-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63144AF967F
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6EC6E35AC
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 15:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE812F7D12;
	Fri,  4 Jul 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f3FN93Js"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01E2D9ECD;
	Fri,  4 Jul 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642013; cv=none; b=etw8vwZlkbPf8r4ZoTFmXmDevWONUTEga908X+3z7SYsqU77lUiHoiE+mWuKNhL9zX83QsO4oVQvKf+x6dPFeSdgRCKyQALvbxUnSkBCMGdm9zfPCVa6Du1pD0hDTKaQw8Ff0S18fM98MIuRpcDNtdAMk4Ujh6yMd9O2Z/7zdo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642013; c=relaxed/simple;
	bh=12pfaAfK/e/Ot8r/dgjqRUYFgdTzDcibky9e6IR5yaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kequPhqbQQBOPivErubntY7jxosmZO3LK6DzS406cGOcDofhxpzEHTGEdxf6aPLatgonivHNhWN2v1cpOMDk4Ydqor5BpZcdJccD6WiA1+b2Ffv7RQZ5MyDKwHIacRh3fIbXwl3hfjwSO7zoXdprOnvHSC7zEWHyAI6zoqCUzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f3FN93Js; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698E244238;
	Fri,  4 Jul 2025 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751642003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0AW+0G4dncmtNWvaqkqRe4wQncXTZ9zbRGXOA3oe+s=;
	b=f3FN93JsvV4pDZPl2HZHSIwhifEi7pWKHcCWbp+rTFccCTfxAovnZpIJcHT7W4iNcbKFKu
	NyE28qCPzhPMmyY9Mp4rMoYyScC0zUEplhVrbtV5BTXFYWNogMw2tLizdScc4kvV1BZecX
	i1wNhrVDB6Yymm2YAFQRhoX1nB2TM9rTolyBxBZrSbLZdvdHe9OkD4bNqnV1D5hFCuLCZ3
	4M/B80Tkb63dpOVxkQrLlqj6ooUWx4NzA5i6bJ4U7PbOeawgjmB+ZPh4+oIPxC2Yde7E0/
	ObMhvlOpoXD1Wyj70x8B43oGWl1V8gEcfw95gFViPNnf+IsOuzCCqDAv0N2dBg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 04 Jul 2025 17:13:11 +0200
Subject: [PATCH v2 2/3] MIPS: CPS: Change default cluster value for EyeQ
 SoCs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-smp_calib-v2-2-bade7e9c0463@bootlin.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
In-Reply-To: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihou
 hhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh

On theses SoC only 2 clusters are used. Modify the
MIPS_CPS_CLUSTER_MAX default value accordingly for EyeQ5 and EyeQ6.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 47aa3f8849f05632773c9064282147608483c715..63d085db42f5ea2ddaf517d4cbbe2a637771ac89 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2331,6 +2331,7 @@ config MIPS_CPS
 
 config MIPS_CPS_CLUSTER_MAX
        int "Maximum cluster supported"
+       default 2 if EYEQ
        default 4
        help
 	Maximum number of cluster available on the SoC.

-- 
2.47.2


