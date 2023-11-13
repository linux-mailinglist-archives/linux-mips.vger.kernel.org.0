Return-Path: <linux-mips+bounces-20-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01537E951A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 03:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F19B1F2118A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 02:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8359217CE;
	Mon, 13 Nov 2023 02:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54641188;
	Mon, 13 Nov 2023 02:36:40 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id F2177109;
	Sun, 12 Nov 2023 18:36:37 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8BxNuiyi1FlY245AA--.59289S3;
	Mon, 13 Nov 2023 10:36:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxvdyui1FltFJAAA--.9944S2;
	Mon, 13 Nov 2023 10:36:30 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	lvjianmin@loongson.cn,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 0/5] dt-bindings: interrupt-controller: Fix some loongson,liointc warnings
Date: Mon, 13 Nov 2023 10:36:20 +0800
Message-Id: <cover.1699521866.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxvdyui1FltFJAAA--.9944S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryfJFyxGrW5ur1UWr1kCrX_yoW8tF15pF
	sxC3ZxGr45tr4xAws8Jay8AFn5ZrW5JasxWFs7A34xCayDX34jvr1SkF48ArW7Cry3Xw1a
	qrWkKFWUWa4jkFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0mhrUUUUU=

Hi all:

Some liointc-related DTBS_CHECK warnings were found when trying to
introduce the Loongson-2K DTS{I} for LoongArch.
This patch series attempts to fix those warnings, as well as fixing
non-standard property naming.

Of course, these fixes also apply to MIPS Loongson-2K1000.

Thanks.

-----
V4:
- Add Acked-by tag;
patch(2/5):
  - Just add 'maxitem 2' instead of duplicating the list;
patch(3/5):
  - Rewite commit message for 'interrupt-names'.

Link to V3:
https://lore.kernel.org/all/cover.1698717154.git.zhoubinbin@loongson.cn/

V3:
patch(1/5):
  - new patch, 'loongson,parent_int_map' renamed to 'loongson,parent-int-map';
patch(2/5)(3/5):
  - Separate the change points into separate patches;
patch(4/5):
 - new patch, make sure both parent map forms can be parsed;
patch(5/5):
 - new patch, fix 'loongson,parent_int_map' references in mips loongson
   dts{i}.

Link to V2:
https://lore.kernel.org/all/20230821061315.3416836-1-zhoubinbin@loongson.cn/

V2:
1. Update commit message;
2. "interruprt-names" should be "required", the driver gets the parent
interrupts through it;
3. Add more descriptions to explain the rationale for multiple nodes;
4. Rewrite if-else statements.

Link to V1:
https://lore.kernel.org/all/20230815084713.1627520-1-zhoubinbin@loongson.cn/

Binbin Zhou (5):
  dt-bindings: interrupt-controller: loongson,liointc: Standardize the
    naming of 'loongson,parent-int-map'
  dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
    warning for reg-names
  dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
    for warning interrupt-names
  irqchip/loongson-liointc: Fix 'loongson,parent_int_map' parse
  MIPS: Loongson64: DTS: Fix 'loongson,parent_int_map' references

 .../loongson,liointc.yaml                     | 33 +++++++++++++------
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  4 +--
 .../dts/loongson/loongson64c-package.dtsi     |  2 +-
 .../dts/loongson/loongson64g-package.dtsi     |  2 +-
 .../dts/loongson/loongson64v_4core_virtio.dts |  2 +-
 drivers/irqchip/irq-loongson-liointc.c        |  7 +++-
 6 files changed, 34 insertions(+), 16 deletions(-)

-- 
2.39.3


