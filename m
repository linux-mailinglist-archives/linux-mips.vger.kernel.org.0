Return-Path: <linux-mips+bounces-13051-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCB7G4GifGmMOAIAu9opvQ
	(envelope-from <linux-mips+bounces-13051-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:22:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8019BA6E1
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD808300B76B
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 12:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E080936CDF8;
	Fri, 30 Jan 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ObpBRoQJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZHQ9vMNm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F1736E485;
	Fri, 30 Jan 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775742; cv=fail; b=CuZoRqm9lm1qvbdM8mDZkRPIRC+g5DLqcL2LXJNiZAvE88yYYN3fTcx2T593j56qLRuLUBq5098BP7XsH2xcoL4jeT5moHrOSniFG4kpdh1vGaRIsvXyeXMOFHhLwopOBDxUjsA9UtwFBn2pz7TQUMneHICcTLnl3vdNYuYat0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775742; c=relaxed/simple;
	bh=W7GLAac0oAguaHDu30e3GZ81xg1RSNfjxSUj6H6sXiw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyQAIbhvxmV8rymCSSUI4K8+7/mnJVHBM8LgJC/jai8lrmjb8+0stBpc7JK5s2jjiQ9jZE9gqoOed521QAtUPz2VsElG3b/dyB49odeSzbD3S3tejSRBIceybw6tGkhtNX9C+t3KVfb3b39HQU7Ktlw9+Zg41Dtnu68nDA7Uv3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ObpBRoQJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZHQ9vMNm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TLv0E4676534;
	Fri, 30 Jan 2026 12:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ksAUtBe6YdtsZky/v3nMvbV2Vj+pj2472apUyOm4G+s=; b=
	ObpBRoQJXWO28VxT9JEXaoS61IZxJJzGanR1tT5pi31CiI94tLX0cDOvbEkEdkSg
	sWqw3mRU/dukl4JaZjIO2TcJoLtbNPtKDuOdcLhg0MuW6evZh92A3fP9uHZni2FE
	XDX43ewJEeWOgZnxaHLeu1EIFlsuhO89YwMiLXo+eeh2hCVah4DBex68BRAas4sU
	BQlT+abHjmPFU688ttah+0lo+LoIQ5gc4lqCoCP8nR+3YEz39R/z2lKnhzILwkdg
	Yr236B6llJHnSmjzLQuexBf0X0po27MEQ+NrUyP5urHUUfTYxBGYlnp9wIktaSCS
	sxv/DsFtzkTEP0P1iiyJkA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2vgn69y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:21:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60UACQ6w035394;
	Fri, 30 Jan 2026 12:21:53 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhdje62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ButPJtkmQB9dmrw68s78yUu6tUDlYjcyKGNlGXM3yEkifgneXeBQ+DP5p9ifudjNYRHdAzWTsMkg9x+/NrZzqYLSgO9vXkGx3CfDEXuOapPxAAKdSr6OBKf4tGVC6pwrKGb43dhGJTFVJkfRPSKk4D27G61mIripJnXaB9t0BX32HNvx30f48COZdy+8UXylh6JDEw7IA/DjI/jlKxD5tV7/tB8bSdnhNWLjjxKiCHAR5SKOIwOMOGg8IgfFBnk8Fx5f2woLfqDDgkaVPjEItwK9yFYVD7tWmwhJHeuYsZKwQbonXiGYyu+SQTJlYfN40CSGAdfb6BJ7eHCfB3skFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksAUtBe6YdtsZky/v3nMvbV2Vj+pj2472apUyOm4G+s=;
 b=vGNluKN3WlYF93XEDfeE+Ugf+NwPveq+8gGKE2QimmvInqNRXGb2ew/ulKNIE0cJKJXLt7sCrSXLD7cSNVKhdpE0TnO0HjObSacYw8cf1v+s80Va7TFYErt8iSpWICbI1p95QlvZ3B4D/fK2aJobGb7BgMJ74MVDfv7LlDXtwvsa/PwBEInlqCSbqKUQDaVco/8+ufXoRpa51GBY1H8Dha6GBPd2TpwnwieRKxi44ltNi8W8vo1nRAVBnLaLBXLGOeRiSO/cq0aOxT7+F977fCjpttGtiIP5zN28y5Q8Ne1mnym+jPq5wgpbAIdmHKdnBvIB4pUyu+XTpKLzjUmkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksAUtBe6YdtsZky/v3nMvbV2Vj+pj2472apUyOm4G+s=;
 b=ZHQ9vMNmFkm81sd+2JiiIKjFAnmUlIwGwrCgKqTbas/OkKYhp2fRB0XOUt4Pm2I99wAD18DVFoqlCy1mEp4ViCdagqvh0n8xjqdsx2U4V2fIeviPyMZf5h8zbKbSUr4m0yX7H6Fq7sFNLGDg8+RPI2NpvHFMJ8W4j1QlRg9iEo4=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by CH3PR10MB7959.namprd10.prod.outlook.com
 (2603:10b6:610:1c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 12:21:49 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 12:21:49 +0000
Message-ID: <eac13252-cbc3-4396-895b-bd0800c7318e@oracle.com>
Date: Fri, 30 Jan 2026 12:21:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] MIPS: Loongson: Make cpumask_of_node() robust
 against NUMA_NO_NODE
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, jiaxun.yang@flygoat.com, tsbogend@alpha.franken.de,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org,
        peterz@infradead.org, arnd@arndb.de, x86@kernel.org,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        vulab@iscas.ac.cn, gregkh@linuxfoundation.org, rafael@kernel.org,
        dakr@kernel.org
References: <20260107094007.966496-1-john.g.garry@oracle.com>
 <20260107094007.966496-4-john.g.garry@oracle.com>
 <CAAhV-H5RnDi1krGk4g7YuLuY+Pus6VcTadvBED4MCjX45m7YmQ@mail.gmail.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAAhV-H5RnDi1krGk4g7YuLuY+Pus6VcTadvBED4MCjX45m7YmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0366.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::11) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|CH3PR10MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: c09a21f2-7781-4d2e-a0cf-08de5ffa24b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUhqWUNYL0ZoMUhFZ1UxZFJrS2VRdEYxcGYwdGl4YTF3WGJwR2cvakgwcVhh?=
 =?utf-8?B?amxpTHp1MHJpc2ttSUhZa29iR0RzUnY2a2NoVC9hK1dEL29yNWpBcXV1Qktn?=
 =?utf-8?B?ak5IL0thbU94cXAwQzdvOVlMTm1pem1UeFdnRVIwR3NKZHZOUllYUkx1WHVp?=
 =?utf-8?B?NlFoeDA2TVJFTDJ3SUxCTWpJK0tTeVIvYTg2ekd5dXRjL3duOFJvSG1zY2FB?=
 =?utf-8?B?Tkt1a0lrV1pubHRiY1ZLRmVySDdUMWJjU21TdkVMT3BOWDJ0aTB0MkZVNTJz?=
 =?utf-8?B?OGlma3NEMXBIUFJIMHZsU3RvRDM3QWtyd3R6dTJYK3ZIdDlrdlgwWi9RMXJG?=
 =?utf-8?B?djJQNlcydFg2U25xdTM5NzNCaWxHZGV6L0xtdXhCdWNMa3MyVnVIR09wZ1hJ?=
 =?utf-8?B?UlNXN203N0hQK21nRHhBNnhGN1V5eERUSWc2K1J4VWdCMVNDODJ1VTBCUjlm?=
 =?utf-8?B?TzNyVkhFSG9ncFhsOE50anBtREF2ZVJwd29MRTJMd2ZGMi9SbzJpNmFkSTYw?=
 =?utf-8?B?M0NkKzhBVm55RE9aUk5Ma0RlM2JBQkM3cisvQUgxNlFFazArdFRrR01zWXBF?=
 =?utf-8?B?c1Qwa2djaUNFSnJpQURtS2FWbUVFSmFEbEM5V2x3d3B6cjJqYlpvVldVcGtY?=
 =?utf-8?B?Ny9XOEo1SFg3VzZBZ0NZTVY5WityQS9LaGM4N0VNR21xcXJZYXlOWVdYOXl5?=
 =?utf-8?B?K2dqRHgzZ2N1Tk1nWjlRLzBDMEVkRHdUODJTbWtIOGdmdUxWWGhLckZyOHR4?=
 =?utf-8?B?Y0t6dTdkaGV4dEJlS0Nidk1RQTRLWUF6c1FHMDQ2a0ZsZm9leE0rRDBXMlB0?=
 =?utf-8?B?UitJRTAzZXNTYVFOaW1LL0h5aDR2MU1lZTNXQXpnRkFmem8xYWxtYlQzN1Fk?=
 =?utf-8?B?MjRpMWlUb0xNaXRaeW9OTm1EVzNudlNCdVJveW5Mc1FUVEhOb3ZlNEF6RnYx?=
 =?utf-8?B?aUVFSE1MaUVhb01pZUFpWDYrRm10aE52Z0hMeldrRGNuN3VUaDN2UUhHUUNn?=
 =?utf-8?B?K0dKbkJBYXZOcUR5VDdkVW1tQzNSaTVJVjA3RXhrbjBmbXBOc3VERE8rNVpq?=
 =?utf-8?B?YmFUSVlvUXM4V240VnNqN3Q0MGZQY2hzWS80bG5aRk5YSHkvVERoWXpDa0lo?=
 =?utf-8?B?dW9OQmowS3VHQ0N3aUhTY3Q1UDZEcHh1WXMwbkdSTDJqRGcvaUZ3U3dHZTJY?=
 =?utf-8?B?aGZSTXhERnI5TG03MVZwU1VEMVJRbHpTc0xSWUJqN0NaNmsvY1dxN2Q1TEZj?=
 =?utf-8?B?SXBJclVRVHgydVBvMWk5cjZVRk1Ic2ZTNUFGeHNXNzFRallRV1RGUTFVcXdz?=
 =?utf-8?B?di9lVVJnNlpYNGYzZHFiZkE2YUhESHRTNEdnd0wzWk53RkpjaGJYVnl2Qmg3?=
 =?utf-8?B?blJMbGRnNmtpeXFMbUlobGNGUXZZdWJhSWZKWTJKdVN6c0w0dE1qZnVaU0ND?=
 =?utf-8?B?emxSMWhyeU1DZXNWaFhNcTczWGt2TjFJaXJUbWJ0TWhKQmtZckVKRWZQMytO?=
 =?utf-8?B?QlZGbVpmcFJHSWppRTNPUmYrNTFEdTIzM1NOQ0V5T1FkZkVVYjBpaENlV2x5?=
 =?utf-8?B?b2ZIZWR6TStjNE93YjE5dFdCS3BkNTA0YlhzSEJHTE5Zd3hQbFoyRnR2Wlph?=
 =?utf-8?B?M1VIMjZFYStwUWlJTDJsRlRRMjhUQ0dEU3RlMkc1ZjB4MU9jd09FU1BJeW5n?=
 =?utf-8?B?Y002TzZjVDJ6SUhnalNGUlFJQmdUb0svNHpXVzVpWHo1YjlJQmYwMTlRblBm?=
 =?utf-8?B?L00yUUJxa3VBTmdqQnYvRWhWeFhoSTE5d2hiK2RqY09UQlJuOW1kSG40SHpP?=
 =?utf-8?B?L0RWbXFWSjgva0VwSklSSm9lVmZGcXJDQ2N3a2FEQlNjV2llMzY4Qk05enVJ?=
 =?utf-8?B?RFE2VlpmN2QvTDRMSzRwcFowRXVaaTdzV2x6c2tBaG5nYzlDTHZqaXJoaUg4?=
 =?utf-8?B?SkVlbHNMTVdtWExCQ3dTRGxVZ2NjZ1lUMDZhWEZWZjNDc0RzdUVoTzRiMWFo?=
 =?utf-8?B?WXhLbml0K2E1TUsxZFB5ajE4amt0cXJTQzVaM0MvL1lHYVArdlowUm9CRUkv?=
 =?utf-8?B?OGdsRHdqdzg3c0RLcUh5Mm94Tno1UFdrcjVqSjhHYzVtN3dRK0x4S1V3V1Bi?=
 =?utf-8?Q?sVsk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFEAFA21C69.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVI0R1puUjhmQ2FPNWYxNHRadkF0YzJQZGlXbjJlbnN2MFZpcHpPWFpEN0hX?=
 =?utf-8?B?MitHeG5XUHBYbjJIRkIxUi8zU1RYeTRxbzhTRkRvU1VleUFNSGpxbERMZEM0?=
 =?utf-8?B?RS9pZzVIOEFTeC9UamhtOGN6cEc3a0IrSy9kZ1owWEVrUGtXVHZUc04zZksy?=
 =?utf-8?B?R2RFc2kzU1Q5NXBEV2MvVWdhcXdnODEvWVVwdmdTd0ZTYUNyb0licE05TzA1?=
 =?utf-8?B?dFhydFVEQUZsSmJNUWI2cjI1NDJHRXcyUE0yVU5iWWh1V24xcU04WFE4R1R3?=
 =?utf-8?B?WUE1RHcxWEtxNU80azZmd1hFUVh6Q2lpQms5clI0dmE2dzlpZ1hacS9OMXlw?=
 =?utf-8?B?ZTJYNDZIQVpJNHZnUVJNUjFwVzNaZHpZSFJhdEhscjhWM2RWbUxtWjlLMmxt?=
 =?utf-8?B?NkxFa3FpRGZvbEFjN2dyb3lUUW9yRG5FdFZjdDBRQkR2VlB6VEtVZ0FyQ2FN?=
 =?utf-8?B?TkRrU2ZlWVJRV2Y1TWxwbk9ycWVsRVpUWVVGcG5CdWFxbzhJZkh4R2lwczc3?=
 =?utf-8?B?ZnRDQ1pzK0hNS0xkTldBeEVTaXhvS3VPUHUzL1ZQZzlPU2J0YzRpUkhtdEM2?=
 =?utf-8?B?MlZXT2xJazhlYit2QUtBbkRzWDNNbW9jSUxxemtrbHRBUWl5dnc2UEU0ZG9i?=
 =?utf-8?B?NW80UFVoekt3UFV2TTN4ekxuTElJblZrbHBieWNLVkd5M0tVWlppb0pnRThT?=
 =?utf-8?B?OTB4N0dXODNKNzFsRU55UkdNTEZrM3hKLzhRZkN0K0w0MmZxSDZPYjk4WHhR?=
 =?utf-8?B?bmQwTERMQjhyUlMzRENNZjcrRElmSFI3ZzdOV0pWV2drcDVFM3diTXNxVk54?=
 =?utf-8?B?TTA1Y0lNaUx3dmF6ZW5ZM1N0V3RFVDFDbmtaOWF2UGFTeU1FbDNFSnhReHNB?=
 =?utf-8?B?aHNCTG1mY0YybVRpdFNyWnJiUk1Xd0R6dXlpaUJSRElNWUU5YnZJM3JSUVgx?=
 =?utf-8?B?RVJyRktUNGNVZkNLNnVPWVNDclpqd3QxOER4MjdTQjNOd2h3QlRXTUZGcyty?=
 =?utf-8?B?VTlka05rc0EyVnl6OVFleEhpb0R6SlBTRVJPTVJJNWNLOXlxK1A2WW1CdVNO?=
 =?utf-8?B?MzdiWlhxNk9zUU5wbjZNeUx3S0s0L01EQlJWSFFGa2Q1dEk4Y2tzRndCbUhq?=
 =?utf-8?B?RVA4SVlKZDRLSmtSNTdWa2srZDhWditLejhCTGxUQnZMTk9VV2YybjIxMUQz?=
 =?utf-8?B?YlFGRmJMTEJML0hCK1hHeGRkTmdmZm5RNmpuQU51NEV0QkJObWdLai9Jb0pQ?=
 =?utf-8?B?aUJpbmtQdmdYQUxmdEo3MDNuZUY2K2xhNEp1UDVJczN2aFpkeE1xNXl1MzdG?=
 =?utf-8?B?YjhYWHMwb0tsbHJ4dUNCaEU3QzcxUVQ1WjFiaFk1c3l1b0FHaWhjNEloVHNN?=
 =?utf-8?B?VTg2TDQyS2Rsc002UUJJUWc0Q1B2OXlLTC94VmRSbjlGN1RuaFZPRlJMOG5r?=
 =?utf-8?B?OCtxYXlYRG9XNHBWTUYrTU9DSXFpcExrQVRPcnpyejA0TWFSdXI4S3c0NXcv?=
 =?utf-8?B?NmRheUpNMWtwczZ3a0pQME5sbnNVaEpZb3Jrck41clhTZUVEOWZ1SWI0Mnc2?=
 =?utf-8?B?UGY4V3UxaFNXSHdwNmprSk9BUllkY1k5RGZSWUJaMm0vYmlmc2tBaDR6RlFJ?=
 =?utf-8?B?YW5SR0NhM3J0NEFTeEdkcWM5dksxcmtzVG5YNXhhb3FBV1JkVlhJZ0hIYnYr?=
 =?utf-8?B?cEs2OTlCYThyUFJ6SkF3ZndsT21IQnNBdTVRM2tuYmFKcUgyaXBXaVp0clkw?=
 =?utf-8?B?MSs0aHR6R0VtZHhuYmg1WFlsZjV1QXZJdXZESzNjTFhmeUFxQ2UyTGZpTjJS?=
 =?utf-8?B?N2YxakUyNnpBV0VJMmZRMndtRkQ1R1h5QU8yMFhGTTZXY1FmSEJ6bCtKckhU?=
 =?utf-8?B?d0tqYno1NG05VlkvUkVnQ3JYb3plUEQwTUlVWmljcU5rRWMrc3Z5L0JyYzBU?=
 =?utf-8?B?VHV3ZFl5R0JzOVRvTHJlclNNK2p6YXlrZGprSXh1dHNBTXJhS1Q2dkxMWmVC?=
 =?utf-8?B?SDNxdGJrRHNuWmtFRm1OVDVZcEx1V1A0cDFHYWdHSGVURm1YdjRuYXJRSEgx?=
 =?utf-8?B?RWl3cmlseGJwQms2WnZ4MVVWUlN1dGhxTjlLdklOVVFIS2p3V3c1YWlkR01O?=
 =?utf-8?B?TnBEL3JvRXlYMm03YnRNdFgyQWpsNU5rRTVxR1o4WlN1T3FONXRKeFlERUMr?=
 =?utf-8?B?RmtnTndxK2V2eUE2cEhXdG5mSGJWbys5YUZPNzROSGJyZjJGSU9PZjMvL3Ir?=
 =?utf-8?B?bHdWMWV5Tzk0NDNDMjduUDE1VVFMblk4RU5jYUc3SjdBb3FQNnFQV0E3YUJo?=
 =?utf-8?B?MmJPbGw2T1ZucklJTXduMXplSHdRc2xHYlpEaUd6YmYrOTVIRWExdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5pttsIy3oK/f3o/3KRrUB1rmnLuRdh2KHQz36ioBJeWfVlRMNkCMKM6KvwYc9p7IG4lBPTZqyD/ItB+yrmPgs+EGCHF/KAbzfiDZtNlnsfTAAO6JhajwpW4ZsBaFP0uE3KJQ2wP17wOerkfHrHD5jQuYlXIy0VL5BWISE+np7sFyuKeXqrSflRMbvxQc3KLQvIh3J93f83t8eQksAMwcIxCAOWalj1p9uuNZgnatpFW2J7ciVkndppvjDjqjMJGwwBuNp/en5Y2e4uyXiQ4ZDF0MeEGROpr1ul3wqlMgljPaffywaf5htkp5agj2pW53NV/kQQHhLhpY8PD44xELuFG3BWRmqauZB1QYX/DuL1NqG6V1XddAJKnEny0kQxI6E8JEcc+XyMhehbPetqoXnRCoc3niML0xEvSAbvPTO9HpWLKUMda5pPrVEOcEybPCUVXQ45jzEonSxsYc8ZYlxodTpB4WdX/8o8IyZuXQvvDAoMBwi8SH1Xq5S52vAkvqIoXg97IMoll/3wNDpEk8GSDcrGw/aQzc794oSZ4WEqgoA23kLUnr462XMJDboj0PnVdjbRCINOIFZUnTt2z5+0zsVL46fuUdY95uptyO0fM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09a21f2-7781-4d2e-a0cf-08de5ffa24b5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:21:49.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC+Wo7UafVSUYcqhHG07OxbxmN5biitnCziW9rqcsxnsufjEqCFfnb2a3Fp7FhTGhluNebqlXv4RPU0SS8tyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601300100
