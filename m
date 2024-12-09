Return-Path: <linux-mips+bounces-6902-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4209E9B0E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1E9166096
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 15:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F1D1369B4;
	Mon,  9 Dec 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="afyuIw5g"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCDE233139;
	Mon,  9 Dec 2024 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759981; cv=none; b=l6uWMjnkDOP1dP2x00X6orpGB4FZfvss7T9IjiesxGmqByoViGLpfte/PHj+5t4m//xY7mnOoYndLzfOi+4rz8P5UIZqUlBz9+YYvcfmpoMGAmbU84juU3muzlG9sYVdLqVHu7uABsNHAycAe2qp8+ODa2L83XqePfhhpq/taoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759981; c=relaxed/simple;
	bh=7n6UksG2jsbDHkJth7c5TMMS++85KDSagCJy47iVCFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V5Ro4oPfBcImiCop8Y4ddbKbqZnOih5lg6xDRq3uKrP9FevzXdeUWOgR8u0jI6gbSu3IZ71LCMd1ZPUmNmP5gIwlAfEV+h8mZZGIwhzSQW2SSC1VVsjD+vGVdFgCoGiqAFdR9lad/CX2MKZuagUVvW3yJRc/4WwPZR1AoOUJSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=afyuIw5g; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8B7820003;
	Mon,  9 Dec 2024 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KMaa9W6ss2OcXsv4sVNHPaakUP1XwxrFXtUUu7rQv1w=;
	b=afyuIw5g1UlzCIZHYC8W1WMyzxKIYnLraB0qvEnVpINOyJSa2mVIkGJOlrmS7ZU4A9YSbh
	m4xx/TcvCME3Qof3QbCbdM6g+3ZoimYXtuZtBTvgVaLyrzE3K3xfhRx4WcLzZXNXaTXFUL
	VPdRS1eBGgeJHRG5SD/cMeD/4F8vCF71Di3d079UAWNTg2fTKJBU6Hlf4ieI8JKAwR7vza
	z1yfLFU0eCeqLRqUAKNyZAt9UiHc4Hxm3zG3lDfBpWSFMxqdxFtwaiHnyQ9Y/ose+2ZLFu
	hz8lB6lAKyA1wDmJctzznBfdcN4lfrNeYZLzYhnc1bjIMuEHQr9i2/1FU9y8tQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 0/6] nvmem: rmem: cleanup & add checksumming support for
 Mobileye EyeQ5
Date: Mon, 09 Dec 2024 16:59:34 +0100
Message-Id: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOYTV2cC/13MQQrCMBCF4auUWRuZSSNSV95DurDpxA6YRJISl
 JK7G7t0+T8e3waZk3CGS7dB4iJZYmihDx3Y5R4erGRuDRq1IY29Sp69otPshh7JOpygXV+Jnbx
 35ja2XiSvMX12tdBv/QMKKVTaODOc0ToyfJ1iXJ8SjjZ6GGutX6J8MkuaAAAA
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
   bodies stayed the same. I did not make this a follow-up as the EyeQ5
   compatible (see below) wasn't part of V1, and I wouldn't want people
   to think it has been through a first round of lkml review.

 - Second, add a new compatible to rmem for the EyeQ5-specific usecase;
   it parses a header and does checksumming at probe.

   [PATCH 1/6] dt-bindings: nvmem: rmem: Add mobileye,eyeq5-bootloader-config
   [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
   [PATCH 6/6] MIPS: mobileye: eyeq5: add bootloader config reserved memory

Code is tested on real hardware, an EyeQ5 evaluation board.
With the patch series:

   # rmem=/sys/bus/nvmem/devices/rmem0
   # for i in $rmem/cells/*; do basename $i; hexdump -C $i | head -n1; done
   mac@7c,0
   00000000  00 28 f8 6b 87 1b                                 |.(.k..|
   mac@82,0
   00000000  00 28 f8 6c 88 1c                                 |.(.l..|

Have a nice day,
Thanks,
Théo

[0]: https://lore.kernel.org/lkml/20240724-nvmem-rmem-v1-0-d2e3a97349a0@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- [PATCH 1/6] dt-bindings: take "Acked-by: Rob Herring".
- [PATCH 5/6]: add "#include <linux/slab.h>" for kfree(). It caused
  compile errors on some architectures, thanks kernel test robot.
- Link to v1: https://lore.kernel.org/r/20241203-rmem-v1-0-24f4970cf14e@bootlin.com

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
 drivers/nvmem/rmem.c                              | 96 ++++++++++++++++++++---
 include/linux/nvmem-provider.h                    |  4 +-
 4 files changed, 111 insertions(+), 12 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241203-rmem-15df9301cf0b

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


