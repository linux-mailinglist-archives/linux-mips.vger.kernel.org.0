Return-Path: <linux-mips+bounces-3816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20854911965
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 06:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436171C22368
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 04:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4A912D76F;
	Fri, 21 Jun 2024 04:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="n2Z3CIxf"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A012C470
	for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944077; cv=none; b=dB+cIhcEYWEG3uny5YZHuHaMCmbAny9/q8+Z0YNbnklRFalvj0Hb4IFwHT6L+wRNyZcb3aNAhM1hVOTv2xOkCCgek5RbJXIIqKIvvUpwAki68S13hFhR1irnXzQzATflgE0OoYjxBJvC8ZdGhHqQ99p/O8AgW71zwD31aYRiVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944077; c=relaxed/simple;
	bh=JwYw48GooEGXKddVE3740d9/raXUKRkQvJ22Umv/L8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJfnsGIn7Qgpv4Hqn/NgGgiS8PhcCgb4WFAaLm5sF90B4ZgqWq4jof9R7E8Lu5AbIz7HVePRux6z8vEH6OZRmr4G5msKxk0PCgqNlMEaTWmgtU9f+tXHwU8R5OAn+qj/Zmzz0biRQdBkpkd3e6YJF97bGy07yEcMs7vGoRhq+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=n2Z3CIxf; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A9A402C0240;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718944064;
	bh=YT8P3PhE0XH22FCG98Odvm1akxGcHT2GR8zXg6YFbEo=;
	h=From:To:Cc:Subject:Date:From;
	b=n2Z3CIxf3/FWu/eFEq8Txh873Aa56tuZRyEa/A8gY913p4WSVF6UKbw5r2PCnhiKd
	 e/j+998Cq2AQ7KpMFXT1dYYpUe+IHiKDBfnVIxqaDfHvfT/oqtaK1gdpR2I6ZVgUox
	 TC4u8AzZPg1xHEZj83fv4P2vNzAzoJmfjpF7C13LJQLmo33IQOlxEPZOvtORZ/o4G5
	 QCeBIPYfKgzd8qO0RSsZgSho5tQqKUQLAvIy1dykAFVI7fa7iP54CVZGab38T6x3Ha
	 fdcbIr7Ewp/V9/r0iP9NHZUqFYCXrjYOY6PkmM63phcrXkT36UFzkzou1jtbGRGPbW
	 eVAwINNGWRRog==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667501400000>; Fri, 21 Jun 2024 16:27:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 460F413EDC3;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 4027A280BEA; Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
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
Subject: [PATCH 0/6] mips: Support for RTL9302C
Date: Fri, 21 Jun 2024 16:27:31 +1200
Message-ID: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66750140 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=ASfweHJq_IkPO-eo3qEA:9 a=3ZKOabzyN94A:10
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

Chris Packham (6):
  dt-bindings: mips: realtek: Add rtl930x-soc compatible
  dt-bindings: timer: Add schema for realtek,otto-timer
  dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
  clocksource: realtek: Add timer driver for rtl-otto platforms
  mips: generic: add fdt fixup for Realtek reference board
  mips: dts: realtek: Add RTL9302C board

 .../realtek,rtl-intc.yaml                     |   1 +
 .../devicetree/bindings/mips/realtek-rtl.yaml |   2 +
 .../bindings/timer/realtek,otto-timer.yaml    |  54 ++++
 arch/mips/boot/dts/realtek/Makefile           |   1 +
 arch/mips/boot/dts/realtek/RTL9302C.dts       |  74 +++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  78 +++++
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/board-realtek.c             |  81 +++++
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rtl-otto.c          | 287 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 12 files changed, 592 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
 create mode 100644 arch/mips/boot/dts/realtek/RTL9302C.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

--=20
2.45.2


