Return-Path: <linux-mips+bounces-15024-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id azQPKU19KWokXwMAu9opvQ
	(envelope-from <linux-mips+bounces-15024-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 17:05:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 440DE66A8B6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 17:05:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=uT8yiqK+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15024-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15024-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B66403014257
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 15:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A35423152;
	Wed, 10 Jun 2026 15:05:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271C4192E0;
	Wed, 10 Jun 2026 15:05:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103945; cv=fail; b=kysr74+t8DrkvAe9q2fa8vU+e+httl6tHng0Wp7Oq3hOsKVsvnCDt1HVX5v+d5IBBRIyTetb6F0ExIw2IPqgkrmMj+HF0ZoeDnL9gmRallJGxNrze3SUwFtBSYwZTc8869bRC5ffLKcGXTAbUEfkCj50PYgMxpsqh5plpqHGX+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103945; c=relaxed/simple;
	bh=Pt7U8T5TcUzok8eQ/SyNxk4SZYwR0uKWnesyrUojjk0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jb+z7e4KDDSTk890m+ng3TA6i3gaSYA8cfRdcYuR7EYl/AosrlLt1xwpGlpR6DV8j4ZSt3899IUuozC29rBrdADe6pbkBPtknm4mfI+ly/exe68mVRNM0L0E+0fQmNwH0UZUHSesmPL5YwzknGgJMtxj6ulUUuqThPrLG6dXXiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uT8yiqK+; arc=fail smtp.client-ip=40.107.201.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO1bTp9XNbJiDAVYJgb7jtuaSYIx8zvfedyfPvPCqiLbWz/mTR1VXi6a+YQLaC9pIxY+CzeWNQoGXIERTJ/VvVSrTPVGtlWRqfGQ7d6UEzIAr9kGGj4c7hY5FwQqYrXjAAWCs4VA6bfccU2+XOhPcSI6DWpYLRksj/BpbpmrudFJNPcDNs5ytjrQ0CfHRZ9MKNu2qnZwSd+qLflTf0+HakM6h7P6RWSxHgJ1WHQJ9fg22WxbIEyq80yYqviz+uYZ/g6XQUBeCzcT0iwbpwEJAB39EkpdBJmqu15l731o25ucg2XaaiuxKiMRWcnjF0hcjavSu+fL+vZ3thex8vNXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9tIhIPQphrxm3pR+/cf/HO7w5GMlLnMtFVJ2GKtoLs=;
 b=bgBgL9LZWwucvLX1ZM974wDhubmHGzvBSQGZShX6dvCqq/etNZukbXJeDwOLOo6KeryqCCTY9M9BCjbqochyQg7vjsbHfRmJJZ9W8vkeSC6SUWGVosdJHMRTi5ly0WFlGEuiBUdgvibdGp4wmfGvsynY/XcGJAzvUcJSET5CCM/XtxleH/BGuK0L357N3FUBhIaltLtzNexoNhRJlJUmmxcRBNR7VRNhh8Qu+NOZbNKtUHgtlueCZVeJ+GaguxQTVJb9ThV0VjmmHvoW1d7O6DwvaUKMq0up2G0ZO+yyRt3y6tVKITYs6k3uDOzEq1KcKMHCy8TOdhw99UG+if6C4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9tIhIPQphrxm3pR+/cf/HO7w5GMlLnMtFVJ2GKtoLs=;
 b=uT8yiqK+qy9K3X3mHXpZrWkhivcA69lKS88Ul+UUD0S6s5IgjM1G5uha5Vko+p41fUwoKUX8gwcY3exZ6ICJZXH38/d5YqjV/v3bLZorD4BQM1aRXKQq3G5/TdCQ4vKqCb59RitGR1M2HIQojbtATrDPJJb/RkC3VO3sPzVISKQ=
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 15:05:40 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:05:40 +0000
Message-ID: <9621612f-c5f4-4c37-93ba-5e79b841e949@amd.com>
Date: Wed, 10 Jun 2026 10:05:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/60] KVM: SVM: Add support for the SEV-SNP #HV doorbell
 page NAE event
