Return-Path: <linux-mips+bounces-9348-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA32ADCD43
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 15:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42BCF1885FD6
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 13:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9312E2674;
	Tue, 17 Jun 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OZPxq/YQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A982C030A;
	Tue, 17 Jun 2025 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166780; cv=none; b=O8CDtkV97llWpAOUHDWQ5n18ovUIxc5Y2lvjuAg3BwPPJCMfQEOyEqcZv4QQ2C/v730SenlpHm73VOkt83QAAbq+ZhyaXsJlw7ccdyS7HAeyUFcZiD77rrU5fcgUkxsyr6JvZzBXzfoOvfVfKZZ7lMJxG13MzXvYS3j+dMDmQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166780; c=relaxed/simple;
	bh=EoQSVfjmQhFp8Pf1z8sIAQ+SUZ570j0AUSbWNVE84+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns0+MWkIQvvwmuZBhX5fGi2rL1rSYAPCP1rSxP9IxvGsv6DVpIhKYLgJ7BW97if/tW4cFAoMSdo6RTtY7G8cF+uMCNY9CBM9swEOFPSop9a92IyW9j8ekUu4HwctyZCwPpBbP+TQGfhg80PDQw1Rr55JM0AUC5JyLHB0Kpkal90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OZPxq/YQ; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F373343AED;
	Tue, 17 Jun 2025 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750166768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCmIoAYmrqX3lAaHkyLHBfKbWm86bSCT79CFP9TUs2o=;
	b=OZPxq/YQLjpeydC4OOQVmZZXskhci/E+RaWXUKED0ACSVFX9/toSDIuzQNCQs8VElwPZXX
	dMiY2oMBp2fi3AivDrPkFDs66tBK8JHad8GX8Lo+TgG03up0pA8v9VrJWPYr2jo8wovUr7
	HxRtUIiL+wBcP+K3NIjkhF1KzXVdZ49C/yxphKjrwCHI9xcJb8SQReWKe4JDSd5lJLFQ0z
	7aMjkOIEjJwVqVaB0iodl4pt9V731csg9caImH7uiXKSNNcPAPDsumsIgdxk+Aeh7MKsKF
	K6SE/WGpEWKqffIkb5YZm+/JEMONl4Hg1bQUcupAIJy61DO88QQCBQCuCq4TGg==
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
Subject: [PATCH 2/6] mmc: sdhci-cadence: add Mobileye eyeQ support
Date: Tue, 17 Jun 2025 15:25:52 +0200
Message-ID: <e97f409650495791e07484589e1666ead570fa12.1750156323.git.benoit.monin@bootlin.com>
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

The MMC/SDHCI controller implemented by Mobileye needs the preset value
quirks to configure the clock properly at speed slower than HS200.
It otherwise works as a standard sd4hc controller.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/mmc/host/sdhci-cadence.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
index a94b297fcf2a..60ca09780da3 100644
--- a/drivers/mmc/host/sdhci-cadence.c
+++ b/drivers/mmc/host/sdhci-cadence.c
@@ -433,6 +433,13 @@ static const struct sdhci_cdns_drv_data sdhci_elba_drv_data = {
 	},
 };
 
+static const struct sdhci_cdns_drv_data sdhci_eyeq_drv_data = {
+	.pltfm_data = {
+		.ops = &sdhci_cdns_ops,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
+};
+
 static const struct sdhci_cdns_drv_data sdhci_cdns_drv_data = {
 	.pltfm_data = {
 		.ops = &sdhci_cdns_ops,
@@ -595,6 +602,10 @@ static const struct of_device_id sdhci_cdns_match[] = {
 		.compatible = "amd,pensando-elba-sd4hc",
 		.data = &sdhci_elba_drv_data,
 	},
+	{
+		.compatible = "mobileye,eyeq-sd4hc",
+		.data = &sdhci_eyeq_drv_data,
+	},
 	{ .compatible = "cdns,sd4hc" },
 	{ /* sentinel */ }
 };

