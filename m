Return-Path: <linux-mips+bounces-4230-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18E192C9C6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92AAA2846F4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17A31EEF8;
	Wed, 10 Jul 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Ed625jF8"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F384206C
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586141; cv=none; b=e4HcujMV4ypDk6WwawnCiw0SJ5hkB6xiKV0x0XrF8Cm5JF/yuZkhgu8KGOhI/lmEfxwYtjIQDqgca+qbtqXXq1d3IaAIzu76t0bc3SLFCz5U80juAFeZnMmC0ZiQlvIh+iW+njuF0Dcn8BKUgIKfC5cgnFpp78lSicnwZMHJsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586141; c=relaxed/simple;
	bh=Knv2oDITBOp35DC8sAXA7mIdTujdcjgcpPJ1dKJ0cZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ndyeZK3YXaGUjNmb76PTC89lpoAFwnNs9Cibq+yINX6KbeCK8bMFp2KixLgzrcxlzOPPBV0t50l13iYIbAD39sqCND/wLN9lxakGthk/cZoGk5crUmGSetpZTOfVQzekSbDqpdr0xKBX6MDSYWaslYIQlHyGC0LP0lJyYNPWcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Ed625jF8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6EF522C09BD;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=hpR2WMekSSBeIpSo/5yfpP+YYCEOKhw22w0OKtz0nL8=;
	h=From:To:Cc:Subject:Date:From;
	b=Ed625jF8Ro4cwcbmQEudz/XCnwpjO+x0b4t3V4ztFuPzP4tgBa9hrFagynbOsJOfn
	 Lsq6hySET8lAn98tvu50vEUuYG830jz/k2ByJlmLOaJFhE3vS6sceqAipPgfB8FU7L
	 qH9ETGWP+VpBeATQFLOGJ7Xu0PI8ClOGzhJnenIQQh957wSRcD4WYawGOwWTFMPK4V
	 9LVQKQgmKkZSMY4wjsIMB8uBzzn91btJ4kq+6qGtnC/XANDb8RWspwb18+l2hY8f2H
	 ybl9fYUUChvlvPR6nxKNwvhUnHOv6M3I40ANzqSklIt7JJbsIOGmlY7V2U8NljfyWo
	 8XRXMAy+KORVw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920000>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 011B113EE2B;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id EFB7428206C; Wed, 10 Jul 2024 16:35:29 +1200 (NZST)
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
Subject: [PATCH v5 00/10] mips: Support for RTL9302C
Date: Wed, 10 Jul 2024 16:35:14 +1200
Message-ID: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=cAq4xmbCUuwB6dAq1EgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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

Chris Packham (10):
  mips: dts: realtek: use "serial" instead of "uart" in node name
  mips: dts: realtek: add device_type property to cpu node
  dt-bindings: vendor-prefixes: Add Cameo Communications
  dt-bindings: mips: realtek: Add rtl930x-soc compatible
  dt-bindings: timer: Add schema for realtek,otto-timer
  dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
  clocksource: realtek: Add timer driver for rtl-otto platforms
  mips: select REALTEK_OTTO_TIMER for Realtek platforms
  mips: generic: add fdt fixup for Realtek reference board
  mips: dts: realtek: Add RTL9302C board

 .../realtek,rtl-intc.yaml                     |  20 +-
 .../devicetree/bindings/mips/realtek-rtl.yaml |   4 +
 .../bindings/timer/realtek,otto-timer.yaml    |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/mips/Kconfig                             |   1 +
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
 16 files changed, 628 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml
 create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-=
2xge.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

--=20
2.45.2


