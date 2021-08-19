Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1E3F1EB5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 19:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhHSRFJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Aug 2021 13:05:09 -0400
Received: from mail-eopbgr30089.outbound.protection.outlook.com ([40.107.3.89]:40864
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230058AbhHSRFI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 13:05:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHG7eRXx3WjKVthDhrUDVCejvubnMSl4ofemag4SL4ikyN3cKlXxk6Hmsg9RgE15szn0+2VqxIPvS0rNUHFqPydXNpPB95GRsMDGlWG5Ygnx6aOvq8Wk5HJf2yC5WVsKZBkaJTUrqftGwJD8kZTvzqYEBXeaLthUxCPcHw7N0Dj6fvJst4y5ztExm/KJ5ihQSn4CHBY+Lgbo2QnuFQNmPprMN1whHxtYiwwI7nCbYfzBBoClPYPSVNt2eesLtXWrUKMz1WUXMMD1xIHEM7Fu5+bJTLiDxnsA3RhLr6hc8GOisArKDjvT/Yof/Q47USd45DymQtC5qHJCAbXRyeNAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuaJzwwi3o3FXFb88r0g3r9V8ZRrgpZ8vPR4X93Xesg=;
 b=Z7W78NxsAjSLbibVZymJ6jpHRsQdb/JdHvVGS42BIiOkOsnQSlkUQFna5BbeBMLRcJsZZxCS/ZqefqdUsh+lXGmagHW3IuE65VpJTx3pHu/rbsidp6Rrs7xFzLTXUZ8kOihkjVF6vBMZQaVYT7tAiLeUWYqS9ySmKjGDgvnzOfPYY0Nt2jxfJ43dhR/hLJWk6NwCQ9kLYNLLwEUAcdKOrtMXuE/BFV3kgh/NM3/3N3JmQHOPzRnP5hyfyX5a9EDLxvDdj6a9aILu4HOAPk84xzoNLVWMnyRRaQXcg+dEAgTYSR79WtJNSJgUJ9ym+W02hj1n9qvX7VT2o51FvqtO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuaJzwwi3o3FXFb88r0g3r9V8ZRrgpZ8vPR4X93Xesg=;
 b=KnbCByJ7LwCGXV+jJ1H35TFeKAYcst6tgz4GjIqUA2DdLf1MLefYwuRmDFL/r6eHQkr4Cp/Md9x9rFIJpIO7qNXnhWh4T4A2TwFAIuQfXZ32215zur7kphgLSVKx6w6GaQooJhYM6JUGZtCva1h6u9LE1y33o21afkYJF/EanU0=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0401MB2303.eurprd04.prod.outlook.com (2603:10a6:800:28::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 17:04:26 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0%2]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 17:04:26 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH devicetree 1/2] MIPS: mscc: ocelot: disable all switch ports by default
