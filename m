Return-Path: <linux-mips+bounces-5112-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39E95FF2A
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 04:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A39E1C20E8D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D90C152;
	Tue, 27 Aug 2024 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="KQoZt+fT"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2056.outbound.protection.outlook.com [40.107.117.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C110372;
	Tue, 27 Aug 2024 02:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726088; cv=fail; b=qwfnMr5diULvFk8wvB4AUdPawfYlMSnFexbA1m3l3YnM3bO8ftdKrZLbtWoembE50j6XyQvgneGH3QHcXhO5AOLLHQuPTth8FODF2fnsmMS5m5PZOJnFspQFjQfZAmEyAg5Tlmnrou1t1ucO+0m93ZGDFQL8sRCx8DsHMK3F5AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726088; c=relaxed/simple;
	bh=sNylu1N/Ikrp4oCwvt+ZUYJMbjCLIpSmcwzrdUoD31k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tk+gI6fkM73fVYB0AOH7Hz2uVDIgK9iVOqXDrDQzUjOlev8QWFQ8mvZRr5NG4L//qXDcS+AOLkGj4+WYxRuumP2YeEOfB9sfZgX0uG0JjAn8wgr+7VMqpgizK+E9H8AlmaqRxFvrOQXZuHoxpAj3xUV2R4EsbT5Ruh6/FUTDycI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=KQoZt+fT; arc=fail smtp.client-ip=40.107.117.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzYGEdB2Y6HsB77XT6BNumhPm4BV4fyR4iyyqksbSTbG/lHkOKhhC6ecP4m5Jh3dXX0xwNzul7aha85rHrZrPNmBJDW+9aowUdas7XXiDSeJoLJvgUnGOJs7R0wMgkj+VsPmvpasZhaxiEZyCpTL2d7gXk1acqIRwwljxMRhzNnP5q9XThXdpAZklcZ7VxrDmR0YnIhTnGXuDDE3eARmEtbVXNHrWcbyn9sD66QV6Tz/nkYS6mT++0/otSQNlNMBSyY+ooX8B+sS6k6T9p1RPqr79X6sOJDQ8Tl3fkmLt7AgmMPHYVWgFUJGXqzaKkIjTR1lksYDVLGCsttTRyq31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DWQp5+9GB7Rsvx8B+9UtmclLvFPjkwrn8LJEjvlqz8=;
 b=GRrT9X9uruorX6jJ5LlUnzi6DCSdwr6qtThoTEuIlNQnjhsO4bxQTnCqK0sIgGDhu7ZICBOfCXNmFWqTvPh/PpnINS8QJ7LkuV3vSq4Z6FlNo5+eZ69dJKTHaEps+pusP7QQe1nVgHatY/gTnRvYg0yNuIZRz/MRkJjgvcqK/90/89ynxLD+fbeKtKxFZyjIfrd6rM2w/xpX8vOVU1CmEHdne97ZMuoVWTY83S5erOuiUVsU+qWpCc65CAp99eLfh+pUDYYtB8z6tNn/S9ogivlG1txlVNs+oLXIYIOQSTzFpmDoJN+9ZZvy7zGBTuHzO1Qw8FP+4FwN6DNYprNtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DWQp5+9GB7Rsvx8B+9UtmclLvFPjkwrn8LJEjvlqz8=;
 b=KQoZt+fTs1r1zKPbyakNtDOUKadylQSpego5BJZfw11Ga50RbKqiI3hv40moJuRxrrrPYW9Vrb+ZSU4ZzZFvGTAT1mY4qxs4mcpAVgkDB3JCOC2o8Mngk/UOHgvwK0QqaAuBoCwGjUtKY8zLUiqSFDwwbwFVmhR75GVBnMM2hfnJ+BKJMLRM47c/lKLxqDSHyVGWlhqoaWK+8/Ld0zxtoH4X+ZCRIULKIYARUl8DcLO5uBxstRTWn7AO4uJkcbdfdbq0G7vnKRN+1U7o42WAzBtJ7ORj2GQfA7Gv8CpvIMJu5qfEz/CCxwLzvUHCrJyD/FtkrkYXIaWMH6dSz5+bxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SG2PR06MB5214.apcprd06.prod.outlook.com (2603:1096:4:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 02:34:39 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 02:34:39 +0000
From: Wu Bo <bo.wu@vivo.com>
To: linux-kernel@vger.kernel.org
Cc: Serge Semin <fancer.lancer@gmail.com>,
	linux-mips@vger.kernel.org,
	Wu Bo <wubo.oduw@gmail.com>,
	Wu Bo <bo.wu@vivo.com>
Subject: [PATCH v2 1/2] bus: bt1-axi: change to use devm_clk_get_enabled() helper
Date: Mon, 26 Aug 2024 20:49:44 -0600
Message-Id: <98e5fe3c7762f3c2cbf7b2f3b3461c0cef789dd6.1724726725.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SG2PR06MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d031f72-d463-432c-19d7-08dcc640ccb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cNr62vWl93k8Py2NWunVNO15CIMbkknl8blmRRLtm2DbaZ/4/YAgur7mZwYM?=
 =?us-ascii?Q?h1J5AFrUcsP8Pt4eV+TohtOjqK1oYVR74BizpZvnqr4ZJJpQYjCiG1NCx51d?=
 =?us-ascii?Q?xrdnohIu2OdEizPD2CorAsxJmCK5dJfiNBTk1p5N/DTK46vWvgT3SAShwHoC?=
 =?us-ascii?Q?/yEWNbaM02Qobod0yKaRAQ/CxZU30s8vHaEOBLAKYYYluWDXOyv5MyulcAlF?=
 =?us-ascii?Q?OJ8hSEFhu8V4IcSCUVDEuGJ2GsQSlQjOoe5vPNlGDNHl+cWHSJcA9qiowBOP?=
 =?us-ascii?Q?PXJ1JpIJ9sdiM7DrPBYu8RZqwi2tCZqR8YivmXt4FN/3H19XFdZnvRR8QOLb?=
 =?us-ascii?Q?nHtGivyxJUjbyevex0xKdmBkATU/vZjBpHAmXOHpOiIVp9pDSAMPmzDHgyPM?=
 =?us-ascii?Q?SH4MdKew7YUtSdKdNQ7GePUz7vn+hjUGJ4yuAsL1d4WawQMLIKUL6mffMZHl?=
 =?us-ascii?Q?E7FOhNRzv7QzclYxl/PMStFdX+irBqm7PviZwdn/OgxPpi3dxU/6e8jhfejI?=
 =?us-ascii?Q?o8DcHmaNGYgSb3KfFu31qtVqOHouSgFf+1oFou4rNOOFRhnL5oH0SWp05RV4?=
 =?us-ascii?Q?BnVse4t/PVtwPsgi4UKXSFzn7sY2VLRV7zKEvEApPcJC5SjRg4WDmlMwT9Is?=
 =?us-ascii?Q?K2bL68qmwt5+9ZZ0iNmB0uTe+H8fghcf6mLiro5HO72ZOm8PrVa+ZFzO4F9X?=
 =?us-ascii?Q?JoY8vQACGN4NzElSWYoE0dZlo8illK46CEKlWeZcZTAMJMl8B8JjAjN3VREJ?=
 =?us-ascii?Q?WSCoZfIgRo6DeROfADiYAUprGxU6Pv0EQtov12fGEvR9VqCCV31S0RXkGrl1?=
 =?us-ascii?Q?OQNo2kD/2ZVsIToBASLeEgokHkAWGaNR7skyhnK8lRrzPxzliuDIAUTbAsG7?=
 =?us-ascii?Q?E+quGq59nmlz/10CVE9mQRBNHYTD/R6R0EifDVfjA75F5eHyLLZsNHuMjlco?=
 =?us-ascii?Q?gy5U1KBIwqAlcPcA4AP1x57IUlbqRzsr2Yw7+ID45d+WPebh3GwsQ7DS3lA9?=
 =?us-ascii?Q?9Ev3Tg3BPDATIZv04oW+W+GHzmWIsOMry7JFBEkH/a2hlxD9tfjtwjrpy9Tc?=
 =?us-ascii?Q?igMFXnVbbByNq4E5eyL4ivqJxJ0THDznY3I34w22H5oHQd28/Cct1xSqxdDI?=
 =?us-ascii?Q?HfmZaFfOWVbU+oPii5fOa9gVqw/cpN8n3ANh4WzW7OOknWnuE7zN9c1Gm2Yy?=
 =?us-ascii?Q?Y3A80kyJNvvjhbMvHGEGa2gERuKgLaI1AcZIXRKIPEmWqLJOloVxALpyu4ov?=
 =?us-ascii?Q?rl3fawlK7GLj7ACEUGrafTIdOiJhVvr7KBlRtAAUzDwhOYL8NwCN2rBPIUsQ?=
 =?us-ascii?Q?O+sMa2licv+5OPalm/ybnAKCkGihmLmVZJBUZLST3tY7Ax3iMzHrLY5Ipy06?=
 =?us-ascii?Q?nm/0Qry49IYYTWtmvSvE7ZXEN0Pp5m89H+tULke1cENgUciZJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4486.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uq+ub1X6xKQuxEsF0Vanrw1v1lUJjO2p7RXLoitID3S0ul0J/QPidQ6w1FY3?=
 =?us-ascii?Q?e2impMdRIxNckUBfVNlihZTRMtYTpI2aqPJ2Yx1sFrbxxWjbuVMTS9JFUB0h?=
 =?us-ascii?Q?pk2wUhj63iOag/Pxmyuc5sfSG1CN6P/63P6Fff98BnQjx/Y6fdnRmN3Y0e3z?=
 =?us-ascii?Q?dc0eryHOETLMbqST5y9sPG9Q0F2czgklA2eK4gatGsoOrF+vlbl7rN+pruNc?=
 =?us-ascii?Q?Ed0o9XyvvxLgZqjlktFbPz4nJMMbHuELvZW2xqYFoTjHnxHs1277cHs8Ueta?=
 =?us-ascii?Q?kflwoFwlhdNnykrhKtN4AFTvF4n/nvALI3pIVbYLod+9ptmeUCYn5QKKqJUK?=
 =?us-ascii?Q?cKwENSvLhvQjhggiLukycs0sCKvgWA55ycbhQ9Uq1qIiND2MIwTI5W34wsqU?=
 =?us-ascii?Q?Rw7gObm2y+rysXqKf5ooVZthqUwjsAC/iO+uN1d1o0mRZ7+q7odCsl0/85OD?=
 =?us-ascii?Q?zcrgX/ZpmrjsrP54JE1hv/gGfrOzzmal4NJiWXrgXMDp51D12ZOGgNIFCbUc?=
 =?us-ascii?Q?QaXEHeY/93lqYwInZ4ZMlWQI0PXAvTGUIutNmCKLH4otGY/pdCxrPuMxwV2I?=
 =?us-ascii?Q?IhhEM72OaYOocVcvIJu5hJ+k8FsFoE94dW8A/96eQyyt9meLs81vPPOzEOsW?=
 =?us-ascii?Q?N710NWP9k3u0BoJAF8Etr1fIQ4hIV9x/H6QZcQabiSxVr9uxK1B9gNoKQksp?=
 =?us-ascii?Q?tEGFAGsoY5Clpy+0tEWevU93zKt7Yrjs7yAWUQx7AhujGkwAbWjvIHJnyDiZ?=
 =?us-ascii?Q?GGWjhBNn5uXWQwc6l7Dh4+luQb3zeRgE8C2NhR7G8WyukPFYdPC2v9yCRGPi?=
 =?us-ascii?Q?+qchG8Fav+A/W8XhMyAMaxNHhwZuuRQKppTnWg3N9qKqF8oBdsGBhMUly3L7?=
 =?us-ascii?Q?Qo7tEOC2ScdDPpqXXkPCokVvVqP0JJXJ0X+2ciIY1T2mxQpeYY24VfIrPwOs?=
 =?us-ascii?Q?zDWWc4JQIg3W5MuXcqbyzdpNy3i25wZAbZAdQaNhf+P6Bcnj8kzsxd+heRSQ?=
 =?us-ascii?Q?2ho9Mlp3KErgBQ7284CCltXYztLy8yM0FR/5zc3dYsnqfycBxN5cnSm2kVD7?=
 =?us-ascii?Q?J++TUQmpwEW6D8kcXXzDNT823EOhVLBozGZt4eCjZO3ZprTI0HvBMAuPhpjZ?=
 =?us-ascii?Q?wiemk8bD/CZ1OzT0njdSHPlB11hdEUrlXGVtPhH8DBW3J4V1zcJeCbAq/989?=
 =?us-ascii?Q?lMUqh7RH4MMPNpWw49fToCnHOMWTj42Yce2KAkGmO+Q1wCJLxvL9mutxJRez?=
 =?us-ascii?Q?zSyLeSd2EY59Bloiltn0vI/YI2rFt9tV+i0NE/2BBVPn0lbtgYoNuS6pvR3K?=
 =?us-ascii?Q?sOgcWYgLwUNeDf7RjkvXwIEjdpZ/+jWTwYEZTNw40QG21ZtRXI1eZsvgvqyf?=
 =?us-ascii?Q?l/TVEh4Q0wsalunqgTma9y0kprzvZcbwHJsSTOBtcSVPuUGmQIwvpl8X1O81?=
 =?us-ascii?Q?E4/09NpIuq3HM/1vhpzRG9x/z/2DmmmQulpADnrtYrE886NMZFTDW8tHn5Gu?=
 =?us-ascii?Q?NheyvIqSp9gRezs3MlR/0zQh6RbXw6Lz6dtQPT1hbm6R4er1XJEDIm4UBYxv?=
 =?us-ascii?Q?pYsAyeSNxwrffBe5PDAk5nlq/o/k7owSTXc/5zoG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d031f72-d463-432c-19d7-08dcc640ccb4
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:34:39.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgi8p7KKbjPHZhnMttsAIlOzoFXUmlgQdcz7XDmnbCJpKONSudOS1q8q1BFiDQyAa+7MVOD0tBi8u7N3/590CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5214

Use devm_clk_get_enabled() instead of devm_clk_get() to make the code
cleaner and avoid calling clk_disable_unprepare()

Signed-off-by: Wu Bo <bo.wu@vivo.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/bus/bt1-axi.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
index 4007e7322cf2..a5254c73bf43 100644
--- a/drivers/bus/bt1-axi.c
+++ b/drivers/bus/bt1-axi.c
@@ -146,33 +146,14 @@ static int bt1_axi_request_rst(struct bt1_axi *axi)
 	return ret;
 }
 
-static void bt1_axi_disable_clk(void *data)
-{
-	struct bt1_axi *axi = data;
-
-	clk_disable_unprepare(axi->aclk);
-}
-
 static int bt1_axi_request_clk(struct bt1_axi *axi)
 {
-	int ret;
-
-	axi->aclk = devm_clk_get(axi->dev, "aclk");
+	axi->aclk = devm_clk_get_enabled(axi->dev, "aclk");
 	if (IS_ERR(axi->aclk))
 		return dev_err_probe(axi->dev, PTR_ERR(axi->aclk),
 				     "Couldn't get AXI Interconnect clock\n");
 
-	ret = clk_prepare_enable(axi->aclk);
-	if (ret) {
-		dev_err(axi->dev, "Couldn't enable the AXI clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(axi->dev, bt1_axi_disable_clk, axi);
-	if (ret)
-		dev_err(axi->dev, "Can't add AXI clock disable action\n");
-
-	return ret;
+	return 0;
 }
 
 static int bt1_axi_request_irq(struct bt1_axi *axi)
-- 
2.25.1


