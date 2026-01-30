Return-Path: <linux-mips+bounces-13052-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KJBNR+jfGmMOAIAu9opvQ
	(envelope-from <linux-mips+bounces-13052-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:25:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D5BA75A
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E540E3012BC1
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 12:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67856378830;
	Fri, 30 Jan 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UUUFHlLj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yTIWps1o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B237757D;
	Fri, 30 Jan 2026 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775893; cv=fail; b=O8LxLk8lp/BP3mlkiuIdGGT6FbvZozoMJ30+wmkrcETruL6lh8a8g07kD6+sG3aZKAcDmh1gidb7Vpts9ME/RgLV+3I4vZju5XJSEqLIepzwyW30thxfUX5zWIWstNGhofIqeTv08MZhk359vwgPBZUJ5ajT3MWWzQ6PiKYrebg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775893; c=relaxed/simple;
	bh=22aO8sF/ExxeDkd8uvSITu4q4WX6S35cZdyQeEcQj6g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hHdhKSvKqElUpojpRmwo+PUg/5fIIzXzwObFk7aFA6ge/v+ONphRB1v2r9qU4vHqcriMUhATa/wXxzGOAn7RYRY1YrMsW7BzTsuD9gf0LVwq3y2Ag88AxfmHm8S3F980O8OXHtmwdtog/tRMw7wrIBQ20D8PHwEd1CoE3UuxKug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UUUFHlLj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yTIWps1o; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMZHh6676538;
	Fri, 30 Jan 2026 12:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KuxNTK9TROexVb4Y3cwuzj/a8I2f9aPz3IZrJrbzTUE=; b=
	UUUFHlLjO8NypcCszFfxqD+YKhB0JWGYSR6c6JWkEUMf7l7yd5lUHrVqe83PneMn
	aSGsKwFJ4XkAnBvLLoFit8xeUucHxtcxM7ZdJNhkC1qt9i2oS0VeGHz2B7dmapuc
	sEnxpYL9/8aMy/WlzwFgdxJ3OLpSNbwl3DTJqsyW6b9tXSiZyIzaM6oR0xU0hKwQ
	kU50O//g6VLstPEa/ZzOyzJa+qgRTPGNkUQ5p0DUet3U0yEFFIsOCO3AhbQBME4C
	kL3Az6dONRX1xedtUPLGBYxKYglHrdSez5om34/RkHuodvuirDwBlQ3pgR/oV1Px
	tl+fgzGcp54HhJ6bszPrzg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2vgn6by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:24:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60UAK0QG036096;
	Fri, 30 Jan 2026 12:24:20 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhsvvvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:24:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmu7IDYIntSUfSq+1Jf/RJ0qeOd68Lr5a+HNA7I1wIUrFKkzvOxpURv2kdMBWu9C1Xd90OMbkrqjLAlmrd1UujZYQGnROb5k0jY+a0uTfT4zpA2LkMGAv1Wo7/jWJ8UVnX8UeY9zeC19aTKWfQH16Ip0zXQxP9dR8qhCe7vl+wizCzzVorJV4szZhBjDHHdFfE/lzzzspFR6KyevAzyec3h2iaiVLnf6UYw1min5Qd5wlrjbC3Wv/nxd61erabr7juPKxSofAhf4XqOTbeHANJCKdbPReT8Dc26EdNTDayJ75yueLKPn+OSvuXBXuJcv3O11oM6kE3WHtQDqktpr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuxNTK9TROexVb4Y3cwuzj/a8I2f9aPz3IZrJrbzTUE=;
 b=tPa5NTvR/v7E/Lv4cRRGr3Ob4f8/Y56p7nyq409SrZ/LNXbbvpX9Cf17PVimlshpJyVe+BaPCz+XiaI0PW9R2RVcKlsERA9Hv6eXQfyz9uu1HJVAD1WJaFN3KtcSjoABN8GiPXF/jqyjfWJQVNnfFHAKM5WQKHJdy4HOB2W9bVfGdqmnC6PZIVpPsJiIhERHBfELfZMkkEK1yQFdHcUtUq08RYOAtzUZa0KmDKS5HE0n6w6oBxGT/pOQME+t6RHyM9Ni4lfHYtTzfCQgtYrsh0gZl2Fb9AGW1sTp0pZe2Ki42zV+X+iGtWbDJpvZfYDVxfmpqZiN6CLdd2cQZHNjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuxNTK9TROexVb4Y3cwuzj/a8I2f9aPz3IZrJrbzTUE=;
 b=yTIWps1oqxMvus2+IiRrL32LJy5pDUmfNq1Zd1ukJTLUSa2D08FnNTCnq+60GO1IqZpZWIQt3XalNO6u3hHozmhXaSVuqRkcIknXFyQGOOiT68flPduIkvT8E9KE6sFhK0xYACyKhrxRMyvh8GvgOdyE+NPrUVeipyiFRkYcASk=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by DM6PR10MB4395.namprd10.prod.outlook.com
 (2603:10b6:5:211::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 12:24:17 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 12:24:17 +0000
Message-ID: <1171c2c1-1d9e-49ad-8d94-ede3c68c9f9c@oracle.com>
Date: Fri, 30 Jan 2026 12:24:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] include/asm-generic/topology.h: Remove unused
 definition of cpumask_of_node()
To: arnd@arndb.de
Cc: loongarch@lists.linux.dev, peterz@infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arch@vger.kernel.org, vulab@iscas.ac.cn,
        gregkh@linuxfoundation.org, x86@kernel.org, rafael@kernel.org,
        dakr@kernel.org, luto@kernel.org, hpa@zytor.com,
        tsbogend@alpha.franken.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, bp@alien8.de, jiaxun.yang@flygoat.com,
        kernel@xen0n.name, chenhuacai@kernel.org, tglx@linutronix.de
References: <20260107094007.966496-1-john.g.garry@oracle.com>
 <20260107094007.966496-2-john.g.garry@oracle.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20260107094007.966496-2-john.g.garry@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0369.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::21) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|DM6PR10MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3c81c6-bf31-46af-42fd-08de5ffa7c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW9KeGwxekdPYm80cHZGcVh6VXI0V1VQRGRHWWF5RlZjWHFVbFVqUWlJQ0N5?=
 =?utf-8?B?cktJbDJEbU9udFZab1BQVzUyWFF5UEhOR29WOThkT05VbmNMdy9pdFZPNFky?=
 =?utf-8?B?SEgxYTVpditNOHFheDlua3FCMDVQcDd5SEwzK05GT1NEWUdhZ3d0QjBEckZk?=
 =?utf-8?B?dThrYzcrVEZidG1kNit2b090OG1tMU9iZmhpZmgzQjRISGVwZlh2czIxRG1V?=
 =?utf-8?B?eXAzU2tkRlRmVzdueVVWSG5OdWI3L0Z5N1ZGRmtoY1NLeHk4ek9IdVNtc29G?=
 =?utf-8?B?aWcrcklKMnpKM0VobGlqZjR2N1J4STc5cEZYZ1BuL0lqNkhrYmlrSHUydnZ6?=
 =?utf-8?B?UWIvWHg0WGdQSEJ5M2UvRFR3V1ZSRytnR3U0TlFaUGZ5RFM5MFRiZ1ZSb3V2?=
 =?utf-8?B?SkFFdUgzekl5eXp0dG9tWDVEQTdraWxPcU9zODA2ZjJsWjVJOVFZeHEyRVRx?=
 =?utf-8?B?S1M3aWhYTzJzMEcyUmV5VTRjbjFXRDVyK3hGK0pTOHA1K3h5TGRwbloyempW?=
 =?utf-8?B?UmxiNWI4eHgxV09QTWx5V2xCbjZBQ3pRV3A5cHBCVWRqSGpFeklvV0ROWVpU?=
 =?utf-8?B?b3dwdzAvVWJNeGpkekZWdlFscXBKSEpUMHRpTWpYRHhvdlhoYzc0Z2RNbUVS?=
 =?utf-8?B?V3U4eGpLaXdMTlkzY3JGaFNSQ2RzdkZ0aXVDVGg1blNEZHdBbTNoNnYxcnh5?=
 =?utf-8?B?bjB0QWR0MjB1d0RPK3drTk1PYjFpYmcwelF2YWw4aWhGZDIxcW11R0NidVJi?=
 =?utf-8?B?M1RYVWFSNXhXN2dXeHNvQnBlV3hvcXcvTEhXckZ5bE1zL21mWFNnWTloNlVT?=
 =?utf-8?B?akZEbEh4OHJyNzYzelliaHg1MnN1dUw2aGI4RlNjQjQ2d2RCVlZNRWlJNmUw?=
 =?utf-8?B?cncrRWlvSHRNMXZ2bnFqNzZ4TlNKZytHVmpxTWpkYzQ3ZjkzbllPVGZhQXBi?=
 =?utf-8?B?bkFPcS9vNE11V0h4b0RYUFJPNC8xc3V3OGZQY0Qyc3RmaXkvcFVYN0JBcDJw?=
 =?utf-8?B?akRPZjN3QWlZUHZvK0VaRkRNNFdhSFFuOGJ1MGxlS21pWDF4RlVKUFBpVE5z?=
 =?utf-8?B?YjIyUldpYkxvVlgyQWZxV3RLVUdoRWFaQTFPblhoR0Y5dDN3ZkJ3Mis5dVd5?=
 =?utf-8?B?ODA1dkZpNjNvbEdPdGlBYy9yK3cyUVNkRWhyWVplazc5Z1RZclNld0tMYWls?=
 =?utf-8?B?cjNCMk5Kekk0WFJ4TlZ4TWRUQlVqVVBGcU5iVmNkTlk0V3Fac09YMktVU0w0?=
 =?utf-8?B?NzI0aUJzblRMUEFoMDFraVlqdWFtU0ZhN0pNOUJHZ3ZtekRZU2dmSGE2NXFN?=
 =?utf-8?B?Zm82cFFKZ2FpbnpZVmM3eG5KR3REeUh6WW1DOVlHeVgydHRhd3ZWVk1CZHZ4?=
 =?utf-8?B?Mlk1UitTRFliZ0w0UzZGYWdZenBSaWhBcU80bm9GUnVUVjYvdXNVVzh2N2hH?=
 =?utf-8?B?VUsrWERMb2J5ZjVhTjlVVXRIbitZck1JUjYva0VJSjcwVkZKbGF1SWFodG5z?=
 =?utf-8?B?KzlRNG5mNXNaRGlmcHdoQ1o4OWNYZ1g5YmdieGxHYnB1eFZtSTI4UXh1RXpP?=
 =?utf-8?B?a2kzYklsN3ZnMVYySUdBSkRqNVpIUzd4clJ4WHA3UGFwdUp2LzJmbHN1UUJu?=
 =?utf-8?B?TWNFaDFJaHpDTXhVVmVuVGg1TVM4OVBNRHUybGcrTEIrdWloV09hWkZJRG1I?=
 =?utf-8?B?MUNteTdHeU5NZzcrMDRqZXRrQ1Q5eU5tSFU0TDlINVhJdUtrck1TSUFWWFc4?=
 =?utf-8?B?RUVFc2FmSTB5L05HT29Lb3UzOXdQWlN0eFExM1NmNWlpd3N3blhKdG40MkU1?=
 =?utf-8?B?bWJyeElhSHJidmhFc1pkaGtkenUxM2I1N0Ewcmh6SzEybDdZSWpHbkhlWlpX?=
 =?utf-8?B?VkE5dW9jbmYvK0lhaklMbmdCeE9CWDlsSWg0K3Q1b1JFRDFZckF4dEdyY2lZ?=
 =?utf-8?B?V3dMSnIrWDdWNDZFUVdvSTNGKzdicE1MNUdHdU1hRjhPcmtYUGpjc0RLRzdL?=
 =?utf-8?B?WU5ma2xNV2Q4LzNCSFNyQUZrZzZZMVJoUi9Xa29Wd0xCZzNWd0NRRmFuMEV1?=
 =?utf-8?B?dFRqbTBJTHUvN2J5R2VnekF1SXZjYUNPRW1kYzU5L1BsWW5hMS9mS3BKUFpU?=
 =?utf-8?Q?yO38=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFEAFA21C69.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlNzSmtaRHppdkVvNTZYWUprUkdUOFN0Y1kxN05EQ3p4aDE1RGJqQUY5UTdY?=
 =?utf-8?B?NVpaU3hOdzJ3Y2ozb0FwZ1IvMFB2dWpmL3BiTHlsamhBMVBzSWd1Y1J5NVF3?=
 =?utf-8?B?ZUlFWHlUT0ozcEZJUjBQRkhaZ1dTN0s3TURkWGxWd1lKaVpjWWZESmpYaC90?=
 =?utf-8?B?T2hFcUtCRW9OSkJmMEdYaEFuemhleU9ueDNsYlpXbjRtbUloYlNGd2tCVnFY?=
 =?utf-8?B?S01tOXZucTJlbnU3aU4yVDJuR3VrRlF3dkYyaEhCckV6azcrTnNUR291aE13?=
 =?utf-8?B?NlMxL0VtRDdHZURudTcvTzV1cGlmWVoxUW5aaWNvZ3NvQUZueHBXaUYxNE9v?=
 =?utf-8?B?aUJSMERlOVpRS3A5RGVYWHNkeU5HVXNNZHFyekN3L2RDTW9VL1Nla1RuUW5u?=
 =?utf-8?B?RjdYbUk3c2duR0xjM0UzTmFMK2tFckhwcDJXd1JZZmNpaWZxYXd1ZzNJRldk?=
 =?utf-8?B?c2o5a3AwdW1iWkxTODlBRUZXYmJtc0RmbENYMjdUdmwvRkFqaHVzTTVIL0g2?=
 =?utf-8?B?TTU0Uks5ZnBkWXlaSTRqOXNTa3BwVmdoYVhnY0M0NnYvTGN6WFQ1QmovdmJQ?=
 =?utf-8?B?NlNoQ29rTGlJV1VUWjRnT1BuTHJtalhMZVpoMGZ4WkhJRkw4NlkxaW1WZC9x?=
 =?utf-8?B?aTljWE1SMlpNekdlS0YwN1d3NmhiZGhGNG9Xam1GZXBlU3QrUU0vNzM0YUxX?=
 =?utf-8?B?MXZpY0pUeWova2VybWFSSnl0WVFDWnhXandMYUxpZ2h2VzFlVHZsUHgwNEt6?=
 =?utf-8?B?a1N1MmlPRVR0b1A3VEg0VzhRa3ZmNzNQQi9rR2d5eko0eWc4c1MrK0dja0tD?=
 =?utf-8?B?VlRlUUFLV1gvcmhnZHpSSHlzREkyK3BRYzNienFobjlqOVltZWRUeDBzc2c1?=
 =?utf-8?B?VUFKUXBxTzZ3eEN3cTlCdkxGSUZWVGhXN0Z0TlQzOWFKVXNvYjNXd2hZalRW?=
 =?utf-8?B?T2R2WGsxRC96czh4S2JmNCsyV09GVTlDY0hPbkhnU0R3VlBLYjE0Y0pvRTVE?=
 =?utf-8?B?cDAremhBS3piZHNGRnAzNEtkU1o5QjhscFZrNlFQaHBKSDRzUnRjSFlMb2VO?=
 =?utf-8?B?TmlRSmN0RGYzZkhjb1BXb3RQTkQzLy9pczBSOFNFWkNycEVCK0NpMVJVNHpB?=
 =?utf-8?B?V0IyRDE3ZUc2S3JiOFVXcUJLK2V6ZGFVbnhNV0JPMW5PZHcva1U3VkpIQUVC?=
 =?utf-8?B?VFFyOVlCUC9kS2xXT2k4SlVSSndRemo4SG4waW1uaGduR3VQV09JNEpxUUda?=
 =?utf-8?B?K1ZKbVhVRTFEUVRGS2pLYkJrNjg3emFPdEc5UGVBRTdyWTM3NTlCVmxoa3lD?=
 =?utf-8?B?ekYyMGU5N3NyOUcveDViMUQxSE1ORkdYZ25LYjNKTmhvM1lrMkdKQk1YR1Fh?=
 =?utf-8?B?VklaMVhsWVlPUFNyOHI3MVRkZ1VuOHhDaWlEUDhnZkU5RStPajRYTHpZZDlE?=
 =?utf-8?B?UWtpWWVsOWN1aGV3REpJZXVPL3RYakQ0aDdoeHYyYldmMU9SR21sOTBRVWNl?=
 =?utf-8?B?RjFLV3NUeGVWU3pWaHVUVU01RnFEV2srcThaYnJNYUQxREsvbEU0WEhoVmtX?=
 =?utf-8?B?cW1FRzFlS1FWVzV2Vmw3Qm1zazhacVFtV3NScE5qWStTTUhjYUlpQ3JQQnQw?=
 =?utf-8?B?dG10NTNXZDYyS1F2cDdEQ294dDhxd01keFFIbE4ydGlCQjZlK2RDckFDSDNJ?=
 =?utf-8?B?eU1yRTdDVC9CVGFrWnRxanpZbE83T1VwTGRlWTN4SHI5ZktmMG1CSkl1TDZM?=
 =?utf-8?B?VUVHd29qRTRxMnhVMXp2T3MwNVpJbnpPRnd2MFdNT1BqcDdqQ0dxSmk3K2Ex?=
 =?utf-8?B?YkFrcmZrLzJMWGJGRW82SEFFa1JkL2tXWW1lLzhnRzdERHFpaHlNQzdEU0tk?=
 =?utf-8?B?TE43Z254THdUaDczVmVrMUI2S3FxMXh3YXJmNGZUUnh1eWpuMkdML05Sb0No?=
 =?utf-8?B?aGtRODdnUDVXVHd5YzJoV0NKTXZlbi9ia3BXNnRZbDVMZ3FoTERyd3FzUDVk?=
 =?utf-8?B?T1RCcWJPZEcwc1FYZmxBWVo2NHRNQTZjbktRQnNtenFpR2h5d1NTZmlQVzR0?=
 =?utf-8?B?KzA2NFBvUWUvOTB1eitMZXZ5R2VkckZGMGwwM2RzNkprcGROY3lXd2tiUkFm?=
 =?utf-8?B?YldIUjVDckhGdmJoVzYrQkdoRXlxYlF4NENvU0dFQ0ZPUkp6VGdpZHFNVUho?=
 =?utf-8?B?aVVjUnQ1bFlKY0M4VFFVMGNDZndrUUN2ZU9yUW94NllVdFVjUHVNN2djQnBj?=
 =?utf-8?B?RWVBRXRMWUwwdW15d21UVUkwd2FZbjZSWG5FQUpwOHBhdmc2T1EvcVpXcHVZ?=
 =?utf-8?B?VXJld2JVaDJiSldKRGlJNHpVMnR4bTZXSXZHNUN5M1M4ZDJxbmRJdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	omN7MnfDj46WfEggYp8D7oU+bF8LISu8lIrVV8uzlqj31RD0K/LzZt3xrW5LQvwA6VZ/3vd2X77cGDQUr2ULYlEcRQ+pLUKQS4l01eI2mmylrMY/U3VOqOnTyXoJ1/jKHoVE6XWuDMh0ZErGdQD/tm+VDT2shfmmTCIrkbRJWaefHfQmmmHlQKQPjNbdnmdOvp/oIBsrQxJ50Mx4/1D8QlRVah4bhkGqkB5PGN7fPQofwNhvOFCmYLSin2EZ2M4tuXzPtXIW0tgdNk0Fnv//rzeDTDzN0ZUSukMGEQw31Xo5qBbbQx2/UzUN5fSOyz+Rz5IvdkH2r3jW4oZ2tlQoqq/CevO+f6VzkaTM9joVxw8Deq7x3zFdc1wW0PYNB+U0/cjCMhR+1wtnCHxZGOgc1mDSdol/wJqF4R84Ji+mJeJiPjYWdW44ZzbJ5tkTsPtZatW+p6vjeMAT9cgEg9BmbMc+VLiaeoOFUjUnusytXhR14wK9iU7gb+TEMESfzwbvEcFqlR2ryFq/kDPZjRPbBGht3wnk/wNnR1DfJDMYJz4CitENqQ90Hbcp1h/YN2yNILBhdPeemAw4qFI/xtRzhOX3mdihOEqXfiYqmKh0OII=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3c81c6-bf31-46af-42fd-08de5ffa7c6d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:24:16.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJHNAWH3JaJbu+WC+nuzY58JEQUgY4zxJhPe2NIzu233f9fMCOaNPLEq6xLm39uDg2c2nuJb+snpGi/J6yY7gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601300101
