Return-Path: <linux-mips+bounces-9621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D4AF92AF
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7F054670A
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805502D8DC2;
	Fri,  4 Jul 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TaU0izP5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77022D780A;
	Fri,  4 Jul 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632490; cv=none; b=uyS+wkTJ1fW+ElLJBGQy/KkFiZ1hqAGSxGT2tAwAa2d3siS3R/NeGqvAN08IhXTIHqkFxi7o1UUfU3cY1cXn0OWxRmMD4clG5LSlth6iIjdvH9n1IeArP/MB46M3SKxDZZNrkMSGImqfL30Eml3EKrPUM5LuMKRwxZx0IikrKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632490; c=relaxed/simple;
	bh=yPIV3TAF5m34q4sRomXTC5wAn+tia9dAeTvb8ukNRl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fZrhUKrJ670g99X4+v3d9Ir1rDt/XSA/YWYXg0W3HUcT9KGkbWEsrVyXOuj1HXu2SbdrjTUamu4KUc6rwHD6atuEb0xhFap1FBuvkFcwhAo5KeXjnQ1lgBgBczrxe55mEFi//yZ06dJGn2LyEZOX9lunviQWCCWE8TMGnaAq744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TaU0izP5; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id EEB38582F55;
	Fri,  4 Jul 2025 11:47:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A9571FD37;
	Fri,  4 Jul 2025 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HFuOGsOl+YvjVySVfrtK0l79nf+JYtNJ6JXO2dwKdQs=;
	b=TaU0izP524Zg468BLnpL3EluYD8a6hqmfYu7Hio/7/gsNPIBlY6YmU/yadPdCqV8o7WpqC
	lepK3aGf/yZ0jEBxOwA1yIg6F3eiueWyp3FzIRRcHrjynICgX4fYqPYBiq4+rqWpOhQcKU
	hWjYL1cShV6cU2vE4A2QfqAn/eXqZw7Xc9/rUsovmAhnD3BasLrdjIBSb1d5TAm/DEoQWI
	U4ChfNGc1IZEZpWSlSJ9YxdZ3Wwp2R1zhag06PUyfgNSH1lvn/npLCVPge0w74WswSkD14
	0erBUvypR46hxQO3QfqFHvLxm6pd3DbFSviKudNPsZ7KMM4di2VPPYgDkk2iuw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/6] MIPS: Mobileye: EyeQ5: add GPIO/I2C
 devicetrees/defconfigs
Date: Fri, 04 Jul 2025 13:47:05 +0200
Message-Id: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADm/Z2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3fw03eT83NzMkmLdFHOzVDMgkWiWZqgE1FBQlJqWWQE2LDq2thY
 AnU4veFwAAAA=
X-Change-ID: 20250704-of-commits-d76e6d76a6f1
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffjeeftddtleetffduteekvdeuiedthfehgfffudehudefheffheehgeeujeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvdduiegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgui
 hdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Here we push changes to have GPIO and I2C support by default in EyeQ5
defconfigs and devicetrees.

Linux driver work has been pushed in the past. Devicetree patches
accompanied those series but didn't get merged at that time. Acked-by
on I2C DTS patches come from there.

We start by a small new defconfig patch that a clean working tree after:

   ⟩ make eyeq5_defconfig && \
     make savedefconfig   && \
     mv defconfig arch/mips/configs/eyeq5_defconfig

I2C DTS patches:
https://lore.kernel.org/lkml/20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com/

GPIO DTS patch:
https://lore.kernel.org/lkml/20240228-mbly-gpio-v2-28-3ba757474006@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (6):
      MIPS: eyeq5_defconfig: Update for v6.16-rc1
      MIPS: mobileye: eyeq5: add 5 I2C controller nodes
      MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor
      MIPS: mobileye: eyeq5: add two GPIO bank nodes
      MIPS: eyeq5_defconfig: add GPIO subsystem & driver
      MIPS: eyeq5_defconfig: add I2C subsystem, driver and temp sensor driver

 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts |   8 +++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi     | 105 +++++++++++++++++++++++++++++
 arch/mips/configs/eyeq5_defconfig          |  10 ++-
 3 files changed, 120 insertions(+), 3 deletions(-)
---
base-commit: b4674c5af605321f2ec0c8ac5a884c4ecfad7214
change-id: 20250704-of-commits-d76e6d76a6f1

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


