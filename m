Return-Path: <linux-mips+bounces-7987-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16688A467E1
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1DBE163C29
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 17:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51207224B1C;
	Wed, 26 Feb 2025 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="FqX8vr+2";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="8ISGMUX+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B98224896;
	Wed, 26 Feb 2025 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590369; cv=pass; b=e+/XoC5JCpr2Vp2F7E34HvFNTrmLjqM6zp+1eihItwhQyrm4yqpAYfXsBHA0NHqdoxQMu6UfGl3+xJxmSxPIbTV5XeYW7QA/i41e88Ke180uCxnIWu15BskPbRlrKohvlXqGvMrD03sD7R1pi3+Y7ZMJcfYTy7fxNR3ird85amg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590369; c=relaxed/simple;
	bh=aTe8bIBDw9cNT4V5VGDu63y5GXCtXugACmEJ+LcwWoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLWV98g2rAlBovzM4yDwfr/B+PPz8H7y1Lt67fcQtIVPxghJ9Hdl8aQ+SPQjS0QErocj94YuOeOvjl1tfv9rGUHqOUCSSozxPPH8AyTZx2a/cBncYINTKjAWNLIyTwukEpSozle4oKwX9so+XuTuO4OEX1MJY1phdALPcgfVmWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=FqX8vr+2; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=8ISGMUX+; arc=pass smtp.client-ip=85.215.255.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740590184; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rZD1eBj48lT2kBGBtbS0fSK9xISjR1Ih2LIgsMlWURi6FoXmXlIOUuYBuG2gx6K+5h
    oomWFSkokJIwBDzO/8NjFZ78KlVP9bGZ73M4pinOYM4yQUxm/m02tYNfJpfoYxyCsNg+
    p3J3K9gCMCipbMkFxGYzMDbCkLT+Ik+ICP+NGI9D6z8P0KCYSnN8oGfMfVGOiC773phs
    w0yllm7xbkCSG38xar6S+kgH+vAIeBChp6yGQeTC7IAC3eCC8PxpvvkhluBlFnqlOmt+
    TiDmj8p9Jg9z8KrQ/2pWo3UMlR0Kus3JP5SI0X7ZVws9BO5nP6Ht1L7BQPU964SEGBpf
    5Dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=tg/caXYQ8b6ViZ+7YFGhj0BppCMHY7JJxwlElkLteTDv4VU6WAls1d1mua5kZbgh8g
    5m8Z2okV130cbTBDPCMrWVtBuLz1thNkCVgGoVl51pfeV5ZHDOzJIIiTYG/JHNAXAW0a
    5zJihPbo1ptRobYkTx8asS3sEqibu1AEWkh7cvW3lsIofY33FpYpw6JNfCGKjC1/S781
    U4Fb7rxAdPidX2WFg3vGUfkglZxpuY+HkFt4ukq8bHlDBcDpZia9g2NvMWkmQHh2N4xE
    MrnOIeruK721s0GDLBgF5yslo97V/iQeHAOmQ6spZUeeVf4aWn4CYE3j668BzzfHVTZ0
    aCEw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=FqX8vr+2A6JIldkC58obS549PwHkZzHqKj+35pEN/MxQpOCr2/D3VpOaGkBCOvq/vQ
    5Nq36Xrt6gae9jpRgA3tW9dztIQCReNsiv0DSid/4ob9QWGlnpitp/PBm6Bp9hubkcSf
    Ye/+wlSZPm6zCxaoVLnZ0riZkLEmrqRo3FJ1FvGMI1zqIMDTMPcNQvRE53I/FYgU9Kd5
    XhWIXi3aeZz/NKVEwL04RAGrU/UNs5LPXGzA7QJ9WjZEiZH7Y/QPOiQ6tgOqQJsVebdS
    heyQvfZsGGF3MAUJSdKeO+fXU5CXXZJlwbsKzkbCMmGueU01SOapfrPAivCM64pmHTPF
    zh5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=8ISGMUX+cjHbDdsVM6DpAom13p1mfC0EaFFMwyruaabUMS00qPCSliQXjJUoNeVPt3
    ztQyAvaNjqusS8dt1bAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QHGNfpx
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 18:16:23 +0100 (CET)
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
Subject: [PATCH 1/4] bindings: ingenic,pinctrl: add x1600
Date: Wed, 26 Feb 2025 18:16:04 +0100
Message-ID: <c42f0ad1aeedbfc90b9a5f10a36b2f5f2da528e2.1740590093.git.hns@goldelico.com>
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

Add bindings for the Lumissil/Ingenic X1600 SoC.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 890961826c6f0..84e960255a36d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -42,6 +42,7 @@ properties:
           - ingenic,jz4780-pinctrl
           - ingenic,x1000-pinctrl
           - ingenic,x1500-pinctrl
+          - ingenic,x1600-pinctrl
           - ingenic,x1830-pinctrl
           - ingenic,x2000-pinctrl
           - ingenic,x2100-pinctrl
@@ -81,6 +82,7 @@ patternProperties:
           - ingenic,jz4780-gpio
           - ingenic,x1000-gpio
           - ingenic,x1500-gpio
+          - ingenic,x1600-gpio
           - ingenic,x1830-gpio
           - ingenic,x2000-gpio
           - ingenic,x2100-gpio
-- 
2.47.0


