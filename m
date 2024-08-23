Return-Path: <linux-mips+bounces-5030-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB895C325
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 04:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76A7B2823CC
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 02:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B41F18E3F;
	Fri, 23 Aug 2024 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qEWEm2Hs"
X-Original-To: linux-mips@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010032.outbound.protection.outlook.com [52.101.128.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D963947E;
	Fri, 23 Aug 2024 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724379373; cv=fail; b=QMgDJFuGQgAJhMTeqYVpMCfXOJAvTWsaMlXXdJRzx+yKmx/j6w1mC4hcoIZsWalawg0vaKVRwKjNk6/yvCtDU/1bNOzIgYQj0DcQOFmSj3HIE/lnslcqOtDSL4CG1iKeTP1F3Ulvcy444G06F20HQIzL/VnGF2GoW0qhblFj2wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724379373; c=relaxed/simple;
	bh=ZGwzgYbMjeJ8sYdpGbCxo+UgtxVHpkrk/VrwaHzrABc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Vxy8QeygRXKkfEn4+ZTrNYf0lryvh7sgPSyYdjm8anelbFAFa5oGWi5BEXdiXyQTN8DQRtktFuI8p42yYpUshnO16YsxPeS45cNw8JewE0cEPI2ItQRt4hIA6gqutZ7JzOAV+ZHo83rTeON/9BroGV92mauxGFrdQNynw9rEve8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qEWEm2Hs; arc=fail smtp.client-ip=52.101.128.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p68bt5seOHEVs1+KzXCEp/clY/M3PFMkgKrif8KzheBksQfuth3rIDJqZL3x24Tx0pW9EWWnoRrrZP8tHez4xL1xUhQJIHvxZI1IINOSmq1Ut+JC9M0xSDVsfctpQGA/DJQznPFGyG6DfLWbzuulZlVm15Etc5+7ejkwEUk294E90Bv/0lsKEpM+6gzcaOXS8Fy9/KLk8TykQPGBpBKmFNYexjepD2NrviWj3allc/rlE0O+aEqLxyTjfWpG88o04PizmxuzrMSr1HYzilvoqYNYD5gaMKmgKiRkJ0UYQI5y6Fv/zi0LJaatBy81Nj9iTcZkAzTqSqu13xk1+dxIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLq48GqfWEDBKqzUrSkeOSZEnt1VnKAevbXpe8wvGsk=;
 b=KPJzAHV6H31OqDdeW9A07o2G4en6JVlbqrAxVT1w+BuEGPsMSTjTWA1X8l7H/td9l2JoxhPbkoDhHCZgEdjlq7c5Lcrv6UcG+h4tdieKADEIjIs9FMDS4XgvO1A+rEDZxUMcaaoSNv7CKbMJ62jJx/TqNcZk2DNmZZbbXPFzdVIRQNuRqlFl2V8lYRGG0rPbrPEZKIXIU8eNF0jRO+IavrLd3/zH/9xARj8CqfHGUGXC/VqYu+QoYHArmIlpZxg82qqOjqZTSjbVWhVpqdiP0/29d8A2H99pERt518vg9mZBWu0UmwUv3+HcPaPC/DuphIbiWPB+gqfvDIZmC4j03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLq48GqfWEDBKqzUrSkeOSZEnt1VnKAevbXpe8wvGsk=;
 b=qEWEm2HscBvFicjyMHQbwdk4TQPCfoM5/hKKVZzogfCFBHrQiqVXDF+IB9CvoUan1qIY5thDyFlQEPC99ezUw2wp4B6i7e53LtjalpI/da9jEmoADTM1YChL/JqBDw2jPVXd3XdQOISknr3e2nHKS9QZEzvIG3Vj+MsTahIczNhdxllisyk/YRHcfk5XLg82S6CZv3zxYGhyvi5IKMQS2rkmXtE0jwalnLA47vL+dYYldqZibOsBHaBGD4gbwHB06dzz5YmUwqssR5VZjLmk2uVFGEaEfHZQHVR+K5kVgDzkk9/zNl6ugX1MJmGEfk+WTSrVJ6nJOVScR56iG1ZJsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TY0PR06MB5779.apcprd06.prod.outlook.com (2603:1096:400:27e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 02:16:07 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 02:16:07 +0000
From: Wu Bo <bo.wu@vivo.com>
To: linux-kernel@vger.kernel.org
Cc: Serge Semin <fancer.lancer@gmail.com>,
	linux-mips@vger.kernel.org,
	Wu Bo <wubo.oduw@gmail.com>,
	Wu Bo <bo.wu@vivo.com>
Subject: [PATCH] bus: bt1-axi: change to use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 20:31:03 -0600
Message-Id: <20240823023103.1984437-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TY0PR06MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4684e0-1fb4-4d27-6d55-08dcc3198c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8YN6dljBJql/CKiZ7C0ZXv1DAL/nI2HMfjhJD0jpsmC0Bdj2PWnaC5Rx+eVt?=
 =?us-ascii?Q?UOouc7C9Z5tTfv+VTwXStU7mW3WIQ6hLgWEHIB6PX20qv2kikkRe88Saz/wY?=
 =?us-ascii?Q?QmpaLAXUiy35tq/gUar0/NOMpM2xvMOw9eeN8I2mWJ0N4z6VdiMml6MTdTYZ?=
 =?us-ascii?Q?JAaLYGG24U5oKiSf+bsYVTnWfoH3XDPMuyyuOpwhl4raBCvHgYJfg2E4FjZv?=
 =?us-ascii?Q?JsBc2zvBSSjy1/irc0VLdOiG9jOD5ejpo7VK1di7YMfhLroQbgiUtUyzZQZs?=
 =?us-ascii?Q?fpzZ5CMEf8CaWGvDYDuuv2S13XFia2F/4Fplk5HK2RX+ZNvJaFzDPcElZxBN?=
 =?us-ascii?Q?BhxpFYXLlz37qB2QAmBZXiyJbtatTKRqhHrGTCSLqujFGrTFqnFJefP3l2KK?=
 =?us-ascii?Q?x5v4yQUM+Tkyd4lSWpz1/zX0Sep5pvlWVAlzJbpz7Ev3hEkTtiQR6/meLlEv?=
 =?us-ascii?Q?zPmLPvHZkzWU196ttT6OaEWShp1JWveO1W0qNgk+NaPRlIkJ8F2UugTpTEHJ?=
 =?us-ascii?Q?W4Gn62qRbA00gtcR147VLAj/Zzwvq2Ruyh2vYVFK5UCqfDCRs5vsEU/fU90f?=
 =?us-ascii?Q?GR/sQ8G3QF9L2zB2Ls7NWwbeEP1Zn9vZhRIN73fLsRvCGJJaS27CGbpdL3aI?=
 =?us-ascii?Q?1sq04WFBRoaxjymiMKVTQWhsvoU2E57Qw3OqNzfDfJHV38YQwEI2AVNCG0wr?=
 =?us-ascii?Q?Eui7cNGrNszwYcNmbs+OkgzG0GXpNKU8Y3PgF/6R99gAlRgr8rvEoOm20QD6?=
 =?us-ascii?Q?a+vmMkU2K/+lt5630vurWH29udFh1JhxcDG9Nb5+emOCHAfCWE6VOAvKZyqf?=
 =?us-ascii?Q?fCJ+vc/Moldv0AYqgjWP6hW6Rt0K5iTVu+IcuW0V3Mwh2MDSW6+ohnEVCzrz?=
 =?us-ascii?Q?NESqUvFzxYc7bqgZZUCQPc+vx0Q93vxjOfxdcmsVzgZgVeMfzNVjG7VPJ/cA?=
 =?us-ascii?Q?yDon4xkUOTKgXd4Bze0g6WTwTwVz8vEvmHW20Eb1xugoHQpSdUiuf2bi7bGh?=
 =?us-ascii?Q?9I4JFMxehlvMiCIWAc15TyE+EepAyPtBcenRUTgwkfghQaTBbCCodzdV99CF?=
 =?us-ascii?Q?58ZSTvCOLeIPpcVxgXXd6zdeXUiKU5WGS2uhanvLohoHKmX5Ncgb/YRgAvqv?=
 =?us-ascii?Q?3arOM1P/SQos+5S5mdBLmvXWgkmLVvDcW0+JEtNouGPNLm54SbE8tWfG875B?=
 =?us-ascii?Q?b3nuUGM88ZoGQJypFNS3LRSBhFisd3KdYE+hOg0dKmNgcJKg6He4A/u7y+yX?=
 =?us-ascii?Q?iJ/QSyIyZVLIp/5qhWNFO5VCbQJ52T9jfwBlxuhi/Xl2RA0LPB56k7glePAa?=
 =?us-ascii?Q?i6qCYW+WyxMjGnvRUb/rs1BgtbAnf4x2yePQa1EK+8icbywHGhuvoVScPYPO?=
 =?us-ascii?Q?clb/GLCYOLDVF4BTmoRKlo3XE3Sk/N3aXrEFzPacXySWkGOxtg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4486.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9XAIWj0hiluLO96IegR5cQWvRGxVMRpZb1+Y8QHVhEurDe8CYKPTHzyVQPiS?=
 =?us-ascii?Q?k6hz8MieMaNRslAs8beJ31G5NVFfbqQITiNo3TMvEkJKt2dgbK3zsjb1PkYO?=
 =?us-ascii?Q?9ZbAW/O7YPhew+p27VmZaLtjvMvlPwSZ0+xgfpdghBcYlRPgqGiAZDOoBUXM?=
 =?us-ascii?Q?BAT97xPfRQ/dXSbdKdjn6gjZzLLWolAJ9S3En5e9w77lA413qKlrlhc3727A?=
 =?us-ascii?Q?bqa+iRNirodRMSBIaQiksErpPGy+BGFYzjvfi/K0Z+4DjxPqI1erwIyrPyow?=
 =?us-ascii?Q?a2ygIzo7dNWmbhW/k6uD6Y36j9/3t2fID0QfzZqjFXL52sIOJx8iwV5uK2bb?=
 =?us-ascii?Q?rAVsK1ungjwEEpQUMFmDlrGOnGcOCV1EC46BuF2MKH3zFI/00iZwmcDusNZx?=
 =?us-ascii?Q?w6Mp0fMWRDJzvDRKvZAHzIsTI2VClRMbmSGPMOV8M+ulV7YeeTYy6CoWDWIR?=
 =?us-ascii?Q?NRrtxxCkipF/CVeObdp/s3aKQiFA4u/THbQzkrzMHWS+O2V6scFY9rSM6iYs?=
 =?us-ascii?Q?Z18rH+Sug6AmtWv68h1F3YMcIzsGOa6WnqwjDiCwalcX6zdwfaCk4fVfV9P7?=
 =?us-ascii?Q?j37nJb/PLBWxP6qFnCT6uN7PCZq6yhiygMlRQJIhwFXXvX7vF/QdN27pm1do?=
 =?us-ascii?Q?Fijai5AOUB1n1HzG2T0yggM8jyc+NIaf6W+5VRdqAjZzlPcOegRoTlFuS02M?=
 =?us-ascii?Q?2M9PWu6KJZpRy5mIPhpNS2i9wZa00j5sty2jcMci95B3G3Wf0PT2JutMOlvX?=
 =?us-ascii?Q?wVboBB6+qIOMsZON/65q5OwhyGKmYOdhbahT99GHYJjFSyDb7rP5Ar8IW6QK?=
 =?us-ascii?Q?waD010cwbdYD/Y5ZCIQt8X3kf9kWdJGjKPkuni7Strq1tGHJ1GicQ6Pz3ruc?=
 =?us-ascii?Q?1IGKWgbyBoI/NMQHUmlnL85lfyYFj1NnzmmEt1J180wbSM/52q0cI8SH6VqZ?=
 =?us-ascii?Q?irUcMcwMnHRF5nBIURyUoz32wttBFsAxZTNDtAe0fPnglDlcUVB8aOrld3la?=
 =?us-ascii?Q?icXgzXM6QmPoFSJ7pjluBdvkKGvbMu09B4SzVAHsYt1DwFstXmFnkpoTWGXI?=
 =?us-ascii?Q?k18dTvP2Ic8tpKCh6N2zm+X1K1hUpkecW44ea7nz0LmfIx0+/ODSj0Vz9/sZ?=
 =?us-ascii?Q?aHG2OJHm2GfcCWGREmQERcUSAxtTyywkYnuWhrsYmRjtS2XCFuYmsQEZk0V4?=
 =?us-ascii?Q?wySVrdudwj47LMsXoylOuq1PTDip3la9qhzEZm0hruxmQbuLKkZlvMsBl1mJ?=
 =?us-ascii?Q?9kd/JiQ3UOamotHke2IVT453BXJGlwcybipnKlRcDz7eqytPE1FfJS3Vxd26?=
 =?us-ascii?Q?zt3xAImi381AUCMgMZRho0DPgOaG9pZVfwwlZuZwEW29ioRPj6B1SwSQRf01?=
 =?us-ascii?Q?yCPKKVkB4cHLO2X5ykUbLCuOHSrFgP8EVrAorJkJ30jLJa1QlEEHPS2mpaGZ?=
 =?us-ascii?Q?3zABvOqcnPDuumahO55kSVCGnSzFcmhuxCSAYK/Jbk8oJjIBYuAdyy2TEzv3?=
 =?us-ascii?Q?cALjKhHbNUpaqi/xqKG5XWuhBDG+HgxQF5GRi+5om1OQrr45fZXexPkKC19s?=
 =?us-ascii?Q?iqtLll6MoiL5pFwo9GboEzXzhD8U5Lbrl4lmR23v?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4684e0-1fb4-4d27-6d55-08dcc3198c07
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 02:16:07.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mldEJ7p4ccQcDY9BqLHVKUmwg1o3avatcm+gM1Baq1RWv79uqhVwf5sCrdI35es6USg0+9jrix0cU48e1va5YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5779

Make the code cleaner and avoid call clk_disable_unprepare()

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 drivers/bus/bt1-axi.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
index 4007e7322cf2..b0baae49aca6 100644
--- a/drivers/bus/bt1-axi.c
+++ b/drivers/bus/bt1-axi.c
@@ -146,32 +146,15 @@ static int bt1_axi_request_rst(struct bt1_axi *axi)
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
 	int ret;
 
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
 	return ret;
 }
 
-- 
2.25.1


