Return-Path: <linux-mips+bounces-5104-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EB95EFC7
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 13:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC212835C6
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E0114E2CC;
	Mon, 26 Aug 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DoOj3zjh"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2087.outbound.protection.outlook.com [40.107.215.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6835140E37;
	Mon, 26 Aug 2024 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724671948; cv=fail; b=sEspU2HA6HzklMHFGHGNFaUw1FAd3UxnX+QVhUXBFhueUWaRKPCs0QV0PrkLochq2rfLB64CLaZLMtBpvy22u8kCSB8xC7DK77FkMgm9PxiL3giET6oY3PovkEQVG4iuVfS5/Kx5WDrEjaGrlVggQLU3XY8QwnXic92YJrRBSnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724671948; c=relaxed/simple;
	bh=wMm/oQM7P0LkblRhoyx+iiXckizejswqoVP1NOs3Gcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjCmJSWkAV0w4ZS7Yx+U/1Fm1DCB2EnCw+feV8uALrSZeihPz1FnH9k0xZQAfnc1HNpi1/KTJgd7A7y2PcDAOySgcOa1shaT12Ee6c1w5lkbE7eZerJmHUlfFUU24s7kt62HwQUyTX2IKrfDVcRjNejEQ3ympV9qKF3Nz3kL0Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DoOj3zjh; arc=fail smtp.client-ip=40.107.215.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPopCI9FhjERPH/YEqcf39RhlmLvpLOvTgglZzQDGFfr6ENMYTURHDArDPTgtS5HW0xhBCYHYEnN64qkqEDomzXeRgAkI+4r4UEZ2Xp4lx+/jTnNF8K13Dhk0FUbZS1TwqLrwRN0GwOr04Ahio7AhTTqwTi7cyx5swU0ZOel0R5LwfAbBW9V7fammmYgrUiIkwFrlNiRi6+3FokOwHVTj/2BrkijNNfTGzCQyEEqjdYv2HEAkGb4OxymjSuZzzLc6ep0h3FIjMPXlo6LMxaON91PnN8pNO93gSlmJfNm7mWqSCiff336h7p2yZH4zKZZ8/J/JcX35YFgmGdWYcHFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuRyEXqBmwxTsibF/YQbovWPMiCujuWu93lLiT/1iTo=;
 b=OWZSKxLT11jwe0rzQhlqiSElIgESGvwgE15qgSQefEH4HI8E0UxYIjn7R7QHP5yTGbU94qIxK6NLdDyiPGk5r1ZvF+vc/PiuY8TLJPVhUY6ip/JUTDCvJo4+4ksoQV3qlFtD3MnCEmIZmQOndLPFq0OZmI2ZSOTR0ku9aqJiBitENa/kagpVvCQn5FeRVdyoldy0qvxjti2PegQk4rITgePqgrCYlDL14029pSgdeUFERQmI2U8Iw9cB3yWqF+8hr1ycA3bzv76dXURcoFOTF9L0WzQXnavKBWRjz52As+BZQvu/pZGtE4mUv9QrdrWzJ1b1DdaSGOVZIWY7Hhrcgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuRyEXqBmwxTsibF/YQbovWPMiCujuWu93lLiT/1iTo=;
 b=DoOj3zjhu1D3z6HPJ+InlM7ftysF/rh6h0KxdVojp7zgn0aJWWwxwmQPbjh0Q8sPEH/JIKN6IEL6xb5VkBYmVsjsX7GnQQfXnCGbjOedoXE/bMrzsuDe0NQmBM338nABk/3XkT81SYSZoXzwFpuD6ypxq7jZ4myZ96sU0ZPrtO/5RISEVwAIUDdl/lc74Am4jh/+nk5BDwi+jeM1QVqzAflL17aYbf3ZBgczbb9gCBPYYy/9J3VaOMXVJKSG/+alph+L1Z0WpkuF3VOxOTjHTUhOr/1Zkkhsmc9j6aVpev2UXmQQPWv2I0i8/PLCB2Rz7P5WTGf3pi1eOxT/A2DcOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 by TYZPR06MB6466.apcprd06.prod.outlook.com (2603:1096:400:45d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 11:32:22 +0000
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd]) by SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:32:22 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Lei Liu <liulei.rjpt@vivo.com>
Subject: [PATCH v2 1/5] tty: 8250_ingenic: Use devm_clk_get_enabled() helpers
Date: Mon, 26 Aug 2024 19:31:57 +0800
Message-Id: <20240826113158.7280-1-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826112933.7249-1-liulei.rjpt@vivo.com>
References: <20240826112933.7249-1-liulei.rjpt@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To SEZPR06MB5624.apcprd06.prod.outlook.com
 (2603:1096:101:c8::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5624:EE_|TYZPR06MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: f0af154e-a901-41b4-b84d-08dcc5c2c091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U/OJhCvve23H0hYIC2ChVpxWLvE69scql18KqoQxUk/TEZaMEseLT8dat+l+?=
 =?us-ascii?Q?5TCxQhJBAxR+EGc6Y2cs3mRX5U7g/5d7RfXykZcTMjOKiXE0bM3K7Ck5veMS?=
 =?us-ascii?Q?i2xk1tDGvkbxFZOzSIHmj3DNCKaXcqeJR6YHWqSyhbdJa9V8FfbzRAqLdcLx?=
 =?us-ascii?Q?fXfFMbosp7JUbJ/HMhrAqooOm7khaiTXojq76c7mNCnwY454ulxm5rijwDEu?=
 =?us-ascii?Q?puY/9a5B98h3VEcd2UR/W/8uQg0u8eyVBuVMq0fe1kpqaAVw9SwPJ8kxvfy9?=
 =?us-ascii?Q?aGm7YUd8NOIB/oyox/Jmmr6GHgvVtiCjIWPxbyr4fpJPBM/t0gU6eJtwPA1M?=
 =?us-ascii?Q?B8fF/m4gwPaHWZlEZu2Vl6i457ffn+be8Bn9Evt6DIuY3gOmb1YABNkPUepM?=
 =?us-ascii?Q?zixT4W1VZAbgCmGeWqrnVuq50aiMYwukpuU2jMl5QlWiTZLYvW7BYoTPQSnx?=
 =?us-ascii?Q?5ioKFX+MX1ic1CoHPaXWi48yt/hItWd2FbcG6c7/dhTJcLj6STpJkBrcqNEH?=
 =?us-ascii?Q?IZJ5vWc/hsz6+cFMTAntZdw4v70q0pUktzJXp+05ikDv5ZFyQjZC5m7N1+t8?=
 =?us-ascii?Q?HHLgjByKAEfjN9jajA18QN2A1UbasTy8POUAJWHS95XEnFGZHI35vYCD3YzR?=
 =?us-ascii?Q?Jmjnunn/i/bfjLcXPUCesJVdSZWtq6IHD5VZR/TSgjkV83l42Mzm5DLtfGCp?=
 =?us-ascii?Q?jo+yX8gOf/J0wx+3wo7RsFuMwrZvLYQA+IalZYcUOiSk6gvHaby2MGkEWB+b?=
 =?us-ascii?Q?rvv9egh4Ky7oIuHYOsM7GXG4Pu5rWaiw/HxPagpOjumK6JwelJzfKKc6bW3j?=
 =?us-ascii?Q?ttRHy+owuvVuImj0MRKUig7cyjc5gmjUaCP0Oc+KPSs3xinqKVnEBDqHKUBh?=
 =?us-ascii?Q?jexCNk06oyChtjFMYiM8k8mIcVE5o4mmQXmoFwKmApW/w7bH+1ap9bGYw/31?=
 =?us-ascii?Q?AXpYCYxj4ovxt9bkCPx/dar76Um01yhywd3kv3UFyq2U6WA/1gWs0Fpm2ouk?=
 =?us-ascii?Q?POxHJUNc4K7xG0+sNzzsKA1GLSwBc8RcdldTUgoonbmt3k26oWXZABL1FzJ8?=
 =?us-ascii?Q?fsnrsqMXrhDXmGPep6tJLt+lCyDQHfkEBV94EqKe5oOXH/w04hc2eoYPG+/V?=
 =?us-ascii?Q?6B5ipq1tcYJmkCkg6YCl9i46cGOOG1yU3UA7yBeO6EkEdVi+/xNZH79T56vt?=
 =?us-ascii?Q?w2RllHoNi6mkdr7TlRJZm746755GE1Atg6DJJiKeKhMxvXiPL05xnyMlH3SN?=
 =?us-ascii?Q?yYeBxfmzWSYl+JxF+qwn03fG9VUvNmirKP7ru1/SmwiJtdoIr+Fgv8vpvxGQ?=
 =?us-ascii?Q?CpXzWUijBq0HYSa7Mlw/sTjXo/XPt4QBV6e1yzw6Y1hls/IHkotGLHeA9Yf/?=
 =?us-ascii?Q?kpt1Zj+S8qZNK3P6Xc3SurogrhgSc7JF4ZFmjvyIMXS1Ml0xqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5624.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JL7Aj5y/+gpcOlnSQOPUQ2skVgr565IV294MC4nruaAavKeYs/8cjj1xtgHz?=
 =?us-ascii?Q?1P/m6ipiZh8D2ecqi4NNAZW8OvL6f+vFocmxokvNzYF8yZ6/Cen3fnLwgDxZ?=
 =?us-ascii?Q?hsJPw7i548rjtTREkBHM5ac0e+k4X5hRgQuLOcVT82o5+chB1exlRqsZi2I0?=
 =?us-ascii?Q?8cq6qSLw8BUx82cqJUbWUCDjzVkBCAjZbRpY2AHfHIghg+9Uhf7R6f+b3SON?=
 =?us-ascii?Q?Dqc/pshOy4PSHdd/U6qfBgvRqqU/be3NO3Pvm+VpAF/9ED1LV0tnPw+7t2ej?=
 =?us-ascii?Q?JmrvVH9XPnqzaSAjLK3EFLMPylW54c2DWWLTmgMoxH3Q1e4NEMOPhevaeLT0?=
 =?us-ascii?Q?dxjtZGLYQjd+lMn3eypip6b2EnSP8r36SqD4Cb9/X+qN96Ka+a0DEAHHKiDS?=
 =?us-ascii?Q?g4IDKBRRbZgwJKvBVM/gWayp1wPq72Q/JEtF+PAbYbX853FR2FB17TaNj/mG?=
 =?us-ascii?Q?q4b8ZpplYQdNefZLCPaUgZztb8Agln0zf6C3kRUcuzLQXEc6wW5CQar0ypQk?=
 =?us-ascii?Q?EOgyltaApq5MDKhy+PCcOBnNq3madxIqEfBkq9QXoYl36ChF5gwMxE1s6QYv?=
 =?us-ascii?Q?2epbsMqJ6AN6mo2kqTFvl0fp0IQET073rMe6EFqVQZRUGub8Q34oBTJ0nQge?=
 =?us-ascii?Q?q+lWFPtp0rkHCPTu5jb7YmB6ur73Ji95LiQyUjt1naU655lQCEblWEKyNylC?=
 =?us-ascii?Q?gVlf0aNwGHI9COPOX7xTojBgTl2O2ceJ7zJc52Bl+hMxOLtBV1LoKcVzOwzj?=
 =?us-ascii?Q?h2dax0aWczQURYcQBtJkfED+lkZoPkeMTd9Qx5ui/3hDK9A2W3/FUJ2RpISm?=
 =?us-ascii?Q?UrjJfzgE9j3tBYxmLWnA5tF6N1GqEXcyA/JexayYjrXofRdEJFt6k+g2kMGC?=
 =?us-ascii?Q?ivxx1v0lSreWQxFdAo7d9fCLvjHMV55v9CBEXMsERq9uAqt8iRxeRrHksfiN?=
 =?us-ascii?Q?TFgSUo4c7Hqo9Ytn13E8xaNUkea6t5t4vp1TsttXQLXz6bcHQwA6GGIkqqDe?=
 =?us-ascii?Q?Czfync1VfyqPGBUS10JKBtUYTek0WmdAGf1EZUfDhPzHDO/EReQRTr9aOGyY?=
 =?us-ascii?Q?L+cR+Ev4OrZ3kJvdPGlkY9bi9OSxqknrW7XPhVZW2zhQKe1N2YNOIsL/LVkm?=
 =?us-ascii?Q?BTu3F8SYx8rZgnL4pcDKkFDpA+D58Vx/mbxAB611C0Bv36QB/g5jeTISwIFj?=
 =?us-ascii?Q?F1YnlHJ4hGfxc84TR+s3/pTRKPLQprZXSNaC/WdoJnbeEKVenSinoD20/ayp?=
 =?us-ascii?Q?TwNwnM9oB8C55rod4rLyujtl7aNx0QiBQ302lfBuJ/TLVGPdo13PsX4A9Zuj?=
 =?us-ascii?Q?IT+cbhdKQkL9k4MYBHwhHoC+xoORIMCITvALwdvRLI2Q/lL32r6aWAKN2Xhk?=
 =?us-ascii?Q?+j+IFqFmIVesMEDJ0bxcXSb+oE178dNQSEANTQC15mKRs/P6qYaoYIYjbV72?=
 =?us-ascii?Q?qIdjV5obEO0UUpwZKWbFKEC0brxh1mQA3R0dTwsxJA+Es7e1mI3DexwDZzWE?=
 =?us-ascii?Q?WuhDFP+wtBdZo9VoLjbd6NfwsO701k2fbX2gQ/kleLxgSngfiIU2wsUAwAUA?=
 =?us-ascii?Q?Sh4dOztCJuP1CbZYcELHhcs+6kXI8hBrEU/ipTO0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0af154e-a901-41b4-b84d-08dcc5c2c091
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5624.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 11:32:22.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9nui62tK9j2qTXJ6xPpZTiykMWtPeTsr2iz3mTP+h2aQjs9AoM0e2KLH1LTssAGBMZ3KjtJOrzbY7x363oc9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6466

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

---
v1->V2 changes
1.8250_ingenic modification directly uses return data->line

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/8250/8250_ingenic.c | 27 +++-----------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index a2783e38a2e3..b2b7f784aa45 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -274,44 +274,25 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	if (!uart.port.membase)
 		return -ENOMEM;
 
-	data->clk_module = devm_clk_get(&pdev->dev, "module");
+	data->clk_module = devm_clk_get_enabled(&pdev->dev, "module");
 	if (IS_ERR(data->clk_module))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->clk_module),
 				     "unable to get module clock\n");
 
