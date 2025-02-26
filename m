Return-Path: <linux-mips+bounces-7990-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9EA467EF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5AEF16B955
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 17:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6C22253E0;
	Wed, 26 Feb 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="WNZ1vcFY";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="qvxkKLCD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF2220680;
	Wed, 26 Feb 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590549; cv=pass; b=X9O8X2tlBvFneVF4Ie5R6K7UQZPJuPYRp4vllTfGG3MgtGQb7jhcpJ09O7zZiWaUs0AVgYu5lCnT2QfRimGHGA6BjVnwPzmd6y2NShwZ0iJLBwDDNmWc7tNrzJ5ca6Vp6qjF9KNHdqYVY6S1DsaRLpsY56k8gLLj379KOs+si0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590549; c=relaxed/simple;
	bh=S/PiPzCVRmka0OjHHthPnqNxfP8KG+E7z2CDbxI51JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaUjM0nFe/nUV/BrdrlTIVNclvoZJT1zc2/oABOuBbcZpIc7fw4pz/DVhf2PQsMD/J61epKYdVHwbl64rbKvhMlWgbjITSAmiwWDKhtwIn0HLvP0LddTuzDDt1j2x0H1aOqPCoE1IDCgFflxylnukeAV4vmxdSs/p+79dH1/V4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=WNZ1vcFY; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=qvxkKLCD; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740590185; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XzegoGgoNCNxR/DpTLYhpmeVC7GAAlAso1mUkbxW+HtcDmzhz9+/o1bMaxdVfDcaoz
    NP8vA4dODxV/O1nBZ47ElGyqvqFXNNl4j8mlQ5d0H8m83ZJQJH77tJdztkkB3huWmDlj
    0hMuUU9RV4I2bgElzzKIFidKrztWl+kb/sMPQP072WwTokt+leKr/p0reXJRLDlWaROQ
    e0HIt3QJ6So0cN41kmqPUszQWF2V/dy62iSyhASXuRgNsXX4ATdyrlNx/UQRuxOyZWye
    +AcjfHlSRMu5NQY2hQOZ+bhPwdgrfH//E+uxARtJEHfl7sq0Yk+D8B0mcZ9XFFSE8fvw
    i3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GbY1FLE78d7HUAAoF/6GehoDyAWxuk3FuXFDDvxwZJY=;
    b=XQqPefzFDqQWJwhVAN9ETVgWHLJBGq+GVarRrcpkzHRo/KmzHh5PcWg/UXA2Zh0zLe
    0JGNsfS/BaMprSe7XVsTYPyThIoHT15UJBr6P3MV4fHlPAgya6mAos/DfkcCH5rR+R4e
    4jiUAHJZtOPz9IDYQOu7gyUElCiFy7JUanDL5VJIOG1IUFBuGK0kLAOfWzBQ/9OlUpSh
    zIPg3AIg9kvHrMMSGyARn+fq2aCeHaOVmcsPKrf6PGYZMRSccxo/CGpF8eivRnazlbmQ
    UUtLXJ7FK+vSuSxkGaEQLlV6c9X2zFJrRt+2viy9fw9miHZCUX4P1JU1FxV7Qd3RawYc
    Cc8Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GbY1FLE78d7HUAAoF/6GehoDyAWxuk3FuXFDDvxwZJY=;
    b=WNZ1vcFYyuY9VeOKiO7EFAoEYmnXfiFFixQKAYxAxWEmy61ioYgIfB1hWDbhPdN0ei
    veVdhhke7fYURoXsEepa+jnfVE/5QP3B5l5gE4zZFf1gywHGBq1hUcZZh+brcAgCwUdy
    kjSNLla3EOw34Tltdb6UqPxYKgt3ShANj8T4vmhGvkF3dnePPRvwYANhGQNVDW+FKvVt
    o5QsLz754NHf87GIxGkHnDFk6Gw9nB5hKmP103A/KnndlquRPyaktftmGgrD1zwY8HVM
    Vdm/TSVdf95qf5ZcYuBCxZkyPIIpz93IWhYpo69+KV24Pt61s/Y3MyIHItcFyIrCgPXX
    2kUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GbY1FLE78d7HUAAoF/6GehoDyAWxuk3FuXFDDvxwZJY=;
    b=qvxkKLCDRHQgEZ7+dC9e9mg0S6+Qx4kEXvP5tG/Zen8Kzp+9pa2dViqoqsO3Rbn5cL
    iB6xR6ZdKu7XH7lWl9Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QHGPfq1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 18:16:25 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Paul Boddie <paul@boddie.org.uk>,
	Tim Bysun <tim.bysun@ingenic.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 4/4] pinctrl: ingenic: jz4730: add pinmux for I2S interface
Date: Wed, 26 Feb 2025 18:16:07 +0100
Message-ID: <7541ff32baf429db4efc1e69b11fe911a75b296d.1740590093.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740590093.git.hns@goldelico.com>
References: <cover.1740590093.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

I2S is used for the sound codec of the Alpha400.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 86d285a800c5d..6a16729d0a235 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -209,10 +209,14 @@ static int jz4730_nand_cs4_pins[] = { 0x56, };
 static int jz4730_nand_cs5_pins[] = { 0x57, };
 static int jz4730_pwm_pwm0_pins[] = { 0x5e, };
 static int jz4730_pwm_pwm1_pins[] = { 0x5f, };
-
 static int jz4730_mii_pins[] = { 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76,
 				 0x77, 0x78, 0x19, 0x7a, 0x1b, 0x7c, };
 
+static int jz4730_i2s_mclk_pins[] = { 0x44, };
+static int jz4730_i2s_acreset_pins[] = { 0x45, };
+static int jz4730_i2s_data_pins[] = { 0x46, 0x47, };
+static int jz4730_i2s_clock_pins[] = { 0x4d, 0x4e, };
+
 static u8 jz4730_lcd_8bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, };
 
 static const struct group_desc jz4730_groups[] = {
@@ -235,6 +239,11 @@ static const struct group_desc jz4730_groups[] = {
 	INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
 	INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
 	INGENIC_PIN_GROUP("mii", jz4730_mii, 1),
+	INGENIC_PIN_GROUP("i2s-mclk-out", jz4730_i2s_mclk, 1),
+	INGENIC_PIN_GROUP("i2s-acreset", jz4730_i2s_acreset, 1),
+	INGENIC_PIN_GROUP("i2s-data", jz4730_i2s_data, 1),
+	INGENIC_PIN_GROUP("i2s-master", jz4730_i2s_clock, 1),
+	INGENIC_PIN_GROUP("i2s-slave", jz4730_i2s_clock, 2),
 };
 
 static const char *jz4730_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
@@ -251,6 +260,7 @@ static const char *jz4730_nand_groups[] = {
 static const char *jz4730_pwm0_groups[] = { "pwm0", };
 static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
+static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
 static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
@@ -263,6 +273,7 @@ static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
 	INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
 	INGENIC_PIN_FUNCTION("mii", jz4730_mii),
+	INGENIC_PIN_FUNCTION("i2s", jz4730_i2s),
 };
 
 static const struct ingenic_chip_info jz4730_chip_info = {
-- 
2.47.0


