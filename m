Return-Path: <linux-mips+bounces-6759-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024229CF136
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 17:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 331F3B387A1
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 15:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BA51D5CFA;
	Fri, 15 Nov 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R3f/sIlL"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075EE1DA23;
	Fri, 15 Nov 2024 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684619; cv=none; b=hZ4eIlVxEhyerQNZU4J4ffJpZo3AQt7/yI8mN8vqf5et+GGxy2hwhWUliWDMXz1IqH8WROYarrN1iYvTsTCwDYYcC+bG4ZIcXeAHsBt1D91EIuI2CABHDJCZXLk9FGIjlXey1gulXNsa+ZsYLip7i4SHLlw2PRKm36T+0NKPIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684619; c=relaxed/simple;
	bh=7cKWxnI2OZqFbQorTshJhiFbBdgQ7Za0qIySvryeVTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BFqo34In+/pxlSw32Nhxt/f3AlixiMn7SeO7XfuTFdNtkBq2eSc9cpPbCgFh545CvIPZ2NxhTnw0a9QhX7YwmTJKDuNBCVz4aiPgMC8cvn+NVSPMcZeicr0WVdiKI/28OtyC/6owLhsb6rqBfToGEtWQcJGJK1yNQNdI5T1wKUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R3f/sIlL; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB166FF807;
	Fri, 15 Nov 2024 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731684608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QEG8U0t5YDcfuRT+zXtJR9s+sxFLAhMTdN/JlCoLu8U=;
	b=R3f/sIlL9qiB9OdA3rxDg/kMJQKwQMxQfC35RWKO2VGsr5NUXwwwWCK4VlmTiOW1cqBfUV
	CllbDlYXNsaiojjQ00gHw4OzaW2ZsLdAjN0PvAr1Z8ELdxfgSm9YoUWfDpAjLPgUN+K1Aw
	uJ/m7u+d151yW4gKUkZlKG98aiAK+XHmnAuQuB40zDt97tHFROY5Nthhm40X1Q/zuqS1hl
	SH8XYE/rUzzUoaY82g61R1+GC2BU879+l+gvCeKN1JPtaeDMIAUsfhPJfZC+/QJv5gDe9g
	bX+iGnF3RRJcLaFlOXcwLiXipUc/23aVdJq5VYDFZvVRsN0Ka2QZ7BHMQvqIdg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/5] MIPS: Allow using multi-cluster with a broken HCI.
Date: Fri, 15 Nov 2024 16:29:53 +0100
Message-Id: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPFoN2cC/x3MQQqAIBBA0avErBtQMYyuEi3MphoKi7EiiO6et
 HyL/x9IJEwJmuIBoYsTbzFDlwWE2ceJkIdsMMpYrXWFYT3TQYJzYOxlWyhibZV39eiM9wQ53IV
 Gvv9p273vB1Wac6ZkAAAA
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
the reg property.

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
Gregory CLEMENT (4):
      dt-bindings: mips: mips-cm: Add property for broken HCI information
      MIPS: cm: Detect CM quirks from device tree
      MIPS: CPS: Support broken HCI for multicluster
      MIPS: mobileye: dts: eyeq6h: Enable cluster support

Jiaxun Yang (1):
      dt-bindings: mips: Document mti,mips-cm

 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 43 ++++++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  5 +++
 arch/mips/include/asm/mips-cm.h                    | 22 +++++++++++
 arch/mips/kernel/mips-cm.c                         | 16 ++++++++
 arch/mips/kernel/smp-cps.c                         |  5 ++-
 5 files changed, 90 insertions(+), 1 deletion(-)
---
base-commit: e87100a0b90df5f239e6b290f7db67e16bcda85f
change-id: 20241115-cluster-hci-broken-840a78f72aae

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


