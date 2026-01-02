Return-Path: <linux-mips+bounces-12709-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0048CEEE99
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 16:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88E8930124D3
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 15:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C27128EA56;
	Fri,  2 Jan 2026 15:53:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1628DB46;
	Fri,  2 Jan 2026 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767369187; cv=none; b=Y10QmO2pcTxK9x0oz2B4EGdCRfikAQPoCtXlgusq1YimkWTqCoq0R9wdKOrUKs0ntN0qlYXLES+3qAR2d/6fjyOwM3qGnTbmGeGYwmd8KWO4JgB5fmYIiCKycirNI2Z+wqneEwUBUscpvfBBepBHytfZLNNm4tCr0mEgXQrQzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767369187; c=relaxed/simple;
	bh=6xwXaESbQDcoH6UquNWlaguH/ghPy1QEXupzkKp1O0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gu25X7jS/rl/96Y3KYIclVeJTUVZbrQOPP6jDxS98IPGuLx5kGqZqsi3DMWF3Zq89ZewvgDqJrgoJoPmfk9jY7R8SkMei7vD8Dr2IAKlv9fKwZO+Fgq0wNiBxwX0BOFC3v/R7LhnlG9jDOvv91V5k/H3UIdbY60hHWrYPloLnec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.158])
	by APP-03 (Coremail) with SMTP id rQCowABnaL_N6VdpJWUQAw--.54339S2;
	Fri, 02 Jan 2026 23:52:47 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] MIPS: Loongson64: dts: fix phy-related definition of LS7A GMAC
Date: Fri,  2 Jan 2026 23:52:43 +0800
Message-ID: <20260102155243.3639731-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnaL_N6VdpJWUQAw--.54339S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4DCr4DJw1fKF1ftr18Zrb_yoW8Wr4Dpa
	y3Cws7Xrn8ur1avay8CFyUXr4fAa98KFs5uF47C3y5Jw10vF10vr17JFyrtr1UGrWFqa40
	qw109ayxX3Z7Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Currently the LS7A GMAC device tree node lacks a proper phy-handle
property pointing to the PHY node.

In addition, the phy-mode property specifies "rgmii" without any
internal delay information, which means the board trace needs to add 2ns
delay to the RGMII data lines; but that isn't known to happen on any
Loongson board. The ACPI-based initialization codepath, which is used on
LoongArch-based 3A5000 + 7A1000 hardwares, specifies "rgmii-id" phy
mode, which should be the one we are using.

Add the lacking phy-handle property and set proper phy-mode.

Tested on a LS3A4000_7A1000_NUC_BOARD_V2.1 board with YT8521S PHY.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index ee71045883e7e..6dee85909f5a6 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -199,7 +199,8 @@ gmac@3,0 {
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&pic>;
-				phy-mode = "rgmii";
+				phy-mode = "rgmii-id";
+				phy-handle = <&phy0>;
 				mdio {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -222,7 +223,8 @@ gmac@3,1 {
 					     <15 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&pic>;
-				phy-mode = "rgmii";
+				phy-mode = "rgmii-id";
+				phy-handle = <&phy1>;
 				mdio {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.52.0


