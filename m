Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 012E41396A5
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 17:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgAMQoX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 11:44:23 -0500
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:56635 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728775AbgAMQoX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 11:44:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4632446|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.571545-0.0205303-0.407925;DS=CONTINUE|ham_enroll_verification|0.0125564-0.000309334-0.987134;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07389;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GbRhA7M_1578933839;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GbRhA7M_1578933839)
          by smtp.aliyun-inc.com(10.147.40.233);
          Tue, 14 Jan 2020 00:44:13 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, miquel.raynal@bootlin.com, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, daniel.lezcano@linaro.org,
        ebiederm@xmission.com, keescook@chromium.org, ak@linux.intel.com,
        krzk@kernel.org, paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Date:   Tue, 14 Jan 2020 00:43:30 +0800
Message-Id: <1578933813-80122-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
 <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the available properties for the SoC root node and the
CPU nodes of the devicetree for the Ingenic XBurst SoCs.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 .../bindings/mips/ingenic/ingenic,cpu.txt          | 32 ++++++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,soc,txt          | 18 ++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt

diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
new file mode 100644
index 00000000..f23e9be
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
@@ -0,0 +1,32 @@
+Bindings for Ingenic XBurst family CPUs.
+
+Required properties:
+- device_type: Must be "cpu".
+- compatible: One of:
+  - "ingenic,xburst".
+  - "ingenic,xburst2".
+- reg: The number of the CPU.
+
+Example:
+cpus {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	cpu0: cpu@0 {
+		device_type = "cpu";
+		compatible = "ingenic,xburst";
+		reg = <0>;
+
+		clocks = <&cgu JZ4780_CLK_CPU>;
+		clock-names = "cpu";
+	};
+
+	cpu1: cpu@1 {
+		device_type = "cpu";
+		compatible = "ingenic,xburst";
+		reg = <1>;
+
+		clocks = <&cgu JZ4780_CLK_CORE1>;
+		clock-names = "cpu";
+	};
+};
diff --git a/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt
new file mode 100644
index 00000000..c731fa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt
@@ -0,0 +1,18 @@
+Bindings for Ingenic SoCs with XBurst CPU inside.
+
+Required properties:
+- compatible: One of:
+  - "ingenic,jz4740".
+  - "ingenic,jz4725b".
+  - "ingenic,jz4760".
+  - "ingenic,jz4760b".
+  - "ingenic,jz4770".
+  - "ingenic,jz4780".
+  - "ingenic,x1000".
+  - "ingenic,x1000e".
+  - "ingenic,x1500".
+
+Example:
+#address-cells = <1>;
+#size-cells = <1>;
+compatible = "ingenic,jz4780";
-- 
2.7.4

