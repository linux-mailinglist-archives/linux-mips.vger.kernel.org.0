Return-Path: <linux-mips+bounces-8041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C4A49A9A
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5471898327
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3526E63B;
	Fri, 28 Feb 2025 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="NENsfMBk";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="4P23yebB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD426E160;
	Fri, 28 Feb 2025 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749674; cv=pass; b=ssK7mdqq2NETTSwjHE9a2Wpwkx+5AO7yxB9EwKuM5iZ7s3aYEBADcIxAg3Wq5qRrtSG3WAKob7Gp4hCzJ2TMyYX/7iI8Aup/TolpXGMTiwgenG7Q3OKyRybMnDKma0NWEajoBSJRYu0oBh9Tg3vDyEzALEyA6zgXddv2yn7vbDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749674; c=relaxed/simple;
	bh=SDcNEbpoW0wQc8tyNe5jKS1YIfSSJNpeZYPRI5H4gGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+gJL6rQyfDSgNZvDYgp6iYVU6S1sL/o4O5Cl1pdu0hmmxOYnX4iDzIRjepjOwqCKTsVpQj8+KM2cMB8vmxLR0NjzdibiQBdF0JAesUQcIBlg3Xqn2XVAObbEEY8CJTNzelemOhq/jFLSRw4UMtpaQFYhTEFO9+veIcHsoHWldc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=NENsfMBk; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=4P23yebB; arc=pass smtp.client-ip=85.215.255.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740749647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eBvBo4ajnz1jegZvm4UnLae7AYC3PBMBNLcw9E2TtA2RVD0Mql+xDivXPuDEMxgCyn
    lgRgsQ3lAwRp/6A3Bt+dI6+AIJtA/3Hwv2tkbiXl1oUh0AjjzJmdAtVF3+KKxMjPL1/q
    EC4XWu+KRQorj7Uk/FY2fK319acBTIzMTZkr10NZfN+ZvPtJkM5Xnh5ilwssAhOmdNvU
    VPclP6abEs+wDASSgabUoyeFW1HrJiZqArAYmPAJhCI3uVPQK6MEO0y9pYamiF7F0YEb
    1gEnRPr4KTGO9QqCa9Uf9OOj2IQKwp4GIzF06RnZvxLRM/3oi6WNjgxexU6ki8pmzIV9
    pkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=o0UOuuRgat7IvYsZ5tQY6IYq6A/sTwnl3BCDpsLAp1E=;
    b=V9HPgHP6zanjbAwy+n5wH7o6sZf4/1/bvnsx1Hjf0oIr2RIVslu6mOBRsmg2hD9gJs
    Sebtmq9BilqsplI/LG/JVq1Mg6KxblAyvqr7839md2d3jHcj7/cPr7vmRtHU/sPG7W3M
    /I+WVYP2BPt7mqKxFlBbUOQxqd5LrNYqq590tFW4BHNHU3HsmyeMGSTnz6Vx7KQVIT3c
    yde2SZBWd4uEWXVPh0hoUwMxT4xxZEWWHWcLP9GgDkZe31By4pKoPKiwVVR1kwYurvUy
    olU70t331U8AXIfGl4Jvv3TDZljeKYFCHw9cNWhdwpVDnFe1+pwQTnKKxoEjyh5fsVks
    rjjQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=o0UOuuRgat7IvYsZ5tQY6IYq6A/sTwnl3BCDpsLAp1E=;
    b=NENsfMBktWN5A/NeKS6GFK5pEEBelG6oavlUUs6qkKZEl1wILcF50AEQcHoBe/JH9x
    A4WsMqGKt6nVt04i6/TctMP+mSysiSTcUTuxCOAEIwy0uc096zqJG/rszVJdgmV3tLE6
    YDhPIZ2iYHd2WURQKhXbbOyZuvh87PX65BdQbYYdVgvpNvucLa0W1fBU3tUO8tAMJfBq
    5s8xBHiPlnLuDcrdAO89yRiD1K4zSgwd89WRH7XYkUqtEEYFW/Z7XA/bZAJK3mlzNf16
    f4ITlcdCInN+0zjQfGc7bhiCwRo6WFLVprUd3k+l/dbT+H31RfTXR9Kmera7FhtPsfpO
    4ifQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=o0UOuuRgat7IvYsZ5tQY6IYq6A/sTwnl3BCDpsLAp1E=;
    b=4P23yebBtTV54XDQ9X3kEjAL+fP/z4UXWD8LvwOJq9hgtvyCF0SNLPsDSUnkLk4g4O
    AyvRGcJOns0DolH8RpDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SDY7L5a
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
Subject: [PATCH v2 3/4] pinctrl: ingenic: jz4730: add pinmux for MII
Date: Fri, 28 Feb 2025 14:33:57 +0100
Message-ID: <b5b3c548a8ed90e6203054e34a3ae4e00de1496f.1740749637.git.hns@goldelico.com>
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

The MII interface is used for the Ethernet connection of the Alpha400.

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