X-Proofpoint-GUID: UQcfxrtBKmbATbr3iSh8Btej8IeaCe-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMSBTYWx0ZWRfXzd6fKgMQdiUz
 llk4eluvcLwmHB4C5ZgljWUjWZDGWqwhCmKl6e5m3cl/x500sjZ/3+S5/RG4LapB8QEECXK4hJU
 Oc34qM6FXyP4IlwwUAurA6OBvS5wNJ1lzU6KWHT3eveKXQ+o+xSpY2ywxCBTRNWN5avcRgvkSOJ
 AuZ9euS7tVP82kFALgSIh1rZqrwPNK7yEtJPbB1zPnDz9N2QIl95IUeYP1jIobCGvy9sdQh7juR
 mAY0FZl8rv9odModAR7GgsCGzPctyFLhPzCB5ZRciued6EImt/v4qQ+Tc+k5paefw5+7F8qeL88
 UcPL5wQ+f8YsMJgjY6TjrvjeL1MqlchovxRWQCbXxlxYSgytwGBxMg1rd91xiMq5D5nBDiFKVRo
 I6M9X3dlX6jA5lJh/mHu1BOd4ftHj+tdt2LYe4ifD2NU4inu84nNQa/d2qOMBrcuhsyQh6X08wK
 rQlP6RYZnO/Y5QXKAZg==
