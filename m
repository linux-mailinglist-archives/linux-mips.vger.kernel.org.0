Return-Path: <linux-mips+bounces-8057-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B2A4AA24
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 11:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88D016C41B
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95AB1D5161;
	Sat,  1 Mar 2025 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="a0XUIxvi";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="hDtuC0UJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113291E49F;
	Sat,  1 Mar 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740823430; cv=pass; b=ejjZAmxrvDIAJAJ3coOx8C2EGZOWqykE/sYbNPXnOx9Ua+EpBa5FgWP1aLnRPWkpFOPCIU3ZO4H0cFJFsYNwPhI8u46vOFI0NE5UHTlfULdbrfKw2cTQS6csnzjJxI0+n34j7iEmG9QXkJKXqckuhkz6EYrRvUHft//o0ArtM/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740823430; c=relaxed/simple;
	bh=XrrRdLCdDP1wT21Bmhui6OyNeFE2aRvgWH2YcXFXoM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cv1GO4z2aQ1gt3qkJa1eaMxmeQnF2sF0/PtkJ5LDnSUO4xIE8pXSUG8CZmYg2VXcVv0WNNpvmEjczMCE2287Pilvvo7QKe0zxcPvpgGjTA5PSd1gJaAU6tJJwFqUxCV/BsjvKdpmKL9TYBb7FGtWk/gjkyO8h5N4/IY9r5O2Uzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=a0XUIxvi; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=hDtuC0UJ; arc=pass smtp.client-ip=85.215.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740823244; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HFczhW6miLMkK5Yx2xo5G8ne3i3YoHoalPiyvkti0mopHiIY5goPqUwYEtiKYfMN2k
    Ijt5SGvXhm0b3Fs0sJgQzMvH/Vd+D4SSbXRlWVU9ahxLLuyX34nJleuAeuEDMCvrEwZV
    sylP9L7QtAvf+YDp5Y68utqo+4DHIi80FRVA0QJr2NYMlxnw6VYvIW5fu5VeuDEm147G
    0vz5MLqXWqkBz8BKKegibiNjfjuMIapHCPqwrO5KvbzHxwjNIekJGM/4/iIhFPeQLa//
    nV+fvbH5eg+k0egjvLQRNAXOo4KC31tFckGtBA712F54h7AkZ1DU/e+fp7Fpomwa4pVE
    vWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TwKE/cqsQ4G0f2hoYzJ+N6/G1eyULp43pxnkbVXKruE=;
    b=l8ICm+q5WOkL2E0NJvaevHYVNqU8Tygswpnl/Xc/e1MrOcD+wZQ7sybY/BB/bnxbWj
    FkCfb4q1Cq7pOqtVMvWuFmDwPEMMLL76GCAZB22g1GitP2ntokZZmvf3zaEBHmET8MI7
    LJHW4B9qRs5dhm9ZK1f26iz871DlrdyINCMvSSiMupLFpGdY8ZyKHBlZGaYvMF0tnjcM
    HpKpQa8xW5VhcfpOtPDcZY+mvQ+b0nx11aapZ0FiQtKPlJmU1Yphh0jn2oXid2r5iGKp
    yjLmDzpUQniYzA46XEkgRcmwjNvBeREaAEqoP/lbIwPLLMd0Pjop9WGU80mTgCsN6D5y
    6JNw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TwKE/cqsQ4G0f2hoYzJ+N6/G1eyULp43pxnkbVXKruE=;
    b=a0XUIxvi6U1l7GOo7YbPzv1GFuRpJzo/3KLbJk/Ydm1z2F+BlW12lhBFS4S/wmJqS/
    jLTszU4KGpnBd6bDuur1hkpQUpbDWx39YtobHOrwqdxtiwTZLELZU8//j9iXQpen0eNR
    q9TeZdB2X6NHX3pINwgvsccoz12G59YLFloZfbdZEM2wHV/ukuqUzaAde+DMcugo4j8y
    I+hChUhnoKHGDaBmk7SJPhbhmjmj7TVzEu3H84pFnhRwdOkYwjSyGM4NKBqaKRuS6800
    iyXbWkOY555/fmdcdLzd8w+MsvdTP6U4W4JmohS9Z5JntfLpcdr7FJ6kUFx9XoV1/SYj
    X1nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TwKE/cqsQ4G0f2hoYzJ+N6/G1eyULp43pxnkbVXKruE=;
    b=hDtuC0UJorgdCbX9DhasknLH7S+uXNB472PC3gr5BplrtrCJKafiqn7SwvmoSAO9ys
    QJFLEwftM0nt4VU+vzCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjEZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc121A0ibfg
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Mar 2025 11:00:44 +0100 (CET)
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
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] bindings: pinctrl: ingenic: add x1600
Date: Sat,  1 Mar 2025 11:00:38 +0100
Message-ID: <a9865c817d5aa9046dcbb251d834c1dbcc4e9219.1740823241.git.hns@goldelico.com>
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

Add bindings for the Lumissil/Ingenic X1600 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
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


