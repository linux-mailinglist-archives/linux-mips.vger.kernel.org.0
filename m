Return-Path: <linux-mips+bounces-15023-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QeIML8prKWpkWgMAu9opvQ
	(envelope-from <linux-mips+bounces-15023-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:51:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32021669F3C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=FLR1I8pN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15023-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15023-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44B5D318D140
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 13:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32DF40E8CB;
	Wed, 10 Jun 2026 13:45:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847740E8FC;
	Wed, 10 Jun 2026 13:45:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099109; cv=fail; b=lPuO71hLsbCoIxeZi0G3tnFn47Uhf8qLmIKHR9hpqwHU7uPi29Wxm6e3tGE+BpwOcO1+nNy+YKPEJnfPtczAZV7J1hGuuNxk9pcLoMhv10H5sMicWbJ0VaIJ7UD7DxAvu9GiF9QV/38Tw9qQ23AGMWgs3BEGHt9Ce3NX6Ipqmms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099109; c=relaxed/simple;
	bh=qiAL/s+lfN89fTbhfJSCuMJBBCzx9RsbYy0Wyl/m4/Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWHJ1MYD/riDLlLY7B+WBuYbVwdyBCFiMEB+97qiriXPc/AxiGoRCG9NH23NLf4MgOfotwckHSB/0gDC4kU3caLqQI/hkyFfiajNfs4+aG/MYCrsCH0ITfx8ExaYoDmY5TvLW2NqOjbe6YiQc8pGJxXUSaybpcqWSjpQWnE0tFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FLR1I8pN; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6c9EbW2Urhvy2wKTWRhGGYZWfPrw4dESgNv9kvNzf8YmOaSxWbwI17nZXvrrlLWFbT8ba7d2f2AGwRWFSrTTzd+K48X/zeS8L0UXqZxBm18x4QFEtUnmeJ71w1Yq0F2wFYd3dJsEUwFEY1CpIubKBJugkAH99DmeqBEuXnvcOweub+0CuwaRIoT6Yt6ocQ1JGwl86tlD0NRjwmR8MLx55mQgbj5oIiK/nytk/E9eFEP6I/2bJ2S7yRpiDyhvFhTz6XVqB4Epln30z3ymglsPTzo6/VCMEB/RcwRLaCA6ayQ79c4Df6YU3oSAQ+oZOu5DTIuB8HajN5xI4xKCF//jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyKnEpqU0YHoKCACoYtz1S/+wbhiCUsUo3R2cFUTCGE=;
 b=q8HcxT3rBNbg1RT9tzAo2Us/7qJMPeO57cEY4bjg3fVl7ppnb4jikanNEF8km/gk9oWCuU6Iyy6VM5bvQuDF1kfdO8RbEY7ucPNVU01tAW//bCzG1DUMuKfHsqHNMbLX5o4Swo5x3k3U9Wjboa3V7rCdZZYlFH4ZNj28ceouN/JYWb043HFo4dCICSBT9238whcYwATnHWb8Su4Gad00bRPIvS+pUWa7GElZTmyCmRFW19uktDS5EQn5H6gP4gPBMhzNAL/TAs0NpO//5DZgLThVlKwtCKa1nrf2dkO9mh06LIfUkOcIhHdNLvt8YpWNi14MzoGoFczrLV9miNvI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyKnEpqU0YHoKCACoYtz1S/+wbhiCUsUo3R2cFUTCGE=;
 b=FLR1I8pNSMpvCiOJYdj9N05siMTv+UAJDwT4rDthcqjU8u3Kqnmju4tvn1u+XxCwOO2D2T2wF5CNevEM3W/igzaionPPUejE9fOHWj/cQRPfL7LQZdOXrJIjyZHUaX+sRy0RQq/j66Aa+PNdkxToC+BUEI1NsNgUx7mwssCWXo4=
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by CH1PPF0B4A257F6.namprd12.prod.outlook.com (2603:10b6:61f:fc00::605) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 13:45:04 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:45:04 +0000
Message-ID: <62c1492f-c40b-4a0f-84f8-695660e1f20b@amd.com>
Date: Wed, 10 Jun 2026 08:45:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/60] KVM: SVM: Add support for the SEV-SNP #HV IPI NAE
 event
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: ashish.kalra@amd.com, michael.roth@amd.com, nsaenz@amazon.com,
 anelkz@amazon.de, James.Bottomley@HansenPartnership.com,
 Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-8-joro@8bytes.org>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260608144252.351443-8-joro@8bytes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:806:20::19) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|CH1PPF0B4A257F6:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7608dc-73e9-4f71-0751-08dec6f6799c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|56012099006|3023799007|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bKTsJ+6bn86WlxIXHVE7xUBmZFYIyFJF2xvHuryjmy0legEBKftnyLc0kYm0pkDCGXmlKht9zAc65NI7jasGTlaUr7+9hRtGfNNvOAFvAl+KofN5asamAHl904HmWx7d1hZHPIucxtG1P5VQFYdmcYVbOCBLfeaVjASOKRRffhZ2GC1yHtUCpDnu2zFCv6ry/FN5b0SXLli3UGnXgQ57lbwGqxXmWxuHkqFkWjhOy6HfVgChE2aEAx2R9iC959I/O+vgxnCc6JhHwxU9HP1RIrovwkFPNzNVF+eG0Qrt/7bx/2S74K5/kOQHJzitCvwMZhcRDCtBIyVwxZ3GHgkLQplOa4wx0ON0UiYDrc4EZBpqSHP5IzSiIUb/fVlFhgEX67/+qpLnaBIshbql7hZs/S0dL3qOv0qoHpTAHDjFx4hLbW+vnGHsZAhwF5YokESFF20f19gayhC4hZ/9noPN+rYIVj0ZGRF17HV2nG/jkfgqFzrVccwNLOYD8SOJyOHYlbbSPqe2WksAoV8qOvipXNmOm4ji6zvXG7Ft8gy9F0P2hQqSTBieG7YL7jnZ8qgdSm38PqWWybJcvmM0P7Ne9Sl3j+X6xiXS4Wa0YwF+lavSkSQrYq8ucRD6RtbZMlIaEphl/OYPYV17PJ5yDDRC9AxSxAgN1E5tT6Nm5JgX6JpjLyUi1fHpXDxxboLh3aMb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(56012099006)(3023799007)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FvL1ZFVytzUnRXTFRQdUVRbzQ1NUg3c2dHWjBXNTNtT1A0OTEzOXROa2pi?=
 =?utf-8?B?dFdlN3JRY2JwTEFIWDAxZEN1MnZJQ3NVcXRYRlhlbmJ6VUhVK3NHT3lIVzJE?=
 =?utf-8?B?UEkya0FLZk1xQ0k0VHU0KzJZUERsMktUemFrZkp4dEFoK2poY2hhYisvZFEy?=
 =?utf-8?B?bTBDbVFiMjgzVitaRmZUVE5JV1FjZHg3K2Z5RTlwNlBGZGdKNmlVL1BKa0dG?=
 =?utf-8?B?dzhjL0xhZCtUUFdrMjN6ZTlYYWpBVTFYcTV3a01HOVpxVm9WRkE0VDlLcUZp?=
 =?utf-8?B?TzIwYVNFVVdJbmtCK0dmRy9IYkU0NVM3a295YUpkeGZlZTJCeUprS2s0bTVG?=
 =?utf-8?B?UEtKOWVNeDRKWWZRMVBtS0dlMlBwTG8zWWRhelp2cTA0Si84OVpzQnF4M3BO?=
 =?utf-8?B?MXNiVjNpUXNrdzNZVk9kb2o2YTJqQkZDdG9Vc2pKaTV0WE5ZOHZQSmtONFJj?=
 =?utf-8?B?Wkh1cnJFWitRZTRPVUxVSWl0MEJVZ0NoTElHb3lrNXVTZVVkWXhzY3hGZWZt?=
 =?utf-8?B?RUxJZ01mUHZqZ3JKK2F4Nld1cmVYUjhWUjYxMEZUVDRKTmdnaGpaTllQNWh0?=
 =?utf-8?B?a2ZxRFZIWTI1V1RVV1BFbXR3ZEFGQnRaL1Y2ellIRldHcmQza2poVHFzVTdr?=
 =?utf-8?B?MS9xV2JVMEZ3eC9JcXd5aDFEZEdUZjR4OG9VTmNCRkNlczZDOVhXR2w2V1BX?=
 =?utf-8?B?YUN2VmxVVytTWlNOODdleFFVR01TcVhtOGtpeHZHL3pVUk1oazRkQ3BNOGxz?=
 =?utf-8?B?cGZsSnMwOTd2cEUzMCtIM1BYc0VUYWNUdlNzbjFtMkZSdUJ4SnFFY3hSM2V4?=
 =?utf-8?B?bWw5YlgzODZGbUZjSXRobU5UY0l6VW1yb09mSVNjMnJLZHdkKzArTGJOa0dO?=
 =?utf-8?B?VktaRFc0emJ3SjMwT2lBN1FKdkJGcHFXRjdpRVJsRUFyUWw4SVVmUEZnS1d3?=
 =?utf-8?B?MnMxVW1ybThlRDNlTCtqRUZsNkoxOSs2M2I5aGZwZ20zS1ZmMDZLSFFRc3Yr?=
 =?utf-8?B?Tm56cE9MbU9HNzBlaGZxOGsyNjlUNCsraTNqdWdSRDFtbXFjZFF1cUNlYXpI?=
 =?utf-8?B?U2hZcU9sZGdsTTJUandJUXJpNmJ4Qy9KT1VNektGSG5URHlkc2pUMkRzQ2M1?=
 =?utf-8?B?dW5ydTBOMDZiRkp6Z04xZzFQM1NQMCtncFR0eXZpUFdxZXRNUTlUS2RuNVB2?=
 =?utf-8?B?QU9ZbjZibkdlNk45bE1Fd0Njbm1jME1XWFFCK0hwek1KdXRSTGNhb3Y3RFNT?=
 =?utf-8?B?MDJkMzFsNk9nbmNOOEFTR25oWmNUelM0cXJ2TEJJUENDZVNCZUl4U0xCR1Fi?=
 =?utf-8?B?WE9FS2E2M1ZFelh3bDY5aVRJbnVPOGRxbFFZWEE1TTl4S1BzcmNxSTZvRHdD?=
 =?utf-8?B?RDQ4U3BBMWlMVllRbTJFS1ZaaGVzaHZFQ1BmTkg4OXlkOW55WVlwejlSNTM1?=
 =?utf-8?B?aWFNZXlJdXR6WmNrWmFwMjV4VW01eFJhQjhDbFRCVEI0bjcyMm9NZEpORG4r?=
 =?utf-8?B?eCtiMm1yK0Fjak9HYnkwdEd1d1c0b1FGQ3B1dTA1YnlpRnRMTVhsNWtjQW9X?=
 =?utf-8?B?b0x6eFV0bmlQTFJOMzRvRWkxYTIybEdlR0RFQUg1K1RQV09GTmp1eDRyYldt?=
 =?utf-8?B?cEpRNCtVTDVGTTl1a1lEcHMrK3JjTTVadUlYUmJsVm1lMWxpSHVCVi9ReVRa?=
 =?utf-8?B?MWpuK0V3R0RJNzB3bHE1anRQREM4dC9PZ28wdVJGQmNDRDFtNllxcG5RQ21K?=
 =?utf-8?B?UUdYUVQ4WGxlQ1hmZVBMM1p2d0xKNlp6ZkIwb3p4WisxZFp1eElERlpDK1Qv?=
 =?utf-8?B?dGxzK0VJWGlzTlAxVzNsQW12cUtDVmR4SURuZCttdE1RTXNjVkxrOG8wSFZH?=
 =?utf-8?B?aTFxdzYxYzgxZDZUWUdzN2pTeDg5MkUyL3BVY05WbzV6dUt6aVdBQ1NqZEVR?=
 =?utf-8?B?OUdKRm81QThFcExsSTd4NCtPMUxPS20yb1VFcit6RFc3VjVhQ3dSNE0wMlZQ?=
 =?utf-8?B?Q1NzV2EvTWZqVFRobGtPUzR5aUxCVWFhelhrQmlwakJINnlLTFUyYUVkRW41?=
 =?utf-8?B?UlhWUU9hNWszM3J6ajNaRzY5N0R4c2hESlN0ajFvR1ExdTZlNlIxcjVMb3Jm?=
 =?utf-8?B?OGJHSkROY3lFSXpYajlkbVZoQlZSNWk5WXF2NzkrZitlTENMTGZ4MlduVnA4?=
 =?utf-8?B?TmdjV3pwSXY1aWxFZE1RSmlaSFQrWHpJd21iZW8vYklvODlxUzlJVlp4anZF?=
 =?utf-8?B?ZmVPeko2UDU3OWdUaFMzVFhJZEM4blVXeTEycmlabmlYaDZQZ2pCTzkwU2VU?=
 =?utf-8?Q?FfER1+suoMkaasfYEe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7608dc-73e9-4f71-0751-08dec6f6799c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:45:03.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hI+Lq5wW3pJSVXyAnmL3+bWG3oaODz0lvQztVFJbwaXloKLgY1JvTHIg9osmyOin3iG6rPWXaOQ+MXJr+08TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0B4A257F6
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15023-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.lendacky@amd.com,linux-mips@vger.kernel.org];
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
	FROM_NEQ_ENVFROM(0.00)[thomas.lendacky@amd.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32021669F3C

On 6/8/26 09:41, Jörg Rödel wrote:
> From: Melody Wang <huibo.wang@amd.com>
> 
> The #HV IPI NAE event allows the guest to send an IPI to other vCPUs in the
> guest when the Restricted Injection feature is enabled. Implement the NAE
> event as per GHCB specification.
> 
> Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>

This patch should come before the patch #6 where restricted injection is
enabled.

> ---
>  arch/x86/include/uapi/asm/svm.h |  1 +
>  arch/x86/kvm/lapic.c            | 24 +++++++++++++++++++++++-
>  arch/x86/kvm/lapic.h            |  2 ++
>  arch/x86/kvm/svm/sev.c          | 28 ++++++++++++++++++++++++++++
>  4 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
> index d84a13ac4627..d281dd21c540 100644
> --- a/arch/x86/include/uapi/asm/svm.h
> +++ b/arch/x86/include/uapi/asm/svm.h
> @@ -122,6 +122,7 @@
>  #define SVM_VMGEXIT_HVDB_SET			1
>  #define SVM_VMGEXIT_HVDB_QUERY			2
>  #define SVM_VMGEXIT_HVDB_CLEAR			3
> +#define SVM_VMGEXIT_HV_IPI                      0x80000015ull

Looks like spaces instead of tabs between the name and the value.

Thanks,
Tom

>  #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
>  #define SVM_VMGEXIT_SAVIC			0x8000001aull
>  #define SVM_VMGEXIT_SAVIC_REGISTER_GPA		0
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 4078e624ca66..ab40a2e4ab9d 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -2558,7 +2558,7 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
>  static int apic_mmio_write(struct kvm_vcpu *vcpu, struct kvm_io_device *this,
>  			    gpa_t address, int len, const void *data)
>  {
> -	struct kvm_lapic *apic = to_lapic(this);
> +	struct kvm_lapic *apic = this ? to_lapic(this) : vcpu->arch.apic;
>  	unsigned int offset = address - apic->base_address;
>  	u32 val;
>  
> @@ -3583,3 +3583,25 @@ void kvm_lapic_exit(void)
>  	static_key_deferred_flush(&apic_sw_disabled);
>  	WARN_ON(static_branch_unlikely(&apic_sw_disabled.key));
>  }
> +
> +/* Send IPI by writing ICR with MSR write when X2APIC enabled, with mmio write when XAPIC enabled */
> +int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data)
> +{
> +	u32 icr_msr_addr = APIC_BASE_MSR + (APIC_ICR >> 4);
> +	struct kvm_lapic *apic = vcpu->arch.apic;
> +	gpa_t gpa = apic->base_address + APIC_ICR;
> +
> +	if (!kvm_lapic_enabled(vcpu))
> +		return 1;
> +
> +	if (vcpu->arch.apic_base & X2APIC_ENABLE) {
> +		if (!kvm_x2apic_msr_write(vcpu, icr_msr_addr, data))
> +			return 0;
> +	} else {
> +		if (!apic_mmio_write(vcpu, NULL, gpa, 4, &data))
> +			return 0;
> +	}
> +
> +	return 1;
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_xapic_x2apic_send_ipi);
> diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
> index 274885af4ebc..afd440c88981 100644
> --- a/arch/x86/kvm/lapic.h
> +++ b/arch/x86/kvm/lapic.h
> @@ -156,6 +156,8 @@ int kvm_hv_vapic_msr_read(struct kvm_vcpu *vcpu, u32 msr, u64 *data);
>  int kvm_lapic_set_pv_eoi(struct kvm_vcpu *vcpu, u64 data, unsigned long len);
>  void kvm_lapic_exit(void);
>  
> +int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data);
> +
>  u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic);
>  
>  static inline void kvm_lapic_set_irr(int vec, struct kvm_lapic *apic)
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 369fb1e36f58..d04f71836ef7 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -35,6 +35,7 @@
>  #include "svm_ops.h"
>  #include "cpuid.h"
>  #include "trace.h"
> +#include "lapic.h"
>  
>  #define GHCB_VERSION_MAX	2ULL
>  #define GHCB_VERSION_MIN	1ULL
> @@ -3538,6 +3539,10 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
>  		if (!is_sev_snp_guest(vcpu))
>  			goto vmgexit_err;
>  		break;
> +	case SVM_VMGEXIT_HV_IPI:
> +		if (!sev_snp_guest(vcpu->kvm))
> +			goto vmgexit_err;
> +		break;
>  	default:
>  		reason = GHCB_ERR_INVALID_EVENT;
>  		goto vmgexit_err;
> @@ -4416,6 +4421,22 @@ static int sev_snp_hv_doorbell_page(struct vcpu_svm *svm)
>  	return 0;
>  }
>  
> +static int sev_snp_hv_ipi(struct vcpu_svm *svm)
> +{
> +	struct kvm_vcpu *vcpu = &svm->vcpu;
> +	u64 icr_info;
> +
> +	if (!sev_snp_guest(vcpu->kvm))
> +		return -EINVAL;
> +
> +	icr_info = svm->vmcb->control.exit_info_1;
> +
> +	if (kvm_xapic_x2apic_send_ipi(vcpu, icr_info))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  {
>  	struct vmcb_control_area *control = &svm->vmcb->control;
> @@ -4698,6 +4719,13 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
>  			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
>  		}
>  
> +		ret = 1;
> +		break;
> +	case SVM_VMGEXIT_HV_IPI:
> +		if (sev_snp_hv_ipi(svm)) {
> +			ghcb_set_sw_exit_info_1(svm->sev_es.ghcb, 2);
> +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
> +		}
>  		ret = 1;
>  		break;
>  	case SVM_VMGEXIT_UNSUPPORTED_EVENT:


