Return-Path: <linux-mips+bounces-8056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B0A4AA1F
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 11:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFC21896EF3
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 10:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A9E1D79B6;
	Sat,  1 Mar 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="QcWBWI20";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="YDfmcgkT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6F1D63C2;
	Sat,  1 Mar 2025 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740823268; cv=pass; b=bHKMsISFuKyN2wwzsTSbTM3SSz+7molF/8A4n6OajrHWlSOAT8hMw88rakUYW0qW8un0t40Ep04EUg0nYtoI+cmlqiSKtnv+NJs/0/4IdX431xEl3FATdRVmEkVHWZ18HiF+24KD0dtmV38OBuSVivIdaUtjNDR8Gd1qgtm9Hdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740823268; c=relaxed/simple;
	bh=SEVwul9X6QC9WMuIafTdGvjNM5sdF0+jQSA7cRo+0xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtMGPz1t3us+bGsh7tH0lkIxR953nbQIzJaQRYaeS8mB+/CCA+isEyPFX4EjukFgh9wU67zWukC1ZjTVDQrjr7zMg7FmXYWCLmEcWoEl6CDbh4BiZ+mOf1vVSb7CGpY9TWR35UB0hqKPJ5i/zOkMQPradhMTGNStNtIBKmx2Pkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QcWBWI20; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=YDfmcgkT; arc=pass smtp.client-ip=85.215.255.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740823245; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ldSY8N1fexuziLq3q+wuO5CqptQJRqLMy3oyURX8u3G+9ElNiENx/IccU30+PQM1eX
    oECUeFaPWI7VXe3r4QCti9WxAmYZZqY5wXEpG2TuJtdoyDPWdhmqdMsqGj2r2FQNBjXU
    bliboGEMEESqHjb9iTanQlzwB3+4/1+1EP9CWqj2iLLMpml2bpakLsdhjQ/OJmLjXwwR
    ZseuDX69A8b7OVkVkitcqmDh63X615mkhc1ATrWDhtGb70NtDBWj+N0D65ecUYdbC/mX
    svy+inek75fiwL7V/Xek/c4jZGV8fLG43SUWt1c+zR3Ksqc+vx7hIlZfyADp9zNwgkkL
    YZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823245;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ufCVCWGw4NANqVVXHTLp/paqlbdcRLa5Y2T0kNxcPK4=;
    b=UbtDIA40A3/osUakgLAM8DBolSx71Z8XZiwKLVNC8zIPrWupntzkswzdZZcoZAbK2u
    gTDljKujlOMolLqgZ7xgcSeUzADyaPpYqo7u0G7uq49fG8xahLeFvkK2IT4Hba+HGgS0
    Eg96dyrfUj0WoisEpIqaSHgnGx67zfhmsHO4TjjI9L1P0Vp5vYvxu2DtrLyJAVcMh+0T
    rCpPL6I5NHOQmQkJEn/kaW9AUwGjONRgANAuV/E9c6jKZQi84ZI7alNyElZ7TukzSbv1
    K6cquIhf5b5yuoiTaE4s8LdhjKx6Qenq5T/zv0E8O/rhyr1q5NinF86jsyAqnWiUpW73
    Fw0g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823245;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ufCVCWGw4NANqVVXHTLp/paqlbdcRLa5Y2T0kNxcPK4=;
    b=QcWBWI20hScX7uC5grkQp3oBaOuPmPq3vaNlrcZ9VfqwgoIU5HRBrfYHgp6kugvSgu
    qJu2Tr43NdqioD+YZKkNJsvaUWpdwxcQi8SeNWnDt/H7PbaE6kfj9iZHLa89ysu1wyeG
    ldZX6xDc06+7dChlzHMtjEXTODTcjAYQKAyfmPq7oF/hYwHUNXkcA4XAKQ65td9bnXwh
    4MMvvFgmwEN+1nyDLxhxo+xSmmMpD3qre3P9CCVDWitj3HQSzdg1UaucmUpgSMnrRRpg
    +8sQFtp2OCfH6N6TFGk3CfGdGNTmYZq6iLx38f8P3GxTbw2TwSAJoNbPM65b6aNqNxL2
    3saw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740823245;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ufCVCWGw4NANqVVXHTLp/paqlbdcRLa5Y2T0kNxcPK4=;
    b=YDfmcgkTBnQ89C9Cx+aWMZzr6NSbGLJVGsM273oZniU96pc1eixWlrFk5LOZW5GDdb
    fmc5kzUfWDrLCpnAciDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjEZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc121A0jbfi
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Mar 2025 11:00:45 +0100 (CET)
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
Subject: [PATCH v3 3/4] pinctrl: ingenic: jz4730: add pinmux for MII
Date: Sat,  1 Mar 2025 11:00:40 +0100
Message-ID: <972b31e1fce03808745e53df17315b29e2bcf696.1740823241.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740823241.git.hns@goldelico.com>
References: <cover.1740823241.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The MII interface is used for the Ethernet connection of the Alpha400.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 8413cb8bd355e..08e082e84f5c6 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -210,6 +210,9 @@ static int jz4730_nand_cs5_pins[] = { 0x57, };
 static int jz4730_pwm_pwm0_pins[] = { 0x5e, };
 static int jz4730_pwm_pwm1_pins[] = { 0x5f, };
 
+static int jz4730_mii_pins[] = { 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76,
+				 0x77, 0x78, 0x19, 0x7a, 0x1b, 0x7c, };
+
 static u8 jz4730_lcd_8bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, };
 
 static const struct group_desc jz4730_groups[] = {
@@ -231,6 +234,7 @@ static const struct group_desc jz4730_groups[] = {
 	INGENIC_PIN_GROUP("nand-cs5", jz4730_nand_cs5, 1),
 	INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
 	INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
+	INGENIC_PIN_GROUP("mii", jz4730_mii, 1),
 };
 
 static const char *jz4730_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
@@ -246,6 +250,7 @@ static const char *jz4730_nand_groups[] = {
 };
 static const char *jz4730_pwm0_groups[] = { "pwm0", };
 static const char *jz4730_pwm1_groups[] = { "pwm1", };
+static const char *jz4730_mii_groups[] = { "mii", };
 
 static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
@@ -257,6 +262,7 @@ static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("nand", jz4730_nand),
 	INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
 	INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
+	INGENIC_PIN_FUNCTION("mii", jz4730_mii),
 };
 
 static const struct ingenic_chip_info jz4730_chip_info = {
-- 
2.47.0