Date:   Thu, 19 Aug 2021 20:04:15 +0300
Message-Id: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:208:be::26) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (188.25.144.60) by AM0PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:208:be::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 17:04:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb25da0c-d0b0-42e3-727b-08d96333668d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2303:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2303CE3E0D87E100196B958CE0C09@VI1PR0401MB2303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xKCfKjFu1mfBd37tdybrBuT+MwVym0G1FUrpWDPfB+3mEg0J4COuvJVZ2/iKvXh7HHuhJCh9+fWAFD4LT5ZfUP8Pol5eOFHGgok5zDevN8k0lefDDbMVbywC8Y+JnQmKo7G4Zd/r7WViy6JKtbGu4JPktAPyVqFZj3pg43M0xaal3gskswVDHo9Nhlv9zJSJYxNMZP4nZrVQpmlGtH9iQu4duyKifso114aRJzkf4oIUZ2hd5yhu7GDvbD5ITJ+cM/V7Hr9vAdMMvDu8u3jOUYmCuKWNkmytH7qbidSmKSctxdG9cNJCdWE4WN4VG5D9mW7eFvl/pF+BHdc45cZhZmcFilfZ7hOdXnk8GytGwWa8CvnLoz6HvbICYwod/yOqorpumMGft2W12FNIofZmfNB6aNFN0MYrFNGftvtb3+SlreTl9VbyWDnJKaOM28VSNA7cIB5XanErp48Zf7wccaNkTVG+O4N08veGgWgGbMqoIxoeYYydwASmvcjFG9btUCjEv74duAwqqD9ptYkJ4mW2CcSqkbNevUe1IImWc8ebWNyi3hZdNsRRCADDcQEO70dzteDskguHhjG9DBQdVFjAg7hxaq+1cDwde9fxocL4LUlJ+KnCY1w7+t323SbQhUjaNlbkjX5Kio1BzO353WiJMZmWR3y2qZRd4m00gfD2c1XdeQmgKqE7lLBm7gSRBBFBlM4X04P2/y7oVbQ7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(4326008)(956004)(44832011)(2616005)(52116002)(478600001)(8936002)(6512007)(26005)(8676002)(6506007)(186003)(6486002)(66476007)(66556008)(2906002)(83380400001)(36756003)(66946007)(316002)(5660300002)(86362001)(38100700002)(6666004)(54906003)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/cKvT266xLocf37IXXtowGfxc02hr5awpmB3ZzKpM4cLqIKTmbagtWk/NVvk?=
 =?us-ascii?Q?6Hbx5ZpqzLM9Lp7gwFV1YTDOKO3eCT4sW+oUwUxA+Uld99WgpTvFe3Z5QEBN?=
 =?us-ascii?Q?A4AN3p+Ucm+SG1FCjaGFHKANJtU21YwCxlBa46hnJ5Xh+TEDbnk8OzPgm4m3?=
 =?us-ascii?Q?C1J49tA1jTXMzUq6YW+3m+EWwHT5QkvuTTUBUDw7NSPoQjBHn1fsJ62zrf7F?=
 =?us-ascii?Q?UcpSg/pNaRDaP32e3A/BX767qEjLA66L33k1yiSXUcBIPjEf+Un2UOaDKUBr?=
 =?us-ascii?Q?xBZp1gYCmU06EoDZwG3GIokzW5RpeV2N4qegsoeraLvwBzRLUPke6NWT2w3p?=
 =?us-ascii?Q?t8xN76RkqDYriNTMSv4tatHnZrUmOd9OhN4FBN7ZC45AocEl4eMTuL3Q9qtv?=
 =?us-ascii?Q?Mx8IaC9XWUv7R6EOrwUmmsCnOs/8uhksEHFUlCtUmJpHOqHhlCMQ9JNctgem?=
 =?us-ascii?Q?Kac+AxdOfaXhdhnjEVzKU8ffR8UqqbA9SsiU1YrRjq2/7x8Ds8Lq2K4EaS3y?=
 =?us-ascii?Q?gbKaZtK+3gogRJxLwE90dskFAi2Qf8yuQ9euJGkwkxNO7v1DuKCJWQl3tdhu?=
 =?us-ascii?Q?STzGhwkYeXxmHty/Dy1sIVEODjLJM+x+ZSpuE0/zrhTSeE/hgyQi5OSMp6pd?=
 =?us-ascii?Q?p9E+6RJM1FN72WumADAHQeZPDhTFNZ9dmBrXZUL9JZWU5EBF7CTIaURqINAd?=
 =?us-ascii?Q?C4rKllml7OxzOT3J6F5C1dokW+q5LyI6JgB8Sy0CjihzLZBU+aG7FuqT2EeU?=
 =?us-ascii?Q?zoMJIapoudI9AKbHvJlibayjmDPqrb63190I1NaZhuQo7fR3gFxpxi3NkeRJ?=
 =?us-ascii?Q?CHEoif2x/GQXqLAfTsftp3Z0PA72HU5K+2c/xxBP6h+9KLKSGzHcmRBLqvvE?=
 =?us-ascii?Q?6ju+pJ/TmAMUGUGuNI6trTWTv6OVw9u4y/qjNCUlnp/J7iHbFlBRnmjkqgfW?=
 =?us-ascii?Q?lxV20MIGgw/l/llYppuGE4oZ8nD8EODwsyKoJkGwZq0iXeryRw0qp9dzt+nN?=
 =?us-ascii?Q?FMA+/q+NaXmwJhJEGax+C5leXtS+W4zfg8q8nr7R6rwHo+wwH9Q00yG4c36x?=
 =?us-ascii?Q?wwM5z5e/8OtNHvbLTsLjj2BhFyqaOGv1IyDSDgeHV9WKxSEOKStMh8HfU3PR?=
 =?us-ascii?Q?vkb+DIPUsrlmO4nvZeTB+IRfeK4WBbov4UK/5a8tD6PX0QgeuArwCWXcAj+f?=
 =?us-ascii?Q?gohksSUQzfK7Q1Ch3RLPqEWWnmq/w0gxQGH6KlG4YQZlX9D1AkT09J7EV1h8?=
 =?us-ascii?Q?a++9ZtxRlm5IDsCHQiScx7MwvFVO7b6IIHLrFj/HETU/5TpZcsLZrk1Pamtj?=
 =?us-ascii?Q?g/qItqsCRkr0a7qyMdOapyy4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb25da0c-d0b0-42e3-727b-08d96333668d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 17:04:26.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtXz7AjzDRByCCzMIKawotInT6Si3ZlWaeEvFs2H86wy1lgkrN5pA6Z4p3xwt7r0nHTleaCGIMQYINv6IrG+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2303
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The ocelot switch driver used to ignore ports which do not have a
phy-handle property and not probe those, but this is not quite ok since
it is valid to not have a phy-handle property if there is a fixed-link.

