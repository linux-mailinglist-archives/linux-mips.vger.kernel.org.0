Return-Path: <linux-mips+bounces-8043-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B43A49AA1
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D93118960E7
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF0826F464;
	Fri, 28 Feb 2025 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="NvR09UkW";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="iOLEU5+l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21626E174;
	Fri, 28 Feb 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749675; cv=pass; b=hJ6soHzXtbqiKMLLvlgDmO1T3ibJ/QDxw46i8PK9KbAcMiM8BmM0nT9xVYqVE0/M0so/5csjXRR1hDD4rUN/iiw6s2wY1oBZrAy0w3r3ysTQ4PopwC+yHWFI+PreJ9EfuTUuzF/r6z1HNRYXSpmlc952i8SPdFGe3HcaJ58K5mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749675; c=relaxed/simple;
	bh=inW6kWRfLwX83R7GkMrs9hxoU4ptG0rK9NSS9c9Sq3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4b0k8A+7EQ6h8NzUhnhdxLXo71XWfiotXhJTUMD9/Ii3/VQsWHoCVFT6xzwfEQPVsTL0lUuBaSYsezJvuMkBOmqiMHYEz39Dl8o2oGchjkYVHXatJN4PmFjEkubZrj8ZW13l+CHZhblAJDsrwWKAMe8sDgOLzQTAADw3EbpHqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=NvR09UkW; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=iOLEU5+l; arc=pass smtp.client-ip=85.215.255.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740749648; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q00Fw1bS4BlwDx3aW05t4/rbM0SGSXmpmK1IEbDEM3B/QlsfqzQY8K/ldv7o4NNCI6
    ZNelVstX08dg2eipdMWXNDyfIsmqoAmXPOMq8ZQZWniucwKv4E0ImcMUimDKx9h6NNPB
    qWN0DgWxhv8kK/NINLR+KsE1IodY0A8fodfw9e3QZmJFpimJflbNr5K/w6bqe5MOhVib
    UWQW1t8ylKujwfdvTHstMO4sXMIOeaibrVkX5zNKYGf9ehaVATSbvUjv96A79e6j1VlG
    DcQ9qVuZKcfEHXrPw24KA9mtrcCT+7JiCacCea+HLDJmaGFmMTqXbyP4iNs6n6dFZd61
    s7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749648;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BnO9kMP5EEMlcNUu37VpD8+x8A8PIolImzQ1UIPCtdk=;
    b=BIMjRj1dzTaN7wS7A0ABE9/8LCh7ty+QWx/S9W3w4/+GU6tmzNdh49/E1J+UxfbuHB
    dE6N5nEH0zpOrBc0W1o6ckCdEr5SzmkEUN8mek513lGmGN7Ss2bKq0zgUc4Psp1LSPP4
    0DovsdDWVouXlFOcDYqxGcGdK6LY8wYhB8UhNLtCn8l+s1erPgXF4a0aAk3HGfPJhhde
    6zV2dh89xKvOXnofxc/nPE4CmoNBdINDwCzsZZ5Sx1N/ZgWHFwYmsmvHCT6QUAX6sofa
    sNuHtde9H0x9AcHr4bImPm+71en/tI68t0wdiP6QxB45e0GJsGZus6z5aUoca+MjHyPl
    2wTg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749648;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BnO9kMP5EEMlcNUu37VpD8+x8A8PIolImzQ1UIPCtdk=;
    b=NvR09UkW4JlArNoT4fBxqa0wpfokZoyI6jFvxDZbjHe6BUmDLsCPBEZVWgs/JY1y/m
    9/MoKc7s2CXECNJgEQmzox5NvuoS6prS4wLob1grOvOm7DeZxdQABiTTxZUHScQfptju
    /WcoJmRH8YpV6maCUPnzlI7snktUS7wKHlpwawl43ExscxB+gNIkyZoclhYHGdE843Ih
    P7MerO2JizLdm9rLb1lmHgHFCFs6htP4xp/KZvUDE7G2hrtSob1AmuTJQaCy3XdQQN0e
    QOmxTxUtAgvSuqKDAbAFC2HmqQTzCDOwrBcSd32kJVmtR/m0KEU3xg1YxcKif/PsD+Tu
    bm1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740749648;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BnO9kMP5EEMlcNUu37VpD8+x8A8PIolImzQ1UIPCtdk=;
    b=iOLEU5+lnOf1ofLk9OsIwsg0CHMM3+XO2TAUqdhcxcHDlrOEYrhUofZQwl9IJ5dJwI
    5c7aj18CHuQgKoN4WBBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SDY7L5c
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 14:34:07 +0100 (CET)
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
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 4/4] pinctrl: ingenic: jz4730: add pinmux for I2S interface
Date: Fri, 28 Feb 2025 14:33:58 +0100
Message-ID: <1d50f0c980155dd22ccd164a6d281e3ac68e7446.1740749637.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740749637.git.hns@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
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
index 08e082e84f5c6..6d7dc077c373e 100644
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