X-Proofpoint-ORIG-GUID: UQcfxrtBKmbATbr3iSh8Btej8IeaCe-o
X-Authority-Analysis: v=2.4 cv=a7s9NESF c=1 sm=1 tr=0 ts=697ca263 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=eadb6KKd8NyWLkMeEzYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13051-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,oracle.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.g.garry@oracle.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E8019BA6E1
X-Rspamd-Action: no action

On 25/01/2026 03:55, Huacai Chen wrote:
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks

So can a loongarch or mips maintainer pick this up please?

> 
> On Wed, Jan 7, 2026 at 5:51 PM John Garry <john.g.garry@oracle.com> wrote:
>>
>> The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE - which
>> is a valid index - so add a check for this.
>>
>> Signed-off-by: John Garry <john.g.garry@oracle.com>
>> ---
>>   arch/mips/include/asm/mach-loongson64/topology.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
>> index 3414a1fd17835..89bb4deab98a6 100644
>> --- a/arch/mips/include/asm/mach-loongson64/topology.h
>> +++ b/arch/mips/include/asm/mach-loongson64/topology.h
>> @@ -7,7 +7,7 @@
>>   #define cpu_to_node(cpu)       (cpu_logical_map(cpu) >> 2)
>>
>>   extern cpumask_t __node_cpumask[];
>> -#define cpumask_of_node(node)  (&__node_cpumask[node])
>> +#define cpumask_of_node(node)    ((node) == NUMA_NO_NODE ? cpu_all_mask : &__node_cpumask[node])
>>
>>   struct pci_bus;
>>   extern int pcibus_to_node(struct pci_bus *);
>> --
>> 2.43.5
>>