From: Tom Lendacky <thomas.lendacky@amd.com>
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
 <20260608144252.351443-3-joro@8bytes.org>
 <be57043d-6abf-402e-93b4-a01519c97c1f@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <be57043d-6abf-402e-93b4-a01519c97c1f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::19) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|DM6PR12MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 96209fec-2a04-4e52-9eb0-08dec701bc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/aGBvAiK11+S0MQXPYLtB2/Ese5utXfC/Hzs0hGVWmSw1epiu+KYgG0ZTTveFIB4HmRTqXqvsPIywWBfddU4uZ2GMJUKBZF99QF9Hy+IuPwG+cmUjkUIO3kM045RcRb3Hntx+U3kGqje6d/5FG1t+RjuWE+sx24HotqQ6v/GStAs/d4FOesRvZlB3tiex0VoeCFnF/iTL0HEGCEnfszB3Y1apeyYPoNkCeeyz/nTYMZNtAGKPoQd1yvQ1aRWC8iHlAkC1LmCWWhYkvzRi2+IvPaKq74MbT8yVHsqMt2s7NNTRX/mKx21X1rJosDtHwKUtOL8Qa4E+AwoSKtVmL+tQkLcFNtjGtSJyIwXC4RbAaHE+FuMgBgACZbQN1V1OZHNEm/lXPcAqLBW7OfGIRnG5jpYgZpzgSIUQ7HqcjXrzIRyRm+PAjm3nzYxX1A1XfW7858PDPBXwA31elRAisJz+GwdaiCa++G1n8JlcQ89j/oJGSp8Bj005q9VSwvLrt7TYGhl+yKrx/sn1q9r5R3m6E5+Xc80AwJRfX8H/zD87iwCqc7tftMUi1cNUzdXkp1n/K9TUPfoWLVAwiT/19LL3yjhFLQlaikxNRRIgXAfg62aQFRWUu0gRfpYL5s4i97kulsvMO3MGRloq9BuATkgTfhW0miHkmEAgwjC5fS+B87QvmZjbEisPZUlHBuxyEVQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJIUkd4V0I4Y0I1UWcxS3BCTnVnYjhoODNNRmFodXQrWHFNTmFmQXVudlNJ?=
 =?utf-8?B?WjBLU3owamZzL2ZDa3Z5amgwcVkzM2p2bTFHN3lBSlA2ZTRQTkVGQjdtVGNZ?=
 =?utf-8?B?alBOZWROZGtyU0pJZGJQQXFYK25ld1pyT1plY0psMWNkWGpNcXZUVUthREt2?=
 =?utf-8?B?eS9ia2dCRDFIaGQ0MjRLK2NacVM4TWdyekZVY0dYbmMybHdYVW5BcDMyMkRm?=
 =?utf-8?B?NURCN2hlTzhDcHltS3VDVzlLTVVYVkJMVXZ6eWhMaTZYeVB0WkdYTjVzMFIx?=
 =?utf-8?B?cGEzNC9LdlcrZmJFUEhPOU9neUd4ZXcwc01vZmcxUnhkRExXZEFpcys0K1hq?=
 =?utf-8?B?VHllWFRZaTRVaVJqUzFjcE5uMHlqb2c3SUNFanRCNHp3RkZoU1VVUHFYRHBM?=
 =?utf-8?B?bEFHenZWUHdpNHdrWkN1WVhPODBHNkNJZitERkIrR2pLRjgreFpzUHZkeXpO?=
 =?utf-8?B?Zlc2VzNTOU00Q1NVdzQwRVJuUThqT1NNaE43WVNMZEM4bEhJWmNFMWlRUmsx?=
 =?utf-8?B?UGVpK3hYK0FySHJQdldhVUdZRSs0TTJMTnVFU1luK2xxTmE1WGlDM2J1c2R6?=
 =?utf-8?B?TmN3aHAzMXdSOE1oRHh5MGo4U1Y5VFhmY3VrbnovanB0WFozeGZqR2FzTzIr?=
 =?utf-8?B?TjZzVE1NZlJHVkxBTDRCYXJjMTNvNEdKd0hRK1doU0U3OVRad0UrSGV6RDhi?=
 =?utf-8?B?Y2JYcVBoNGc1dTRVTVNpWXgxeU1ZZzJZY1drckE0dG9OU3BYM2ZCWmV3OGl4?=
 =?utf-8?B?bWtaOUtrYXhOeHlabmRTcDc3NTY2SEJDc0RaTi9VUmNGZUNZZ21la1dYeHRo?=
 =?utf-8?B?M0pJK2pieEZ2SEVQVWxSdVpqbFJ3cVRHLzZ3SlZ6U0VzVnlTWVM0WFFVaThv?=
 =?utf-8?B?aDJJVEJXVUgxK0xRYlZCRFVjSFBEMlc1bzV2bkJzcFY0S1V5SDhkVmxub1hC?=
 =?utf-8?B?eWsxQVVuSjJJdVRGbEJXL1hRM1kxZGQ2aHI2V2ZCVnErbWhOYkUxWm4xQmdO?=
 =?utf-8?B?VVJiUno4d3Jhcy81c3hScENzOWt5QktiN0F1RGhSWDNPNjd0d2l4dC92N1ZX?=
 =?utf-8?B?bUE2ZE11U05QZ0RnbzRqL01ud2tWaGs1RFpiR1NnK1BjdTJZcTFNQVMrVUpL?=
 =?utf-8?B?bVBCT2J4NERWcU52MXp1K056MGN2NkJNWlFPYmQ4aHY4STBRaHJwRWdBdFcv?=
 =?utf-8?B?ckE2U1ZtRE16cHJDSEt4WXpoRnV6cWlOZ256SjVBZUh2OU8zK3B1dVQ1cDB4?=
 =?utf-8?B?eFB6Y2o0eFNjc01USnZQRC9VT2g5aGF5VFI2bytmM1ZpRElJUmxjZ3FVblAz?=
 =?utf-8?B?YytSV1FOTG1SM2xiV1ZsYUxkREUza3B1N25oRDRIME14dUtmaXdNVUhlalNF?=
 =?utf-8?B?Z3A4WDJiWUppNUNPNGZmVjJSY2ZWR05VOHJJaW8vNVViM25mU1NGeTBRZ2M1?=
 =?utf-8?B?L0FJMHBJamdtL1BZSXJRMkpoK0xEb1EyM1NlYW5yOWVXZVMvdjNjUjFXdDBa?=
 =?utf-8?B?V1B6WFdPelJWbExjTkdJTUpoSWZuWUNhL2ppNnJKVzR3VFVzNUVqWEY3dFE5?=
 =?utf-8?B?aVFOT2p3NTR5NGx6WHg1aWxVU3NRa3ZPVVJYbngwaFdrOVE4MzlHcmdOQzJS?=
 =?utf-8?B?UUQ5VG96V2wrWEwxWlphVVZJNlpBc3VzZ1VQVGh3eEFBVkNMajJXNnlrOVlr?=
 =?utf-8?B?TE5RejlURDFHMmFBb1FnSVNoMUtFMTFnUGdRQ3lia1dGbmNmQkxrdmRUcGJn?=
 =?utf-8?B?Z2dNcEZmcWZZNDlWR3d1MGJ2UGttNXU4NE0rcHJtbC9sSVVPcXhYWldFbUVi?=
 =?utf-8?B?dW9iN0x0MGdzTU1oeHZuNlhzRE1KNDd3NTF5N1c1c2lYRng2UzMzb2cxMGdl?=
 =?utf-8?B?TFhxLzVub0kyMDB0OEFnbXUzNmZxditJcjVsQ08vUWZ4RU5LM2lDR1dZeWJt?=
 =?utf-8?B?VEtlSzNIaGVMRVEyMmhPaHBWS1lyUTEzR2J4Wm40ZC9ZY3lSc0FlZDkxWHNv?=
 =?utf-8?B?MnVrVHFJMmY3OVBvaENxUklQWmF0QmNLSlJ0TlA5V2I3RnFZc3A3eUdpcWFj?=
 =?utf-8?B?ZzM4bWNNNEErM1BMS3o3TDZUZ3hUQWJRdG5ZMGttdGVTdWhOWENCcmg1VkE4?=
 =?utf-8?B?cElvQTVSdXJ5MUM1YzJoUldjOXIrTHJnaEovYkMxMEFZZm5EbEIvWHAxTVZq?=
 =?utf-8?B?bjFSdUxmdjJ3NW1OemRTWmhNZXplaTEvcU1EREY5S2s2UnU1WGQwUXExT3NQ?=
 =?utf-8?B?cGpCMlRWUG9kYVo4QldzY0FQZCt5WnE2cnBoSlB3SG4wOXRiamY2eTFCVzNB?=
 =?utf-8?Q?maprtK76jjWcPKdAUv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96209fec-2a04-4e52-9eb0-08dec701bc16
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:05:39.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIzKW1vx3TV+ZWPOHSm3efgzXCzlBRsB98W9e/Jl8sXur4HWoRrVIoPIXH4mqSgdqQGID9Ws2r8QfLcKOezuSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15024-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 440DE66A8B6

