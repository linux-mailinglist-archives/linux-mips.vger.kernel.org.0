Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BBB50A74F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Apr 2022 19:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiDURoj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Apr 2022 13:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390877AbiDURoi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Apr 2022 13:44:38 -0400
X-Greylist: delayed 135 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Apr 2022 10:41:48 PDT
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net (p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558334A3E7
        for <linux-mips@vger.kernel.org>; Thu, 21 Apr 2022 10:41:48 -0700 (PDT)
Received: from localhost.localdomain ([209.234.248.132])
        by :SMTPAUTH: with ESMTPSA
        id ham9nkETPic8fhamAnljNp; Thu, 21 Apr 2022 10:39:32 -0700
X-CMAE-Analysis: v=2.4 cv=Q+QXX66a c=1 sm=1 tr=0 ts=626196d4
 a=QYjdx1n8fnJJ/8JFsBbjTg==:117 a=QYjdx1n8fnJJ/8JFsBbjTg==:17 a=NEAV23lmAAAA:8
 a=_twTT5zqAAAA:8 a=6R0Kyn_f9nWU-igJ6UUA:9 a=ILoXdGDbYT3DTB7Z0gVI:22
X-SECURESERVER-ACCT: dhu@hodcarrier.org
From:   Du Huanpeng <dhu@hodcarrier.org>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org,
        Du Huanpeng <dhu@hodcarrier.org>
Subject: [PATCH] mips: dts: ralink: mt7620a: rename nodes to generic names
Date:   Fri, 22 Apr 2022 01:39:28 +0800
Message-Id: <20220421173928.61467-1-dhu@hodcarrier.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNdzv5jfK0g153WJIHj7b/tW+my450a5GCAClM5BMyMirAAl9evuviFEomChLrbZ9pQ2US6SzFvOAdYtcZgEoKG46y8McajnjV6wPAA6XLFGkdD1YL6+
 MnEhfsrJyuHnw4AEl83jDHTL2vCcpQmgMj41NsKQjMm7vZ2cP0w6DupGwbbmIdXizbdz2U9hjswjU/ABszjKrf6CXsyMTORkQeSroVu3Q8CWNYj6n0ZlLea/
 qDsTHyoon65jUfuAH4Gxke073BgwMGgYjaz5PIdIXjpH50LjRFDlFsCBuyL3aSzELsTrrBt7nz4/OQjLaxeawvb4H8BS9mWg125lO2ecwMz7IKXWEMRaQ/hV
 vlonII2bpS70THRM3Hw7Mty4YUaEdrwSEkovpe59KIMvKsaO0ktVPhjWkeVOGLFqgE1KHRpLQByWCTUYie2JXDo6Cffm4g==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model.

- interrupt-controller
- syscon
- memory-controller
- serial

devicetree-specification-v0.3.pdf
link: https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3

Signed-off-by: Du Huanpeng <dhu@hodcarrier.org>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index 1f6e5320f486..b9cbde603778 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -10,7 +10,7 @@ cpu@0 {
 		};
 	};
 
-	cpuintc: cpuintc {
+	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
@@ -25,12 +25,12 @@ palmbus@10000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc@0 {
+		syscon@0 {
 			compatible = "ralink,mt7620a-sysc";
 			reg = <0x0 0x100>;
 		};
 
-		intc: intc@200 {
+		intc: interrupt-controller@200 {
 			compatible = "ralink,mt7620a-intc", "ralink,rt2880-intc";
 			reg = <0x200 0x100>;
 
@@ -41,12 +41,12 @@ intc: intc@200 {
 			interrupts = <2>;
 		};
 
-		memc@300 {
+		memory-controller@300 {
 			compatible = "ralink,mt7620a-memc", "ralink,rt3050-memc";
 			reg = <0x300 0x100>;
 		};
 
-		uartlite@c00 {
+		uartlite: serial@c00 {
 			compatible = "ralink,mt7620a-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
-- 
2.25.1

