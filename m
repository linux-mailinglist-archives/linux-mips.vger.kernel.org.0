Return-Path: <linux-mips+bounces-9868-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F1B0E037
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 17:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44B51882D2C
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEC9241C8C;
	Tue, 22 Jul 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cyb+difb"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DE23AB8F;
	Tue, 22 Jul 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197353; cv=none; b=Iy2yYWS3kKKleYE287YK1UeTdlMGDEzfk3J6s9VcPYqSpUc1H+EdW3h4WUqJiTxrEwvKvlfbw1jEukO+TtkAmNBC/fmXUUiMOKH2PiKL3rNEnYsxzlqcSWrbiqM96SbqUxDsrtU+Pv9+cv/seYbo0Zt8U2+a5C+QlQXqjFCC4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197353; c=relaxed/simple;
	bh=1Sg74Q4pmuIxKFb45pFmDzFgYvD2TpGqT1mRFZ92sqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ViX0hDi9h/svJ9UXon5HMKUn4RVT7nykgU06VV5wcoYl5WuKSqnm0glQjZqIA/ONWFIfuNVMlcGBmdypRwwbJRHUK6F2q0+KQHSfBLXcTUZX7mnZBA0sseoB3zYcN7ybfCx3xRoJLWMCosIuUu1aPXDN5/5TcUXv/nyJgqrb5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cyb+difb; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB903438CA;
	Tue, 22 Jul 2025 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753197348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JoXwtxCcaF7qyRR1rprGAYD5Yhzf/5ulPNtGR6S7Rqg=;
	b=Cyb+difbG37Qat5MG7CP41QiN/5NsBJOiulZF8oDfd8N74myQQMM0dy0YiM2DIJfKWLv1H
	hzJ71BNsEA8QKZ7XIh5U/HzIBKts3LesKgS3jMoD4efyPRqOy7H7E2n9xtwpuR7idTldXY
	Z6UVMwqLKAadB/NO9x5Ok3AxE0eGYhsQwjDaYgA1VqcqV65RQrtWWDPvS4x7vRlSGqfXUD
	qLZM2YP85CsoYZfgg21ZzYbu9uB/UlkDAP6wi8H3amj/8+P04LLU8SmVV6pVBj4DKJ4Cse
	CdxUCjVGIpK64/cwvt3LlhMXNj+qTPEluWfjjZld/L9dXIY2uPmeog8fhc/wog==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH 0/2] MIPS: mobileye: dts: rename the emmc controller
Date: Tue, 22 Jul 2025 17:15:19 +0200
Message-Id: <20250722-mmc_dts_warnings-v1-0-8a8a1594dfd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAerf2gC/x3MwQpAQBCA4VfRnG2tYSOvImlagzlY2hFK3t3m+
 B3+/wHlKKzQZg9EPkVlCwlFnoFfKMxsZEwGtOhsjWjW1Q/jocNFMUiY1RA7X1nCkhoHKdsjT3L
 /y65/3w/AzAPHYgAAAA==
X-Change-ID: 20250722-mmc_dts_warnings-ae5c40a23a85
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejhedvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveejueelgfdtfeelfeehkefgffdtudehueejtdefveehkeelfeejvdevffegleffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvhedphhgvlhhopegludelvddrudeikedruddtrddujedvngdpmhgrihhlfhhrohhmpegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-GND-Sasl: benoit.monin@bootlin.com

I somehow missed running dtbs_check with W=1 but the kernel test robot
did...

This patchset change the name of the SDHCI controller to match the
expected pattern from the mmc-controller binding in the eyeQ5 and eyeQ6H
device trees.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Benoît Monin (2):
      MIPS: mobileye: dts: eyeq5: rename the emmc controller
      MIPS: mobileye: dts: eyeq6h: rename the emmc controller

 arch/mips/boot/dts/mobileye/eyeq5.dtsi  | 2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
change-id: 20250722-mmc_dts_warnings-ae5c40a23a85

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


