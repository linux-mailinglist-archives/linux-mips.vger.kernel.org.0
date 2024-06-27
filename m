Return-Path: <linux-mips+bounces-3969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E93A4919E3A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 06:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962221F22D34
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 04:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D26B1CAB7;
	Thu, 27 Jun 2024 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="DoSBtp4b"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A428118C3B
	for <linux-mips@vger.kernel.org>; Thu, 27 Jun 2024 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719462808; cv=none; b=FzhhkFpc6qaEmYplvRUatNla4U0JHeobT8JXxyTBVexAgmpfxzM88HjOSl7Vd4N3ithHTtJ2gqaxA6loDeSFFhfHjNFU0juhTKQ70MyaiAa0cqEM4xp3yBqMruS+sWj4d+lYWdAu5EuXVq2HLWqlfbVdbMfNsl/nsGFHIdaDX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719462808; c=relaxed/simple;
	bh=HkKXhQJ2s3Gpn7ht2bpswjjFfOejAR2SehA9hUpJook=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOZfgpCNN9Ec0Kbj/xBdHZiU36j32aoeyHRZ02fSLgN/ClO3lKNzHQkFm7PzGX8l9li5qCau6LmgA20hUejavyKsE9pL8lntDyaucYdPErOTuYIPBTcva4JlMbQIfNctLRgmEg9U2SlkL3ohMrlA+gEL/IdQ+gkNE60FQOnK2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=DoSBtp4b; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5564B2C01F6;
	Thu, 27 Jun 2024 16:33:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719462802;
	bh=VlSev23TkovLAkLueBzWCXRXtr+rCN3WgesPRHKn+S0=;
	h=From:To:Cc:Subject:Date:From;
	b=DoSBtp4becHpy687FfEFQDToeFKuHXWcQqNsZ2E+Qu0ZsPraAigYKmDmM1bSk4UhC
	 QZyEtLUnoNC5+rfH8VEQG7zAp4GayxpTYj/V7iRgTy0+z1RyIpzw30NZdHUaQOE2wH
	 CADlMrELWhhAxg5tcx8yiH+3JVnI0H2a0BJAh6+Bk7WsaNZk/zi6hBRdrkSAd/wlPj
	 aijlu10IqMGcnN3qkHdbJz37ZzMLL7E7rOAvH5CopX4sOx+9L+9lG1gP+6QfOoAaZ8
	 KKNGQV14EHv1T53vjZovyVnMbzi52cE907rO3T8SZRv06geZc/2XcBB8qLte/OAF0g
	 LYpTEGFAQ5q/g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667ceb910000>; Thu, 27 Jun 2024 16:33:21 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E05B613ED5B;
	Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id D89C328078C; Thu, 27 Jun 2024 16:33:21 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/9] mips: Support for RTL9302C
Date: Thu, 27 Jun 2024 16:33:08 +1200
Message-ID: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=667ceb91 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=cAq4xmbCUuwB6dAq1EgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds basic support for the RTL9302C reference board. Currentl=
y the
focus is on the CPU block stuff. I hope to get around to the DSA switch d=
river
eventually but this is a small start that lets me boot a mainline kernel =
on the
board I have. I initialiy started with code from openwrt but have paired =
it
down to just the clocksource driver and devicetree.

The first two patches in this series are fixing some complaints from make
dtbs_check for some existing realtek dts files. They can be applied on th=
eir
own if desired.

Chris Packham (9):
  mips: dts: realtek: use "serial" instead of "uart" in node name
  mips: dts: realtek: add device_type property to cpu node
  dt-bindings: vendor-prefixes: Add Cameo Communications
  dt-bindings: mips: realtek: Add rtl930x-soc compatible
  dt-bindings: timer: Add schema for realtek,otto-timer
  dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
  clocksource: realtek: Add timer driver for rtl-otto platforms
  mips: generic: add fdt fixup for Realtek reference board
  mips: dts: realtek: Add RTL9302C board

 .../realtek,rtl-intc.yaml                     |  18 +-
 .../devicetree/bindings/mips/realtek-rtl.yaml |   4 +
 .../bindings/timer/realtek,otto-timer.yaml    |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/mips/boot/dts/realtek/Makefile           |   1 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |  73 +++++
 arch/mips/boot/dts/realtek/rtl838x.dtsi       |   1 +
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       |   4 +-
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  79 +++++
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/board-realtek.c             |  81 +++++
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rtl-otto.c          | 287 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 15 files changed, 623 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
 create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-=
2xge.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

--=20
2.45.2