X-Proofpoint-GUID: LQPCNHdiSoQKWCShU0L5A7HGNnoGb_J9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMSBTYWx0ZWRfX6TEHukOCjzvp
 XdP9rRa8jq1RBqeGx4xUkuKiwW1ZSja0OH3xx9ApFV+L5aZkC7kqII8Tmicnfzi3r+2qDIQWh19
 3Y/me93NUMHioYA0N+R9kviDD5bLlxh6L1Pwq4en+fmyntZNJlT1b0seb7b5F8H1xzzW9KPDj1q
 nNB03ewtQ7/BEE7M0m8UkoR/EKyvz2zWp0MWwRwFw81YFLYA9/JHPZqOZwd1S7zGT2Q3iJxdFBy
 mSV/gOjQ8hX24br3ccuu5qQHISJwEasUdOalmAKxKWKnq2ALx7Km/tzQihsLoBHEf0I1yodxwuR
 QX2wyxV5HMICrfiZCUn1OJg4R3L3PV1JyWmKz2cpH7gHoVSJdxtLP97uQrSOMeEU/pOPg0KHgDe
 aE2IDwcd2pE21a2cv2Hr//3og/KskYa+vVnrO//IXI6cpbH1PO9N5TkDFug/qpfIxobeeGF8KMj
 HNxye/oPJuwYsS4WzyXvMPwrQFzdb61avULF0Q9I=
