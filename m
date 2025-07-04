Return-Path: <linux-mips+bounces-9626-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2DAF92C8
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FBF27AAEF3
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C192F3637;
	Fri,  4 Jul 2025 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e1fU9WUl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D32DCBF4;
	Fri,  4 Jul 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632494; cv=none; b=S6fsuzDn4mSNvWpwvHkk+AIKENfWuJY8F345xHAnb+bQNkjwUIg2Bb1xJS5JiYwuRN9igtiMdTvwvbrzLY4+0zlcoW4mpT5T8Eoh3TnLHQpJgL9lQ91kD/UrkF0+Vjc1jcZhm57s0VOdhpSLso6AFjt5YwExydrKy00B4JVD1KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632494; c=relaxed/simple;
	bh=gOLGhEIHS8Y/TGfNjMO7PqmIPxxpHa+P8omNhz9ArHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0JfwhjMqUDLhJEWj2Y0f3HY1fT9qduNVpkS9N9WWkTTz/PWFNfjemxTrEQxbnFb/hDUFXPqdIX9dN0zO3du9elFn5v61QvQ+ym/nhX/yXbaMS73cdi6sK1OO7H4FWBZEwJnDawN4r/I8ILygha4wqvplJCfTIVfKiOdHDhACh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e1fU9WUl; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B6E3F58300C;
	Fri,  4 Jul 2025 11:47:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FC4D1FD35;
	Fri,  4 Jul 2025 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GYxmKoUKaQlbNFuPwYqAISFCq0z+5IakQmKH+DkHBRk=;
	b=e1fU9WUlb+UiFxlHrzgw8zAAwhXi/eNQdwR8wydxMIgaQm0tBTyf0kP7rcBuCtQlGaM2XU
	PRyTKFIfnQOg3aiZZf59os46cDCuSvzd5KhH7RoUB234DYRlP3o+YMAUxvUIW3GKQloXIu
	v5cUJZ49EbwNQBPWyIrTZCBrcHtwCi+jsnv41VRzZpGbBokcN8qnajMFt3XUi1Ri/7rAAH
	xTCAt/Z5OhK0yP19Cl7My2jjSJBLe+Yn2UjsQTe9r0SkrxPGLQD0Yp4yKmvoWxDb+YO6T0
	3iXt5GX8m+Kg/E02FF5aqrgwKq/fkgK0DQwH100p/LT2aKt6AmJM/JYExnKv8g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 04 Jul 2025 13:47:10 +0200
Subject: [PATCH 5/6] MIPS: eyeq5_defconfig: add GPIO subsystem & driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-of-commits-v1-5-dc2006bf2846@bootlin.com>
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

Enable GPIO support on the EyeQ5 platform.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/configs/eyeq5_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index e2d6ad7c3006b037ae370a68c09e7aacab61d083..05a579e21970eed203d96bd4b8103d030e39f262 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -64,6 +64,8 @@ CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_HW_RANDOM=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_NOMADIK=y
 CONFIG_MFD_SYSCON=y
 CONFIG_HID_A4TECH=y
 CONFIG_HID_BELKIN=y

-- 
2.50.0


