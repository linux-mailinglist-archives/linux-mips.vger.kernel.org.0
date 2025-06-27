Return-Path: <linux-mips+bounces-9526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F392AEB250
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DDF91C2735D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C424129DB6C;
	Fri, 27 Jun 2025 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W4CfjmgS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41A29AB11;
	Fri, 27 Jun 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015386; cv=none; b=phIDkEqHUBJxhmclA2STH5rza4Ltk/nqoXGFKGLpIfkSxDxtcVzrx1WtKobuXo496yPNhOxqyPvtDpX++g7M53bmcScpHyR2+e5bjFCWTimI/8INqL0l4IL6gXK3kmxqGUeJomsmpf/FSNsdX2LJvk/MWx+Czz0d2buQ5LSpNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015386; c=relaxed/simple;
	bh=ZOde5Pi/SP0+9HqoRQX1N/Sl9gulSMVebWBpYm3NpQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s37iAh1JoDzYNOiS28OOMIN2yqezjnHUS2upnA/9pzMHnDS2F2ITpKi/CMKOO6VQlBOseBKHL9FZkuTh/0FPOg/nnSqfd8TlmvOB2eD1qHlznZRJTVM2UCeMrI6Nj5sKru6phKZuN/mssao4i5PcVp/2X0pD0DrQWzi8U+gDxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W4CfjmgS; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81845438F0;
	Fri, 27 Jun 2025 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xV7K0ZdGbiaBZuLteWgpn/RILuyXMQnyjLW6HWmhQmg=;
	b=W4CfjmgSoJM+Upzz2zRqknrcszFKcSpACX7Iw9QnLs0j4IOS4G9zzLn5Fvf7iTHbgseDNm
	+bB8xHRQE/XDxJwHGj+e/lesSOkDoXxlXg7K9tyLqOxqANwV8AcRl+RiH9rmhhERqgpiD4
	fI6pOW0uIPwO+dJBv4zs99VEQMaIOQ82hkHhb9uUBDTy5zHWe2XeOnaDyv2/ouSMl1yalY
	u1j9eeZehL7d13KCwrgHg3MZImDO1Jpebwmp0cbe6HzdGpSoJ1yLFfZw4F2EKCQ70NwBCQ
	b7dtZpcdh6g8Bewpt/x5+1/OULa4vsOUnLHiUGYJwHI733jwEkeXZfcniBTGUA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:55 +0200
Subject: [PATCH net-next v2 09/18] net: macb: sort #includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-9-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrvddugegnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeefpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgto
 hhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Sort #include preprocessor directives.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index be667cb5acce85a9d11aaea1f5081a3380b60ef2..a6633e076644089c796453f856a766299bae2ec6 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -6,36 +6,36 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-#include <linux/clk.h>
+#include <linux/circ_buf.h>
 #include <linux/clk-provider.h>
+#include <linux/clk.h>
 #include <linux/crc32.h>
+#include <linux/dma-mapping.h>
+#include <linux/etherdevice.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/inetdevice.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/ip.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/circ_buf.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/interrupt.h>
 #include <linux/netdevice.h>
-#include <linux/etherdevice.h>
-#include <linux/dma-mapping.h>
-#include <linux/platform_device.h>
-#include <linux/phylink.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/ip.h>
-#include <linux/udp.h>
-#include <linux/tcp.h>
-#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/ptp_classify.h>
 #include <linux/reset.h>
-#include <linux/firmware/xlnx-zynqmp.h>
-#include <linux/inetdevice.h>
+#include <linux/slab.h>
+#include <linux/tcp.h>
+#include <linux/types.h>
+#include <linux/udp.h>
 #include "macb.h"
 
 /* This structure is only used for MACB on SiFive FU540 devices */

-- 
2.50.0