-	data->clk_baud = devm_clk_get(&pdev->dev, "baud");
+	data->clk_baud = devm_clk_get_enabled(&pdev->dev, "baud");
 	if (IS_ERR(data->clk_baud))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->clk_baud),
 				     "unable to get baud clock\n");
 
-	err = clk_prepare_enable(data->clk_module);
-	if (err) {
-		dev_err(&pdev->dev, "could not enable module clock: %d\n", err);
-		goto out;
-	}
-
-	err = clk_prepare_enable(data->clk_baud);
-	if (err) {
-		dev_err(&pdev->dev, "could not enable baud clock: %d\n", err);
-		goto out_disable_moduleclk;
-	}
 	uart.port.uartclk = clk_get_rate(data->clk_baud);
 
 	data->line = serial8250_register_8250_port(&uart);
 	if (data->line < 0) {
-		err = data->line;
-		goto out_disable_baudclk;
+		return data->line;
 	}
 
 	platform_set_drvdata(pdev, data);
 	return 0;
-
-out_disable_baudclk:
-	clk_disable_unprepare(data->clk_baud);
-out_disable_moduleclk:
-	clk_disable_unprepare(data->clk_module);
-out:
-	return err;
 }
 
 static void ingenic_uart_remove(struct platform_device *pdev)
@@ -319,8 +300,6 @@ static void ingenic_uart_remove(struct platform_device *pdev)
 	struct ingenic_uart_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
-	clk_disable_unprepare(data->clk_module);
-	clk_disable_unprepare(data->clk_baud);
 }
 
 static const struct ingenic_uart_config jz4740_uart_config = {
-- 
2.34.1


