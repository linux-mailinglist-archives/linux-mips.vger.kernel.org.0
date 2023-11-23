Return-Path: <linux-mips+bounces-219-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE07F62BC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACEA1B215A0
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 15:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F74F374E5;
	Thu, 23 Nov 2023 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dw9HifTh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930291B2;
	Thu, 23 Nov 2023 07:26:51 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03E8F60004;
	Thu, 23 Nov 2023 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gqgiEya/er1aZ/FbHndX0f9Kc5UgcFypKNTjKg43y0s=;
	b=dw9HifThKTpsyMp5AF5r+cojCswX88IrWYBuGyLFq7eTRuKEIMrnzSDLG7ns/Y6o3RbjYr
	onlxqfM7G1kmDQZu3rJGKc3C5L+FwKJInEYNHdoGg81sG0/23po41JZy13HnaJEXDIZ0WO
	A/N9dXg84N7pPzAH8QqswiPrHguSpltUU2BN2l3qnFqYQj7jw8AJNyTYF5P+6Gs34a7KCt
	2vRH2qpEGn8Maqcn9yumARbiAg+uP098JSz/1pTXzbqOLEy0VKuT2YXgsvavNyP/jVxGoj
	BEdSqqd859b2w8LVgV18u1aS7y/VcoZRPt4YIiM+nWxyNpCBSj6PImJA2qTDRQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 00/21] Add support for the Mobileye EyeQ5 SoC
Date: Thu, 23 Nov 2023 16:26:17 +0100
Message-ID: <20231123152639.561231-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Hello,

The EyeQ5 SoC from Mobileye is based on the MIPS I6500 architecture
and features multiple controllers such as the classic UART, I2C, SPI,
as well as CAN-FD, PCIe, Octal/Quad SPI Flash interface, Gigabit
Ethernet, MIPI CSI-2, and eMMC 5.1. It also includes a Hardware
Security Module, Functional Safety Hardware, and MJPEG encoder.

One peculiarity of this SoC is that the physical address of the DDDR
exceeds 32 bits. Given that the architecture is 64 bits, this is not
an issue, but it requires some changes in how the mips64 is currently
managed during boot.

This second version comes a few weeks after the first one, because
there several iteration to support having kernel code outside kseg.

To build and test the
kernel, we need to run the following commands:

make 64r6el_defconfig BOARDS=eyeq5
make vmlinuz.itb

In order to get ride of the aliasing patch I got, I followed Jiaxun
Yang suggestion by splitting the memory in 2 part: low part under
512MB and high part beyond the 4GB. It allows to boot and run Linux on
the platform however as a side effect the number of pages used for
memmap passed from 512 to 8672 which is a huge consumption of
pages. Do you know if there is a way to reduce it ?

