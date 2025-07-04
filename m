Return-Path: <linux-mips+bounces-9625-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B0AF92C0
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0998B1C882E3
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11792F2C4F;
	Fri,  4 Jul 2025 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nL3HJjJd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860B2DCBE3;
	Fri,  4 Jul 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632493; cv=none; b=nChR4qQFmAQ9TrlNgBsaLIXBk75LJnPQWljRnC60YNHrYt2HT1OE9VmNr0oZFAMH1cGTjpF6LoCD5h9T42UaFoz7upTUC5uzBLCPDzhyLqW6lq4bcBPIZ2T3jX4VHHZ/S0hyJjVkwPw/sWmlc7uovRZ23/HsCYE6usKcBi1IUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632493; c=relaxed/simple;
	bh=+IJG9jF3wvzHlnY/pPibfrkxW+sgY50vQvTAPclcixA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKEDXvw3zYDz/vs+RO+KmxKRQEAdaZ6Hoak/WitNJmI0z4Nhz3xIxYJ1S82ORplLjRmbM+W6qwK8mkvgJH/LimQH18oi07vYXq0pVIW8ecg6nykQ3FMgKIXvx8N67WN75rdUb8TM5sAFXtBz7IZVFEYTlDW/HXFhlTwXvILNTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nL3HJjJd; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B2958583004;
	Fri,  4 Jul 2025 11:47:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10D51205B7;
	Fri,  4 Jul 2025 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyj2PDPl9Fhgxy+tOu92EwhO1jycTsUPwRXwJOieIjQ=;
	b=nL3HJjJdisqChY7DlJph8kn5z/m/mDiaOy6ksmv9me0UrKDKm96rZjmRmkTnsJsNW2d3b7
	RTMS3ps5f5MVhmvRdLNtx2JwgSbmkWddN5A1XIOPeiB5KBN5BX1+mqFAUF5FaApfEmwFcO
	2gtIJ2sg9Z12BS8woSsD+9myGhywScOyqpk1E5cRL6G/6O5qYd2BRaDiX5h63PTBF8ioPK
	QXzs3bWNg4Cp0GoQEW8fvE8vP4bxbzX4W87+Ir13ZS+VuEasKIZz8Mf9fBfZFgVpFUp6BW
	vRCjPWu0WsT7Awws7G4Yh1cGfkEb5EVmGgNL2Hj+CDFIWCR/jrgLapWAYEhDmw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 04 Jul 2025 13:47:11 +0200
Subject: [PATCH 6/6] MIPS: eyeq5_defconfig: add I2C subsystem, driver and
 temp sensor driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-of-commits-v1-6-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
In-Reply-To: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudeingdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Enable I2C support on the EyeQ5 platform. The evaluation board has a
temperature sensor mounted which helps test the integration.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/configs/eyeq5_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index 05a579e21970eed203d96bd4b8103d030e39f262..2064b79b59b6d94bf003f0c2c95e61948c77b1b0 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -62,10 +62,14 @@ CONFIG_CAN_M_CAN=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_NOMADIK=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_NOMADIK=y
+CONFIG_SENSORS_LM75=y
 CONFIG_MFD_SYSCON=y
 CONFIG_HID_A4TECH=y
 CONFIG_HID_BELKIN=y

-- 
2.50.0


