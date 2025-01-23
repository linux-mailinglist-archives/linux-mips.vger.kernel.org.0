Return-Path: <linux-mips+bounces-7581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8DA1A26B
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C1C3ADAF3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3535C20E031;
	Thu, 23 Jan 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dmCe+yBT"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2920DD79;
	Thu, 23 Jan 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630128; cv=none; b=O8ideNKF2nlJxk97pwm18jRwxWIoJZJbkJrN3xTw459tORiRMIL3ECjGJuCZjQdXgBPLtt1eu6m47FZNYuzavFuZXcgKbZuKZS4LXLUBN1v3KUEsPJUxT+JsJ0xpnc8Z4qx440zInCuOuewbr2pVN4rG+LcAhbVWv5Ql+68AJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630128; c=relaxed/simple;
	bh=nWZKPaU/sVitw02m1p8ZjGNj05UUtvrBLX7NWqob6nw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UhXPYjqca/npWv/IZ/e36MyenVxCMV1yzZo6BKsCCS2FrX2PMCvUpqbh92Y56LkR7GF/dexOVyWmP5ysi2NR9zT1XJzn9CDdOx7/exzqeDXC8JHXqk2hdjYgk1YO2hEcR9CPhSTxEL4UbSZhsznPzkke1bQk9K5ZcWVsJeZLmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dmCe+yBT; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67ECEE0006;
	Thu, 23 Jan 2025 11:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737630123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w1fu0SJV+JBUbRVhDayZd5JkmE/6nQ70nEA5yOhZebw=;
	b=dmCe+yBTZ5Of9a8j680B6qTlPuKiKOtbbq3WQ0n+2yrC3nAQc3Pnrq9pRm4FwIpJh3MbXS
	SNTHhSs+hu6HY529JliNKvtpsNDD0E9n1EF32JM9MCbKK1T1oc+q9lO7PNRcuDhLJrxH5s
	9+0Abv597K+yT1Aj8TVou67Q070c1Asbp5Wx8QGUNJGOfsJ2ewgk3tyIo3Zn2LlzIX1dR5
	VLr+eO5a9owy02FBGF3eSgtLrY6y26x1bzLkZqOuEta+c7rCc9VJo0aYSRTjTmkY23h9BK
	K09wy9mAlNYdxdlXZEKlNhX0/MeCroTOyJaZAQbJ7oRtpZjFBQQRrPoT3jCXLg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/5] MIPS: Allow using multi-cluster with a broken HCI.
Date: Thu, 23 Jan 2025 12:01:53 +0100
Message-Id: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKEhkmcC/33NzQrCMAzA8VcZPVtpuk938j3EQ9elLjhbaWdRx
 t7dbuBBEC+BfyC/zCygJwyszWbmMVIgZ1Pku4zpQdkLcupTMylkAQAl1+MjTOj5oIl33l3R8qY
 Qqm5MLZVClg7vHg09N/R0Tj1QmJx/bT8irNu/XAQuuBBVXjVpAvTHzrlpJLvX7sZWMMoPUgqA6
 iciE2J0KbXpagUH/EaWZXkDu0RSEPsAAAA=
X-Change-ID: 20241115-cluster-hci-broken-840a78f72aae
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

Hello,

Some CM3.5 reports indicate that Hardware Cache Initialization is
complete, but in reality it's not the case. They also incorrectly show
that Hardware Cache Initialization is supported. Unfortunately, it is
not possible to detect this issue at runtime and the information has
to be passed by the device tree.

In this third version, I rebased on v6.13. I also addressed remarks
made by Rob and Krzysztof, and endeavored to add more explanation
about CM, explaining why we now need to represent it in the device
tree.

My initial proposal was integrated into the series set by Aleksandar
here [1]. And the series adding the CM binding was here: [2]. The
patches 1,2,3, and 5 have no dependencies while patch 4 should depend
on this series [1]. Actually, those five patches should replace
patches 10, 11, and 12.

Gregory

[1]: https://lore.kernel.org/all/20241028175935.51250-1-arikalo@gmail.com/
[2]: https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@flygoat.com/

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v3:
- Provide a more detailed explanation about the CM in the device tree binding.
- Make the reg property optional for all compatible strings.
- Use "mobileye" instead of "mti" for the eyeq6-cm compatible string.
- Address and correct the formatting issues in example and description.
- Link to v2: https://lore.kernel.org/r/20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com

Changes in v2:
- Use compatible string instead of property
- Link to v1: https://lore.kernel.org/r/20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com

---
Gregory CLEMENT (5):
      dt-bindings: mips: Document mti,mips-cm
      dt-bindings: mips: mips-cm: Add a new compatible string for EyeQ6
      MIPS: cm: Detect CM quirks from device tree
      MIPS: CPS: Support broken HCI for multicluster
      MIPS: mobileye: dts: eyeq6h: Enable cluster support

 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 57 ++++++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  4 ++
 arch/mips/include/asm/mips-cm.h                    | 22 +++++++++
 arch/mips/kernel/mips-cm.c                         | 14 ++++++
 arch/mips/kernel/smp-cps.c                         |  5 +-
 5 files changed, 101 insertions(+), 1 deletion(-)
---
base-commit: 24da360081efcc12be3f346b6822a91fcb142027
change-id: 20241115-cluster-hci-broken-840a78f72aae

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


