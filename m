Return-Path: <linux-mips+bounces-7988-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E26FA467F9
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5772188C31A
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 17:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445552222A9;
	Wed, 26 Feb 2025 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="d4NSzTHy";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="jzU8aYoK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA31221701;
	Wed, 26 Feb 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590548; cv=pass; b=eeaA7D22NCughijhWR6shBaswpSWedKP0/6Lf0v8GiD64RyI/Xljd2HqTXD1NEht6IpisCq06IlIy0cS29Z7JQH0SeEfSkTUGrvDx6GRnYMASXrmdvbmHHTPQTTe+vIcIranetU9qPmgFGknmgtMzeGxZiN7sl0N9/0wSUSMdBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590548; c=relaxed/simple;
	bh=zaPQGZakIJ5e1FIIOipa9PeTaMKtCnQvOQQNRGVUfcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gD4p+kIRxQpBzMnhDE3A93UCZsRPmXpgTw7Zy4UwJ2HdEBMHfi2zfCg4NZROdLM6oQOZsLGMHDq+1cqWmYrCp1CBcZsdjaRC6MnXlYLWiQrJs66kP5bvQNLbNeuDXFBFSkE5w8fNikEN9sL9TZUaa1i1QYKqvhgG0hthXiq3zkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=d4NSzTHy; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=jzU8aYoK; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740590183; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kpdTkzwL2m3RfU15u8+8R8+tE295/4UPz5vcYu2WM4aUrUb/bqSfI1XmDJgB9KLBHV
    jH2LRtS5HvxsGOnGRQJsassiUM0NgP/kCQZGIPJ9TuzaJDlwTfQtHj15b8v8sI7hMWa6
    jZzfURC30LMDHu/jKEoFeMmiNYYA2dnjtfd4+yYYH8ohfYSLb6RLOksXkxY3xn2Ipiul
    HDGi618Q4rB9cJGjK5UrxtWfRlsNGcAa41lTcXsOdNn1dkB19mdnnElaZoir4Gt+4qv1
    Xz7cAzOqVe4dApVzBYObhAZl9ULwYhsv0mLHb8yOoi1yKMGe5TLnJux3XuO2ifbeLW3J
    3oOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590183;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=4v/XI+GHsK5iNyWyu0JIeFOmhfLFNQbdUVuziJCkONg=;
    b=JDN74OXl0Bw4P6g1LetHoVIEUjHkh8fKSkRNOq9LUbY8AaQGFM1vUuw7SBffvhwGBO
    RamJ54dhaUnW3RZaEcZp2PCpuWsjHcmt5a3PucaVfK+nr3W2ao8AYryCjmgNktLm+qDq
    RuUUGR5xGV7PDAwY0s64Q3Pm6LXsSgLz82lN81kMvqn4PI7t741c8Orei5czef/l9OI1
    E7yGZaTjCKvJZH6yeBMyohkETwUSwIQtRciyL0euzoj/FV1K2a+2mD+xxwScKoG42nCF
    2JOoGOXlhf6eDbll/ROFURAwpFWIeEtZBJZTk6HYSb9E0KdrxsSW4jloeX58pSlMuHEj
    bWuA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590183;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=4v/XI+GHsK5iNyWyu0JIeFOmhfLFNQbdUVuziJCkONg=;
    b=d4NSzTHyZLeC3k5Z+DJRjEYCPrbsNpKqVmYAZV2m5K+ouQ2Zupgk8fjhK60ocVXghz
    Gl4lv6qhO/jVgltqm2OdfX6ijP9L9yFZayTm3ltXQQOEMFxkZCvAIOwF+KEqgJu4GWsG
    Ev+OPTwgBhyfaGMc60+/e7mL9/pLyTqwbqEoiy6MHVOiXa2g7+jAJGAnsdVw475KAydS
    XYCTIBejVTjNzFANVa8dCw+idT9gGAySoRqVuJ05PUlOJ8yyqm+dGoy+e6ejoBEZaGdJ
    RZCrm6Vdq9Ub1CFRevVP441gC3WeHcrUIEOh4QRDp4bWanDlylkJFnJNPrSbfqtq+Q1N
    g9zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740590183;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=4v/XI+GHsK5iNyWyu0JIeFOmhfLFNQbdUVuziJCkONg=;
    b=jzU8aYoKhju2bqGEWFzNlod30Lv069KlILRo10wp5EdWAAp+eli72oNeHSmKfo/DEK
    VTwb5/ghmRuP5LNIFBAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QHGNfpw
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
Subject: [PATCH 0/4] pinctrl: ingenic: add support for x1600 SoC and MII and I2S for jz4730
Date: Wed, 26 Feb 2025 18:16:03 +0100
Message-ID: <cover.1740590093.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

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
 drivers/pinctrl/pinctrl-ingenic.c             | 259 +++++++++++++++++-
 2 files changed, 259 insertions(+), 2 deletions(-)

-- 
2.47.0


