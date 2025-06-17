Return-Path: <linux-mips+bounces-9347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64616ADCD41
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 15:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760C91883BDE
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 13:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3932E264E;
	Tue, 17 Jun 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HTU68KS1"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CB2E7169;
	Tue, 17 Jun 2025 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166778; cv=none; b=Pb91nQ4G/+uFGsQxMbdCoYWAFEAdTpqSYW6rEqpzT0qOqbN+/ZkVz2FxtABYxgKauKSmF710zRWoqx0D9aGvNR5l+mXyUKKXQUuNigAnf3HoWJKnbLhjMaUxiPl0PJGsn2vvdQ5xEDNbnSnC9R2CVVoplaeDV01/rhi24Dj4cE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166778; c=relaxed/simple;
	bh=wNORk0hXvvkPqbJFbqdS9rN9/qpHWhfNvs+JPPcQAFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FaI8x0XvEGi23peXnhR6QOvA06He7vZoJ3ZsvmA3o27SlwmkMH9S39dary8MeaHJ4WjUj0LXBD8GCE6FxVJgYD6XfMMy9kmdU3lzgEkGkqYi/fZRHwvi8Xoj9i36Lu64+ysUcnRS3IX6jaiR3UolhvwJ3X32ZXknY/nj5fAHVwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HTU68KS1; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D1643B16;
	Tue, 17 Jun 2025 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750166767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VBP1D5K0x3QxSBaXRPUliaOayaAzgYNXPqHRbr5cqYY=;
	b=HTU68KS12LI/XmNO8zbV3KybQm3jtMesgHO14kri2Nwge8neq4UBjjtNiN3+gOtjSVY6Kl
	Fp1fcYU18CvZeoNq4tsOO5ihacbZj4mFee355ktEhS5n+wAwg3Jfnh91JM40yzo+joUcpk
	DcPYHUXeY/ydrrqQ0mB0Rtkvba4AnZ0bCwoLVv8TH1IsbdudwS5tkoWM+zo/t2CebPcSSB
	hYjR5yLHtu44WBPSLhtWp6rXeed1XBQnGdUhYsTr65/O3M4wbbty8L3VsYWx9nGn3jG7py
	8icXHQ2ngbpTmqMyEnnC5yQMQVfrdBt6nt6+NvIU2n6MYk82Jkrdzozgju3fhA==
From: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	"Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/6] Add MMC support for Mobileye EyeQ5 and EyeQ6 SoCs
Date: Tue, 17 Jun 2025 15:25:50 +0200
Message-ID: <cover.1750156323.git.benoit.monin@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuhefhveehuefgteejheffieefhfejffdvteejueefgeegvdfhteehtdeuhfdvnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvhedphhgvlhhopehfrhgrmhgvfihorhhkrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-GND-Sasl: benoit.monin@bootlin.com

The MMC/SDHCI controller found in Mobileye EyeQ5 and EyeQ6 SoCs is 
based on Cadence cdns sd4hc IP. It supports up to HS400HS mode. The 
only peculiarity of the hardware is that it needs the preset value
quirk to configure the clock properly at speed slower than HS200.

This patchset adds a compatible device tree binding to cdns sdhci for 
mobileye then uses it in the sdhci-cadence driver.

It also adds an emmc entry in the dtsi of each SoC and the config 
options in each defconfig to allow using an eMMC for the rootfs.

Benoît Monin (6):
  dt-bindings: mmc: cdns: add Mobileye EyeQ MMC/SDHCI controller
  mmc: sdhci-cadence: add Mobileye eyeQ support
  MIPS: mobileye: dts: eyeq6h: add the emmc controller
  MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
  MIPS: mobileye: dts: eyeq5: add the emmc controller
  MIPS: eyeq5_defconfig: add cadence MMC/SDHCI driver

 .../devicetree/bindings/mmc/cdns,sdhci.yaml   |  1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi        | 22 +++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi       | 22 +++++++++++++++++++
 arch/mips/configs/eyeq5_defconfig             |  2 ++
 arch/mips/configs/eyeq6_defconfig             |  2 ++
 drivers/mmc/host/sdhci-cadence.c              | 11 ++++++++++
 6 files changed, 60 insertions(+)


