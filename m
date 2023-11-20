Return-Path: <linux-mips+bounces-115-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAC7F0E85
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 10:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57BB81C21214
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 09:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D171E1094F;
	Mon, 20 Nov 2023 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98450D7C;
	Mon, 20 Nov 2023 01:07:04 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8Dxg_C2IVtlwSw7AA--.51614S3;
	Mon, 20 Nov 2023 17:07:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt6wIVtl0WRHAA--.27816S4;
	Mon, 20 Nov 2023 17:07:00 +0800 (CST)
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
Subject: [PATCH v5 5/5] MIPS: Loongson64: DTS: Fix 'loongson,parent_int_map' references
Date: Mon, 20 Nov 2023 17:06:49 +0800
Message-Id: <12036a9dab5b4d421fb9c74e1ef2c3cb2f26c641.1700449792.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1700449792.git.zhoubinbin@loongson.cn>
References: <cover.1700449792.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxzt6wIVtl0WRHAA--.27816S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr13XF4kWw1UGw45AryUtwc_yoW5tw47pw
	43A3W8Gw4xKr17A398G34UJr1fZFZ0yFZrWF4xGFW8A39aga4UXr1fJF1rtrs3Gry5Xa42
	9r1vgrW7KFy8CabCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6rWY6Fy7McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxfHUUUUUU

Since 'loongson,parent_int_map' has been dropped, replace all
relevant references in the MIPS loongson dts{i} with
'loongson,parent-int-map'.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 4 ++--
 arch/mips/boot/dts/loongson/loongson64c-package.dtsi     | 2 +-
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 2 +-
 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index f878f47e4501..36f499a3772e 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -71,7 +71,7 @@ liointc0: interrupt-controller@1fe11400 {
 			interrupts = <2>;
 			interrupt-names = "int0";
 
-			loongson,parent_int_map = <0xffffffff>, /* int0 */
+			loongson,parent-int-map = <0xffffffff>, /* int0 */
 						<0x00000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
@@ -91,7 +91,7 @@ liointc1: interrupt-controller@1fe11440 {
 			interrupts = <3>;
 			interrupt-names = "int1";
 
-			loongson,parent_int_map = <0x00000000>, /* int0 */
+			loongson,parent-int-map = <0x00000000>, /* int0 */
 						<0xffffffff>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64c-package.dtsi b/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
index 5bb876a4de52..38de0108e804 100644
--- a/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
@@ -35,7 +35,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0xf0ffffff>, /* int0 */
+			loongson,parent-int-map = <0xf0ffffff>, /* int0 */
 						<0x0f000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
index d4314f62ccc2..8972adcb83d6 100644
--- a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
@@ -32,7 +32,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0x00ffffff>, /* int0 */
+			loongson,parent-int-map = <0x00ffffff>, /* int0 */
 						<0xff000000>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
diff --git a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
index d0588d81e0c2..88642fee1bbd 100644
--- a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
+++ b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
@@ -34,7 +34,7 @@ liointc: interrupt-controller@3ff01400 {
 			interrupts = <2>, <3>;
 			interrupt-names = "int0", "int1";
 
-			loongson,parent_int_map = <0x00000001>, /* int0 */
+			loongson,parent-int-map = <0x00000001>, /* int0 */
 						<0xfffffffe>, /* int1 */
 						<0x00000000>, /* int2 */
 						<0x00000000>; /* int3 */
-- 
2.39.3


