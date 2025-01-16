Return-Path: <linux-mips+bounces-7481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90940A1386A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4EF3A750B
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 10:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66031DE3AB;
	Thu, 16 Jan 2025 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cu+X2rrj"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049171DE3A4;
	Thu, 16 Jan 2025 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025173; cv=none; b=m9TgD6Q1nyvP3FEXZt9etq9/qhtBsX1ExLRv83p9yCFzVTGgwK2FMrF8a6TL29yuYDNMJljzOufERZXw6TG/OzEQ2jPpdg3aJNdM1Hll/SJbrgvblDCfva9rx10yK8DON2wOmQ4lqDZzBXTzS0lQtIeXdFhdUe5QVsZQ+E+6oGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025173; c=relaxed/simple;
	bh=hzbr8u3GzR8n6lml4w/5G6XN55lwyIy0yVr5g/YHkjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K4oPhbt3RQA9cdKTgQzT4zLm2zFlHpn+36fSftbOIKcgziK3s2PExl+qtf/f5m6+ZXxBgUGNiY6WV4kfHsycgTYqb/bWPqquLDsAKFYdZGo50GIju0Lb8oq+/eWIIhHA30ZO4QP+zZFOtTw0fhMnCYBC0+QXa9SaPagXQML5wyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cu+X2rrj; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79FC6E0007;
	Thu, 16 Jan 2025 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737025168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yuyaXHAY47z3uFO53zBgofYEVSBIL1GlxK0FAhoHtd0=;
	b=cu+X2rrjszsYqy5jJz4BnhRBjQAPEw4aYsHlmcfBQgxa8hiN+FN2Tvmlj3Pg1/wUyd9Dtl
	MhYfAoPQuXmSpoiy0g9LCwBo9WdnY86d7uIlJvhSl3VuLm/3FEVjvrc+PrhvaczKfCW/+k
	e0LLdJI1L7qBLHARWHep2lXL8WBysd6B10WpMrQkRQ1rj2NuszmZGDICNe0N2RzjhVmRjR
	HAJwgU1xWwNXpY0NrFsjLmZcJCHpgTj6WX9nIbE0UdkU7Bw4jp4sFV+bEFo7yEEQuC/YH8
	BLlrUQXWUKdwhLzeqGpFMbyIBDmWpzgDiu36lIr2acOJvVdfJQ1IizGBWeNeAg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/5] MIPS: Allow using multi-cluster with a broken HCI.
Date: Thu, 16 Jan 2025 11:59:18 +0100
Message-Id: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIbmiGcC/32NQQ6CMBBFr0Jm7ZhORSCuvIdhUcogE7ElLTYaw
 t2tHMDNT95P/vsrRA7CES7FCoGTRPEugz4UYEfj7ozSZwatdElEZ7TTKy4ccLSCXfAPdtiUytT
 NUGtjGPJwDjzIe5fe2syjxMWHz/6R6Nf+1SVChUpVp6rJSdRfO++XSdzR+ie027Z9AWNi1j22A
 AAA
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

I initially proposed to add this information as a CPU property, but as
rightfully pointed out by Jiaxun, it should be more of a Coherence
Manager property. A few months ago, Jiaxun proposed a series to pass
the address of the CM through the device tree when it was not possible
to get it at runtime. This series introduced the binding for the CM
that I reused. However, there were some parts of this series that were
commented on and needed to be addressed, and I don't have the hardware
for it. Therefore, I've kept only the binding and relaxed the need for
the reg property for the eyeq6 case.

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
Changes in v2:
- Use compatible string instead of property
- Link to v1: https://lore.kernel.org/r/20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com

---
Gregory CLEMENT (4):
      dt-bindings: mips: mips-cm: Add a new compatible string for EyeQ6
      MIPS: cm: Detect CM quirks from device tree
      MIPS: CPS: Support broken HCI for multicluster
      MIPS: mobileye: dts: eyeq6h: Enable cluster support

Jiaxun Yang (1):
      dt-bindings: mips: Document mti,mips-cm

 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 58 ++++++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  4 ++
 arch/mips/include/asm/mips-cm.h                    | 22 ++++++++
 arch/mips/kernel/mips-cm.c                         | 14 ++++++
 arch/mips/kernel/smp-cps.c                         |  5 +-
 5 files changed, 102 insertions(+), 1 deletion(-)
---
base-commit: ffc2ac99f7a0dccb6389ea5e318a95965d882dba
change-id: 20241115-cluster-hci-broken-840a78f72aae

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


