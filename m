Return-Path: <linux-mips+bounces-15042-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XreRFVKqKWqwbgMAu9opvQ
	(envelope-from <linux-mips+bounces-15042-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 20:17:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2CB66C346
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 20:17:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=VLO5u0Yp;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15042-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15042-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A274315E975
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 18:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A033356762;
	Wed, 10 Jun 2026 18:14:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCB3546FE;
	Wed, 10 Jun 2026 18:14:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115246; cv=fail; b=nY8rA3DkvecrjDFZQsaBvhD/vWg2sBb8vYUefGn53SgdeRPIKhclWdhaa1pGOB0ZGJQCxyFV3nnbjye98q3zMVV8pTAs2kAmcTA1yopKrfGfWQvF6zmmHCxUjujROP10OzxOH07sAQUVHOSnoUfNVFYB1a0omL2RIz0rrJvyg5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115246; c=relaxed/simple;
	bh=fZdHXRlGxTNqS9K/7Pp64tF416skNgES8YaG2jNzNN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sToWfeUYyjonEQqbjeNTgYVRdReOb93SBNGaujnn7iD36kfHt4kRjHCjejipQexhfMGpRB3fnIDJSQR/iRJc/x5uPnwnDG0Ia/Om55OA9eqvjO2hFXrQl+iigReRlzfg8O1oXTeVqT8WYkX0ZS6T8o06TpXgRlTv5hkogw8gXPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VLO5u0Yp; arc=fail smtp.client-ip=52.101.52.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT369nfkbHNw7KmVRlTSq4RQKqCOE/jKD30QFDpVPC+vYzmnMjTGIAthqlMRsEaanv4sxiukPjKnxasiOkP1w0JohwnRAhNzlzR13FJ9qj+IBjpxsKMt/F2zCb7WKCL1fHd8AGEmjhUURvqnp02wOPhLtkje4MdpSaRhgdwUaG9WAFnciZwrryDO4YMkAkS0RgojT2Jyb3i2uwaGj6PO7AKAExAeml5HC6udC54oMU1mEz5AEU0AwusCvitvQetmy7AadFIx22uCiBlmHZNByWOo+VxZvwNeH54YveSHjcDXT/bZXnX7LJHvfJZbLj3LVfbWt2UnU6btaEmunz9Ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkS1FTd+qbaNr9HqaYWVqCBsm78oGqOVbxJkY8Ve68Y=;
 b=g25dqjAmevSWxqBgZXiGBB7ZjMC624tFM/A4u7fLTSLvsaG/PanBUU7YUhcix/j7wmgp8wymgAnSt749I6JBb1lrFMXWKO3YnD7yCLgWyxprsESZuPITj1fwBIT1zGF4mcDdoNyLzJPewnWGDcCEnD9Vv+0J8zMO8tV29txpDOpsJeO+yqClHxh9j/E/41HThe1HimZ1bfaKzTexnAZDKVs6qCWR3rGW2Snq4Jt0PsBzy2bZvlP+j+uMn1f+O0vGVMe2+Qf/fkvmY6jpY2nxTqnDlGS4RXWcA6zooVsKXhTKbQf8TgGcXbAiynz8NZCwKUSywDsF5qxOW90PR8dp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkS1FTd+qbaNr9HqaYWVqCBsm78oGqOVbxJkY8Ve68Y=;
 b=VLO5u0YpzdY5MiuzFIRaEu6JSGGiiRpjua7AecQFkFBVMOVip0aPhuJq9lH4VVC9XWnzHYnq6Gz6W0D3Ksn0csYNdWx7LSGmCutAyv2+YHrcntfG/30bFDir52IIsLlYMoaIscPG2KFhS5/2fHHJBlLYSsyiH+OiSRPOlBwHVnI=
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 18:14:00 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 18:14:00 +0000
Message-ID: <3c4c6c24-ec76-4085-b6da-cadfc8a229aa@amd.com>
Date: Wed, 10 Jun 2026 11:13:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/60] KVM Planes + SEV-SNP Support
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b4ca4c-1c34-4f54-d74d-08dec71c0b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	85rVobyKmzAiMmj0x9bsU7nkxs2Ql9SZvtnsjHoHirXMbPzb7KoTTAbXcInHr+dDsC0rWdRdA1MPfbMB1ZYC9yjdt1OM9u4tM+Y0HNvJmjeFxeRqxtmu/byzJPJMWDkO07lopvy5zRxgFWAHixBUvaTG5IjxBxEJwa9+Biex/XMkB7ktzh6JnoNa67BUbSZ/Oa5nTvDJ2zpRjOIfjqDzaii+bjGz06ndPhpsrmWpbYYhHdkRkBEjSa9SP0QutITV1PnaJp0o7E5UFBICbi8fd6Dib0b51H/BHuoScV7lKiuWU1QgGaf9PBoA6/xGQdD4pR0opRiONWOZIj5QWCGuNlqNJ24M2oViLZ/yy6XITXhZ7FD+9uz2u2rm36xzhjpmanMI6gQmPxFEQ/d3ut1vSQq28QgxyP386sM/ljUl6MTRxMGJJIafHmhmarRuu7BKrplcMRibayOgdtLJ/uJa9tDjYv/VmLQmhoVjgQ3Twjz8q35HMx+GLg/csoWWir1OPu0Oy/OphO52+6Ap7OLhkiOdnrYZzbO2xkCZwc7TtbGTo5nmOYFWkB7mwfBTmyXH517lNvTU/PIzeWyaD9bqCwWo0vpAQG4vLyiPpfZRLyzkHDqnqwOcw+2sAcJhoaHwoKZdKi7+FUXeQolCRkpHJ5ieXCm7I+gDkdPPu38XknKKOTBWloB3KmQ5LngJ4sxI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJwYndwY3ZQOE1aeHkxbS94cGp5NmRvd0k2QVppNmZhMGdGUEppUEpkTlMv?=
 =?utf-8?B?aUFWdGZoZHU4bk9yUWp2RmpsczJycFpKcmorR212TFZNVGo4QXQ3ME12Mjg5?=
 =?utf-8?B?aXZMdEpjNURVWFN2enhSM1lvZEhLazE3QndQN2p4VFg1aVE3c1RnVUVQRGl0?=
 =?utf-8?B?aDZUSkJXQjhtVldHOENGdVhUbVphdzRsRjdPMVYvRG9hTWR4SStKL1VFN1Fy?=
 =?utf-8?B?OFJ3TGttU1MxK1ZHVlorRWh0UXE1VzRmU2JNTWUxdUFWb1ZNWEcvZjd6OVgw?=
 =?utf-8?B?d3F1TFN3QmR5ZlJodXVsd1B4bFhZVHpySE9zbFliMklubEt0K2UyeWl3eWhh?=
 =?utf-8?B?OTZGQi9BOCtTQVVacm5vYm55ajk3M0tLVTFIc0JFeCtYNkF3aVRYcS9IcWMz?=
 =?utf-8?B?eHNPakswelpFYXo0YVhXNmxZOGNNK2dEaUJEZmdXTzJtNDJzWGFrd0N4Ty9y?=
 =?utf-8?B?ZVdrUFV2ekNtOTB0ZnFBd2RTU2hTVXFDcHhjNWs1a09TQ3IzbzZnQUJnckpS?=
 =?utf-8?B?SWRhUkJOMzV2Nis5WGVIUTBneEtSZkkvY0RyVWI0R3EyYVJjTWV3VnorNDgy?=
 =?utf-8?B?YWNXNy9QSHliaHJRUFFDcUxYVTdBNHJTWUErSHRDeGdhVUFNUTl3LzFGMGdW?=
 =?utf-8?B?aHNWczh6YTRaeE1JY1RKUzVNU2U4Rmd4OWxuUHVpdjZFL0hKcVArV1BUcDI2?=
 =?utf-8?B?eW01b2NDTFVQckxFV1p4REs2M2pOcnVPcC9TdGxjR0Y0M3dSamhSa1ZFVjFL?=
 =?utf-8?B?TzRWaklxNWN6MGJ5Zy9WYmJYdkZ3VDVOdytQK1VBL05zOFRxcVcxQTdLbTlK?=
 =?utf-8?B?clIweGthdU1BdDV5ZlBTRWxJa2crWkdJZVIxMUZWQTd3NXBTS3Vrbk5SakFD?=
 =?utf-8?B?aHIrZTM1STE0UUNmMGlOcE96ZVV1SzlCaFUwbjZSeFJXZ2hVL3c5Z3JseElm?=
 =?utf-8?B?cy84T1R0OTc1ZzAwVWppVXZTdjNqTW54dnlHZjY3Rk1aS3JHYTdBR1BjSDZB?=
 =?utf-8?B?L1VTcHY4b3NYUGU2RUh1RnQveCtadHhPeHhGZFNTV2NEWVZxRUZHRVF6ZHpx?=
 =?utf-8?B?MTYvNDNRdy9vck1zWVEydS8yOU1JZnlKeUYwT0VJbGdzU0hnaDQ4VldVcjRJ?=
 =?utf-8?B?UXR2bU9KYThnZ3BIbTBka3c0V0M4dFRUZVVEbDdYTUdxRFdiN1BFaWFwWDBI?=
 =?utf-8?B?UHpXeFBIbndNd0k4OWZlZXZJQWxqZmZhRC82dG1WRzFKOFhxQmN6M1ZKcmpp?=
 =?utf-8?B?OEV0dzFFcEdEVWNJZWZoYnlWa2kyKzZnc2djbHdBK3RJdncrd1ZpRDdKZTFG?=
 =?utf-8?B?WU1KUlZTZllOckM2T210b3IvVDB5K1hNblZIT3BGQUxWY3M5aUFhaWNOc3hP?=
 =?utf-8?B?Q3NNYmpFVHRvN3RyMVN0dHVxNWdnSUN6TmxTbUg1TzN5dENPMnhwZy81REs3?=
 =?utf-8?B?NHZvbDFXQ2ppb0JocStzU2pPNHMrdjE2dVR1UlFxUFZMTHJMdXNka09zdG45?=
 =?utf-8?B?d09aVDdiSzY5SlliVHpUbG1BYVlmWXZ6NDBoUExDRTc4UTFzY2FpdTdCaS9x?=
 =?utf-8?B?TXZoR1l6Y2w4VHoxSmwvbXlpVmY0MGZ6eGx3ajZUQnBhaTNURWVmN1ZLZHh5?=
 =?utf-8?B?dU5LT3VvSXpmVk9EVkVDT1RpTDZrU3NNOGYwbWRHRm93RjZBM2FaVXpxdzEz?=
 =?utf-8?B?Ty91SHd2d0NaWGN2WDdWMmN1VlRFT2RSQ0V1aEFtQkVwakI0bkZIZGVNSWgy?=
 =?utf-8?B?MEp3cC9YaVRyMCthYUpNQjNOK0F5QWF2VlNtRU1Cdnk3OFB2V0lucTJZK293?=
 =?utf-8?B?b1JpTFpxY0w4YTJWWmQ3Smc3MHdMYmRlTkYxdURPaDJ4K3VORjllWDZjZ3dF?=
 =?utf-8?B?MGZkRHNFOVdMOGpWaXRkeklmbGVRWUpnODU0MTVrZzlzNFR3WkJxSmF4S0pz?=
 =?utf-8?B?VS9yTmpnZnlOZFV6VGFtVEpDM0lVTDkvSURxSm9ib1JiQnQ2S0Y0Rmdvbkhk?=
 =?utf-8?B?QzhwODRoOWxCT2dncXdhMWJRb1F1VGxETFpMdDJwU1Z6N2doZExCc2R4cTJY?=
 =?utf-8?B?ZndhMVg3dVpFOWVJT2pYV1pRWlM3L1R0VE5rRnowenlZd3J5Qi90TzFqUE9Q?=
 =?utf-8?B?UDdvNGZnOHRHVHRMdVI2bWNLSDBwYmZnYnVIN3RXbVBLVFFCSVUxWmFyb25H?=
 =?utf-8?B?TEg3ZEtpLzFpNlZ3Sy9zY1lqM2VNbkczVlJjNVB6cmF5dU5ZcTJQQXc2R2Vq?=
 =?utf-8?B?VnpVUXZMMkNJTzk0bnJVL3h2akJUNFprQThPM2QzQ2hzTWp5Z2dkVnZhVHdO?=
 =?utf-8?B?eHh1V3NGekowNUx1aU9jRCtZSUNrQkJLZkVGSlJ1WGNRbHNTWXpZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b4ca4c-1c34-4f54-d74d-08dec71c0b89
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:14:00.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+Rg3KGvROGFm1p95CNRxo1p8Fw3mpQCssxc/9Xmhd4JJxA6pqRX6qTQQvbV0FtEYTz03B48tas2e9pYtD/xLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15042-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[huibo.wang@amd.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huibo.wang@amd.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC2CB66C346

Hi,

On 6/8/26 7:41 AM, Jörg Rödel wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
 > ...
> This changes depend on Melodys patches for supporting restricted
> injection. As they are required to run COCONUT-SVSM, they are included
> here for completeness.

Btw, I am fixing up the restricted injection patches based on AI 
reviews, will send the new version out upstream soon. So you dont need 
to review the current version.

-- 
Thanks,
Melody