I also noticed that if the kernel can't be in kseg0 at all by using
low memory at 0x40000000, then I got the following message during
boot:

 Run /init as init process
 Unhandled kernel unaligned access[#1]:
 CPU: 0 PID: 22 Comm: kcompactd0 Not tainted 6.7.0-rc1-00024-g7d48f10cb2bb-dirty #409
 $ 0   : 0000000000000000 0000000000000001 0000000000000010 a80000080800e100
 $ 4   : a8000008088fe758 00000000088fe758 0000000000000004 0000000000000002
 $ 8   : 0000000000000089 0000000008fa0000 0000000000000000 0000000008ad0000
 $12   : 00000000140000e1 000000001000001e 0000000000000000 0000000000000141
 $16   : a80000080321fa30 0000000000000000 b88f553ba6dfc404 a8000008081bfe9c
 $20   : a800000808ad0000 a8000008081c03e4 0000000000012488 a80000080907afb4
 $24   : 0000000000000000 0000000008ad0000                                  
 $28   : a80000080321c000 a80000080321f950 0000000000000000 a80000080800dcd0
 epc   : a80000080800e104 emulate_load_store_insn+0x544/0xba0
 ra    : a80000080800dcd0 emulate_load_store_insn+0x110/0xba0
 Status: 140000e3 KX SX UX KERNEL EXL IE 
 Cause : 80800410 (ExcCode 04)
 BadVA : b88f553ba6dfc40b
 PrId  : 0001b028 (MIPS I6500)
 Modules linked in:
 Process kcompactd0 (pid: 22, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
 Stack : 0000000000000000 0000000000000000 00000000dc420010 a8afa5b0e1346800
         0000000000012488 a80000080907af80 a80000080321fd28 a800000808acfb80
         a800000808ad0000 0000000000000000 a80000080321fa30 a80000080800e90c
         0000000000000000 0000000000000000 0000000000000000 0000000000000000
         0000000000000000 a8afa5b0e1346800 0000000000000000 a80000080907afb4
         0000000000012488 a80000080907af80 a80000080321fd28 a800000809078d80
         0000000000000000 0000000000000000 0000000000000000 a800000808003174
         0000000000000000 0000000000000001 b88f553ba6dfc3f4 f91f7fb9d6d87a3d
         0000000000000002 fffffffffffffffc 0000000000000080 0000000008b90000
         0000000000000089 0000000008fc0000 0000000000000000 0000000000000000
         ...
 Call Trace:
 [<a80000080800e104>] emulate_load_store_insn+0x544/0xba0
 [<a80000080800e90c>] do_ade+0x1ac/0x1520
 [<a800000808003174>] handle_adel_int+0x30/0x3c
 
 Code: 3c03a800  cbffff4d  24020010 <205100f0> 82510007  92410006  00118a38  02218825  92410005 
 
 ---[ end trace 0000000000000000 ]---

But then I don't see other error when running the system.
So I don't know if this is a "real" error and how to fix it.

Changelog:
 v1 -> v2

 - Added reviewed-by and acked-by tags

 - Fix typos reported

 - In patch 15 use 'img' vendor string instead of mti

 - In patch 16 modify licence

 - In patch 17 give more explanations about the block usage.

 - In patch 18, remove _ in node names, don't use anymore
   CONFIG_BUILTIN_DTB in Makefile, remove macro, modify licence.

 - In patch 19 remove most of the bootargs and only keeps earlycon. I
   also split the memory in 2 part in the device tree.

 - Integrate the series from Jiaxun Yang
   https://lore.kernel.org/linux-mips/20231027221106.405666-1-jiaxun.yang@flygoat.com/

  They are patches 2 to 6 and 8 to 12

  Then I added patch 7 to fix the cache issue visible on the Mobielye
  platform, I also add patch 13 to improve warning message when ebase
  doesn't belong to KSEG0

Regards,

Gregory

Gregory CLEMENT (11):
  MIPS: compressed: Use correct instruction for 64 bit code
  MIPS: Fix cache issue with mips_cps_core_entry
  MIPS: traps: Give more explanations if ebase doesn't belong to KSEG0
  dt-bindings: Add vendor prefix for Mobileye Vision Technologies Ltd.
  dt-bindings: mips: cpu: Add I-Class I6500 Multiprocessor Core
  dt-bindings: mips: Add bindings for Mobileye SoCs
  dt-bindings: mfd: syscon: Document EyeQ5 OLB
  MIPS: mobileye: Add EyeQ5 dtsi
  MIPS: mobileye: Add EPM5 device tree
  MIPS: generic: Add support for Mobileye EyeQ5
  MAINTAINERS: Add entry for Mobileye MIPS SoCs

Jiaxun Yang (10):
  MIPS: Export higher/highest relocation functions in uasm
  MIPS: spaces: Define a couple of handy macros
  MIPS: genex: Fix except_vec_vi for kernel in XKPHYS
  MIPS: Fix set_uncached_handler for ebase in XKPHYS
  MIPS: Refactor mips_cps_core_entry implementation
  MIPS: Allow kernel base to be set from Kconfig for all platforms
  MIPS: traps: Handle CPU with non standard vint offset
  MIPS: Avoid unnecessary reservation of exception space
  MIPS: traps: Enhance memblock ebase allocation process
  MIPS: Get rid of CONFIG_NO_EXCEPT_FILL

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../devicetree/bindings/mips/cpus.yaml        |   1 +
 .../devicetree/bindings/mips/mobileye.yaml    |  32 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 arch/mips/Kconfig                             |  26 +-
 arch/mips/boot/compressed/head.S              |   4 +-
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/mobileye/Makefile          |   4 +
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts    |  24 ++
 .../boot/dts/mobileye/eyeq5-fixed-clocks.dtsi | 292 ++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi        | 134 ++++++++
 arch/mips/configs/generic/board-eyeq5.config  |  43 +++
 arch/mips/generic/Kconfig                     |  15 +
 arch/mips/generic/Platform                    |   2 +
 arch/mips/generic/board-epm5.its.S            |  24 ++
 arch/mips/include/asm/addrspace.h             |   5 +
 arch/mips/include/asm/mach-generic/spaces.h   |   5 +-
 arch/mips/include/asm/mips-cm.h               |   1 +
 arch/mips/include/asm/smp-cps.h               |   4 +-
 arch/mips/include/asm/traps.h                 |   1 -
 arch/mips/include/asm/uasm.h                  |   2 +
 arch/mips/kernel/cps-vec.S                    | 110 +++----
 arch/mips/kernel/cpu-probe.c                  |   5 -
 arch/mips/kernel/cpu-r3k-probe.c              |   2 -
 arch/mips/kernel/genex.S                      |  19 +-
 arch/mips/kernel/head.S                       |   7 +-
 arch/mips/kernel/smp-cps.c                    | 171 ++++++++--
 arch/mips/kernel/traps.c                      |  90 ++++--
 arch/mips/mm/uasm.c                           |   6 +-
 30 files changed, 890 insertions(+), 155 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/mobileye.yaml
 create mode 100644 arch/mips/boot/dts/mobileye/Makefile
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-fixed-clocks.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5.dtsi
 create mode 100644 arch/mips/configs/generic/board-eyeq5.config
 create mode 100644 arch/mips/generic/board-epm5.its.S

-- 
2.42.0