On 6/10/26 08:28, Tom Lendacky wrote:
> On 6/8/26 09:41, Jörg Rödel wrote:
>> From: Melody Wang <huibo.wang@amd.com>
>>
>> To support Restricted Injection, the SEV-SNP guest must register a doorbell
>> page for use with #HV. This is done using the #HV doorbell page NAE event.
>>
>> This event consists of four actions: GET_PREFERRED, SET, QUERY, CLEAR.
>> Implement it per the GHCB specification.
>>
>> Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
>> Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
>> Signed-off-by: Melody Wang <huibo.wang@amd.com>
>> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
>> ---
>>  arch/x86/include/uapi/asm/svm.h |  5 +++
>>  arch/x86/kvm/svm/sev.c          | 71 +++++++++++++++++++++++++++++++++
>>  arch/x86/kvm/svm/svm.c          |  3 ++
>>  arch/x86/kvm/svm/svm.h          |  2 +
>>  4 files changed, 81 insertions(+)
>>
>> diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
>> index 010a45c9f614..d84a13ac4627 100644
>> --- a/arch/x86/include/uapi/asm/svm.h
>> +++ b/arch/x86/include/uapi/asm/svm.h
>> @@ -117,6 +117,11 @@
>>  #define SVM_VMGEXIT_AP_CREATE_ON_INIT		0
>>  #define SVM_VMGEXIT_AP_CREATE			1
>>  #define SVM_VMGEXIT_AP_DESTROY			2
>> +#define SVM_VMGEXIT_HVDB_PAGE			0x80000014ull
>> +#define SVM_VMGEXIT_HVDB_GET_PREFERRED		0
>> +#define SVM_VMGEXIT_HVDB_SET			1
>> +#define SVM_VMGEXIT_HVDB_QUERY			2
>> +#define SVM_VMGEXIT_HVDB_CLEAR			3
>>  #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
>>  #define SVM_VMGEXIT_SAVIC			0x8000001aull
>>  #define SVM_VMGEXIT_SAVIC_REGISTER_GPA		0
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index 6c6a6d663e29..b9ad1169cb2c 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -3522,6 +3522,10 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
>>  		    control->exit_info_1 == control->exit_info_2)
>>  			goto vmgexit_err;
>>  		break;
>> +	case SVM_VMGEXIT_HVDB_PAGE:
>> +		if (!is_sev_snp_guest(vcpu))

