Return-Path: <linux-mips+bounces-9381-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 675EEADEC05
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 14:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EC68175F65
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 12:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB62E54A5;
	Wed, 18 Jun 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cKiJlBFh"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012063.outbound.protection.outlook.com [40.107.75.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61282E54A6;
	Wed, 18 Jun 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249267; cv=fail; b=gXCtIPK55Ym20Z+9YEbhrwHb1hfrWMpvW3shQUe07/5Y4pHimlkf3N+k4gfIRn87FEulqckIDE/16ltJzDGW+6glefEkT5AJhvMRfYT866wYYjNMH+pizQngeurPJa2UoTgDYD+E0LPZxEi1rAr7uS7p8c82lgF9eaJPFeLEydg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249267; c=relaxed/simple;
	bh=qRDeYS3kgR2GDw3F78QQJW76qn4fOEsxFpeCx2j9Yk4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WuFCMPbybL36dSsiYinBz5AplY7o2zOJhL+KzKlzF5uBvzW7Rad7/yUbs/qzcciSQmGY5uLm7iYT1TizFEF6Y/fen+GxinuhrOlydqIUm8RAiSUWjNEnw8AQHCMnMTG/UQ7cUvCFhxH8MPlSNnGiIJ1V0A8zOkkRFWhpLHcx0us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cKiJlBFh; arc=fail smtp.client-ip=40.107.75.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCdKyQhZtR5NN6L3knJQTlyd/STYv+eub0v9Imwz5Buqa/tUSdPCgYH8pLw0eHzsWwH/oNLiTNydejoovD4nMGL8DWnrPs6gMv/TxJ1QkijdCFfxIL8HkzzzB6pTuqcWxTjSYyFetp2iyYmsv92rVU3JUqesHbsCV/Vomv0olxGdJ63D88UDZLsqs85xH4TglvGoul4GBep5Nr+wwGFKm2nOEqOirfV58eHxqF9dAlmavtAf+8avhXzgIFthjNksowC6iGcU/gW53NuB0qNoCq4Co5b/IgHmG7xaX1MdauHEevVbARzZSH+bLIqhGq5SA0pBiwvcKpSeq+8SDnfB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOOayFpBZNotouQYi0SsbSw4DVL1NZGF4yYQVTk0hFE=;
 b=CC5qWmUaOZggenWFHa3FAjkktjLQvbobpmzCYUePB3y/XppfIALYb4WDcDnmwrSVTUzssTHUgyTNeBdwF8Sv8OozyGWN0KURUWydorHfHPXI8VhwUEhnTnzxTpB5qEQhsy/LFmYKTiNSrhlfqZG1S1RkdhoJesvcO7ii5/BlFFoDnJmaD/Ja8I5XuZWvJ3i1lA3lTFZ4llBekS3UKp5SMl1xLCndmjfvy5FlmbIEKVEt52IaWY4u17MdsWKUFt6te/q0TT78Lc2bqhRLItJmwncI02nhkeqdH1nZroYbn44xWOVJi8eZADuIKKvVQ7C2yvoUgMczE5SsZ21ZuVGEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOOayFpBZNotouQYi0SsbSw4DVL1NZGF4yYQVTk0hFE=;
 b=cKiJlBFhaohumhLOnRm2nWpnI/M2DCd7b7dyJEaM4FkzIkwBQk/Hi0Dy96UzrBBQepR4Ha1KD3SgSDL+Yja+VWC8lHjEiEoPYMrlaUkampoArwEcOks2maPpqNtlk4YYizEpXAYn19RGSfUZMFYi8jZNZ9RPK1/azcgKH2QkHIaWLZYUGiCYbt6nhmicUqIHG5uQNr/dDN+IC9Yf838U01153r84WAPnRGG3d12RvY5CJztDrmdxMpmC0qrA3Otid02ZkXXHVLF4UO0gMGx4q1l5+vMlpPhs2qG5rjRKQ7sRt63zbBlsgCrIq5s+65SKUTCRppa3VpQFTYNvE3xmEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5389.apcprd06.prod.outlook.com (2603:1096:101:64::7)
 by SEYPR06MB6357.apcprd06.prod.outlook.com (2603:1096:101:13e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 12:20:58 +0000
Received: from SEZPR06MB5389.apcprd06.prod.outlook.com
 ([fe80::6869:c60d:7f4c:ede6]) by SEZPR06MB5389.apcprd06.prod.outlook.com
 ([fe80::6869:c60d:7f4c:ede6%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:20:46 +0000
From: wangyufei <wangyufei@vivo.com>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	wangyufei <wangyufei@vivo.com>
Subject: [PATCH] MIPS: ralink: Use min() to simplify code in rt_timer_config()
Date: Wed, 18 Jun 2025 20:19:17 +0800
Message-Id: <20250618121917.35899-1-wangyufei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:3:17::26) To SEZPR06MB5389.apcprd06.prod.outlook.com
 (2603:1096:101:64::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5389:EE_|SEYPR06MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 459462e8-b070-4463-31cf-08ddae628cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9PqH5VlXkSGyxd71j8mSu3FayXCS4ypNQddYEJrbDoK0+Od2KT+D/PV2Nz0B?=
 =?us-ascii?Q?7YtmIamhNPlILDLvQjwwP81VWzzA8MnD7JHrYVFyIYwBG4n2+3AzDkQ9IAWW?=
 =?us-ascii?Q?Wx6xM5oUqGLzOytMMVhObo3tckLRT7WWXaahtWgtLPxnhh6CugHkbKPSExEo?=
 =?us-ascii?Q?EqgwSZQ54rz1LflZCptzGBiP1CacTbMuorv43BW7EqDK8KqDHTet0AmBIXrT?=
 =?us-ascii?Q?VuxSt+yWocoeJFqj2zI/WFqirB4pRO+hIqXdKOMb4mQC5ue0KdNobuUra+2k?=
 =?us-ascii?Q?gbSO0eOjlG+hsIypbN6+PNGobC9VbINXzD8zj3Aa/SoyfEEcA/tlwirnr2pL?=
 =?us-ascii?Q?4ycLRZbx1sdt1N4oIiYn8LpqezoiJlUUbFyLRIDJCv46Rwc+O22jPAOBhpGm?=
 =?us-ascii?Q?HEwxQqQqxbGYO+5Adp2ko3DGjmPsMP8En71RPAWFz1QONW+JB5QqGfQHW3nJ?=
 =?us-ascii?Q?avpxyFQ9kPdC0YNb5RTwyNX8VEH6G4rtgZWQLyrbfiZbPuFLvJh+Fy3983gd?=
 =?us-ascii?Q?UxO2s3eNm2HhGfU5p+cVcPIGj3Zug37n1KeYmVMK5RTbUaXMPOOLkoOVM8OJ?=
 =?us-ascii?Q?LfvNKPns2zpPKYuIMpsYNYPyVL19gwRgLwOaN588PK902+1pBLzubNUoAR2D?=
 =?us-ascii?Q?8iFq1JZjQ0atJnzvdAkn0xdblyNHVBxmcLVlK+6swi5Zxu6y7xLST7jmWr5C?=
 =?us-ascii?Q?4jWQgPn45c55uie1P+ho8vc/ucY3rJF5ITmqaUYqt4gIjvbs5tPWNaAt8XaJ?=
 =?us-ascii?Q?eVHQh0o0NTPpO6zyEBzmjn5NRLa4mCjitiQ1tVA1kB07MENkv4rxcvH2V73X?=
 =?us-ascii?Q?JalX/PLoxCA+QpZmYvAEHE5FeVMG0YHNEUvOL3Z6RQTsQvPru2qj3H7x0h7r?=
 =?us-ascii?Q?uSADTNBMkFr2w9VPG0zOG0GmkhrluiRGw6Y3cK38N9zaH3Fc9DdY1hYTqihv?=
 =?us-ascii?Q?dBFuOv0dhYuIS93dXuoHdxwaQtvLujbujY/kvUkMtxvAw/Dz47j97FnjuZFr?=
 =?us-ascii?Q?DDP2GfYExI9MiJ43VmXIC1xYgkQVwEtAX+YWKavFq4ifi8P0rCTzCaQMKkB7?=
 =?us-ascii?Q?gmDYeUa8oB/5/yCAUfeqosZTVXD5UF7conbdBDb8Q1WOEbn1a2zJCMzIrgmC?=
 =?us-ascii?Q?fSzMInH901s9HviBUxEz9EWMEnGHydbMu0ScxPPavT0WKbrmNxyNJxxBUD0u?=
 =?us-ascii?Q?7f3qmpEnm/uTZcBbNef8ReglPzDsjiow74Zk+FR1nmUQXR1O/y7eNPA9F5hE?=
 =?us-ascii?Q?riVB0G1mSOkaV/73tDh3Z2mfW7swoupSvXc6vPli2R2lsho4b/f1vTVCg/Yl?=
 =?us-ascii?Q?LHwkVtwyUlhVJPswo0SPFOvVgDOdmkayR/7FZm++8oNbHZgUdfh6YOe3MwdH?=
 =?us-ascii?Q?aT2lh9neBceri7cRPClvJe8PqkmNa7O8dvLLsX+Ms6uLVisVd8jmLrS5qofR?=
 =?us-ascii?Q?Rt+OcvZrU/PG3UsXahjm6xzqxGVizrDf6WnCRMGTPztGFP56ssGfrA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5389.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZIC27rQoFpI2PPtFh2YbzHO/5+SbQwTz5qTeLgIiMII++Xkz0Andc5rBXp+Q?=
 =?us-ascii?Q?KtFPkfGlReRcCe5w7T8ufPbU6GtkGIu9Q3SPuVbqCmQ3eJPc9lUC1/gv6dF0?=
 =?us-ascii?Q?ikK+VUGdRWkZoRoGVKEY5MLvZIBoCtizPOGnAZY8HihnUN+eIiIbQkwoiwuB?=
 =?us-ascii?Q?EPWgLLg+lUzJxm+Mp5lFQavM0RGrj5pUqnsx5TFb8T/GkkiKZB3oSF2DwweC?=
 =?us-ascii?Q?dxoDiWqYlDzSouKD/pvvoRoglwDSboR+yzLM9jf43VBa6tNAAKorUPBsw2mV?=
 =?us-ascii?Q?SX+RmgFolGtCED1MYjm/Xml/9rYeN9TFhsuLFWBZ23x179O1O7a7EocdraId?=
 =?us-ascii?Q?knjAoz3OAvnMSbs+OFVTreNAFSuSgKiWatiTfwOKMcsDOqGcPixhg/pKln7o?=
 =?us-ascii?Q?iemW2g9Xo4kiY0V8SLrmyPXOkFcqYlytxVg+HKx5FdshDvPTmoyQbKvLbXKL?=
 =?us-ascii?Q?49CTuTy2/doUAZOVV8fpEeAoJTO3p5yTGlIG9ilJ1VJXEKvV3sWD8lfWNiAv?=
 =?us-ascii?Q?scvCzMErX/f3+wZG+PYoe9BT+THOqBGVOXWJEoe4OLr6FEMchuj+AKQzdHRn?=
 =?us-ascii?Q?TwCsZlEXTsLyM9Pt3/2PSWjvVAHs31Q5PEUQO3jM690Y0GcEANUb2MiOm2c1?=
 =?us-ascii?Q?2GKLzLkkvR5G0M2Ijg9hLpHT9LPFekpR654rWX3yzSVxqEXf4Jbwk52QEt+d?=
 =?us-ascii?Q?nOhXYYD0iPSs0IxiI+Zznx2cevix6s12C5AwtKqALN4L6TO1xylEAEoJ5cAl?=
 =?us-ascii?Q?Z8pR8n4UoV4P/sDdoUlgEbkDVynZsWzMo36onMYxELOgW6z7wHEheHOm/eK9?=
 =?us-ascii?Q?GFXYqLoXg5oEulqnA13BjGqACGVWUvNtUdip9qduDyvhibo1IdfXkGk9rgFz?=
 =?us-ascii?Q?ijMcZa2UkR52xuo3jijthkOFbZnIMMqTKrWaJfoC5rJF308dY3U2n1+LE7bY?=
 =?us-ascii?Q?h0Mg3krDDFKgQHe3JvZsI0ZqgSJUD748g76jrQmDpbwv+/QLkF3MO0jrRpfc?=
 =?us-ascii?Q?mExk4wpBwCGWzATQXscPXI1pJW9Dg6C/kqIRPJM+JjUnV/+tEQvWQw7FJjnj?=
 =?us-ascii?Q?5Uc5WI/c7aSQqhXmFUpHyMJvbK7fWPcSh0AnL9RbNuxZbSjFWVRINwVyoCng?=
 =?us-ascii?Q?RUVTRN2r4gfMwroOrxcCOLtwsRDqFeIPKgz9fMo3zR7eUOofZDS+1YrKC9el?=
 =?us-ascii?Q?TKuEF8N1OyTXO36MaLzK9ZxkE4fyit/bBuIs3pqgKBLlwjOroCAN/bYQBFp4?=
 =?us-ascii?Q?2RVMWsZuHd+sxo6fKVtCH7QolS8mGgnn1YnPdPsEFYu759G/hiu/dx/MZZS0?=
 =?us-ascii?Q?LB4bbUN+EEh4iKr/xmLOlYp91Of9lRqXeKv6SzdsQDIwvH9XQwo8FuaS3s95?=
 =?us-ascii?Q?jo5dz7sRbuuf1MhTwKUrNPZLBkSaUtmRZO86yYXgcmo1Pdvf+kBlU+tzSUix?=
 =?us-ascii?Q?Agkqcw38X2M6v4jkQycJh/qKxEnB01g/u2PxlbPqc1bWLGjLlEqVrd6kwOz7?=
 =?us-ascii?Q?BrnBbjJanQ3RfXXgMvtyhDybIuF+7JzWmgWOd7UXzV3z5SemHm4dC6o6iYq3?=
 =?us-ascii?Q?HXIeT7sVT1DwtkCbVTaMsDcWud+asD01DgNJ294f?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459462e8-b070-4463-31cf-08ddae628cf7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5389.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 12:20:45.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv178NgLW+o97cwBLFHv7oI/dAxBep/rPFznFG/7EAMBBDvB582xFRqtE3HB6AIxJPrE3AflvGRlmxLS7ykREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6357

Use min() to simplify rt_timer_config() and improve its readability.

Signed-off-by: wangyufei <wangyufei@vivo.com>
---
 arch/mips/ralink/timer.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 54094f6e0..bbdd0af0b 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -75,10 +75,7 @@ static int rt_timer_request(struct rt_timer *rt)
 
 static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
 {
-	if (rt->timer_freq < divisor)
-		rt->timer_div = rt->timer_freq;
-	else
-		rt->timer_div = divisor;
+	rt->timer_div = min(rt->timer_freq, divisor);
 
 	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_div);
 
-- 
2.39.0


