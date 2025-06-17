Return-Path: <linux-mips+bounces-9349-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40797ADCD45
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 15:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D051886799
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 13:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336652E2EE5;
	Tue, 17 Jun 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m5H0uv6P"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4072E06CF;
	Tue, 17 Jun 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166780; cv=none; b=Ax7KN7GC1TS8tr0WcXIOec0sChptWpj2KqI5rgPkdVRaO1nbFuuUm5NioLv8rePP0c2bON8rEXXU1XGLwtdowFtzanIQ2+7cg5zpVpw1x91vsqhuGdPYRvX1THNsGDFy4jn25MZVeAIoF9u67XJ/cEJJQF+cqHvOHruJqaHokXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166780; c=relaxed/simple;
	bh=Ty0fkNiI9qSnDDdjYwkP6iOGZ1ZNK7yZLHHMtfmAipM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L72vvnRnACZJ2vcK4jD3iEJDgsU9Eu2nSY/oeZEWbsZKPIeAqVuHURQK7JJZbntqoF8cCMeRgZXX0oJbJyE1AHlFcuoNk/7wx/4W0EloFyQe9yZ39evoFy6GvkPlfTQq85ZmOo+ESpBDtuYK8i6K4IhHd6n9OocROnJpqQHfDMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m5H0uv6P; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5F9643B1D;
	Tue, 17 Jun 2025 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750166770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ty0fkNiI9qSnDDdjYwkP6iOGZ1ZNK7yZLHHMtfmAipM=;
	b=m5H0uv6PFYY49GWB15WKi0hzPSDU+HQgBGYvVfAbYlANOS+qIw3MtvDSS6fNeJ5OzxN/Nc
	R6BJPo37F0zEPnTuDeFhI851htOO/CeZDUr6CAdcUFKgVgvj8t0Eu1I+U7x2R5bhoS8/2y
	SB9/xArG1Pys1gs3N+X38+wLYh+nAVCC4XN597OTTJNL27yETvVp+YJ1EreJTCEuTi09Ve
	dznb3+GAKXLSfnjbKvRiWyoJdmwkp5iKhklf/Q2vgdHqTExJwk7vUf1j8gm/QbXN4mPR2n
	S31HjdbQpTPFJszxrkp+v8JxE8OFUlNNCjxeezOjuZpOVbYkLm2MV3i+VLR7xQ==
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
Subject: [PATCH 4/6] MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
Date: Tue, 17 Jun 2025 15:25:54 +0200
Message-ID: <4deef2c41a8b7d41259db291a6a1401588bb8752.1750156323.git.benoit.monin@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfffeeiieejkeevuefhvdeggeefudffueeuffehffehffevjedugfdtueegtddvnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvhedphhgvlhhopehfrhgrmhgvfihorhhkrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-GND-Sasl: benoit.monin@bootlin.com

Enable MMC support on eyeQ6 platform so it can be used as the root
partition.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/configs/eyeq6_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/eyeq6_defconfig b/arch/mips/configs/eyeq6_defconfig
index 0afbb45a78e8..0a00a201937b 100644
--- a/arch/mips/configs/eyeq6_defconfig
+++ b/arch/mips/configs/eyeq6_defconfig
@@ -82,6 +82,8 @@ CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
 # CONFIG_NVMEM is not set

