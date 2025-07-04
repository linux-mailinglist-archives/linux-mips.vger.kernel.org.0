Return-Path: <linux-mips+bounces-9628-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636DAF967E
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFDA1897434
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 15:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7872C23A58E;
	Fri,  4 Jul 2025 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LMAyR0qw"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E982877C2;
	Fri,  4 Jul 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642007; cv=none; b=Orxvtd1nu1ikHCs0CrihiOHNdS9mUYA5rO43zp1SeLI5ORQNLXUubkn6HUyfvA8PZl7j71o/4DiCJa65RU3+BtQusqYc9B+FUVdxh7VahZr6pKBXyhaTp49KeDS//74SsQXx5vnnl8QwYSmrL/LN8eUpmuIepGkCZ2gPn6RCqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642007; c=relaxed/simple;
	bh=h5NGHUQ31TfqllNIiJyzwzrUtEAcIwB0fpxC0shtqzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qfCItpUo2U7N6J6OAJxGCIGq6hT8WUVHXBQXQ/q56+jsEzQkO4T0MA8wpCjF4brLaDe2Y31J4yjQvhHvBTioQhF9lRiO5LgB/6q7wAOym7RYR8yjXo90PniEAjUxnlOhrGJ8k6VlxQaeGU3O0io5k0fuOgq93+YQ621E425+CNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LMAyR0qw; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A029843972;
	Fri,  4 Jul 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751642002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CuaTJ5c8tMIQ8LQs2CvxI+E8LhCPLMVaI9gn+ckc+Ys=;
	b=LMAyR0qwBCEMaQRJZ1gyTsNZbqVnKqj8d3SPxYnT0pEzTqQyzlc7nwf84Ma/qAU6QDBycp
	OpwE093kXMB+jy/byBr5Hz1un3tX+DnNN1aQO47k5v7lFcRGdcg6HduSrK0hwQfVG9JRUJ
	re2LIFs1anPrr3Vw6/cy7JJYAGjALFT+I278KuFLKAuo0kS1wVjeBMV4uvXaLODLksJa88
	IdpzAHrsjLfTfPq/+96ezXIvnpXIULnuqK0nFwrhcAW4X2oyeC7lOP1tsdQ3Pt8dxBseWO
	UaZFnfiju9APsdoSUs/qF3EkubFBQbkZwusyIjzGIg3KbyYQ5HPaJXOCIRpV3A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/3] MIPS: CPS: Optimise delay CPU calibration and
 cluster helper function
Date: Fri, 04 Jul 2025 17:13:09 +0200
Message-Id: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIXvZ2gC/23MQQ6CMBCF4auQWVszrRTBlfcwxEA7lUmAkpY0G
 sLdraxd/i8v3waRAlOEW7FBoMSR/ZxDnQowQze/SLDNDQqVRq1QxGl5mm7kXlT2gtiQdLpvIP+
 XQI7fh/Vocw8cVx8+B53kb/2nJCmkMBZLh921rsr63nu/jjyfjZ+g3ff9Cx3z6GykAAAA
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekveffkeekvdekteevgeefjeevteeiheeigeetjeevvdfhheeitdegveekgeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegurgdtugemjedtheehmegutdduvgemudegkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegurgdtugemjedtheehmegutdduvgemudegkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhos
 ghilhgvhigvrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
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
Changes in v2:
- Add a patch improving mips_cps_first_online_in_cluster()
- Use mips_cps_first_online_in_cluster() in calibrate_delay_is_known()
  as suggested by Jiaxun
- Link to v1: https://lore.kernel.org/r/20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com

---
Gregory CLEMENT (3):
      MIPS: CPS: Improve mips_cps_first_online_in_cluster()
      MIPS: CPS: Change default cluster value for EyeQ SoCs
      MIPS: CPS: Optimise delay CPU calibration for SMP

 arch/mips/Kconfig                |  7 +++++++
 arch/mips/include/asm/mips-cps.h | 18 ++++++++++++++++--
 arch/mips/kernel/mips-cm.c       | 40 +++++++---------------------------------
 arch/mips/kernel/smp-cps.c       | 13 +++++++++++++
 4 files changed, 43 insertions(+), 35 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250520-smp_calib-6d3009e1f5b9

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


