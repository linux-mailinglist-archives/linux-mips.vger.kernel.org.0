Return-Path: <linux-mips+bounces-8058-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88DA4AA29
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 11:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 371307A8686
	for <lists+linux-mips@lfdr.de>; Sat,  1 Mar 2025 10:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D601D7E30;
	Sat,  1 Mar 2025 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="YCSL+ZCX";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="wcqUjdTw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B031D6DC8;
	Sat,  1 Mar 2025 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740823436; cv=pass; b=pKiElAUIXMmsVhOtvQT6IgrIgHHZ+rSsuHGiAtmwRbKhT0CZ0o27xQ541G8GGvmRbDD2HlSwuS+Ij8WhdB8ZxIp3E02dCXkx2BUc4t3EsE6T43jrnWRtORMeQHuFlbYwgfnmOcho/qSIUDcwQM5pstEI2LdX/Eqzr4gAoKvxJd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740823436; c=relaxed/simple;
	bh=Rn/w/lrOPl+6Z/ejlk3nn0vA6sXamygIoAjnNZ6QoL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GMK2+MkFC5dhzKTs+4InvjY37dq0a3dYEGIMon6K0OhWUUwDe8R9mxYO6yeynuQgdVLw87vxU5KKC7ZeJPk0uP7Qh83r4djoA9F/OKw/rmsnNZ38eWG6wKeNcBT0i/Q4PZhaAew3V1aMwl0ENktkDSQqUhCfy5p83Hz3ACkNw7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=YCSL+ZCX; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=wcqUjdTw; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740823244; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VfGLBiyuuul7M5Jh4cuZyMbLX48q2HddResoH33nydVhvupAHaLjbd+fQwTygLu3xd
    xQcK+rz54QnUCGEP7PvUmzj4qIc7NE+zgVMQnvLC1FfsgZ6o1WeWmbNr3y83WeaTb1l4
    Qsu5aoipVHWePuQ83IDJdcJ9eEScC6IqS7t8U/cpxIHhUQrY77Y0Yjgj84/dfqgg6huj
    gidh9rXRglovd9s+TiEu8tzOcjMOzKgCvizjenapxJ8brTOXcvhncNhUuckBLrWH0M5r
    6eGvqJKshk4altmp/zIC60nmP/1jVLnQqxH1PhBkBkSLuqd9Wupdxdl1fFIwm7HYC1EH
    sVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jQHkoK6XIUS+W/XJnNra9kSPHkGbD84yfUBClpEfK14=;
    b=owU9sDCrg3+r9Qe9omYgoNZObZ3GUHd+/YYbtFLwdflvTXi9/06XZBIVbQVdyLKYBl
    HpPjL5Tb0StQHs4RFCQ11CD0goKi5kVy4pQMj2QiX2D2eJOMb1nAIOjyFUFeiryVlcSj
    tfk1vBylRl5BSqrHrSckciTEuIDNatEfCCOgC2890q/NQf3GC4oBBhUiDyju5SHTbp2B
    HPUfTxiDdRCGEceNTsSVQtZodqU20kx39AOdWxn+MVuNFjQ7mbTHXzm4+C40UDiY/d6H
    HvB4prxUgvt85PBDdUjMq4+BUikOOyb342bWnFbP6+/NBvJt304YOaTNvNDFNHKbG53d
    TaEw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jQHkoK6XIUS+W/XJnNra9kSPHkGbD84yfUBClpEfK14=;
    b=YCSL+ZCX1HMFEZz0lYwmft2xiKDXGknLSxammPr/P93NuBVBDPMHj3fdnva4afNSx+
    PfUjryNeVZkebUjnaJn/McDNyUTDySQsmWqYV50GJQlAZCPPJ76oNzEQDoVjuCuvS/Yo
    WE2AyV1z0ELj3xMAlMJdJru4/xZ6AG4rhGtgQyQOu33/hD6hDIHzYBln6l/feE+0cAkD
    y4+v1clU2BAmvqR3EPIVrxCwAtBbADkZ2n6kmBM+5TeRChOyRxgS5MtYtt0n0r5PtEag
    WKXWRYqAqYeqqoZBvmKJR+DE9ljDFJdHDoyz32Q5JI1Xwb+3nPHZS1G2VPvbd38Ty/7C
    FoAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740823244;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=jQHkoK6XIUS+W/XJnNra9kSPHkGbD84yfUBClpEfK14=;
    b=wcqUjdTw7TB0GskEKt703SipSmVMBCBl7OhgFwLkja9cGIzoyL3FExijRRWlXg3q8N
    ywFNz5gv51mfYqD+HmCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjEZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc121A0hbff
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Mar 2025 11:00:43 +0100 (CET)
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
Subject: [PATCH v3 0/4] pinctrl: ingenic: add support for x1600 SoC and MII and I2S for jz4730
Date: Sat,  1 Mar 2025 11:00:37 +0100
Message-ID: <cover.1740823241.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

PATCH V3 2025-03-01 11:00:41:
Fix some nits reported by Conor and Paul during their review and add
their acked/reviewed-by.

PATCH V2 2025-02-28 14:33:57:
Fix pwm5/pwm6/pwm7 pin groups (each one can be muxed to one of two
pads while pwm0-4 have only one pad) for X1600.

PATCH V1 2025-02-26 18:14:53:
This series expands pinctrl support for some Ingenic/Lumissil SoC.
For the jz4730 we add MII and I2S pinctrl and general x1600 support.

The x1600 parts were jointly developed.

Code was tested on LX16 board (x1600) and Alpha400 (jz4730) and
on CI20 (jz4780).

Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>


H. Nikolaus Schaller (3):
  bindings: pinctrl: ingenic: add x1600
  pinctrl: ingenic: jz4730: add pinmux for MII
  pinctrl: ingenic: jz4730: add pinmux for I2S interface

Paul Boddie (1):
  pinctrl: ingenic: add x1600 support

 .../bindings/pinctrl/ingenic,pinctrl.yaml     |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             | 262 +++++++++++++++++-
 2 files changed, 262 insertions(+), 2 deletions(-)

-- 
2.47.0