It seems that checking for a phy-handle was a proxy for the proper check
which is for the status, but that doesn't make a lot of sense, since the
ocelot driver already iterates using for_each_available_child_of_node
which skips the disabled ports, so I have no idea.

Anyway, a widespread pattern in device trees is for a SoC dtsi to
disable by default all hardware, and let board dts files enable what is
used. So let's do that and enable only the ports with a phy-handle in
the pcb120 and pcb123 device tree files.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi       | 11 +++++++++++
 arch/mips/boot/dts/mscc/ocelot_pcb120.dts |  8 ++++++++
 arch/mips/boot/dts/mscc/ocelot_pcb123.dts |  4 ++++
 3 files changed, 23 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
index 535a98284dcb..e51db651af13 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -150,36 +150,47 @@ ethernet-ports {
 
 				port0: port@0 {
 					reg = <0>;
+					status = "disabled";
 				};
 				port1: port@1 {
 					reg = <1>;
+					status = "disabled";
 				};
 				port2: port@2 {
 					reg = <2>;
+					status = "disabled";
 				};
 				port3: port@3 {
 					reg = <3>;
+					status = "disabled";
 				};
 				port4: port@4 {
 					reg = <4>;
+					status = "disabled";
 				};
 				port5: port@5 {
 					reg = <5>;
+					status = "disabled";
 				};
 				port6: port@6 {
 					reg = <6>;
+					status = "disabled";
 				};
 				port7: port@7 {
 					reg = <7>;
+					status = "disabled";
 				};
 				port8: port@8 {
 					reg = <8>;
+					status = "disabled";
 				};
 				port9: port@9 {
 					reg = <9>;
+					status = "disabled";
 				};
 				port10: port@10 {
 					reg = <10>;
+					status = "disabled";
 				};
 			};
 		};
diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb120.dts b/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
index 897de5025d7f..d2dc6b3d923c 100644
--- a/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
@@ -69,40 +69,48 @@ phy4: ethernet-phy@3 {
 };
 
 &port0 {
+	status = "okay";
 	phy-handle = <&phy0>;
 };
 
 &port1 {
+	status = "okay";
 	phy-handle = <&phy1>;
 };
 
 &port2 {
+	status = "okay";
 	phy-handle = <&phy2>;
 };
 
 &port3 {
+	status = "okay";
 	phy-handle = <&phy3>;
 };
 
 &port4 {
+	status = "okay";
 	phy-handle = <&phy7>;
 	phy-mode = "sgmii";
 	phys = <&serdes 4 SERDES1G(2)>;
 };
 
 &port5 {
+	status = "okay";
 	phy-handle = <&phy4>;
 	phy-mode = "sgmii";
 	phys = <&serdes 5 SERDES1G(5)>;
 };
 
 &port6 {
+	status = "okay";
 	phy-handle = <&phy6>;
 	phy-mode = "sgmii";
 	phys = <&serdes 6 SERDES1G(3)>;
 };
 
 &port9 {
+	status = "okay";
 	phy-handle = <&phy5>;
 	phy-mode = "sgmii";
 	phys = <&serdes 9 SERDES1G(4)>;
diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
index ef852f382da8..7d7e638791dd 100644
--- a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
@@ -47,17 +47,21 @@ &mdio0 {
 };
 
 &port0 {
+	status = "okay";
 	phy-handle = <&phy0>;
 };
 
 &port1 {
+	status = "okay";
 	phy-handle = <&phy1>;
 };
 
 &port2 {
+	status = "okay";
 	phy-handle = <&phy2>;
 };
 
 &port3 {
+	status = "okay";
 	phy-handle = <&phy3>;
 };
-- 
2.25.1

