Return-Path: <linux-mips+bounces-9663-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F7AFCC64
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 15:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660863AA870
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 13:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7303B2DD5F3;
	Tue,  8 Jul 2025 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kAz7NVKP"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051631D63D8;
	Tue,  8 Jul 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982382; cv=none; b=q6zkf6+hwutigOQrEYmC/l0WYKe9xxo1Sl9cKPZPDEMTKa3inPEP8bTM3G/ncddUTmgslX0Af/0pBnMWd+MqQNK4PvAJzHyB3lIV2iHkPWRJLs/9jTVOtyeYjw6YA4B2A4fB3G27Byb7qcuU1CMnUqXq7ltIFiiuDC2MrmAtKq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982382; c=relaxed/simple;
	bh=TeFhGn8VBBQOFBheLzuxrQlxl9f2VQlqg6g6ReF1X34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fta9eUKckFtPJw9nsd7ZbvSrqho2C2nQC/KSXBxUwK+39kZFlT1D0chiByMFhN6/q0C1hxafNuTxogFPzkB8lbNSCazLtZh7hXg3sFNS09fFLO4NpiSlS53ehe6R1gYBSl8YwkP0IgXJTmgWcV1L4DJQ2GlERyVI0hYYZlOy3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kAz7NVKP; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4EED4421F;
	Tue,  8 Jul 2025 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751982378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2RvRl8VfHn0Tx2MLIKNm594NG+pf2HoMBRMLyQTI6VQ=;
	b=kAz7NVKP/UbeP9XbF6oW37fDJEFU2kJSDWjlCHhs3LR2SFkJYrQglm04pQ8j4Xf4vCnj6n
	FXlQ+W8c9gzbuUhC+L7tvXGB4mvZAefQFaFkIeK9ovwrkm8AnOA20UCga6ewrpppFUP77v
	UEyF+Td+KJR0Ws+vuAHWUfrHtNtORTIFa7r6ToKHgmIQibZ67fUbh+SfYY88JV/Mw/7iQ0
	G+AvzW969k2T+LEa37+dPxGVv9Qy4VHwlqG+d5adM60qRLGkFuAxCcqY5GoKuJ9cDdC0RO
	uO4Pj6WsFC/3Fuk6VMLTSJ8jJ4FX+JUwGrCREr1oOI33G59YPjQ2wQtrnAoKQw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/2] MIPS: CPS: Optimise delay CPU calibration and
 cluster helper function
Date: Tue, 08 Jul 2025 15:46:10 +0200
Message-Id: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACIhbWgC/22MywrCMBBFf6VkbWSSvl35HyKSx9QO1KYkJSil/
 27ajQouz+Wes7CAnjCwU7Ywj5ECuTFBfsiY6dV4R042MZMgSygl8PCYbkYNpHllc4AWRVfqlqX
 /5LGj5966XBP3FGbnX3s6im39V4mCC24sFB2ouqmK5qydmwcaj8Y92NaJ8uPWUHy7kgPXymKNr
 YGiyn/ddV3fmSDqoeAAAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekveffkeekvdekteevgeefjeevteeiheeigeetjeevvdfhheeitdegveekgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeijeegtdemfedtrgelmeehugeljeemrgdvgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeijeegtdemfedtrgelmeehugeljeemrgdvgeelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhm

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


