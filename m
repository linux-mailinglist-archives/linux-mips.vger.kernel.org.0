Return-Path: <linux-mips+bounces-9736-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B586B018D8
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 11:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3EED1C206BA
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 09:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B7227E7FC;
	Fri, 11 Jul 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZthSIqRg"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8451287505;
	Fri, 11 Jul 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227673; cv=none; b=E/n5pmB8a55tul2eiSWcgqV2uJ+1S0NpC83b1nUYKJnOsPPUCv9lA3oDdgmnlY7xMQb11rMSdpqISEQSOKk89VdA2vpnktrttO+bfR9B/q+r0UEhxTvEqI1PWD6sr6XQs259N/KnhT+fdqdZhnsrCMwQce5NnTeYsB47HMMgTjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227673; c=relaxed/simple;
	bh=JIMDbcwr5ij4X4g7hF5qo4Yzs2Ki8njZmBI2xxu/cG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GiS29hwAASf+5FccaxPZkz17IDCnqtYQ5ptv/bBsQIPKTUUCSNcsvRFT88O277tpK1aI8rhiW9C09g0ucTCVPVoTvRweP7dWe1jGcTrDZHY/Yz++lmAwCciKacvTzLXRSAI1Zy88/2u+tVSi17ssVaLyS3Oc2pRq5sNONFRaNNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZthSIqRg; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05A2F43396;
	Fri, 11 Jul 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752227663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MhKabUtsaMP3AEvcfl1/UiR9+QAaBcKFM8YoqelazPw=;
	b=ZthSIqRg9X0Hu7VnHM9d3dhcKPWhITBkC83J97DYVw02EX1TtojqZoUerGeDyDrdVfg6E/
	s5KyhffboSbCso7cUYjP5usOFmf3G8XVKXbYfMGIjqmOdaUVGpRLVLKw2P9J3skH+xOy0i
	+4jOmPz78YW6UaXxQPBROgbCeE9OOVvUPn3q/PTzu5JNyLH5vED6MlTijwthbXt9b3zA8J
	ow1DVuu/su/D+P0glZcFPLhJ9/H+dqZhPcbgB0s8VQEIeYOqwl/QdeOdCEbmpvdie29TG6
	40rfXSQzz3lowmeyPW2SQCz3blEIN1xw0lBePu81ItmJwGm+heGljkVi/J0s3w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v4 0/2] MIPS: CPS: Optimise delay CPU calibration and
 cluster helper function
Date: Fri, 11 Jul 2025 11:54:19 +0200
Message-Id: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEvfcGgC/23MTQ6CMBCG4auQrq2ZltKCK+9hjOmvNEFKWkI0h
 Ltb2IjR5TeZ551RstHbhE7FjKKdfPKhz4MdCqRb2d8t9iZvRIFWUFHA6THctOy8wtyUAI0lrlI
 Nyv9DtM4/t9blmnfr0xjia0tPZL3+q0wEE6wNMAdS1JzVZxXC2Pn+qMMDrZ2JfqwAtrcUA1bSW
 GEbDYyXv7bc23pvy2y5kcoBkcI07tsuy/IGyfhR6xwBAAA=
X-Change-ID: 20250520-smp_calib-6d3009e1f5b9
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekveffkeekvdekteevgeefjeevteeiheeigeetjeevvdfhheeitdegveekgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeegtgejkeemvdektggvmeeftgejgeemfeeggegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

This series allow booting faster by reusing the delay calibration
across the CPU belonging of the same cluster. While doing it we now
reuse the mips_cps_first_online_in_cluster() that we improve also.

This series enables faster booting by reusing delay calibration across
CPUs within the same cluster. During this process, we reuse the
improved mips_cps_first_online_in_cluster function.

With the introduction of this series, a configuration running 32 cores
spread across two clusters sees a significant reduction in boot time
by approximately 600 milliseconds.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v4:
- Fix build issue reported by kernel test robot <lkp@intel.com>
  at https://lore.kernel.org/all/aG3AJ2XnH2JKOjzY@rli9-mobl/#t
- Add reviewed-by tags from Jiaxun
- Link to v3: https://lore.kernel.org/r/20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com

Changes in v3:
- Do not depend anymore of a Kconfig entry (suggested by Jiaxun).
- cpumask for cluster filled now later in cps_prepare_cpus().
- Patch 2 of the v2 has been removed.
- Link to v2: https://lore.kernel.org/r/20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com

Changes in v2:
- Add a patch improving mips_cps_first_online_in_cluster()
- Use mips_cps_first_online_in_cluster() in calibrate_delay_is_known()
  as suggested by Jiaxun
- Link to v1: https://lore.kernel.org/r/20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com

---
Gregory CLEMENT (2):
      MIPS: CPS: Improve mips_cps_first_online_in_cluster()
      MIPS: CPS: Optimise delay CPU calibration for SMP

 arch/mips/include/asm/mips-cps.h |  4 +++-
 arch/mips/include/asm/smp-cps.h  |  1 +
 arch/mips/kernel/mips-cm.c       | 47 ++++++++++++++--------------------------
 arch/mips/kernel/smp-cps.c       | 16 +++++++++++++-
 4 files changed, 35 insertions(+), 33 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250520-smp_calib-6d3009e1f5b9

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


