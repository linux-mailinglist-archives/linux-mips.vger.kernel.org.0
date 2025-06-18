Return-Path: <linux-mips+bounces-9400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E24ADF190
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 17:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D115C3B4059
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 15:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA1A2EBDF6;
	Wed, 18 Jun 2025 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q1goBXo1"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F421281341;
	Wed, 18 Jun 2025 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261253; cv=fail; b=HBFqAKAE+pdYCAChlXzSnEWPr+AKcUCJQDnVjMYJE8ooDE1FRU8gK31tokhNqZ5jt+geIVVGgWSBqtsr5dIoqqg7rRjjGNdK1GuXpw9qOOuXPQxY45KKcyABGbC6WFkMC/Eesw1U6XxVsw/G27mC1PIWkK0V75i24HIpfiN1Vws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261253; c=relaxed/simple;
	bh=Zw8vkmJCDnpl9WGoKZDWdtMQ9swRbQAUbos/T39I3Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rjt0hvYh1vlbazm+f+ACdTy+89RFixOKZ5sNB68V8v+all24TptgAr2tXrE/pRkozKoukEnYC+rHTea8WYfryqYnxht7+hN8hEK8XXnQV9p/0ohhMlT4SBaKml7RGKnKUV8DagY4f4is5omuq4gBr6PTksA+DQE704C+ZUe3EXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q1goBXo1; arc=fail smtp.client-ip=52.103.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0KCtoe266d32cOybtgbAC5nVKgZUuRmTbLi9My7fTJoSgJkaTODbMSTmnJ1HUfT9I4zNotLJRsdNOmGTsX++C5/0GjPBkVrj0XQJgDhxkvEOlzPMrT0vVAZ9thKa+OyBhEkYiryLnP5kAjJ0rSPJmCg1XoSS+L+7KXOoUyOAGBT8pjEB+WV68sOKdfYIjGIHz9TxGQDh4GtdvJazlolXL11N+1rOPtbYN3kVdL4vORKzGMaDL4dWmUrNQIqoVjwIkAv06/5E6nKjNk9moa1+KhQXzKemQe2cMYIQVsBIggxqylbbA/6yFZdkm/cGOx9BL6wgyzjP9Hztv1lz62lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMYKdeceU/lYtNXCclmiTHOwfxyaTWC6KjGZilPezSo=;
 b=DRr2Xga0j4twxidOhqDxp6WbkfGCdSJuJIIj28GLT0sf6xWrOEI6t7PW5xymnY4swcRKI5/qchfWZpRJP5Kwm46Ja1j3/ZTYS8fliTYZMIqdeWj1+W080lS1EHCK2IO8keRFsmjvaBG9goQZLRFXWaDnbguJVsseQDmy9vRUfM6d1zkSLZrmZNplhkbHClZlQ5gy2vM+tsS7xBwgC5zYMxTk5jVNCuTLkbnAJV+XpTRvGvWVmNYkNYRT9MdDyaJVCwlOG3IXHaQsfMhwkWfm2wm+2XXfBU2oTmtCUJFiOvfh0qZYVMiLQT1tV0BLBLNDTWBrcck1U1QA/n2NtGEAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMYKdeceU/lYtNXCclmiTHOwfxyaTWC6KjGZilPezSo=;
 b=q1goBXo1Msx36bg1VBnf1eknMrR6Ec/yUN+CU6Kui99LGhjeghrxX5MXxe46DRLETMut3blMkGXCNlYMQTGJmABoXlHzhvOthbYygdzcdwMx9FRqrysXx5p82PgIeiPOnfEPoMhYAavYCokHjv8KDzGjJTnUHsDHkHuYYYxF7lczzz62+8ui+sWi2uRylbUYpJpoAyOrGLCLWiTiGv0Y9nPPVNyvRcrgLLLPL6YgiYIlK4dzR3iQ5czL+A23ugoI+higbj9C2HyxZ+zutVsHWQ/tMP2EzQVzH8on+rj7VaQvfKmEOP3AgbrQsK+lPZ/BN/l8UPfRPLgOjV8Hi5+tDQ==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OS7PR01MB14883.jpnprd01.prod.outlook.com (2603:1096:604:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 15:40:48 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 15:40:48 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 0/2] MIPS: ralink: some build fixes
