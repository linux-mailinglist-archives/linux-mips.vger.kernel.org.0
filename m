Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E43F1EB2
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 19:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhHSRFI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Aug 2021 13:05:08 -0400
Received: from mail-eopbgr30089.outbound.protection.outlook.com ([40.107.3.89]:40864
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230029AbhHSRFH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 13:05:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTYYMlRa2lydWA6Uar7lFiaI67ObSKH7klYp2CfhKF1q5HEiUFNnrsupLGG9q3P1mKdm4dCCXET1dowMvK65DQrTzJxYQRx8I1vmylAjn9SvoZENtuLr9C5rCmCPGJEmqfN19IVMelOOk8aP5a91QdQ4y7kL0fdnSKOxURq7vtbRDpMNX8K2PKHan1gQUZ3q2S0WopZTOb3r/poPShwMdDRpXQ4ipCXU3KbVFIBSoLyPNSwx5huvp7G7RU5CBTenOzZ1/ax15JbTWvpvWbWF4P6jnYVNmTriTq93Visl4FNHyv5m46GnGg5KQdoo02Wz90AWim3VtgOBhH388XET4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGFM/SNPJHgpkKDDYHezRZxBMUrtlQy6RwRjR90Vt40=;
 b=VjxZJOW2csPf0z95HKY2TKalFp6481E0RaRVHxHrF6NV+kWMyvH9mCeF+ZFKjDMMJ2Z1mskk2oavyOuoy/BRJO8VLirrAa9FYyKk79QpF6ni3SoTx9cm3ivOxLMwU4S45MYYdE8a2MW3hHf/xD9qPnYvkD1eG8V+j76N6qf6U7FVuwjG4PPjytaTyxVt/0mcBebCfwqVZQSOAGaMO4vrbntAbESrqzRRkyW64YhJ5trWPCjpVwaLYAaAR/YC/u3UoAvrexAVNNigrTUmB+D4dR5IAxrpyG99cbDD48BFrn1/N7X5jTnbfr/sTgfwyaXGKhD9n/WDZFHyooeViMuGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGFM/SNPJHgpkKDDYHezRZxBMUrtlQy6RwRjR90Vt40=;
 b=IyetCXkvErJPuHnIg21M5BjVfHRA/P2gCXX+QAAujp9NQpBB/EiSRAWcoLE5cFG/G1BFK2gS2YPasBnFV5cXRezsASIuwBxylPPZFJOq/thTPqGHLUShHecFDYW42XVLXI+LOSubYUeAAYE46ask2lRP0mMIWsITLeCDRbl4WgU=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0401MB2303.eurprd04.prod.outlook.com (2603:10a6:800:28::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 17:04:27 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0%2]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 17:04:27 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH devicetree 2/2] MIPS: mscc: ocelot: mark the phy-mode for internal PHY ports
