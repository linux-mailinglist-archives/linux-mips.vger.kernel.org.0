Return-Path: <linux-mips+bounces-6843-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347D9E1F29
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 15:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A6D4B39AAE
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE2C1F1314;
	Tue,  3 Dec 2024 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nj6Qod6/"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742981EE00D;
	Tue,  3 Dec 2024 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234158; cv=none; b=l4oT3rQwAm2ue4qWuVVrbPlm6cE/3z6tDNBbN6L8d6SpcHldipL8RPl8hEs1NcoOJtc3ZVeDiCXG31GNJ8s0/dpQ7b4xTxfqlpMe4TXfWtRYywuZH7Qd2d/5CwselDebffTbLJfb9crRikD2jn3qwV/0wHjQBpSPWtQkP8/ppHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234158; c=relaxed/simple;
	bh=EC9Dl1l1MQgi7BjluXyVcMHnEDdLKfTGSqTeB2Yn/K0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UGioOeyZ7FfNvmsTBIyxGPqzfNRnmMiOirZoPhinyPGnflY9jZ+kdPA+hWP3hg+P/bKWMA1Z1i3G97rpUtTkiAZddQ0hEpiRRj9indEl7PABBGE7ESIXeVW7tyz7uSRyekCm6S2EMz9OXU6OdwC7mCidtwV427tQwKB+Kqkbx8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nj6Qod6/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E8DC60007;
	Tue,  3 Dec 2024 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rvvx0a8RYQ/dRE3IBReGFV/D4LCSjgLGQJuojR4U/sM=;
	b=nj6Qod6/4KlDinuZVy7Q6qV1D9eQs4lotapjdpSPkC1a+GNOfppLL35gKhM64DrgIZcc6J
	OU5AWW2Os8xpO7FB3hnY1OexrlQH5cFScYV7UiroXIWOzww6EXWnZ4E1R/ach1r4elSSGY
	3CWYNsuijYRzlKRvwfpSd/NY9Y6AILPz6XDgGWfww8Fld8gDK0el7MgiJx7360zd/RTDre
	yBhuS0VMJVP8NwLtSywD7kz22kvm5kenYb0mHN7UyDj9j1NPDtsdCSrgPL71fhOUJB3JUe
	KBEN28adD9RmbZaAO+XJZE5Ghm+KCFTJlKqZ9eFmJO8wkjaNfQEZLFMp36Youw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/6] nvmem: rmem: cleanup & add checksumming support for
 Mobileye EyeQ5
Date: Tue, 03 Dec 2024 14:55:43 +0100
Message-Id: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN8NT2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNj3aLc1FxdQ9OUNEtjA8PkNIMkJaDSgqLUtMwKsDHRsbW1AC6mgFx
 WAAAA
X-Change-ID: 20241203-rmem-15df9301cf0b
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

This series is two-fold.

 - First some cleanup to nvmem/rmem.

   [PATCH 2/6] nvmem: specify ->reg_read/reg_write() expected return values
   [PATCH 3/6] nvmem: rmem: make ->reg_read() straight forward code
   [PATCH 4/6] nvmem: rmem: remove unused struct rmem::size field

   Those patches were sent on the 2024-07-24 [0] and saw no feedback.
   There are small improvements to the commit messages but the commit
   bodies stayed the same. I did not label this as V2 as the EyeQ5
   compatible (see below) wasn't part of V1, and I wouldn't want people
   to think it has been through a round of lkml review.

 - Second, add a new compatible to rmem for the EyeQ5-specific usecase;
   it parses a header and does checksumming at probe.

   [PATCH 1/6] dt-bindings: nvmem: rmem: Add mobileye,eyeq5-bootloader-config
   [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
   [PATCH 6/6] MIPS: mobileye: eyeq5: add bootloader config reserved memory

Code is tested on real hardware, an EyeQ5 evaluation board.

Have a nice day,
Thanks,
Théo

[0]: https://lore.kernel.org/lkml/20240724-nvmem-rmem-v1-0-d2e3a97349a0@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (6):
      dt-bindings: nvmem: rmem: Add mobileye,eyeq5-bootloader-config
      nvmem: specify ->reg_read/reg_write() expected return values
      nvmem: rmem: make ->reg_read() straight forward code
      nvmem: rmem: remove unused struct rmem::size field
      nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
      MIPS: mobileye: eyeq5: add bootloader config reserved memory

 Documentation/devicetree/bindings/nvmem/rmem.yaml |  1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi            | 22 ++++++
 drivers/nvmem/rmem.c                              | 95 ++++++++++++++++++++---
 include/linux/nvmem-provider.h                    |  4 +-
 4 files changed, 110 insertions(+), 12 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241203-rmem-15df9301cf0b

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


