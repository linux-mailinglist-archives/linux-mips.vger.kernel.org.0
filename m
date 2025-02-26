Return-Path: <linux-mips+bounces-7986-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2DA467D5
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7ED57A6B1B
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 17:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33705222574;
	Wed, 26 Feb 2025 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="bntJpfrl";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="CqpcHxVg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530C22424B;
	Wed, 26 Feb 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590367; cv=pass; b=WRzRn8z9ILlubrns3FqTPQuzMSzb8mC+Xu7OwvkzN2YIeTYLF7VAZRae5fUekdNNgubeXaRmHOwpG/GcH39zXpmLkT5paUAUhL9+VyIKSAUcuYiPP5Jv2eSp9b1eolba47obg+N/HppkHOvTEk2OwBFP0S3sfOmNcEyKWDyjBZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590367; c=relaxed/simple;
	bh=5mwePBCwCXvsjiJovyQttiroz9hahldAy3COpDFXjWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OyZdUE4F/uJFPutgdYfDIMUeZvdrvTuiTgW4s8YNuWYWGXfsTpjIpHiqYABQbUxxjNt6jp0c9YV5AbSKv9iG3U/CM+OAf6p0rVjYw0/19giar3nhiwuT92hKC3UTTeDkbJ+YfMj1VMHZx9uFtq06HHLmV7079ViJ8Nw7c7Eiup4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=bntJpfrl; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=CqpcHxVg; arc=pass smtp.client-ip=85.215.255.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740590185; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BXigO50lUmZDJc0eYvf3TbRwC+uMMNBCFub7Y/bN/cND393aAJHc8r2+MipqqBTJvi
    ehFSYQ7+bMVPsTkIV894KEBdPdzIrwd4Klv4TIvtHuj/hrorWRMa9kN3JNX8z9iVycBH
    9uNLtGaibfIC3i1eEH8D9/w7BPUVhSgwiWip0atGJSOlXBU8r6DXPmwVCiYIYGkkfs+O
    UjKosVfW+5lLbeP4CIONTZXIilHIL2axO24xcM5puJpVoCgy5pdaYnum7C3tbaBJv5H8
    wqmop0CSff1u/zJtnDCGel8eoP+C08TpgyCnJI4oFRsOWl9bO79xCLI0GcXk2cuab6za
    C6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h8CwoKvG9Pwt69O9WiZ6bp0I9e71uskXS7kq1c8Dssg=;
    b=Uts6vIT0qQg4lnoDXsLmI+v2OuyzhloIZ0BVBLCq3D6wAeguVv9Itn5j1nsX08Rytq
    AIr2DJHfrDR2FGwsz7zGAzZ43eoBbF+uBL1ecg1godWJGotJ8Nt7M6Z9fS3zjGPcj6iE
    f3hVOxb0bxJxP1xf6HgTo8Upw7lysVRijE47yFO26CO5PMcRmFmpbdWTghLENMgzN3kA
    jTCsonPzI3x+POXh+VkhVbHvZEsBOSGtDUfgvlNTBpSTXKr1V8MchPrlpnAaYmcknrxo
    P4KJZVMmlczPI0s11s6AsSBe8RzBvGJGYshoddWc62vMU/brGKbeNJzAqorJkVy8fy3o
    v38Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h8CwoKvG9Pwt69O9WiZ6bp0I9e71uskXS7kq1c8Dssg=;
    b=bntJpfrlseWP8h0sdy9qc9UnUMRqZ+bivXTegTZYrHrGMo9XZs8iGDnSaGSq+TjqpQ
    aYn403ZfGXyFmftqWtQiSVGQwKPviZgP6BRNvCvjLCXIwc1OzHI8pMsZkcIZPNUNuIqp
    4h8IEqV0nkNANnAmX3Yt7rNOKgRD01zABdMGQcMVnCL3GA5HHGbMaZda7drkD9A33J1e
    dYCdDSbBLlZvqDYc3z1J93LgdjOj09o6ruDMSMF3qHB9C0JCWs4rf9vrJCMXTelGci91
    o/XwII+qMXJfyQT/TRT3s41cSHaKoxq1oJk61I1f3nD7eg4BHObsRAv7w+Bv4JWjOFs5
    m/Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740590185;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h8CwoKvG9Pwt69O9WiZ6bp0I9e71uskXS7kq1c8Dssg=;
    b=CqpcHxVgfXE5jvVZ8w26IFrOVvbulQCs9KYtf4HKz1hntaychfninFZ3L61JfYeQj1
    MBrimqkHPDmb8ThaRIBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QHGOfpz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 18:16:24 +0100 (CET)
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
Subject: [PATCH 3/4] pinctrl: ingenic: jz4730: add pinmux for MII
Date: Wed, 26 Feb 2025 18:16:06 +0100
Message-ID: <17fd3f58a3c565b6dd6e2a7dc2783fe20474381b.1740590093.git.hns@goldelico.com>
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

The MII interface is used for the Ethernet connection of the Alpha400.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index dfdc89ece9b8a..86d285a800c5d 100644
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