I think it should also be validated that Restricted Injection is enabled
for the guest as well - either here or in the sev_snp_hv_doorbell_page()
function.

Thanks,
Tom

>> +			goto vmgexit_err;
>> +		break;
>>  	default:
>>  		reason = GHCB_ERR_INVALID_EVENT;
>>  		goto vmgexit_err;
>> @@ -4341,6 +4345,65 @@ static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t r
>>  	return 1; /* resume guest */
>>  }
>>  
>> +static int sev_snp_hv_doorbell_page(struct vcpu_svm *svm)
>> +{
>> +	struct kvm_vcpu *vcpu = &svm->vcpu;
>> +	struct kvm_host_map hvdb_map;
>> +	gpa_t hvdb_gpa;
>> +	u64 request;
>> +
>> +	if (!is_sev_snp_guest(vcpu))
>> +		return -EINVAL;
>> +
>> +	request = svm->vmcb->control.exit_info_1;
>> +	hvdb_gpa = svm->vmcb->control.exit_info_2;
>> +
>> +	switch (request) {
>> +	case SVM_VMGEXIT_HVDB_GET_PREFERRED:
>> +		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, ~0ULL);
>> +		break;
>> +	case SVM_VMGEXIT_HVDB_SET:
>> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
>> +
>> +		if (!PAGE_ALIGNED(hvdb_gpa)) {
>> +			vcpu_unimpl(vcpu, "vmgexit: unaligned #HV doorbell page address [%#llx] from guest\n",
>> +				    hvdb_gpa);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (!page_address_valid(vcpu, hvdb_gpa)) {
>> +			vcpu_unimpl(vcpu, "vmgexit: invalid #HV doorbell page address [%#llx] from guest\n",
>> +				    hvdb_gpa);
>> +			return -EINVAL;
>> +		}
>> +
>> +		/* Map and unmap the GPA just to be sure the GPA is valid */
>> +		if (kvm_vcpu_map(vcpu, gpa_to_gfn(hvdb_gpa), &hvdb_map)) {
>> +			vcpu_unimpl(vcpu, "vmgexit: error mapping #HV doorbell page [%#llx] from guest\n",
>> +				    hvdb_gpa);
>> +			return -EINVAL;
>> +		}
>> +		kvm_vcpu_unmap(vcpu, &hvdb_map);
>> +
>> +		svm->sev_es.hvdb_gpa = hvdb_gpa;
>> +		fallthrough;
>> +	case SVM_VMGEXIT_HVDB_QUERY:
>> +		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, svm->sev_es.hvdb_gpa);
>> +		break;
>> +	case SVM_VMGEXIT_HVDB_CLEAR:
>> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
>> +		break;
>> +	default:
>> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
>> +
>> +		vcpu_unimpl(vcpu, "vmgexit: invalid #HV doorbell page request [%#llx] from guest\n",
>> +			    request);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>>  {
>>  	struct vmcb_control_area *control = &svm->vmcb->control;
>> @@ -4617,6 +4680,14 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
>>  	case SVM_VMGEXIT_EXT_GUEST_REQUEST:
>>  		ret = snp_handle_ext_guest_req(svm, control->exit_info_1, control->exit_info_2);
>>  		break;
>> +	case SVM_VMGEXIT_HVDB_PAGE:
>> +		if (sev_snp_hv_doorbell_page(svm)) {
>> +			ghcb_set_sw_exit_info_1(svm->sev_es.ghcb, 2);
>> +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
>> +		}
>> +
>> +		ret = 1;
>> +		break;
>>  	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
>>  		vcpu_unimpl(vcpu,
>>  			    "vmgexit: unsupported event - exit_info_1=%#llx, exit_info_2=%#llx\n",
>> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
>> index e02a38da5296..7981e7583384 100644
>> --- a/arch/x86/kvm/svm/svm.c
>> +++ b/arch/x86/kvm/svm/svm.c
>> @@ -1277,6 +1277,9 @@ static void __svm_vcpu_reset(struct kvm_vcpu *vcpu)
>>  
>>  	svm->nmi_masked = false;
>>  	svm->awaiting_iret_completion = false;
>> +
>> +	if (is_sev_es_guest(vcpu))
> 
> Shouldn't this be is_sev_snp_guest() ?
> 
> Thanks,
> Tom
> 
>> +		svm->sev_es.hvdb_gpa = INVALID_PAGE;
>>  }
>>  
>>  static void svm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
>> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
>> index 5137416be593..fb956c37c941 100644
>> --- a/arch/x86/kvm/svm/svm.h
>> +++ b/arch/x86/kvm/svm/svm.h
>> @@ -270,6 +270,8 @@ struct vcpu_sev_es_state {
>>  	gpa_t snp_vmsa_gpa;
>>  	bool snp_ap_waiting_for_reset;
>>  	bool snp_has_guest_vmsa;
>> +
>> +	gpa_t hvdb_gpa;
>>  };
>>  
>>  struct vcpu_svm {
> 


