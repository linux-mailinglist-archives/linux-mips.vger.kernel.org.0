Return-Path: <linux-mips+bounces-15085-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YrWkCzvaL2rIHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15085-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:55:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CBD68584E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:55:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gaisler.com header.s=selector1 header.b=AmwwRQCe;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15085-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15085-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gaisler.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AB393048922
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDBC36D500;
	Mon, 15 Jun 2026 10:52:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from GVZP280CU018.outbound.protection.outlook.com (mail-swedencentralazon11022072.outbound.protection.outlook.com [52.101.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4836A35A;
	Mon, 15 Jun 2026 10:52:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520772; cv=fail; b=lOnP4ma5HV9yEK3Iguh5EKC3QIhZ+oSHukMYpf/RyOWcaWAG+7bd6sJgfhD+KcXEjWGSizv/narormJ4ZR0JCl/SLjX9f52uwMZ0lXIJQeljHjvYQAUWZQSfeqMGJnpckW89bPkv4UQf5HcvDafHFKIQqUT3O/l4osCrmlSrCHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520772; c=relaxed/simple;
	bh=mk9dZB+TThHGhLBzmbajR01sLqzXf6sncuYMG1miMPs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HeB1yYbi7SEF0xatwd02woyvWI0R2PaUw75fpNvHF7ObG33AHge7er9SGhDpgzgdg9a8nzdiCOcbo2e04RFEkAtCYb5P/VfOsjv/Omr4iiSmFBfxWxrNrBJKKTfCZretoWHdKJj/EPHdNwWvU9uZmQA6/p/XcU+g8rtfXUcaJr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=permerror header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (2048-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=AmwwRQCe; arc=fail smtp.client-ip=52.101.82.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5hP1EMyLvJcpCEHRYxb2fqiQlC5BXY+yDRZ0dXCNgUOFuTp4nasNh9XfvbOtA69zEjVUF4COj/nTnpgIWooMcZXlcvZf1nqTmm/427WmG3251Bs5RjSn6rgOe2IXzmYxDh0hy3xLZMWgnIGl3Ad6mtnlbpD37+d1nql0eA86ty2Z6caugtWw+k2JCxGVOUHUx3RNQYNUgypBAp27c/+fdFkXUqCE11pbgRlSkCF9dkh6E+t5mvqgwx0cYuNCjdro7Rsuhncr3prOlr/yUTkLwDhy7LBr8GjlCeVoGrCjAwhDv/NiFOPo1jb24xHDc/PBDe47h84q6FCT8y/RIZsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZZ9HuKbA0zQ0VwJtXcsGx/pVDCJNKq8x/AJabyeOMk=;
 b=vh6nw8eT1YAJ6Ckw/ciNVzb0Jc64l8zgXAPmBsEEsmRohQd79EjLDVaAg6XLfdRD7D4AfUYY1JsmfmcEB8m/NO8Etzs1DtjPp7zZ7WNRCHPOxMBAIUPJv6M4XU7g/I5xnH7Fk0eVfwAMrD78tNHlS6grCCnDE+GlAfwmL6/eSYuEaU6fGBhDxCmuxd3ZsFgiRksGH3MDLxeT/Npz6cGvdMEuIEsDOmu7MSgNnZaAQRlXe094xlnwJ2kmsW9vo7MmbAd0tiiXZgll7/UCqC7KDRgmuPqHaKQY6E1KN5adNGC8eZaTRJcoapbM35vtPC9POdm0QisXHwArNM2O8ES1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gaisler.com; dmarc=pass action=none header.from=gaisler.com;
 dkim=pass header.d=gaisler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZZ9HuKbA0zQ0VwJtXcsGx/pVDCJNKq8x/AJabyeOMk=;
 b=AmwwRQCePo3mKdKWLlPoJZP7yj66d/0SjGHMr63QxPtPcvUrZPOudkvLeQP6OhIsdEtpo+V5bzaMRelta8XMiwq7pPPrvczbKmAdDNfr5vP9FZ4dmLMTal2aN+B6L/bxk1qhjTgMo5kkWbpgwluSJ/ojm7yYQEnyIT3yRuXUF0BnQRK6QSdUesvE2zeaM5/wmOw43YFTs05FVXP74/Y9vG8x0LY0F+Kr4sy5Hjo48u+4zKs4KQjAbzbyRwlW/Ovx80KTjL+QtCo0FnvB7PjNdNSHsFri6nGvA4MwCrXDtdZPV6TPcxD4ZuUIrOge2bDW9qsvUeAR2I1gOT1IyE8S4A==
Received: from GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:195::18)
 by GVZP280MB1738.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 10:52:44 +0000
Received: from GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 ([fe80::be76:7636:f4ac:6773]) by GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 ([fe80::be76:7636:f4ac:6773%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:52:44 +0000
Message-ID: <d592a4de-7c36-4028-9763-3913b0836349@gaisler.com>
Date: Mon, 15 Jun 2026 12:52:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] sparc: Remove remaining defconfig references to
 the pktcdvd driver
To: Catalin Iacob <iacobcatalin@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jens Axboe <axboe@kernel.dk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
 <20260608-remove-pktcdvd-references-v4-5-72f88b04cc87@gmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260608-remove-pktcdvd-references-v4-5-72f88b04cc87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::7) To GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:195::18)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVYP280MB1290:EE_|GVZP280MB1738:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e3a7ad-0117-4e59-9886-08decacc3ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|56012099006|4143699003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	YcBE1IOwW0Tty0tgFy4d5Tn7QJ4DCkk+8NtNWvZgq32/8BzxIixbwjEvflMp1m0ay1mZi04PsT1ygJ3HHRQmfCtSoev7WG++RbdbbuH6V4K7uxMLAE66i81qiDgJ5s1+CwgiDaz3Y+2TojHisONHMkcVFdptFkUE65YtXIQw3wfZr6TGQcYFApJfKVcrPH2de1y+rlvnA6ki6S9qKVr2/OcI+g+yZYBKdWsaF3em0fHD7lixVcbj6l/SIcQ3dW3l8pbGDz9tyAfzPYA1HH6/ATLuuaqSmOHK1LqPYo+dkTGnKiyI4P6usMJWrRyvKkDomF1BEW7Qme3k9oPHQd/OyZ7ifr3TGatJzA8HTgnjCn2ciXR01Xhec46gZGJVuK9rybyhesfhNuE7SnkNcs1hTVVbw34zDHSt+z9XAb0lua7g9LcP/sXfjwOIgR5YV0phDCmnVf473ag8GH7vSULxCnpbiHlKvMh2Wo6ZT3FL3xz4CEPnFsBWJ73qvNtAIo0aWJFfWLsm7N8scHBnSqf/4OGFz/yT4fTfwrr79cgl3Zo74KcxdVdolz0vY7fk55KnIUAUPxx3Gr3FbMKt6D6Vox9HPrC1Ui1yRqFn0xL7I3Q0+LdZlgfZscUo7LqJ38nawiGe+5SgegYuo+6fOSYVtGrJTQiLQmcSPsOFpotmOLSpkERpcSTy89C5empqE1kyrw1DRU8RamioiEZ7vHkoHDOO/0ogYosUKuz1JhBuuJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0tyeGVST0t0YTkvMjFFR0IwbkphZklET2Vud0M0YlRVcm1hQVVRT2NYRlNo?=
 =?utf-8?B?MG1Td1VnanBRNVMxQU1COGUyMDJHTU4zZ3A0RXdIK0IxaGpwaDZaVUdvQlQ0?=
 =?utf-8?B?TTdBdytUWTBaU2tkaFMzZEhJZ3F5cG9UdzF3bTJyL0tkUEQ1Vms2N09SS1k1?=
 =?utf-8?B?cHdUTVFFTkJpVGdFMndmWkIrT0l0cE1qY3c4OE9leEZBVFl2UFBEQkRJTnVl?=
 =?utf-8?B?emJ5Z2xtVDl5NEI4ODc3V3plZE93dnhLRDZJL01ZNytwQkN6ekJjK1lNcTdE?=
 =?utf-8?B?WHJObjJRNnZEZHNoVnp5RDd0SnQ1d2JZMnFpencrVGdxamF4MC8wWWtKZzVw?=
 =?utf-8?B?Lys0dFNkUWl0dEs3VVU4cS9UcVFDNUJNQ0ZSQWhxYThVSXk5UmVjR2JjakQv?=
 =?utf-8?B?cmlvZEY0a0FSMmF2dzJHb2Y3b0ZBaGwreWM3K3duYlRBcmxtZ2JhZWlKb0RU?=
 =?utf-8?B?azZVSUV2aFVlZWhpclhMNXgwTFJ1Qlk4Y3laUENWWElKR3psTktBOVNPN0ZY?=
 =?utf-8?B?bHRXZDJIWC80NUtsM2d5NHNLMFNncHZCT3BKRkV2czVLUnQ0c3AvWlNWTEVF?=
 =?utf-8?B?ZDRuVWE3OEhod2lpdUV4SlhoY0dNRlpGYzFIZlBnVmEzYS9IZEt2elY3NzN4?=
 =?utf-8?B?aHNiZ3BpbzVnUXNmek96Mks0d09nNWsxdU0zRlp4ZmxyWkRBR3M3cUdkcDZa?=
 =?utf-8?B?SEZxWm1kaHVBMmxCU3VJbWMyeGg1K3hmVmFZOU1LR1pnei90T1ZUZTJqUjdj?=
 =?utf-8?B?bXF2MU5PelRhblVGdmpydG9TMGNPYXRUdWZFdk5saVREQ0N2VjM3Ti9DVjhi?=
 =?utf-8?B?THJmeFhWWXV5QVEyL0NSREdSVXNUR0d1OXdid0JWZERDdmhNcXc5M3ZZZm5I?=
 =?utf-8?B?d2VCcnBrYTRnTDdncmpoMjRFeDBGcTk3bHRpeEVhZVYyMU43UEFNbHhZSlhJ?=
 =?utf-8?B?QUU0T1FFTTI3aldqZkFCcm1qNzBzRFc5UDRPSFB3U2c3Zm50UHNROXZTdGZp?=
 =?utf-8?B?dmtqVGltc0I0cGRZQURzcXdkUEp4TG5Sb0pRZUVONlJnYis0ZHE2eEJFblNu?=
 =?utf-8?B?S3hLdE9IZWJiak5lRm9MdEdJa0tQcnlaNXhkdklOMzhFMzh1aWtPdEhVQzdR?=
 =?utf-8?B?eU5tQUFXeHpFanJQbzJIOWxCMXkzaU1nZThTTTRTcGE5QnZjUDd3eGdLM001?=
 =?utf-8?B?elBCbzdqSS9JZG54SlZFNkNFaFo0ZmM4ejZHdW1QSU8yQTMyUy82Z01LMGpv?=
 =?utf-8?B?WjBDaTgwNUJxSmdpbG40UjM5bkxsMkU0ZEpTMEZhcEc5d1RncUV4K1l1ZmJv?=
 =?utf-8?B?cGdXdTFSQmx2ZVZVUTVTS2h3a284blVqMkVaRVUrR2taamJhZEkzaXVGMVJo?=
 =?utf-8?B?RjJIQ3JaUXhOOHBLMm9HMkFsbWtUT2N3bHNVN01UcWMyZ0lLb2M1Wm94MFR4?=
 =?utf-8?B?NStHVzdhQUJOTFloc0kzbWFxblJXQWV2VVRSVnlHb09TbHk5cHBOazhuMlZH?=
 =?utf-8?B?UGpNMnp3N290V2Z4amhDYSt5NkRMUzFRRFJpY05RakJ6N0lVUEZNUk9DUFdW?=
 =?utf-8?B?d3NRMU1hd2VVUkF3b3VPK21NTnppWG53ZDUreXFnZGlqWTVRd0hWWWZWU3or?=
 =?utf-8?B?c3duSDEwaGppL2ZBR08rM2lFbnZZeWJtaHIwU0NQOU5KZWk4S0tBVCtIaE5s?=
 =?utf-8?B?VmQvYkU0Szk1Z3MwS3dCYXpKMTJYTkNDYm9INk5CYlVUMXhiMVJlcXloSy9T?=
 =?utf-8?B?RXJzcGJydnJSNHVkblFUV29NbE90VERMMFoyMHVOY1lGUGxTTTVObC9ZUS9G?=
 =?utf-8?B?clgzU3FTOVpDcHd2M2Q3SFA2RnRDSUJBVTBsbkdUa01DQ3BvQWowQ2c4aUFU?=
 =?utf-8?B?enorUU1YWk5UakRlL2g0andyNEhuWmJhNjh4VFEzRkk5aWFpd3BacmM0Z2NM?=
 =?utf-8?B?bld5M1pRZjdrZ3RUZDVIZG9tZ1Y4NjNBa2RsQ2h1WXZOcnoxalhab05mR25a?=
 =?utf-8?B?SDdaWjNaMm1KTVhIWGRGSjhEM1hDb2JKbjNHTDBkRVpQN0xVL0RzMzRqSUhp?=
 =?utf-8?B?YUIzWTdYblBOSDMvdWMrMzVwYXE2alM5d2lrbGx2bGFnTXRTUXZsMXN0M1pt?=
 =?utf-8?B?d1Z1WE8wRENtYzAwdGZLL0F0ZFN4Y2hHbElGb0VCVDBYS1VUbzM2ZFBHR0k4?=
 =?utf-8?B?bjZSNGN4SFZqRVdGeThSS3Z0aHlEYjQ2WTFpTFlXSk96UW40Y1NiakQvZlYr?=
 =?utf-8?B?U1Fva0crZ3V6eHd2MzZrQU44T2NKZ0plUWIrSktRYW16SWxJKy83aE9NUGRj?=
 =?utf-8?B?YmFXTEQ1cFhQMnlYbWYyaHppRzFSU3Y5RU41MnQyeUJ2V0owaUJlTlFncmRk?=
 =?utf-8?Q?c44te9QAjbmb95t0=3D?=
X-OriginatorOrg: gaisler.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e3a7ad-0117-4e59-9886-08decacc3ad6
X-MS-Exchange-CrossTenant-AuthSource: GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 10:52:44.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 91fa4a59-2167-458a-8318-e45d80469d7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXWf5JRMy2vo4wnz60pDKOMAwnCVhH2Jr7BYCTt0/SKfH8g90gFvRFp6uo6IjZLuoCBUcwXrlStAi199DDdiTHkSkx59cPBGXYzcnG6obW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVZP280MB1738
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[gaisler.com,none];
	R_DKIM_ALLOW(-0.20)[gaisler.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15085-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:iacobcatalin@gmail.com,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,HansenPartnership.com,oracle.com,kernel.dk];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andreas@gaisler.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gaisler.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6CBD68584E

On 2026-06-08 16:29, Catalin Iacob wrote:
> Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind some
> CONFIG_CONFIG_CDROM_PKTCDVD* references in defconfigs. Remove them.
> 
> Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
> ---
>  arch/sparc/configs/sparc64_defconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
> index 632081a262ba..4abea39281cd 100644
> --- a/arch/sparc/configs/sparc64_defconfig
> +++ b/arch/sparc/configs/sparc64_defconfig
> @@ -60,8 +60,6 @@ CONFIG_CONNECTOR=m
>  CONFIG_BLK_DEV_LOOP=m
>  CONFIG_BLK_DEV_CRYPTOLOOP=m
>  CONFIG_BLK_DEV_NBD=m
> -CONFIG_CDROM_PKTCDVD=m
> -CONFIG_CDROM_PKTCDVD_WCACHE=y
>  CONFIG_ATA_OVER_ETH=m
>  CONFIG_SUNVDC=m
>  CONFIG_ATA=y
> 

Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Picking this one up to my for-next.

Thanks,
Andreas


