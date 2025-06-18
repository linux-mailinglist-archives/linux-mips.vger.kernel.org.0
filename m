Return-Path: <linux-mips+bounces-9402-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4227ADF199
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 17:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 266E27AE1BD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 15:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602362F0031;
	Wed, 18 Jun 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mle4wKQd"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D72EFDBE;
	Wed, 18 Jun 2025 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261259; cv=fail; b=hL3haY//xpBEe+EKNUekc4F2MnBcg/416ytU+l1GN1XbZH3DbPwLtfUG/TdoZuYrVQaMKHzrhSFXKqkoxrAkitwOHMX1r3JIf36dGobFqbUc0qeKDJDeTjN9Rs9yC039vzNxGtlqHUWajTiFwplAgM1/OBOACa2OtqgQVMvzvOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261259; c=relaxed/simple;
	bh=OkjiKbwlD6XLZxX1CHeYdpyuHENoYTjEYFblowNPGhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nYNMWaz6FIjUSFTPUyL2b6aA1OHQc6nJwlGkASNphnymjjYWhtqU5s26zELzJFyDoIcY1gQrEcFcnPHYYrAFcS9gaLV801ZcT28iVa7tyK626iYZr26GzlkTn1FXcbtTNpyLzFZcUsyDTycv792OEJxDaTPPT1fGiOmLBxmbnEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mle4wKQd; arc=fail smtp.client-ip=52.103.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlllMbLW1UClpE/AgDzPcOJdLHEbJygDnTMRstbmoJ8ia5tibanOwEnEzN5JtRfmliAzPA7wisfmUuU04cvTqysHALeFOaQgDBfZpzDJgmk7HVNixlfJJ6tZZdERkKuzGJDRM8NPmV2BSgDtW5KgMULN3YoyYAK7MSy0bb/gD5ZheYlUhkMGAipjsKIKz++LFhs8m9SMW4Z43BQ1RfpLTn85KfFJ6h7kqkXLKWruSmuonf3J1+F6BAOeNOHpq8lUVm4vdA7lbkRQEzrcmaolCobL/7YIPuiy8ApVJGgbNjgqB1O17iXcQ/83JGga3SpmtNEbY28RDoy/CuUBJRckaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxkMOvVOfKDjJiLHxcBvLaPmly3lOj48KngKVX+o0Ho=;
 b=N+uZPnsaor3Qjmwv4xI7BcT0mOlGF4MLiGY0DvjGjwyxr7FInxhc+Dd+LgLXvCiDx02y2et4MXOZLV23t7ZKHvZG7f7QT2cTCiX2sWG0SR5AaPsayIk65AoSsNYHU/bDN3glYNgxh4xIgIT1KEV8DzwEKCwJ1fUFcsjvpf/uG9+1PCRIqN0a8l+pe408SlcoTD6zvYonFy87TlT72QTS8o08FmVIyupX/aOxIs4sSbgjoLzAInFOarMROAM2afJMKpfx3i3pr8mMIxvkX3iA6/Zq+OZcDX5HSxvRr2+aA2UBdx/YizZk68wLEhYjrGAEzkuhacFRurNpZpOj3bL8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxkMOvVOfKDjJiLHxcBvLaPmly3lOj48KngKVX+o0Ho=;
 b=mle4wKQdhFwV2zZw5PR2pWv/7eV9qCyHKS3cJzgK7Je1q9CLqumlRgvj5LS6YhbJd3QGQ974QVq7Kh+bdHo4blGC9Tw6jAnbGHsofLQzlO4BTpPa5Vc2o7jW4lDn6mtb+NNrKkCdZj681AtjPtniI65o0ipGIVuVK/XP7y862TzfWojN/zMQ35dIaAisSjTQukyU9uryutUG2zfbXUjsdOb54eDBOJUsjZzpr6iQIL3K0IM9GyH9y+6yVmqo707Fcsj7bHeoO9MyeKxjP2JkXyQvOn9nGO0P0akiv+mqpm1aUCo8BNg2Ut5aeD3MqvHCBomcqc14gcWtzzrMwc7Mbw==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OS7PR01MB14883.jpnprd01.prod.outlook.com (2603:1096:604:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 15:40:54 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 15:40:54 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 2/2] MIPS: pci-rt2880: make pcibios_init() static
