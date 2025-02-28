Return-Path: <linux-mips+bounces-8039-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9834A49A90
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA9C3B872B
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE55126D5D3;
	Fri, 28 Feb 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="QJkOEMCn";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="QtpN3u/x"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638071DFFD;
	Fri, 28 Feb 2025 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749669; cv=pass; b=trm8YbbVFkwX/e/QJy9jy/ex3x3AZWv2ESDyJQKckwAg7lv+rVer0jriLxs1MjYVhEgWnRMay8t/yIhWnaP2m3PDj+3bUsIlcUI87JwIBTpb2ZsytfcrihNelsiOgMhzf0Tg1FnEPDvIEilT3cmvWgwx6ESUhkwPD/mXkR8FJkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749669; c=relaxed/simple;
	bh=+QXAJ6Due7ag8DHLEXxVo8vqZ5mIDBhxyds7hwve2Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jYFXHhZPpAMiBXKEjMDgSbL0/uB9mQPzkZxDro+HeViREU9XjHBu23FHpL/ZboxHC9kKvNUfIuPOfuuLXuir7YmXobKluTXLGZmn41FKZlQ/gUau5qo58oL3wFHIKiRzUbgBeetJ9VZxhPcYxA3ry7hDGEP2PRxu0vDhmZ+Rv28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QJkOEMCn; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QtpN3u/x; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740749646; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gu0k9z8hn8hUecmD9At9LzEpjLxSCS7r+xLTpNibxLisE7z9YmeJ34c3IfjZWZ2Bon
    HUWfzMSUl1uebiAd/mLyiCIWQI71iu+lydHQO+gwWfJVuEPGDCNAWJTKlbDbQSRxxisI
    fhwbcwZ1ZAvbyO+9v2p5v3mnupHzLk4V85avsxWl2TaLgvNjvQxxg7EWAsLJXgCoVHUA
    MYrwun7LAM8MlVcljIAHm14cNSvlahuX71jcpagppgNUEOBgpPfEukI07rQmlYZqq73C
    bM/h6N6GG61HOd04pf3/KMPEdVWdOrk4Pi/GyVsavnY7/r5H9YQd93P14NU8P0jVF5i1
    s9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=v7NCNzZEF8ezbYStZO8Aa+bw52ePCswc3Dd8SuRG7mc=;
    b=ApwrsgJ30AKDqNsI7AJJrA0zzavnKv6nFpoQpvgotz8CI60x/hXhQ/V+8rhluyV1DL
    3b95GrPp9tlC6mteAjqVP1O1uz5hhrTz3s/iPGLIC9s4XYFd1HAQKl3E9zF9HY2zTcxd
    ivt1e3ZMgTl1PVi4fwxpeGwfX9w/Wt0bYn/lYkq90viG8z03546imJDJNPCat57qmK9t
    XOMHyY4odj00lpu2WI20n+oA1LMHQ+ajXfMmV4N2WSlTNW9WqyS3a1KzVIdTxPEaaPqM
    L7qnhzR78fnGG4uEDvZnt7YWI+WCFyEQd1oJf69JKg49xtNsSSfrpdpkhIUE+iTxWL9y
    s54w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=v7NCNzZEF8ezbYStZO8Aa+bw52ePCswc3Dd8SuRG7mc=;
    b=QJkOEMCnMV1B2t8jyB97UK7yArDMgQm872W/Mttm4HPhmU6A1VnuPkChCV5rbRbdWc
    b1lJIMNZ/bAqvMJsaU+3JQsIGfQGTh+Mp+ocf1SBpMb6TEUpyKkhv5VPTsoYjkNfIDiT
    gLl/oX93MK9z/yDUBhJd2idqGF1AyuJF3X/R9vEWSF3iD55a2TT+kKZxQW48suKMmh1J
    5c+g2WG3RUSlBtaM1+OTVWSi3xCYjWzIhMn2ea72kf7Y1x0Olv/fmtuAansW1preSUG1
    uDO8fbKSSRU1Ttc9BeHnfUE4AaipYY+kCDGaR0pltNabeCZ4kqnAU/rGT4Jj/QX9+4x4
    hydg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=v7NCNzZEF8ezbYStZO8Aa+bw52ePCswc3Dd8SuRG7mc=;
    b=QtpN3u/xY0+eUOx6/YOgUWfP7vPwXZHTz5d+H28Iqirj0c5UTKF3KbBYY+CcM1rWf0
    o0V3/zh+Fc+sBEHV25Cw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SDY5L5U
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 14:34:05 +0100 (CET)
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
Subject: [PATCH v2 0/4] pinctrl: ingenic: add support for x1600 SoC and MII and I2S for jz4730
Date: Fri, 28 Feb 2025 14:33:54 +0100
Message-ID: <cover.1740749637.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

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
  bindings: ingenic,pinctrl: add x1600
  pinctrl: ingenic: jz4730: add pinmux for MII
  pinctrl: ingenic: jz4730: add pinmux for I2S interface

Paul Boddie (1):
  pinctrl: ingenic: add x1600 support

 .../bindings/pinctrl/ingenic,pinctrl.yaml     |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             | 261 +++++++++++++++++-
 2 files changed, 261 insertions(+), 2 deletions(-)

-- 
2.47.0