X-Proofpoint-ORIG-GUID: LQPCNHdiSoQKWCShU0L5A7HGNnoGb_J9
X-Authority-Analysis: v=2.4 cv=a7s9NESF c=1 sm=1 tr=0 ts=697ca2f5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=9yrEv81tGPMXxe9sSZ8A:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13052-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oracle.com:email,oracle.com:dkim,oracle.com:mid,oracle.onmicrosoft.com:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.g.garry@oracle.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 465D5BA75A
X-Rspamd-Action: no action

On 07/01/2026 09:40, John Garry wrote:
> The definition of cpumask_of_node() in question is guarded by conflicting
> CONFIG_NUMA and !CONFIG_NUMA checks, so remove it.

Arnd, can you consider picking this up please?

Thanks

> 
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> ---
>   include/asm-generic/topology.h | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/include/asm-generic/topology.h b/include/asm-generic/topology.h
> index 4dbe715be65b4..9865ba48c5b16 100644
> --- a/include/asm-generic/topology.h
> +++ b/include/asm-generic/topology.h
> @@ -45,11 +45,7 @@
>   #endif
>   
>   #ifndef cpumask_of_node
> -  #ifdef CONFIG_NUMA
> -    #define cpumask_of_node(node)	((node) == 0 ? cpu_online_mask : cpu_none_mask)
> -  #else
> -    #define cpumask_of_node(node)	((void)(node), cpu_online_mask)
> -  #endif
> +#define cpumask_of_node(node)	((void)(node), cpu_online_mask)
>   #endif
>   #ifndef pcibus_to_node
>   #define pcibus_to_node(bus)	((void)(bus), -1)
> @@ -61,7 +57,7 @@
>   				 cpumask_of_node(pcibus_to_node(bus)))
>   #endif
>   
> -#endif	/* CONFIG_NUMA */
> +#endif	/* !CONFIG_NUMA */
>   
>   #if !defined(CONFIG_NUMA) || !defined(CONFIG_HAVE_MEMORYLESS_NODES)
>   