Date: Wed, 18 Jun 2025 23:40:26 +0800
Message-ID:
 <OSBPR01MB1670CD500C628206A06CB41FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618154026.13752-3-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OS7PR01MB14883:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d157d3-ccf9-4c6e-bc63-08ddae7e8310
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|8060799009|7092599006|15080799009|5072599009|440099028|3412199025|51005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tMTha0Ux7eAvDOxu0kE9mbq+tlUEnJwdZGs7MtDM3iDzxIbKmQp4Z/XigDPJ?=
 =?us-ascii?Q?b6jAhIlXMC2hKZvYnHkYYyS709lrZG1zqiyfsml6f2kl7v0CLYDjM4My/WDI?=
 =?us-ascii?Q?epxOtpLp3SM2xLHQzFVY+SChNDK3K5dwRI0JvQBJBr32uWu2VVliKt+LD469?=
 =?us-ascii?Q?LQwk6Gr/GQmOxsMZg50+29iaqzshnqozRbSfTbrFrFtv7+CxeFnhhoy69fw+?=
 =?us-ascii?Q?cKDbRi7fW8e9HYR7ntf2AIy1r5/4jGDwgGalxOXw8rom8dAxg7SUbF6IoZYO?=
 =?us-ascii?Q?u1OzmdSPDLpj46gsvIzHHP4lv0GiOwkS7lgMBN7z6WnHBt5OJuq6izwUK1Vg?=
 =?us-ascii?Q?uizXM30z/pWRQhDUKvmti+m96za8wXIe7bX7OBFobN57tLNFZxZPlSWlIfMI?=
 =?us-ascii?Q?Fy+wVuHlIw9fbGnxK7MpzNRimx/SGvQqZ1iJS8DT8KVIVj0Om4m94ZBus66c?=
 =?us-ascii?Q?YihMiRl9pet7JfH+FBIB4ynrOuDRhoauoDBYjCBzoSbh6nNcI2bOZFcntlFT?=
 =?us-ascii?Q?3acqwhZT1h1ZNte2a1o8J503jsz04sEOn8yE17bwzFstrxlfkxb2KKFG0fXz?=
 =?us-ascii?Q?tlFozr93V6HDk2E4uR0N1G1/LzK02OfFu0dqudbJbvvCTEkjKqC5UfWeQUYk?=
 =?us-ascii?Q?WsWqkMOLnzAYMA5vVtCjROuxU3KPJAKm7gytl3hNc4gqSqfV9yJ1d7cZOG4a?=
 =?us-ascii?Q?JE35/n3Wkj8J87a9a75k2bbHeE2+q066p26PJotZr2UV4FJ02qCUvIu3wXCT?=
 =?us-ascii?Q?0wRRzyvX/a8ksuhbqCGErf4Dl8joUCOrprdOu7CDesAcILqwjighcAq6JwoF?=
 =?us-ascii?Q?WvtRhpFmVI3A/xZhGSo48AS/cCcnFLJVajvxSjS/yOafjiZPYNY46F10MoMs?=
 =?us-ascii?Q?M85z9cFf8bHjdyjPdXjLdPjPuMOTtUO4xFwKrXkpRLE7jCdWSjEVCh/BwQf2?=
 =?us-ascii?Q?ANfiernTvwHwbWYwOq3sfHqenj+KgJ5NcTGSWuJafTJo5E288owtPe3RIFf0?=
 =?us-ascii?Q?aR4mnMo3j5WxjDCnxYa78mcS0jf0jc1d/EP86Juv8RS+N+6/Ji2/GQJuLxIn?=
 =?us-ascii?Q?Y507ROkRb7JlscAjMGORNJ9K8oFWFFGqPYi8ebHPsJAqq/D2hDxiMEsAM6S2?=
 =?us-ascii?Q?qtQbntNi3Ngix91bMa1tx0RlCCKPDRDhJ3v+GcCqnN2nUumOjafV5epEBOSh?=
 =?us-ascii?Q?Vo8L/nupzeJ13L+PC8YGyHead1eBwfF7Uk7dXg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?54AGJU1bgg2NefghpJTJtpX+fWp0a/kxBZhvWmLDm8SIEJnaY5m6ieShduhg?=
 =?us-ascii?Q?3hV42NzjLi/2HA1XRRsrGnLkP2DZjYI5PulUyMj4mnrFZkGv+LopU9LbcfXu?=
 =?us-ascii?Q?1Zdxj4QvQNEXvKcF4/BXJeXNp4ZP/xxbDHwvwxsuHbdPVPcjxihfBX5WwHdB?=
 =?us-ascii?Q?6bqwB/rEdjCZndxsItwNkse+/q4bHOf2FGm5a2r8hanLqAd5SMYYIacITn+D?=
 =?us-ascii?Q?jS5KBiokoMWXse1KM6eznoVQpfYViaAn3qziBKMfBkRfj3dgbPSBr3xDqyzQ?=
 =?us-ascii?Q?WMa0+Bshm1OJv3ZbdEydOB1Lk1ywKGQzkDvldOSKY2FLW9LibwQG4nkWr9pM?=
 =?us-ascii?Q?oqqDKwqR0dhAAd0MxiNl1BCJfisMPofwhQTFfiYS/NXxpEl8oXW0z6yXhvoW?=
 =?us-ascii?Q?I7uYIiJbw/CfgvMcf99ymQG0rB8UEyio/pz2YwzNboMwtMzJaWApXvr6iwne?=
 =?us-ascii?Q?hLY8nHR1TEK8KbODCMo+izOCij85kVa4MGxpApgn0nmkeYyU7HIOr/qsVIKt?=
 =?us-ascii?Q?AQhsku5bTUf2M+3PUxs4rKZCdRnmmbTrC+F9UXz9eVgoQXbZBK/SCWQVbAjR?=
 =?us-ascii?Q?MP24jCuMo+/dt2N1WXKaJ/dunFk14duOySkvKbKP9+R3T0r/naBnR7dER+bu?=
 =?us-ascii?Q?dja5S93i3p7XWH6Ljm866ArLR3TMAWTtb7ienNvNQ3RXxo2qS7IXerOm2bi6?=
 =?us-ascii?Q?5boXPEEye6STqGqx4JeNtLD5FvxCejn1tte+gbprPsCZ2QqGaLdyLn3GMg65?=
 =?us-ascii?Q?kLn0szz33NB6CE6GTEX4Wj6vjiPcATuzYikFIgA9En9p3lj4+xBO9qg1Q2kf?=
 =?us-ascii?Q?51aPjPa1CqkQp0DcFbGggXi4kOps5qxL+Xfmi7w1+TU+CmFrwcgLie0M31o4?=
 =?us-ascii?Q?K+Lqr5lECKCVUf3JGxbX0+uCyThHmpAgs465rSTtIpOPFsF/pga6IlK3B1l0?=
 =?us-ascii?Q?FPMP+auY+DeyCNtrA8qyoA/oIOQzofBQfURTLSGkEa/JzUvykBJe+SuY6twU?=
 =?us-ascii?Q?qWs+PPNFXA3yO29Rv+A9H1rPbZO9oXOydui5oaEZTtZmyr2Ik+YIxzZyDJY0?=
 =?us-ascii?Q?9V/hs0kboikXN6KhGtDW33fWbAvpahhPB8Y3+arL/EH/TFaIqdwInlBLPZnt?=
 =?us-ascii?Q?NPryKVZCvOgwMATbKUPkxXlA/rH43uwx8YEsPenzT/dz9cZPlXwlc1WUxhMY?=
 =?us-ascii?Q?+bRIkf6qLaC3HgI0/7ZaEGhG6TVwyR8BtY7d+FzG0EqX1fM8+3sRHDhaLT2r?=
 =?us-ascii?Q?x+/HMaqOHSiNnexQUdDi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d157d3-ccf9-4c6e-bc63-08ddae7e8310
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:40:54.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14883

From: Mieczyslaw Nalewaj <namiltd@yahoo.com>

This function is only used in the current source file. Mark it as
static to fix the compilation error:

arch/mips/pci/pci-rt2880.c:267:12: error: no previous prototype for 'pcibios_init' [-Werror=missing-prototypes]
  267 | int __init pcibios_init(void)
      |            ^~~~~~~~~~~~

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/pci/pci-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pci/pci-rt2880.c b/arch/mips/pci/pci-rt2880.c
index 1cada09fa..006e2bbab 100644
--- a/arch/mips/pci/pci-rt2880.c
+++ b/arch/mips/pci/pci-rt2880.c
@@ -264,7 +264,7 @@ static struct platform_driver rt288x_pci_driver = {
 	},
 };
 
-int __init pcibios_init(void)
+static int __init pcibios_init(void)
 {
 	int ret = platform_driver_register(&rt288x_pci_driver);
 
-- 
2.50.0


