Return-Path: <linux-mips+bounces-14090-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ns2eAmfW12mDTggAu9opvQ
	(envelope-from <linux-mips+bounces-14090-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Apr 2026 18:40:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 677BF3CDB7A
	for <lists+linux-mips@lfdr.de>; Thu, 09 Apr 2026 18:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D47A30094E8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2026 16:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F09A2D2496;
	Thu,  9 Apr 2026 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="DEucer+t"
X-Original-To: linux-mips@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84968BE9;
	Thu,  9 Apr 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775752802; cv=fail; b=pZ85gKH1d9vOortxlNRtI70guP58Ry8KZsckpntbbA/rbUCQnvqEqkm9rmkySEw7y2teumTL1RbOgDlMSNwLTWVQdX557nfbowM23A4AMtCgkVQdJc4gVeKXyAJ4cdV9f0LbTYnHz2dGKaSjFujNZLvqTcXPk/UP5bi3BTlftzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775752802; c=relaxed/simple;
	bh=wtRnCLsWkUkIGVeds7C9XlQyk8cCg8qVaAW3kp0BjTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DgwmRoXFv4AWDFFLbzzpvp8lBU/enyT+xNy9r8VH5G+t8Rn1GOtzaP4hOsIZTJcYkfnxspCHnWclPqfTEWkZH7BCkAGnYN35hMMl/DALn91BccfuoWMoaLjE758q693X02hALU2FNB7mahLN6gQz1d2680nZFkLMVhRSSodm5ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=DEucer+t; arc=fail smtp.client-ip=52.101.84.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENWEc1K0ibRE5lMeXL+/nDfuwxeWUTa7JCEgGnV3wEzLKChtv872wFwAOzlcQO002+etX2OYEZmzo2ADPNs9uW2ijV9nQgOuOgkbq2HU/1RZdFouOlpgJO2tmSRli15pBhggPRPxuFwlJw9v+wg5jQV/zWXGtAYINe8iYA1R85yCIZeldphVe9gH1lNLCTL44GqSzGfPiwzGlO6khuwKFOpO31AZSTw70KwRQpPtjUf3RmkxYLiAE7l4203DGb4b3rjMUe3DW8Qjfsq0lJiRs4PWNH9NMpDLigzIyZThl+rGAs2DUHKwEKCm3hFhG108z8wNARmN3vpjNlPNBmivTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbr+1X1QMRIKF9SptdW41ow/BnFj7aoa7aZi44DJhlk=;
 b=Kb4+XnZL9naEOYyAt4kYcYK8KztJ9P17V/iBWfFKerKUVwURjaW+lr/n+XXyMaXNqLoehyrf7hhIv0FxsT21ypRiOyNuGEaqjgLWNeL6LdAQXviP2lFDoigc/Zhj/aLVRtR20emrotdKSD8d+1XzRCYGyZlt9J8dyO/mYx9NimlD8r5X98uOGsH2cqhoNHax+Az4ApU7RxGz3His73sIOspxoUto6Ppb3LVgVEttdci8/1rm/Fq/sCJ7c+pDUvbExXIO5jkgUVYGxlp+Xbrgd9ZqdOhoWtwQvkF870dZExag6nVQaJ2K7Up03jqYo4moL5KieDIwjC4S9PJpgR78XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbr+1X1QMRIKF9SptdW41ow/BnFj7aoa7aZi44DJhlk=;
 b=DEucer+tq72uXZUtzv9C16w1Kzq6bxx14Pi2COpw7/Wy+f2Ct2mA3odr+pqjEOjYq91vUa2iwR8JK6CsQ2iyll4NTkHMqGXYQJvmpdDLGnW/XFsKRbR+rxZEaiSLXSeFqgdLynbdvuOAZSAuPULMAFq/hw+4EBu7amKJmzdEQ4aH1yHbIll02VFKZKiUTliZKz4Y+TVumydaFMafzzrckXMgENS6gzwqls/lZ6KRTRUlJBgCu8I+mUY7nflKIXk7FRqVOlXHB/jdnyZJqgg7KOpegaMi9yrs/UK2eNnS7WtbCaWlHADYUs7vaAQssCuO5jmlyh1uL1lSVjG01s/Q4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com (2603:10a6:102:383::17)
 by VI0PR07MB10807.eurprd07.prod.outlook.com (2603:10a6:800:2c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 16:39:56 +0000
Received: from PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809]) by PAWPR07MB9688.eurprd07.prod.outlook.com
 ([fe80::3a2d:5997:c1c7:3809%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 16:39:56 +0000
Message-ID: <9eac5d56-13a3-42db-ba6e-caa7cb248a69@nokia.com>
Date: Thu, 9 Apr 2026 18:39:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: mm: Call rcutree_report_cpu_starting() even earlier
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407083324.906742-2-stefan.wiehler@nokia.com>
 <alpine.DEB.2.21.2604071142530.29980@angie.orcam.me.uk>
Content-Language: en-US
From: Stefan Wiehler <stefan.wiehler@nokia.com>
In-Reply-To: <alpine.DEB.2.21.2604071142530.29980@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To PAWPR07MB9688.eurprd07.prod.outlook.com
 (2603:10a6:102:383::17)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR07MB9688:EE_|VI0PR07MB10807:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a49270-a977-4243-f270-08de9656a1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FNA15sBAUwkzhuoHfzx75fiF5UVuc6iTeYqVs5geuF5k4vXj00g+hpP4gq+0AaXT4m2FhvhcY8gs3CpR3H0n3E4pxjDCZsnxnOIBAuJmmFAa1Jjy4ndKdg2xEs+55heKNsFjV27r9F6nG5Fm4YjdJ1crpLArVO/l+ilZ7zdFkNeZzw29tq/W6WTPpKm0W1RLMbQ+6jGqkX1LQDyRYmncci7s+Yr8s6cB4YPuIRj9MOR3ke1roXCH2YniDGIBVufnckbvrWC3MIPxca+8jQvvRW71zQRFUJxLW6FYh3xqHKUcNHqSkmqo1zG7K5QHUPQzEv1M6IePiEPlIycDHQUp4nkN3htPtqcJrDSDut/rbPHAB43j2eBoFImjuDjikAKLTh20EIVsMfOxISwATrijwIZ6L+uWvLRG9kHzLU2W3pd7WG6plpDqMtggKAFcXjY9XU6TQ1gHZJGy8eZxTkXBdNFHOg8htjN/vNbB2dBcyJdZDxcW5U3XtRiBbImSF5es4JZ8HeMfQr0i2hjGho5i3WnKORUnik+eKx1+MxzCQ0usO6NjtPs2ETTq9vagmAo1/vFFpCRsmMNeGBlxbVzEJynVjSjY0lpMJ8ew53yX+bvp2jXCWXoFuBWp+uUQ7BKGoI9M1U33hRxtlzKJ+b6tkTMmydQDYWuLAFYZcqrR1su0GYpcgyP/W1DhY9tER41haHMo4HWk3k+B+B66eK9lJ55T4swgjo4Q3ynO0j9oHu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR07MB9688.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGZFMjBJY1dkZnF4QWxCRUUrTkNQdVNoUjBsMERIS3J2WkdtWVRJMnVCY2pP?=
 =?utf-8?B?dVNBSm1SR21HSDdtb2ZlS29nSzBNUlRuaGFjTEhSd0tVNmtwdFdFWWVzaXlp?=
 =?utf-8?B?VVJFTURCelZEQ2F5Wm1iUDZWeVJjMmNiZG9ISGNHaVBuWks0aEF0YmpCV1BZ?=
 =?utf-8?B?M3NKSWFnV2JpZHdsaElxWmpReEE4WEY4ejBGNEt4c3R5NWZyRWsvL2hkMk10?=
 =?utf-8?B?OTVKeWpkL3c2T2J1N1ljYnc1eUFsZHZsUWxyYW96MlRWcnNZTGJkQ0JQRWN5?=
 =?utf-8?B?dDlvZituSy9pVVd6VTZqQWFPbEpiMzdhL2F4ejNMWkxIUFRIaFNxVGU4eGhU?=
 =?utf-8?B?eno1V3p4RWp1RFg3d0tieDZMQkVhNVdGejBmTWZDQy9KcnNvTXdEMmdxRXdX?=
 =?utf-8?B?Wmhpb1kzY0NhRnRKSHdpTHB3OHVVZ0IxdnRCMXRpaUdhYU9VRjF2YUxDaTMx?=
 =?utf-8?B?Mys3Q1FoUFByOThidzU1ckZ6TzViS1dnd0grcWtLUThFRjdDQ2NrUk1JTmVV?=
 =?utf-8?B?bGJtSXNPSFlkdE53SFZmMDNNaXV0V0FwZnV0WDdSaGdlcDd5aGppcGYzZHlv?=
 =?utf-8?B?SnNkVmxxOHZlUkxRNmJjRWx6Z1JMdDMzVFhOZWtobjArblZyUzE3a0s3enpZ?=
 =?utf-8?B?ZWU2cGpEaDkzSlRwNS8zcHRlSHlPTDFpRThHZGNzVERucWdKcSt6QUVOeVU5?=
 =?utf-8?B?WnhYWStncnBwVXVZQ1BOWW43SW1pYTBKWWQwVnRtaVIrK3RBNkZucTJZcHZF?=
 =?utf-8?B?ODZIY3RCWnltZVlNNjMrc3BTbGJsQWxMMmRCZlRZMkh4dkdGRGJnV05lNWpV?=
 =?utf-8?B?SVFQL3gxOVJ2WnlpTUJlMEZSOEZhSUZuaHhGTW40MDJkbEN1TjI0djZGdlVS?=
 =?utf-8?B?VjhhbzA4VkI0V0djbnhyZzUwL1hGK2pFWm5XTkZyMzlVZHRmLzJUK0RRYzNT?=
 =?utf-8?B?b2NoL0V6bTJqZ1I0V3M2a0ZzYkdETWQ3aHlrR0g5Vld5RmNOc0xQUDJZbk5O?=
 =?utf-8?B?b3YvcE9GL3hPNFMySG80ZWJIZDNVaUxBV005dGJRVDgzNHM0dncxem4waUdz?=
 =?utf-8?B?VzFrYVFTQmJtUWFvR01VNnIyWVJSM0x0WTV6c0ppSlZyQnlXcjFkcTZUS2lC?=
 =?utf-8?B?QVZ1T3pBNm1lN3hLOGhmdzg1OUxBUi9hU3F3OE1tYzFtZHFVeXE0cXh3YmNM?=
 =?utf-8?B?cU9uREVMYjYrWkZKcDBuRE43MDFnSzFGK0VtNFVra3BIVkxnb25EZnZaUVpi?=
 =?utf-8?B?U0p5c3Zwc05XK2h4QTMyS0l4d2ZMYmpGRkhjeCtLRDFOak1xanA4V0VhME1w?=
 =?utf-8?B?T2JpNnVRSkt2L0FHR3ZoVlkwSnV0NzRsOHlzWXpHNTNYY0ZnTGxQeFdTeDlu?=
 =?utf-8?B?c2lwZk1vbXBERGQzVGRnU3VmYXpuN0t6L2JicGZ0UHk2WVI1bjZveUR5cnRZ?=
 =?utf-8?B?SkZYUndiNkxEQ0VzcVpLQUtvMVo4L2g5YlkxYzJrTUljYTVHRVdSY05hdzZa?=
 =?utf-8?B?bGZmM1BDQm13SXpxMVdHeG1vTVo5VHcxSWZPVzErVTRwT2loNVhHQzNKSEVl?=
 =?utf-8?B?Rm1pUDN2dzZwQnVucUlZK1lLUWZ3RnlwQUcwdjdFNUg1MGFVV2VkRFhuTXlQ?=
 =?utf-8?B?U3VPTUxnRHp3V3lQNWdjZ2JXMHFTbDFNdUFremtSekdTOEE5SjRaZE5sLzdV?=
 =?utf-8?B?Tkl0WVVMWmgzcE1mME5XMVdYTnVwcUNxc0JPdkg5RG1SNW44Wi9xWjhsc3hj?=
 =?utf-8?B?c2VSOUFBMGEyUUxvVFB6SUpHckJ4aEgxd1g5Z2tFQVIwcktOeTU5SC9WQ25I?=
 =?utf-8?B?SDJaTXFwREJVRExaTG5LeGROSlh2b1h1QTJ2b1ZObmNMa2lHbXJvczE1RWNX?=
 =?utf-8?B?Qi9oTVFCajhsM3MzZ3R4SUl0YmNwZklKTFVNMm4wZ01QV0pUaDFzbWpRVEh0?=
 =?utf-8?B?UTg5dmdZUFkwWjBNRHlvZEJtejltTmxjbkZacXVCeVJReWJ2TmhTTTR6dmZE?=
 =?utf-8?B?blZGd2MvbXdvbjNDRGxSamFqdncyNVQzL2ZJMmorZ2ZRWVYyeHVmdHpjbzBD?=
 =?utf-8?B?bUZEUlRpcVFVaFRsdGU2ZjBhL3Q0M2pHZEc3UnlSWXhnaEhrRWVidExUT3Qr?=
 =?utf-8?B?cWRWV1l3WXBzWFJkQ3RoZmZkSzcxandjeitvV0NEWjFKUC81K0JpWnRlbXlK?=
 =?utf-8?B?cGlXeWFvS3ZTeVppdVJVbWRURWFieCtKWFFEUWI4NHNtbGpGNzNZSGRuV1ZF?=
 =?utf-8?B?cm1nL2lMYmNxdWlFZlBVKzRQMXFMMWRJY21QR1BtNDJVQmV5akV1aGgxbjFO?=
 =?utf-8?B?cy9leGtjdU56QXRMb1E0blg3RnRuOTRITEtWcmxRbFk4VFArdUM5WUF4NVd4?=
 =?utf-8?Q?lQn0+xQc6g2ILVCk=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a49270-a977-4243-f270-08de9656a1de
X-MS-Exchange-CrossTenant-AuthSource: PAWPR07MB9688.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:39:56.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCo1hCRswQ6r9wzy4VbPAxS4/Mk5VaxNK0PXKQJ/PD47YuCMGDOahDcNvTbvIe7Oc5L5OlwnHJ3OHcYXee0joMEGhwUqWkTliALA+ZkaAj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB10807
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14090-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[nokia.com:+]
X-Rspamd-Queue-Id: 677BF3CDB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>  You could use `use_slab' to figure out whether it is a secondary CPU, but
> the right fix AFAICT is to reorder the `rcutree_report_cpu_starting' ahead
> of `per_cpu_trap_init' in `start_secondary', possibly even to the start of
> the function (does it rely on any of the initialisation done earlier on?).

Thanks, reordering the rcutree_report_cpu_starting() call in start_secondary()
is indeed much better; funny that I forgot my own change in commit 55702ec9603e
("mips/smp: Call rcutree_report_cpu_starting() earlier") from some years ago.
Will sent out a v2 shortly.

>  NB is `rcu_cpu_starting' the right function call to make, and where does
> `cpu' come from here?

Sorry, rcu_cpu_starting() has been renamed to rcutree_report_cpu_starting() at
some point, and I accidentally sent out the patch for our LTS kernel; also
fixed in v2.

Kind regards,

Stefan

