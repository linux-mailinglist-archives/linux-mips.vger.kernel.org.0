Return-Path: <linux-mips+bounces-3525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6A8FFEB0
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 11:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9221C21DBE
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672DC15B966;
	Fri,  7 Jun 2024 09:05:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217515B540;
	Fri,  7 Jun 2024 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.224.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751104; cv=none; b=eXTwYpA9nuZVfqjQvJDCjMT1nRsp6vCOXWCzs4A7oJItRnBuGaQIpXr+PKjoamf5D/LsEm3vhrqihOkQIcs8VsxCLWBivdtU1z0YdyOrG9bKdtacRlN9Lq6Y63WS28VjenJrcVjTmXEcKmlvP/iJ3l2QK0YBMe0KgnbIQ3sfwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751104; c=relaxed/simple;
	bh=yuFpd84XtrdmCusaDJjTM3sZmJosXeobQizTdbECW0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JW8DpczgyJ1knDCEZi6AZbx63H0zJICaEfaBIXWwPce7YyR8ry6F+uA81Aop3U7YelXATR5u0qZ6X8/xCx0JJLHL17FbIThsvANCpMNZcXXj1s/03WFVwQ+c93fOH1IcbWIre7gpwUpCRi49CF0FEfYeaGDrt6vYTqxx/8IsRFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=91.198.224.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=990276a841=ms@dev.tdt.de>)
	id 1sFVWX-006OZD-Le; Fri, 07 Jun 2024 11:04:37 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sFVWW-00CQZP-Lf; Fri, 07 Jun 2024 11:04:36 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 46AD5240053;
	Fri,  7 Jun 2024 11:04:36 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 9DC06240050;
	Fri,  7 Jun 2024 11:04:35 +0200 (CEST)
Received: from mschiller1.dev.tdt.de (unknown [10.2.3.20])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 25EAB37521;
	Fri,  7 Jun 2024 11:04:35 +0200 (CEST)
From: Martin Schiller <ms@dev.tdt.de>
To: hauke@hauke-m.de,
	dmitry.torokhov@gmail.com,
	tsbogend@alpha.franken.de,
	rdunlap@infradead.org,
	robh@kernel.org,
	bhelgaas@google.com
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Schiller <ms@dev.tdt.de>,
	stable@vger.kernel.org
Subject: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Date: Fri,  7 Jun 2024 11:04:00 +0200
Message-ID: <20240607090400.1816612-1-ms@dev.tdt.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1717751077-B9ADCD95-D17CD154/0/0
X-purgate: clean
X-purgate-type: clean

Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") not
only switched to the gpiod API, but also inverted / changed the polarity
of the GPIO.

According to the PCI specification, the RST# pin is an active-low
signal. However, most of the device trees that have been widely used for
a long time (mainly in the openWrt project) define this GPIO as
active-high and the old driver code inverted the signal internally.

Apparently there are actually boards where the reset gpio must be
operated inverted. For this reason, we cannot use the GPIOD_OUT_LOW/HIGH
flag for initialization. Instead, we must explicitly set the gpio to
value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
may have been set.

In order to remain compatible with all these existing device trees, we
should therefore keep the logic as it was before the commit.

Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
Cc: stable@vger.kernel.org
Signed-off-by: Martin Schiller <ms@dev.tdt.de>
---
 arch/mips/pci/pci-lantiq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
index 68a8cefed420..0844db34022e 100644
--- a/arch/mips/pci/pci-lantiq.c
+++ b/arch/mips/pci/pci-lantiq.c
@@ -124,14 +124,14 @@ static int ltq_pci_startup(struct platform_device *=
pdev)
 		clk_disable(clk_external);
=20
 	/* setup reset gpio used by pci */
-	reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset",
-					     GPIOD_OUT_LOW);
+	reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_ASIS)=
;
 	error =3D PTR_ERR_OR_ZERO(reset_gpio);
 	if (error) {
 		dev_err(&pdev->dev, "failed to request gpio: %d\n", error);
 		return error;
 	}
 	gpiod_set_consumer_name(reset_gpio, "pci_reset");
+	gpiod_direction_output(reset_gpio, 1);
=20
 	/* enable auto-switching between PCI and EBU */
 	ltq_pci_w32(0xa, PCI_CR_CLK_CTRL);
@@ -194,10 +194,10 @@ static int ltq_pci_startup(struct platform_device *=
pdev)
=20
 	/* toggle reset pin */
 	if (reset_gpio) {
-		gpiod_set_value_cansleep(reset_gpio, 1);
+		gpiod_set_value_cansleep(reset_gpio, 0);
 		wmb();
 		mdelay(1);
-		gpiod_set_value_cansleep(reset_gpio, 0);
+		gpiod_set_value_cansleep(reset_gpio, 1);
 	}
 	return 0;
 }
--=20
2.39.2