Date:   Thu, 19 Aug 2021 20:04:16 +0300
Message-Id: <20210819170416.2252210-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
References: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:208:be::26) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (188.25.144.60) by AM0PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:208:be::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 17:04:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6772f31-383c-4596-a0a1-08d96333671e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2303:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23031A776CCB35C059819BC8E0C09@VI1PR0401MB2303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqI8Gj9Ka8jlNnR6v9/ZxTsitWtoHYii1rFUdMIGYAqi82qhHfcWfzQ1NNz/unucX0kfam48I3shWuj4Q9+++1PwHR2HbvZnoHLtJ/ABpH0DvQ7Ej1ydqNKPC88GC3f+9ud5b/OLmLSr29TJaNbsMfMNLTkiloS5rtTUQ133bbGddZ1yAHZGTDq4c3OsWls5NlH01D03qAXJzMDMU+h3RzD1eB3hhohHH6DDLNt066eja+iDOTIpOjA259if4VUo31rG9bW6m/RGajx96MVq/QvGOTzhfaBiPf763BPCc5joYo5irQX/2RdxZSq1rBPAoTgr+VO0cHKlynTfJGcqfvjMkPzZ5EmE6KhWUWwCUrx28EPzVJH5iW5s1RKstzA/as8z6a38m7bV3Nrfb6UkK7RXlkBr5+uCGGvlYL4LyXL1Xjlg2t2yC7eOaj5AWHTngiIoIHGiePjz01yE3ptM9GMhyOq/VLXN40c+D0o2v1D3CSmupQoMx08Y/zcV1Ssbd7sn0zPU0x3CEfwMwbhoujX6xSuniPJtQ6V1mA6MH0tm0ErbDCAnMmDdfMI34owyLhx5hJIT9o9T+qJejHPyed683swinsd1qnQEcTJznV/OUdxEOwM6hyeqN/C+jNtU7Ix4kiAImtr79dvW252vD4/50EfQQIryn/7C9nxTP/cZm7mOireQM/piW20INwiIuOEPcUy3H346b+xc71iFMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(4326008)(956004)(44832011)(2616005)(52116002)(478600001)(8936002)(6512007)(26005)(8676002)(6506007)(186003)(6486002)(66476007)(66556008)(2906002)(36756003)(66946007)(316002)(5660300002)(86362001)(38100700002)(6666004)(54906003)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N960VhtbPFFI8SPr1etvsKc5RuNke3ZUqwGcIaxATMVQSj2wvrNvOtdFKSLB?=
 =?us-ascii?Q?qMmrpJxvX+I7ima5PL7VO9GluN4ckx0aRLKD9/pv9Dohtk1zPUnigadyFVQx?=
 =?us-ascii?Q?/wVrZ7D5GKqY50sjXQhAfPYnkygXqC27Qg/t+fNhP0goMtijNGl6cwOnmhtW?=
 =?us-ascii?Q?fboPFV63MhpiD4t6U3dKb9pKqygmSjEB6KcApEk6vO2BVeGBkAUZRSuY4RoZ?=
 =?us-ascii?Q?pEZjDyHQPp5dcbyjpMDMVT/2RT5CTtnP2JI46dsCC1nrUkqxlsKUJZ7MHxOU?=
 =?us-ascii?Q?RWS0E7lfc90YFAkLw+jo8meZZAah34c++o5YMFhMEVq1AAtn+JAyGK+fWxgi?=
 =?us-ascii?Q?Z5U65jTUKjTK5q4bp+MBkknvaV2kGVMSROZxILdGSFW/WsIVEgWbHpphwTVV?=
 =?us-ascii?Q?kchrOuHXhZPtBYrMFu+eSsMuiZFfKLt1TA3cVR1z4r6GikdeTRN1k+Zeqc70?=
 =?us-ascii?Q?BZDDkkjtC3Ea02PByebPA/nJSWKfg7H7+uclsNF7VOCkAA94nB6ewROopcZp?=
 =?us-ascii?Q?AoJqObtfe9MxgKA3xBxSt4lJeI7ypDJLUh3j7pyj3f+MS2yBsSyuKp35qORj?=
 =?us-ascii?Q?79Iml4eEK/rDs1YQ6r4CCsBydXLngnWmXbiu0L78y4y0cV14HoFRfh5zmCMG?=
 =?us-ascii?Q?HpFBRQtrp1o056PrmPUKp+nS6n/ZWnje9jiWUhpvdqy8cft2IO8GiUL24wpq?=
 =?us-ascii?Q?vMD09ymOt/z2vLMf2Kt6XBcGVKuY0hHYwTO7nD6PPqWbCGYv+rrNVj9D5at5?=
 =?us-ascii?Q?1rjlHoupDn66tmirmhJbqo4/BMAHBbIM7wB2QWVLZ6o+Rf8cCH/exqGoYTZQ?=
 =?us-ascii?Q?AFRpuu3vbuCLO4ZQOEpJKM5xXGS/CoGrzZUROjcA1wFXoO4ElK4Gt7x7wxs9?=
 =?us-ascii?Q?xSocYrIW5jHddIY+OChVQcVmobOqXMXxbbKWbgeS/AC10rA2o3v8cs2brBKb?=
 =?us-ascii?Q?J+NIOBNNE5wxxGaCCi2MdmtKxlJ2UX3mnqT7nL8lceSwzqVF+geU+VjtjL3I?=
 =?us-ascii?Q?zXyu8sJtXOj4OehUcW3Zu/6YBJoJfjsxapgNlP2gE1DR9zZRZc8TRyNoGGrz?=
 =?us-ascii?Q?KKYIfmjJmKg5Bkai4I2yg075QWvXiAaU5ThaIR47ywIIn3YMZhwI0s8qSdyt?=
 =?us-ascii?Q?TzcZs/8eaTOBCjXD+J4Bj0KIzxYTsAQLTsztp4uDuiNK3I00rp/R6Qs3OniB?=
 =?us-ascii?Q?xGdRafcv7qYNsqCxv6Nl5nhAGIRXX7Nni01CChxLY38kKnLzRf41hy0zjkM4?=
 =?us-ascii?Q?nrplEp3KQR6MHJsMRDA9ITk0Er4SBVmXlQtORCBlnXiJLH6I+LuRm09Nuhi/?=
 =?us-ascii?Q?PUmb4COSXcV5Dvzak9b5shAE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6772f31-383c-4596-a0a1-08d96333671e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 17:04:27.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/nEHHpB//El33i57PN1UcKlQqDiKGGiUNsTNm2iggbO4PC+AxVE3jSLhZnRh6/u+5j/KXKTOhcZj3MvL2wxcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2303
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The ocelot driver was converted to phylink, and that expects a valid
phy_interface_t. Without a phy-mode, of_get_phy_mode returns
PHY_INTERFACE_MODE_NA, which is not ideal because phylink rejects that.

The ocelot driver was patched to treat PHY_INTERFACE_MODE_NA as
PHY_INTERFACE_MODE_INTERNAL to work with the broken DT blobs, but we
should fix the device trees and specify the phy-mode too.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 arch/mips/boot/dts/mscc/ocelot_pcb120.dts | 4 ++++
 arch/mips/boot/dts/mscc/ocelot_pcb123.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb120.dts b/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
index d2dc6b3d923c..bd240690cb37 100644
--- a/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb120.dts
@@ -71,21 +71,25 @@ phy4: ethernet-phy@3 {
 &port0 {
 	status = "okay";
 	phy-handle = <&phy0>;
+	phy-mode = "internal";
 };
 
 &port1 {
 	status = "okay";
 	phy-handle = <&phy1>;
+	phy-mode = "internal";
 };
 
 &port2 {
 	status = "okay";
 	phy-handle = <&phy2>;
+	phy-mode = "internal";
 };
 
 &port3 {
 	status = "okay";
 	phy-handle = <&phy3>;
+	phy-mode = "internal";
 };
 
 &port4 {
diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
index 7d7e638791dd..0185045c7630 100644
--- a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
@@ -49,19 +49,23 @@ &mdio0 {
 &port0 {
 	status = "okay";
 	phy-handle = <&phy0>;
+	phy-mode = "internal";
 };
 
 &port1 {
 	status = "okay";
 	phy-handle = <&phy1>;
+	phy-mode = "internal";
 };
 
 &port2 {
 	status = "okay";
 	phy-handle = <&phy2>;
+	phy-mode = "internal";
 };
 
 &port3 {
 	status = "okay";
 	phy-handle = <&phy3>;
+	phy-mode = "internal";
 };
-- 
2.25.1

