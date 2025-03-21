Return-Path: <linux-mips+bounces-8277-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDADA6C337
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5D817A9FCA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28BD2356D8;
	Fri, 21 Mar 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g/jVBZv4"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5EB234973;
	Fri, 21 Mar 2025 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584453; cv=none; b=mTRABLc70chrbdIOqo9IhRkWxslYYERlVKn1F8igZ8iIc3dI7At9d0dGMQzXsMROYCzr6jY5Frz5OU22n4BXYvOpE+deSlYOlHrRi2RlsN+E5RvpxHVhaO985Lc55yJfyvfPra/1nlmn8sTtAuaaeksqZuhfuf3ZvZUDUFl7aUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584453; c=relaxed/simple;
	bh=Vo7F8qDWpLDpeny6n1AZtEpVd3I4RP4vkvsng6fvwG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWYI+MWjkiLFtzOMfiavh3Nh7C2I0yrQJZWxsjvYjisALeXl3DHcsim6kNdSRwcB0FcwtXYMA3st9Sd0uL2ErgPBP+V4Ts/xPwT9FbLFMpfKw7B/XnabhWCCsj3wN9qdtX1J4+J/0OE0HRyn6zTpewR6z7/AR3vizHQegjDbboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g/jVBZv4; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEF8E4454F;
	Fri, 21 Mar 2025 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cj4PjePZ8L7ZRpmqoA742jyqYhMFuSfbXddrKwz88Xs=;
	b=g/jVBZv4Bcb9EF8GtX2PDQPtvxAp6N0dLKzZYBLMBhDQcpX9FeORODffuHbf9+TvFf5/Lw
	t4MiTUK7HLpotqowgZSrVqRSyLnaceic+J5hg+eqjL9kAG+OWoj6icCI9PmDjtL9uKUeIa
	UmiDlRqV/Esa8a+Z65bz4+RI8tmj3B0LnkLdyzmIHyrMZtyLZDuqg7UVQh8OdM+979w1tn
	gVxCVek+z4vauMGK8cxSpD0hpQD6rXh4PZFuorZsZNFdx/a8iQTKICizTsswfp0/n514Qf
	toR///MQZ42Bj8ZMOluyQ8Ijb00Y7vA+K85tcYT39L268B0+ufp1XoKD7TLPlA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:40 +0100
Subject: [PATCH net-next 09/13] net: macb: sort #includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-9-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
In-Reply-To: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
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
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com

Sort #include preprocessor directives.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ad154cfe29106f642b32922fd4a03ca63112f4a7..79161d559166478f85a6f8294d488ed961d9be7f 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -6,39 +6,39 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/crc32.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
 #include <linux/circ_buf.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/io.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/crc32.h>
+#include <linux/dma-mapping.h>
+#include <linux/etherdevice.h>
+#include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/inetdevice.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/ip.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/netdevice.h>
-#include <linux/etherdevice.h>
-#include <linux/dma-mapping.h>
-#include <linux/platform_device.h>
-#include <linux/phylink.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
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
2.48.1


