Return-Path: <linux-mips+bounces-8055-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EEFA4AA1A
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 11:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B41D1897E6B
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 10:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A7B1D618E;
	Sat,  1 Mar 2025 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="h3oWTPQM";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="HIf3I4AJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973501C3BEB;
	Sat,  1 Mar 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740823261; cv=pass; b=hHhkjW1wn5CUrgLfvoS4QaHCyC6ualJu50mN05uk8ecgXeNVDF8YYNL5oR6tqlChxL6RVkF+wkSo4HFM2pZfY7VhAOO7sRkrzxeXjqItTyPchv9Ofd8MBAIaHOWvORdrngTfYbR+GHSUweRNpNYv/YV5ZHR6buh/R38lMzgl7H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740823261; c=relaxed/simple;
	bh=uKJdpQCSbPPB5HN4bVQy18UmETpaVnNAq6aLSQSEJSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWm9tbXQOwCTvhfhpivxzciI+DzOKqkurbmeO468qLAH7e3qXgw4AKAhD2fsYfTHPqVV3Kh2FWE35csD27CCVXClmhdJ8S0+eBQ0RJsHGrQOYAEp3X3BKgvYXgHJrUvQa8giPnbtVGRvQPncohNSqnkksaSNsqifvzcZTGzAHLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=h3oWTPQM; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=HIf3I4AJ; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740823246; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=B2SWVCpRtiHYOnoSPTrC//h8W/FMt8MSTVvI11FbpR3DUyg+BHeZJ0hIsH0j1BkQzQ
    nushWZ012isEqP5BxIkchEPC2QQ25atLMxL/GdMBd590bQGStxGBSkHxvKuzyRQ7Hpot
    1/ddc1MVA4SjaIhnH0bp3+1btIPm76P2WRJWLnqnEv/h84EA1/tnYId1yANC4QEzGZca
    8WDt1Jwp1m8L+CFIIuwa93voXpS8norsnn2NMn/tN2+N506BgrSVoHlPJBIPSOJYx5Ib
    O1qWHozH5KfFeZQqgmeuLnDMfwJqKifNySuTBP5rYXW9TKt6ZED8jEtwdyTTCRBiKx54
    ZP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823246;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lnTVppnPxxg35JdZy9tXb8y01L1leqSyD1ShwbOMzbI=;
    b=Xhzp6kUVmB2qDttEKZVuHaLFwXVwNPHrifRbeLhkVB/dzRZxosbXQacinRPZPBBMqG
    H0Lb5In5crfQrqOCRp1bQKDlmKuhCrigickQq5lk9SHo+O8gUHJ8FMznX7s24f+3QwAl
    UUoektqlLYmCy+4+FubNm2oMXmO3zrV2pBkUI/tuo50FjuLMlWAn8Kz1ZDp3o429O3FA
    l2V1wH0XLr7rY1+hBEnOdpe8ysPYF/NqJir5GXVbiDLctwvgXXnfhfeS7C9/D19ooEKl
    a+NKgzbNfwSs61oY+9+lspGVim0eL0EOURVEVZQ4PCnGeJTIH1z/BWPF2gyoFShoKKLb
    FnYg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823246;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lnTVppnPxxg35JdZy9tXb8y01L1leqSyD1ShwbOMzbI=;
    b=h3oWTPQMxIn9iTmbJW42r8jjkyymEJKXIro1c9/WNNvwKYcW3gs68t9bdWX32K1g5O
    0mDK0hRBegscqsC3hyj/vRe7Gb9YETDhkP/E9D7Xr/5WJTHkpbVeBRoyHx1+6uRauwPZ
    OaUKXkQRDXU6RynAT/LNijl08WZDl+LQImHapaKoRxCh9r6TXFjvUTQMH2JYal2IktVy
    bs8dazgmZktHrW1l7V9wprKoRu0jWPpXC2EBO2qEmycMepkczynEU/g664mMZAFbYmp9
    g9qn9/Ugv5Yn4sqrwmdPOkSVEXypzsbrOVYMU3L+VOVJXYCzSEcRXN76CGLq63hp2dce
    ztrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740823246;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lnTVppnPxxg35JdZy9tXb8y01L1leqSyD1ShwbOMzbI=;
    b=HIf3I4AJuLvimbZgyTEIemJmhJdEGfpIvZ6UJ8wFrSxmv1f3QEUw5NHOkaJiJsKmim
    0dDGsFb3ooelsX0QGiBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjEZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc121A0jbfj
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
Subject: [PATCH v3 4/4] pinctrl: ingenic: jz4730: add pinmux for I2S interface
Date: Sat,  1 Mar 2025 11:00:41 +0100
Message-ID: <7e79b16be569fb0f501032b2b6ec726e4a09411f.1740823241.git.hns@goldelico.com>
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

I2S is used for the sound codec of the Alpha400.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 08e082e84f5c6..a9e48eac15f62 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -213,6 +213,11 @@ static int jz4730_pwm_pwm1_pins[] = { 0x5f, };
 static int jz4730_mii_pins[] = { 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76,
 				 0x77, 0x78, 0x19, 0x7a, 0x1b, 0x7c, };
 
+static int jz4730_i2s_mclk_pins[] = { 0x44, };
+static int jz4730_i2s_acreset_pins[] = { 0x45, };
+static int jz4730_i2s_data_pins[] = { 0x46, 0x47, };
+static int jz4730_i2s_clock_pins[] = { 0x4d, 0x4e, };
+
 static u8 jz4730_lcd_8bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, };
 
 static const struct group_desc jz4730_groups[] = {
@@ -235,6 +240,11 @@ static const struct group_desc jz4730_groups[] = {
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
@@ -251,6 +261,7 @@ static const char *jz4730_nand_groups[] = {
 static const char *jz4730_pwm0_groups[] = { "pwm0", };
 static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
+static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
 static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
@@ -263,6 +274,7 @@ static const struct function_desc jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
 	INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
 	INGENIC_PIN_FUNCTION("mii", jz4730_mii),
+	INGENIC_PIN_FUNCTION("i2s", jz4730_i2s),
 };
 
 static const struct ingenic_chip_info jz4730_chip_info = {
-- 
2.47.0


