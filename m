Return-Path: <linux-mips+bounces-13191-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNv6Mpb7nGmtMQQAu9opvQ
	(envelope-from <linux-mips+bounces-13191-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 02:15:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C891806EB
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 02:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A59ED30557F8
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 01:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B08238C0B;
	Tue, 24 Feb 2026 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="A+yfQeBf"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010023.outbound.protection.outlook.com [52.103.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391322A80D;
	Tue, 24 Feb 2026 01:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771895693; cv=fail; b=DWWuwSvo/SX9fnK1ceRuo1onOjof1JxUExmscnhmfvV/JgcWSGS61UtDOx2YYAHvNYt+3urywCaYN12ofNvcs0dloeRupdeL2yv3ek+ic6xXsDH6sv1eELWR86+qZdbnaVMJmU0wGZmLjHOM0jZEuLgfQ0ERRGRtV8rRPECnpos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771895693; c=relaxed/simple;
	bh=n40whZUQ5Wjtygp35G+cW90zQITU3jHdyIvhGkfI/nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=et1DxCTjKHEPrUECOoE+XzLKcpfd6mwi1FzP/Sz2gHrQJW2EJmpGG+WXcZ41mV/7OTdY7SW91YaKq0K0PtF4Kzv7RSxooiOJjLJG1LxnpbOlpvCo24JIvkVjK/fawqrKQfx4XRy1j3FvvhkrRfzYQG+tshlnxHPeGi6U3jfObVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=A+yfQeBf; arc=fail smtp.client-ip=52.103.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfi1WHZtwd2MP4R19nDU/qZgDnQuJm+k7xQlWr2VuuT5xBsa9BTBxxUvIcDmK1g9lF9igTFvqSW7r2pbYUGJYg6Ce6Wma3dTIByjoAtDo1Em0mEE7MKYt0mKLZf4Vrotb+8LtyssBE5wonE0PJoeyVLdZyhHmqmfTWtIXQU/A5GiP+bn6fYRH3Ar7gAvwqqEWPfa8Y9+IAKNcaJRQnrYQstGgs4nyEGvnneTfx4rBERm1ApbyxK8UuWY4zGIJOiA8XtYCJdEuq4A58GP5eUiIDnGGwdfqC2pRUBQq5qImjz32vF7GBArm6lXkOJj533xp+TNXEjOcIdWYcDjGVbMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n40whZUQ5Wjtygp35G+cW90zQITU3jHdyIvhGkfI/nI=;
 b=tvWO//8yoo6ZqE5tAKYuq8ZibqZD6wxIvxAWI8zWAoOeF7HPRQxhH7FA/v8oTPoNYg6pv4zDcPWZwx0dVBapEitxPUTCft0LvYDAT6JAj5VxOcOHV7+D3L+aIKeamXAj7KgBgRVHWemxyomhadzm1Yw0foBIILpYN4JZpMpIbwbsZI5pbP/hnKKDAllAvR3EsQijRBsbfBb4yHCL8/TqIu4ieyZeG8UB4ytLn9RFKlKdYT9byhlgJBs+F/BVjpM0b5AfuntK9ZrvxCGqZQ3fykdE0J5hqPvOedra53obNKdQupTtnO1/C3JtCf+GR7NUzqkbq9vUM6h08f/wjq7OMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n40whZUQ5Wjtygp35G+cW90zQITU3jHdyIvhGkfI/nI=;
 b=A+yfQeBfbaEkjv4ixD440HMMj8/zjUprWHHFwlD8DqcM6fEmciwHQMGiLYjCWnTuFhbczjJ0VnzTuRY7Ixio+QJtOsEWbHueSJY7SBKz/box9s22zCa3VAwWezaG4DM6nzvkSPBYShmY4ewu5EHVAiY48gl1/unHg6+hyXFME1Ww5pST9KAnOf/9aiK21iE/z9lH6V1UlxXHHTWUkoPsmD/1lrMMgEvSWZN0Y0K7AL14Gce4B2Wq4HVtgJZDiaafSUJAyE+KJyQeyIOC8Afu21OPRPRgQX8kfyHai3RabndCrcSNvS1okAZ/ztz2ibOqu+AKFSM6JmaBCL18WjYotg==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by TYWPR01MB9969.jpnprd01.prod.outlook.com (2603:1096:400:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:14:48 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:14:48 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: yangshiji66@outlook.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	tsbogend@alpha.franken.de
Subject: Re: [PATCH 1/3] mips: pci-mt7620: fix bridge register access
Date: Tue, 24 Feb 2026 09:14:23 +0800
Message-ID:
 <OS7PR01MB1360214DDF878DB3BAB33D0AFBC74A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID:
 <20260224011423.3431-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|TYWPR01MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa73621-30b9-4c8a-f9f1-08de734219ed
X-MS-Exchange-SLBlob-MailProps:
	JdQcnb18bc4BHB3F1hQh20leSl6i83VE5SkvjLhJ+Vkdp1Yey+1HdQViGfbTEvALRdURXZUEbaMWJHeln4dgfajD1F65YL66+Agmnnz1ozZQxmkXvV0/Zfq2DVdfDGkDRLilO2PN2HoDtSpkgP8IimLTbIwy8QbiHTIOKobsdXSK7RhLOINgRAI7djY35CXyHjRoZ+M+nci1cdWR7dQx9zfdbo5S0ryBshMGKi1izByIbpX+jsbPM/LaHBFcpNtL/YfD+4FlVw0hjeM0WWNEDvaA8LDVHdRcaUZaRw5QkLcPIat5Nde4jk7kr0MZDOS1xoEHcEX3xU1uRMY5T/iJzBYvlyhOJs5+FlR4iDR3iNXoZrg15gZf/+VBpt38PpYA29Mkxq1iIcp0njo7xPWAI/CQYOHoqk6B0Cq+BXJTFR3toS2lL1TqPQ5NQcbnDBixYoCeFDACWmW+z6M3W1CU3NyfL2yiJT+2eV7Eo6qd/utVziSFOhfR7BA3Ve6PIavhrvvepRDJ8j20HrpoR515RfiM6GfZNmdQR8BGyeuzstOT8vd+VYwcr7+OLnok62tSoDPlSHSWA6bhlTWxETWICB6CCsKT0/gI47VYl3HUep1H8PhJb6fwYBbAHyu8IwQkogiurT4AdNI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|8060799015|19110799012|15080799012|5072599009|461199028|10035399007|440099028|3412199025|40105399003|53005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+JlFf5tj7QO+pIXH6R8diRgbRTDgI3uqV1q8mxKGDkPRTqsOsb+hHwJi0CWZ?=
 =?us-ascii?Q?EElRdGtH7YRfR8djUHzk9jS9TvYgW1QYTeKxJYB13H4Vwfudy4LUi03mkPBC?=
 =?us-ascii?Q?Q4qqaS2k73KrUPU/eHz2O3EftVGQqZdSMpDTETD4xeJx9FGrTRP1L8BMzdxk?=
 =?us-ascii?Q?xhdsqePbRLytTWBbh9B+4iyDMf8iZDHGTV06GEr/kv0jJMR+0ovTjypJwQQA?=
 =?us-ascii?Q?69AzWlNcyD19WspAVhdEUaMdbXyGXdEVirkeBxcflz5tPiHREJvqcnxwwVcO?=
 =?us-ascii?Q?Cnklr6FDSz/x7E0lDMO9RH+KCCF54VzUFcfUFpjTMNnRt/n0mLE9X8KKr1dd?=
 =?us-ascii?Q?L2Z7ZvXSIsBQHI0qfkzahAWd+ntXkise5PqtrIhiNiVgJCfLFAYNcSd5itrv?=
 =?us-ascii?Q?+YYWn8gaqy+kPtzJi0wd6qJYqlYzwdjMKeOgNX/cVsG1OfJK2O383bMh1bnX?=
 =?us-ascii?Q?rPryZttEXn7/QGRxJ+AOc523Vmglly8eFjK/n+mgSsk1JXwZTp0O3ayvulcU?=
 =?us-ascii?Q?0GoFSgoRDwf0fAItwYf0RD8amgg47yOm65aTfT0hFAwYFkbIkVanY5i4Of6/?=
 =?us-ascii?Q?ivLXQpQyAhXUY9XR10NQqZj6vgGIQ5770uvKKsFSPrFkXDAbMu/VqInjWuer?=
 =?us-ascii?Q?AOa8J0vE9JB+J7FMYNkYh9bqVjmdeVfjCBYZY7/rJ5tA6tBdj9eXUU5Jvn4B?=
 =?us-ascii?Q?r08eSGbF/DkIh60XFJmVcMRSa2yOGg50fBv7LzxU40kf5ySNhmTjyOuVxpXS?=
 =?us-ascii?Q?xFcl2quo0KeB9baSmnfPAVmW+4vo5rzq5LGZAG+FUqfsQ+Ze5jezmScCs8jf?=
 =?us-ascii?Q?2RGpkyHtJTD2nbHVHZ0rAw4Fdo0hqGuj0bxWH53jLZl0KsQlG89VEBcBUqF5?=
 =?us-ascii?Q?9/3SFu1Z3x7RaU+i//uoQG/G8jbNmbvrEdeLN1xcuSEBIKWetjVwYW0olO/w?=
 =?us-ascii?Q?L5PSxzC2SWd4FeELCqnkvMupYmyOW/Y6teczbH7mcLvfm6jp3ZJK5iQFIQKS?=
 =?us-ascii?Q?oxUeEGV5JTne7AhzwUqUGBfXO1SKkZzZuQujijRCRzszhoAtOU6MZE/8rBVn?=
 =?us-ascii?Q?s0k2iJ/+wlY5h4GN3SsaANw47ThdQRm3DP+M4C6dMaD+90SMu8Pwg1rt42ox?=
 =?us-ascii?Q?ezneswM5wVRhOOjyCwgG9HR79ddVojboSaCMsljy4HZohvEHvPx9v1N7ZrPW?=
 =?us-ascii?Q?h6iy4XAhriDugJufR/64Nuist7uVZ7LE68Jk9uBXJ3YDu7JFXU+jPwpgD3zV?=
 =?us-ascii?Q?sDd6rOLiDpvS6wwquMS2Q+SzZsXFHuku7w0KWddoMg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4BZhD0MEBH+KWizVpF3+kKg3wrPVjghaNHAXdiBxWngznY/F2JBESby18X+u?=
 =?us-ascii?Q?j3v8RhEFnnwNVeoBcnq0hPYaqO2fkyW2ZgkZW0iVkd/AwCbzBbWIETUk17AG?=
 =?us-ascii?Q?gVKJ2vPng31dAtFFyN/9XJdP6qXSqWJWNP8bFeYnE7+9iFMZVgNUiNwmrIjz?=
 =?us-ascii?Q?BuCb7DKSaxEP3gwhMMZGoNwSsG/mQERDvoLgCUgkI8X2IBCUaRMykojm/edT?=
 =?us-ascii?Q?t+v7WCz2kt5oz+aPW8gJ3i1N4sogY00xO1FvdHVBW2zsR54ZY6l4GvEMa9cu?=
 =?us-ascii?Q?6984Mrgqz67NDB57dMZAVyNSHYRZzpkm5opkHlZKecZAIKYTparhPJO0KpNc?=
 =?us-ascii?Q?d83Tv3ZcPeTw7wSW9J0VLgm1kaN4ENxRV2hJCGylP7/e2GXQWW0hwtlaxPzd?=
 =?us-ascii?Q?SxM30CVfu35HjZ/62QyL1VUlA+GRrWzRkHQzDobUL1zcoyGP2p0r+kg9goqB?=
 =?us-ascii?Q?dH4Omh0pYhYy/kYbNGBqIUEP0+4jOHzEFuqulPNxL1O9RTKPwcW2VY1+kKMZ?=
 =?us-ascii?Q?Vlz0S7oOZLMX94+COtldW9EzbsW1wtqVrY5gU8nN6HfV2xlWR0i1XWaUwIPD?=
 =?us-ascii?Q?w4UTUijZ/XX3f2zrqXqfTJ6i9n1VCxOYC8Bq8KLBAYIuX7wgotA19N4uyf0W?=
 =?us-ascii?Q?GYrrqsuZGDYk+tXeIpkdoFzR/0pmakc/gTl8dKwM4vpsmj+6zbdZgmdB150S?=
 =?us-ascii?Q?BewF4XkJSBLSCoQJmR3VSQmyrDKi4aQLxzdCAw/CHRMFoPQOzkLvuwtj0o66?=
 =?us-ascii?Q?W/AsiPFvN6/6yk6KlJoOEvkE/ElgObbgtXG3916XR/zzrU1SNI5EiT2nAA4T?=
 =?us-ascii?Q?mTeTGo3FOUy/MTdrNIm1RMVJlQjWnEXMVgJENb54pYjunInQp5eE06ITR+8Y?=
 =?us-ascii?Q?AcVDxKbJxlvCT9eBOEUpchL/TqOzNr5WQ2ilYtco4UdumHnBSEziE+F9Dv50?=
 =?us-ascii?Q?sJrA+ZAL4LIo26qPq9LVCSEcapET4iVNJ01oKme2wpMP3Ui/5Xhbz5lPgeaR?=
 =?us-ascii?Q?aZITpMlzjR9WBNncC6mRlps6W7FObFPCKqzcEmqMBx4wsFk1Jowhcn5gy6xH?=
 =?us-ascii?Q?j7ELQibG0s73rj/Kij7jYzxNDv0mcvFQXMpRwsdjtGTCEwqEDnEsYf9naoxp?=
 =?us-ascii?Q?3Jxceq6uZTokyl1KqeGErYKcieSfzaePAIHSXd7dBLHobETru78SDCb0Cl/Q?=
 =?us-ascii?Q?oOg4i/LEEqzB7fmgjsebnHLxbeFjYI2FA9qjRseNEFUesrgf5UWlePSOWt+U?=
 =?us-ascii?Q?X4o5XnMWO63fJxzCP0Wxd6aA6Xt99FO8pY/w2FcxvJUaS9rHk8VpkCxKD8qo?=
 =?us-ascii?Q?apYWlZVvGEHA24qG6FNkAj1FynaZ15adVagtyUPFzvYhtiqkSaJFE7Y9fJRF?=
 =?us-ascii?Q?ZxLZRfNv5/uj0rRyWaCTMUTTsvJH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa73621-30b9-4c8a-f9f1-08de734219ed
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:14:48.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9969
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,lists.infradead.org,vger.kernel.org,gmail.com,pengutronix.de,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13191-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[yangshiji66@outlook.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS7PR01MB13602.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:dkim]
X-Rspamd-Queue-Id: 47C891806EB
X-Rspamd-Action: no action

Friendly ping.

This patch series has been merged into OpenWrt for several months,
And I have not received any negative feedback since then.
https://github.com/openwrt/openwrt/pull/18299

Regards,
Shiji Yang

