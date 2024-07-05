Return-Path: <linux-mips+bounces-4143-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1A92802D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06DAEB22A13
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B3C1B950;
	Fri,  5 Jul 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qW954NKA"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28314292
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145738; cv=none; b=c0iu7E2+9c8sozsesdQ0D1+r6M17xlSHGIbdxW3kuW+EaJ5kCQJXNmV7OBdx74dMwZPCkRthL7RfauteNONdRqqClHHzoa6MgDCHLaR0GZvCpnxRsNdlSIoW/CHGV5U2CFWD7SART/8eIyLP4btWFhVFOz+sBDmWEYqv6jWrbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145738; c=relaxed/simple;
	bh=Li9UJWF21WK2qgpZJmm/iekBICw81fetEoXerreNhcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=outuk24aUrIFXG+87dKbr6GgGh+Ztp0agse/KLQdMNn9LD/tGzvUDW7vNiMdhRVcltJ49LJbcxlPrKFo6oTQadq5SE2GEahwGsHgTpZTwjIECo1PMIiFiruTwaknU3PcqN/tpsoi63nRcjEuh7vaZXGZyOpDmC/+ion/bmzoETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qW954NKA; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 17B8B2C0241;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=oVuIFkUlXwNllfALTpSQH2TRhtGnRuLM5WxG/PFhMRc=;
	h=From:To:Cc:Subject:Date:From;
	b=qW954NKAlY/KHn2uryDhtg+/3fgYAKKOuuJjeyCZ6ASBOZvBEc3jSosPm8gQuqkua
	 dvF4kXKzjwSXpg/bUcGEqoyi5vr+bu5jfpWYTOAQNl4LHZ7XfvXInvBc08lVYz42cK
	 2iRtTiLH7aShV/l/HHaf7CtPhEqNfVE6yNwQVlOep9G8j4PnaOpHDAExAaqM9FJNjB
	 0UjdrkGlw3NL2AZsd5lVjKEqtM9FiY38LCqJB+VAFtBrBz1hC9SrVuvllbcXLHCnz4
	 lmBajoqqqU5SMUKUYr0sM5Vg54SMaEbgQj5TYltZDhmGshUZ1OWImn93z93Ouma7iK
	 r8CloPzcnoh9w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0001>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 73D2713ED5B;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 6E007280930; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
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
Subject: [PATCH v4 0/9] mips: Support for RTL9302C
Date: Fri,  5 Jul 2024 14:15:11 +1200
Message-ID: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=cAq4xmbCUuwB6dAq1EgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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

 .../realtek,rtl-intc.yaml                     |  20 +-
 .../devicetree/bindings/mips/realtek-rtl.yaml |   4 +
 .../bindings/timer/realtek,otto-timer.yaml    |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/mips/boot/dts/realtek/Makefile           |   1 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |  73 +++++
 arch/mips/boot/dts/realtek/rtl838x.dtsi       |   1 +
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       |   4 +-
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  79 +++++
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/board-realtek.c             |  79 +++++
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rtl-otto.c          | 291 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 15 files changed, 627 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
 create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-=
2xge.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

--=20
2.45.2