Date: Wed, 18 Jun 2025 23:40:24 +0800
Message-ID:
 <OSBPR01MB1670AB9E2C07690BF71FA6F5BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618154026.13752-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OS7PR01MB14883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa474c0-773f-474e-5102-08ddae7e7f05
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|8060799009|7092599006|15080799009|5072599009|440099028|3412199025|10035399007|40105399003|52005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jwKryViqFpfLyDKdy7cZP8EEz8sWfVIGgGQqc2+nFNMnnqBgvja7cReGz21S?=
 =?us-ascii?Q?Tjxa1QqjXbDbuowVuEZdEXcIHM4h85ZJTVMgi/+X8Jvolp2+wKFRbPkoQX0K?=
 =?us-ascii?Q?jZpe13JqvBOAu5KcPgDcXrkdUrUUETRbFW+jLTEoaSfVErmzmytGiFNzLtOC?=
 =?us-ascii?Q?DxyAo/lHqOP4O8Vupw55f0WJX2TiqH5MSMJOtB7rkaEwP67ztqW0cFJXX456?=
 =?us-ascii?Q?mEWVnmxX6Dmzt9Q2GIDS+gneivXLFbXxwDyEcalVbiQWXxyVOsrXSfLl5hci?=
 =?us-ascii?Q?4o/oGsLbHv2w+JmYbEmzo/P8pWFRhzsj/e0QLyyTcEvvo+kp+njEOg/WfvOJ?=
 =?us-ascii?Q?xkHDrtC7z2t7UFAK2j0AAUFbw7n9Vic0p7ANBWGZr1hoxiRtCww//Df4X1/X?=
 =?us-ascii?Q?XYeIo/OIvATeVeCPP68I12bkm1tPajPk8Grbbt9Sq4IVgrm+pq/2TkeHuE0o?=
 =?us-ascii?Q?xJWIb2q+41R1P72fa8qEqez/ZVQYtduBbGqgXp6R0iHt0jc9G0SqjWexLYAi?=
 =?us-ascii?Q?+HOl0FeuS5hB4JcqVWjCcKL8j1YqU6VM+a07GWExKeXX6e1+QNaSEnBnsymF?=
 =?us-ascii?Q?QInS6QLiKMseJdIhht7KsumZu9NvWrg6Td2t3dh+pxYAOeD5HAnyNvyprMcP?=
 =?us-ascii?Q?s2T8JcDalNDojZPd82nJzJyV0LOE9aTpIOAxssNE+SxCXZBz/t5C7+tzQeFx?=
 =?us-ascii?Q?9mXN056dFxcUMN03JY7+tR7SIPYSqbOTJWB6WoVvV4X++AQptr75Bu9jmd7W?=
 =?us-ascii?Q?17oCPsGFtytdAQm3Tt/GirN5yWtdVCS84wUsG8uhz7NkRJcEP15PF7O0RpZI?=
 =?us-ascii?Q?Kdic80iDxJPjDZ5Sp8AH+iQC6WMWGxtCgMaygUJ+IyFKuX5pGkJgu3Q4xJh1?=
 =?us-ascii?Q?GpFPHcqOblNi3xOQSP90UBHr+FoSQSruyPHzsUd2UGGVVsKTUMfhcb1BUhYO?=
 =?us-ascii?Q?932I+O9g8cDYTyNYn2QjCgWSq7W5UhUFqZ98CGd5oPLh3WIdg41hu2sHOtfq?=
 =?us-ascii?Q?880Hiwiss+IBceMEl91Q2qAoZ1gVfAVEbL2RkNWjLmN9t4Z4ZVLgP1NqWwgP?=
 =?us-ascii?Q?i8MmQSddCZZeSY/99VEO2OCJMm3/EyrMlIUyhXJrqP/wlIKqHJrOP6vv96tZ?=
 =?us-ascii?Q?7mci9K6aG6/T0KJ4M6msz05qLIfLF0WOdIDPIWKIRB7Kqq4eXax2wRJGT16u?=
 =?us-ascii?Q?i+e+WziJT89VeScr/ZcGEASbvXWum3bFdjWdMPZRzQXYeDgFfjLJKbb21CG+?=
 =?us-ascii?Q?pbzmwmnyoUYsfSWuXUBnyRK2iwf96wklYGWAeSODPeUr45jh7z8F5fcngZJv?=
 =?us-ascii?Q?SG6BYasnNe78sOxDs7L+meyu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l7F+dPki5Ga/KRc1gbJzeghDD/paIUKgJizK/+sm8HGyavnCM1AFvDOqdsp/?=
 =?us-ascii?Q?pjnN4iyYLxJD/zTBvrqPXGUUR9vlPkTTPziZpnuERkwZSTXM1Plb/xJZ6hi1?=
 =?us-ascii?Q?TTjROMJGUL4ZCimsB25bq1/Yw4wEVWkO+aZyLkxavwniHxCKKGvH9A+MM7uX?=
 =?us-ascii?Q?bD56rqZiRMMLF1KWZCQVJGURhu0lijZ4hpx5Gv+T+In46dGAoUC8oTv8KcZK?=
 =?us-ascii?Q?k1rNHDPUhjLc0Vy/9R3GHr690nnkHMXyIEPCGbz9ZYvx8QZAawtM4SZiAxbv?=
 =?us-ascii?Q?cBusCjW3YgRtKS0mHczvU/N+QGne9X7vfkaDA3+Vs+YRxHyG1UMzybr25yYv?=
 =?us-ascii?Q?LWxx55Q11BW/Q0IX3hzYlJEZ56iWiqVkipaxgjD3fTbRl9tPgHp5ogWTb9zR?=
 =?us-ascii?Q?ciDcrvY432vbFnwb9FzS7qo6F9xdTw97FOAbbsZTiFtOJkK9ngJW7vOdCspz?=
 =?us-ascii?Q?GRdFprOOMuAgJL2+WsWW/+BzY/9P/5YFNddfBiDhvTHLIGnTHH+ghu/wTjuL?=
 =?us-ascii?Q?PDz/qdoW0rfEPQxiL4eY1f7yGTY8sHfIWJRmlGqZ9CX88zc+YCRp79gL6KoG?=
 =?us-ascii?Q?tjjJBak8TutbyQbax0oNUpT3JIQa3CXejEX4hrPshGw9MpNp7WVn1Qqv7619?=
 =?us-ascii?Q?roS9l+gpdDCbgTbCP95kq6da0C+u23YnfiVjZ7WtYMuQcJpFqTyt1k+UTYGU?=
 =?us-ascii?Q?qY5eT1c16UVJZWzYZKKPLByq9wWUrBgb3iQT02gViIl8cTPsTQZ54mGYs6qu?=
 =?us-ascii?Q?loXzYV1qOSnU8ajuncRIdg7KhnFT9hZZ9+NqBVdEe/KBJztx7dRWmZrVQNaS?=
 =?us-ascii?Q?WoHwtYQQOc46kf1D/8rJd8vLY+hx8t8fZLEcaBVxZXcX+0ZoNexqc0A+mOZO?=
 =?us-ascii?Q?IWN7XwnTJhSl5ovyygdeUubPoSccwages4Gx3jATKkeksKh6IGkPgsdOUQHk?=
 =?us-ascii?Q?FwRLIfjIDyNcown6maQwv6ZMBO4S36HAp2vFmCzU7kpLBFrQmAo9BcG/O3m7?=
 =?us-ascii?Q?2W/zJBdBnEerX9DrBLv4G6adrYxV5h8n/hFNcBttbeNLg56AmGrxhbPZEUsI?=
 =?us-ascii?Q?/CbgrZNS9hXnq3zd5e7kNwVFqIjrtqmHAhPGcTti10btfC+i1mVdcThq1PVC?=
 =?us-ascii?Q?I2GcekPMTCrOrkRcfl+ulyUbOy22Qk7mI6rlIlXTMMNrWE25B2YHkURgpeh2?=
 =?us-ascii?Q?XxUq+nnI1GvZUYo9gDrq2QkzMKuAlcdCe0hT2qS4yMNGrcChXAr1qCKyG9jX?=
 =?us-ascii?Q?r14MnVqX3coP66okyNBU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa474c0-773f-474e-5102-08ddae7e7f05
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 15:40:48.6601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14883

This patch series fixes some MIPS Ralink platform compilation issues
founded on the OpenWrt distribution 6.12 kernel[1].

[1] https://github.com/openwrt/openwrt/pull/18654

Mieczyslaw Nalewaj (2):
  MIPS: ralink: add missing header include
  MIPS: pci-rt2880: make pcibios_init() static

 arch/mips/pci/pci-rt2880.c | 2 +-
 arch/mips/ralink/irq.c     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.50.0


