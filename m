Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B01FBAB94
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 22:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388747AbfIVUNJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 16:13:09 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:44692 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388723AbfIVUNJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 16:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
         bh=/BP8hOWE8SJ76SRf1RmiWyLqtKvXhcXYW4oao3LZWlU=; b=lB+pkqsq5ngXh/Zi0/7wsCsa8
        aW8g0qd9xLSsT8X3lvyYzVZ7cu596Ipc06stOJO1ZO1DJPVNBhuD2aAgGj667hmdGmGvXP+i7UeZA
        XtOwM5f6dCpQ4t53xgNOKRHtnlPoyWOBAgowbNcuBr7DPs2Qw3REE+Mlm4h+V+mPA/t1Z29jrOICc
        mtz33a/XSXrEcWEFTgkV0py/nt6I8ndDz1s/p0jhkywFk9FdP8/sYX4+CI5F+Ax12m+FlHElkr88h
        0eJkbucaqCoetZME+8FV41AZf4NSNJ84QWmuq2BvRpfzTPw/P5eosTjiMvcmyAz1eX7md6176ienE
        +kSORIMMA==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iC8EE-0007u8-5c; Sun, 22 Sep 2019 22:13:06 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iC8ED-007vfi-Qc; Sun, 22 Sep 2019 22:13:05 +0200
Date:   Sun, 22 Sep 2019 22:13:05 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] MIPS: JZ4780: DTS: Add CPU nodes
Message-ID: <d4f2225005f6d8a92eec05bb64e7fe937ead8ccc.1569181001.git.agriveaux@deutnet.info>
References: <cover.1569181001.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569181001.git.agriveaux@deutnet.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The JZ4780 have 2 core, adding to DT.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..9c7346724f1f 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -7,6 +7,23 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4780";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "ingenic,jz4780";
+			device_type = "cpu";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "ingenic,jz4780";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
-- 
2.20.1

