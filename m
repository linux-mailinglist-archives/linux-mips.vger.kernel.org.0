Return-Path: <linux-mips+bounces-3871-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D383913FBF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE3A6B21750
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECC18F7D;
	Mon, 24 Jun 2024 01:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qUQNHIRw"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA479F6
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192195; cv=none; b=ljvSX1+EDM13EVqdEkiekxcPmJ8H7NyPk3Gilef9Q0fEngxnBDOJgzk18V1q8rfnUiqr7qVYjD9HSf+y0qos6+TnQO24znHpos6WCYextHE2gGMVvYhpmzUn/u8F30cUkQWJpoTSnwQkc3rZVItbD4G+82atA2g/DagWNTKJ3J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192195; c=relaxed/simple;
	bh=wrfmwc2ZIwxQChd3KDSgwZ4swHto3OhEepDCNyFneos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bU5c7ohgL0IqdFxbwvQyN7Mbtb6q5YaLxldIHMfA2pmO2m93iqBsZWUdXizmsqnVCiHAGrRIzFIps+IuzYV2dwJFKUFE1hNtG+ZjyFRwWHCscpbvVm4dPUGkgHOc21e6TfNqdb0yhCjFxLXQBh6CjnZZzBLOpcc3YnTXqa50mY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qUQNHIRw; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 75C672C044B;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192189;
	bh=H+6jULzI3xqeJLjImk3pPyGyWsW3h79EAwcHUCmjQI8=;
	h=From:To:Cc:Subject:Date:From;
	b=qUQNHIRw+bUrhPkA5M9U7PkzufAc611iQ2JCqZAOT4ptYgfqy8TH251OEjE++2G6x
	 48JAwCXgecthMkC1UEQnnP7Ohb+5CKGYQrj7Ud29n7hpiISLHl80Mq/Ai6s+wrD/Lf
	 Ybgfzh7ISlkTzYQBA1KmqFDuW1taFNnV6OnpcJhcy9GqVPj/Wvoc/ubvwkK0EReCz2
	 OD/gH4cNUGDIUapcEQEs/wZq1MUkNiZ2NW/GNuESHhOwQs20OeBNq6cfWJlVSvIYuB
	 8GEh5ZVx2HbgU0QzQKIxrUgH0jFNhk/qMpMZ6uCtMf6ExwdNul36qg9uvpLVsvhXlG
	 QjCEelvjzMkrA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0000>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2CC6913ED63;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 25DEB280AE5; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
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
Subject: [PATCH v2 0/8] mips: Support for RTL9302C
Date: Mon, 24 Jun 2024 13:22:52 +1200
Message-ID: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=cAq4xmbCUuwB6dAq1EgA:9 a=3ZKOabzyN94A:10
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

Chris Packham (8):
  mips: dts: realtek: use "serial" instead of "uart" in node name
  mips: dts: realtek: add device_type property to cpu node
  dt-bindings: mips: realtek: Add rtl930x-soc compatible
  dt-bindings: timer: Add schema for realtek,otto-timer
  dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
  clocksource: realtek: Add timer driver for rtl-otto platforms
  mips: generic: add fdt fixup for Realtek reference board
  mips: dts: realtek: Add RTL9302C board

 .../realtek,rtl-intc.yaml                     |  17 +-
 .../devicetree/bindings/mips/realtek-rtl.yaml |   4 +
 .../bindings/timer/realtek,otto-timer.yaml    |  66 ++++
 arch/mips/boot/dts/realtek/Makefile           |   1 +
 arch/mips/boot/dts/realtek/rtl838x.dtsi       |   1 +
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       |   4 +-
 arch/mips/boot/dts/realtek/rtl9302c.dts       |  73 +++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  79 +++++
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/board-realtek.c             |  81 +++++
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rtl-otto.c          | 287 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 14 files changed, 624 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

--=20
2.45.2


