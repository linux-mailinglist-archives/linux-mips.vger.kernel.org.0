Return-Path: <linux-mips+bounces-13050-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DC2IFyifGmMOAIAu9opvQ
	(envelope-from <linux-mips+bounces-13050-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:21:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C4BA6C9
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 13:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA022300B873
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 12:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EC237647B;
	Fri, 30 Jan 2026 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ER+WXpf9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BJYmC/yP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD66220F2C;
	Fri, 30 Jan 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775705; cv=fail; b=lgoxsdFmykThqFc/HIOU7U2ym14kHJqTLkBMwoaWsCe+C0gwxCgT1TlkoihRoy+JR30JAdIdgvuEclXBh3WPJRAPfx9hNkmq/RiEfSU5L2pPMF0sEKQMsW+AjIAWPBrQBjA12+wCnfNm4Qmxb6yOxxcwNm/eikTuRFWJ5F61BIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775705; c=relaxed/simple;
	bh=inOBdHznVQe3tYBkzceh2oaXKs+Bkkfl+XR9zOmJOD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ivv1dLwOFQLRRuFiTyscYqkSuVuDbiwUODWcQnzrmMlXspOlzGASRkt6U37NmkceS432FZBTrBjLGbi+Hx6X/HsuHMaeHLdBiUqjSydxSvF2lcJnsN9zEQb8eXWNRv/QGsOSdHle8DOP7cLCeT1fcZwd1yI0ogj5hwKPu3sXVGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ER+WXpf9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BJYmC/yP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UC6CSK448870;
	Fri, 30 Jan 2026 12:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=y6GcZwDxPQa1Ej0gI7Av0Ls30dQabTVBJD9/fd91QNE=; b=
	ER+WXpf9Rw6iU/VIaj/7eemaSEYTul7teyyMWc8gQDgDVKdmgPURqc9G0zGhQNvF
	9eO+NfL3jEEK9zljkDt6VuNi/9dsNXoDoyo0g5C1u3Pj7RkqDPzzPrnuk395kqgx
	i1dgmxb8+pnnOjUSDE30qAO8tT3K70TSL/Um+4Ewu3Y+Hn/HGAt2MEaTJxXdl/5o
	V04DCbfpIXGcXhaNFvG+c7Lrhb4pQ1RvJ7RPjp/kFr4++ucJF7sK6ktyndGYwFJH
	27maPk58P7RYTbRzwh8UXqcKoUOPSQC1K3zv+6dis8wi+Bmijm+l7KrcSxqOCSHJ
	rqX6q0d0O+GZtoTDXmWPkg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bxx09nucj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:20:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60U9cklj010703;
	Fri, 30 Jan 2026 12:20:51 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhdkcq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 12:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRRZ0qBDp0khSjSE7o13U49xGl6hJfRzYXW+nrqx1nvmpzEHl3Fou4ThshrwKw6Q1uTBYR9Adf/N54u9LwKtUSsqFO0IoBnPKh+A2EOdSdKRfBCDgn8dtXZxsNmt2ZnYGixy9C2hcZ7qjOlbxhp/DUHGe64W503/f6HuyAO0BNAc4V06yUQTptid1w8G4WMkzJrvIsEcMVdKj/D8UvLPnl3NCtEJLDDi7Wd/7saySDWUwhYY9bci2KpT85BY5DAYhyVL/OeLFBf/sDB21Ubl6KhniplWxXryalVoObff80fdHfOuXCTCQxtaY2DsXDLAUJ5SIef+bACMs9B2vLiIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6GcZwDxPQa1Ej0gI7Av0Ls30dQabTVBJD9/fd91QNE=;
 b=f0wLxbbvaHl2EJrZVtFtTXzaFLhoMNjHgXn7Rb9CmfpJwjmGimgNzzVxytpYpxaEsyhw+6USmPCSDP8PeNwVDCOS1qT0wp+2+M7w4LLT1AbI9KcVN7fQu3RKjjlq/5ZlqeOE4c8bJ4dLXKfiRdC01ytjBA1zG0RtuVezKKQqf6L6FTQsB1aYzbH+cwiT/XwEcP0qvvVKnQNU8WFYbMdp40y5RQ6GTKjBGIlhwTWPvi2EqnvvM9XNiot59h+3TgddXh2PqfAQKVFaqVdKS/Hmvi5z6q2w7G0Z0M75urk5sWNPLqs15L2p4KA2jHdveZKcoUv92bvHk9T+3o7xYTX4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6GcZwDxPQa1Ej0gI7Av0Ls30dQabTVBJD9/fd91QNE=;
 b=BJYmC/yPxX+qoimi+oX4DrcxpfwkxkqiJ2GBCWTuwceJBkt8YY7KZ/FpZnkhOEjH2bKWx2xhIdgvE8tCH6ITglUnRvmcn0CVos1uyXNs/0rZWHa4kXEA8g+kkam3D86sBVK9h9JWRYnC23FLxQC/9FgaATlDtdRr/qbH0KRSQZg=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by CH3PR10MB7959.namprd10.prod.outlook.com
 (2603:10b6:610:1c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 12:20:47 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::ba87:9589:750c:6861%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 12:20:47 +0000
Message-ID: <59101a15-fa63-4948-9169-3db6596bf618@oracle.com>
Date: Fri, 30 Jan 2026 12:20:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] LoongArch: Make cpumask_of_node() robust against
 NUMA_NO_NODE
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
 <20260107094007.966496-3-john.g.garry@oracle.com>
 <CAAhV-H6qAtsBF3jwxbYGEUytZXH2ZRPfzPtUZRBnXOiZ_K5bYg@mail.gmail.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAAhV-H6qAtsBF3jwxbYGEUytZXH2ZRPfzPtUZRBnXOiZ_K5bYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|CH3PR10MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d87998-5584-4167-88c8-08de5ff9ffb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aERwcHhzaGF1T1ZMTHJ3ZjlHZEtsRnd6akhkUmhLbGhRRFNNQysvODhmSlA2?=
 =?utf-8?B?MHlGNFM2NzJPbjhSNnFuNUFwaE9PVHBxVE4rZkYxdVBDNWFVY1Y4dHB1dmVM?=
 =?utf-8?B?WTNhRjI3dmVVWnpXd2Nvam9Na0Nsci9DK25pNDlFeC9rK3VWa1I5L3lvcksw?=
 =?utf-8?B?UGlpbTNCL1VpUmZiRFV3MTUzK1VHREMxR2hRczZLVEFoZ2toSllZMG8zMllh?=
 =?utf-8?B?UzlLcFpGVXo0Q0NCbGM4ZkNEZUNNV0hBaHJsbCtUQld6YWdkS29VRnZTYndo?=
 =?utf-8?B?clBJRGg4MTJsRFMzcWZBQWhPR1RSY3AxcG5PZUVKc25acE52L1NpU0Q5TG8z?=
 =?utf-8?B?V01HeWJLc284UHV3dWNTNWI1V0E3elNYOFhyMjdsbTU4bTg2T3M0dEVYV29P?=
 =?utf-8?B?MXFSa3RXMUdSMHN4ZmliTGlmN1k5eXVLanhTT1dPS2dLZzREcnBEK1JDWllX?=
 =?utf-8?B?a3R0VzVFajdZNDhxSEYwcE5COVhOcncxbFdJa2x0SmxTdXp6QW9wdCtRaGJB?=
 =?utf-8?B?REF1TUJTSnp5OE5mbGJXbFZsa2tYVno0bjNtQWpya2xPWmdFMzB4c0dVd1BD?=
 =?utf-8?B?WXBYaFkvUGl6ZXZ3MG1ML2c0aDZqMk84T05Zck9KL3NsMVplL0RGQUtxeFJB?=
 =?utf-8?B?YXZ6R1J0VityU3RrUzRsQ2ZtZ0Q1Uk5uMUpLRSt2OWMyaUwwUkJkUHRVVk5L?=
 =?utf-8?B?RXlCcHhIbUpCVzV1THRrektvWE1OK2krY1RNN0NlSTU0Uy90K2dmMU9nSkJ6?=
 =?utf-8?B?emRsM0VpREJGR1hubG1MU1lLRldCdDRucjJuVTRwejdXYktBZkhFbEpGQzNP?=
 =?utf-8?B?V2JPQVpsSDMvS2NtM1ZnRy81MEI5Rk50U3QxQ0ZhRzBLZzRxQklmWXJ0MDhL?=
 =?utf-8?B?NDJLb3pGWENhREpEL3JGUml5RmREY1F3d2o3Q3BqMGRnanpxUElTUCtkR2c1?=
 =?utf-8?B?R1FvQTJSSkRhYzdablNvaGxxQXVZY1FOTm9uNldiWXdBRkZMTTJqNzNkRTlY?=
 =?utf-8?B?ODZsZXNIMzdtT2I0MlJIOXZFOWgzMElhTi82S3pDeSt2eHZpZ2ZQengxV3Za?=
 =?utf-8?B?ZGZwdnFTWk1sWmQyLzRvZW50M1RRZWg3Yko3dnRaeUtZNmNrZHRsWDRCejlQ?=
 =?utf-8?B?R2U2cXRzamlBUGFtc3h4NG1rWU1jQlFBNFlYdGJKZU5GZDBlRXdhSlhHTXJp?=
 =?utf-8?B?eGlhcU8xZFk5djQwYUpRQjZ5cUdiU1dHRnVlWU9HSW9paUNKczdnMkxtL3pJ?=
 =?utf-8?B?a1U3R3RxSVp1dHlHMkhsYmpEVEdJcE8vQitxUk1FQmlqVnExZUFabUQwaEhZ?=
 =?utf-8?B?K0w5cWo4UklzbFRBcjRpS1dLZlhSMXVvMEZnbXp5T2JVK2tKeUw4d2Q1TDAr?=
 =?utf-8?B?NGlOTlVyVm5DanZERG55RDREbDd3ZkF0RFVKSGdxVzQzbXZ3NDIrU1Y0TEph?=
 =?utf-8?B?OXRCem5SZlY2RmIrWnpScWdDS3pNTkF2OE1vblVJVyt6YmU1a0U1c2hRRy9z?=
 =?utf-8?B?NUNMVzdYand6RVBiOTBQME43YVc3dTRTSG1zWHg4Qlk1MERUTElYWGhUdysw?=
 =?utf-8?B?NVh6RUMvSGlPN2E1WmpKWmJPbnZaL21CbnJWaGxlVENnL09XUExBRVFEbE9t?=
 =?utf-8?B?OWhTN0ZCeXRVSlQ2OFhaNm9scFN2MkRVV1lPeEZxenRHU0tpTzhCRXUvWDlR?=
 =?utf-8?B?bGkxbnNkb2JaMi9uK0FLZXg4SmJlaldjTER5N3BiQkM2bHlLTHJ6VlFDa2la?=
 =?utf-8?B?TTBZdUZLV1VOeHU1blhTYzIxcnNGSERKWnBSalFaYi9hTy9sbnlsRnpteGFp?=
 =?utf-8?B?cVNyRUpMVFdFU2ZXcGFIaE1ybHJyMjF6RCtrT2hsajEvditwUGh2RjRBSW5z?=
 =?utf-8?B?UWFlbTRMT0tTNFNscmMxN0l2THE4cGR5VVZSRVp4UGJPSDBDNDIwbFJBUUt0?=
 =?utf-8?B?bmllcGtkVWFpMFlCV3M4NHgzd012bXZDcG9oOGYrUU5iUEtFQ0NSSXRqSi94?=
 =?utf-8?B?OTE1NWREMnRueVdVblMzajhYYXh3UElsWkx2ZGVIRnIyRkQxVEJGS05mVXhs?=
 =?utf-8?B?ekMySUF4Z0NERG1YeFZTVmhNT2hhUjUrWTh1NjQxc29kSkt1a1BRUk94YU5Q?=
 =?utf-8?Q?IfRM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFEAFA21C69.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0oxb1U2Nmg2Z0pBRVcvZlp5SFJWZlUzL1J2NGEzc0Fmb0pmZW9jdjNHdTMv?=
 =?utf-8?B?cFlQVXhRT05oOWY4SmF3NUFVb0dEaWFJUGVOZWFxL3dYOVdmUTNWOGFWbzg3?=
 =?utf-8?B?N2llTStCbDAyV2tEWTEzZ2dlZDVESTBBY2RWR0xybDNWYktQZmJQbDZtSERB?=
 =?utf-8?B?Y25Zbktuam5zaE9XbWNqa0F6cExMeGQ1UHhneVdRUzZ3S3hVRlpuUTBnemxR?=
 =?utf-8?B?aEtKSUdiOVhjaGJZeTdpZDhiQU1nZTdiUUN2TklESk4xVW8wYkxjTEZ3b0NX?=
 =?utf-8?B?aTdGWUxvRWFyRTByZGdqNUVTdW9LNnV3YXZ6VDBRbDBDZFdzVGlZUG51bDNQ?=
 =?utf-8?B?WnVXT0Z3M1d6Wll4S1pUREx3eWJ4eGNCVVVjZTA0UUVUTE92QWNRdTdXV29X?=
 =?utf-8?B?Vk1URmthN2plRkZ5TUllTlUrdE9ZVDN6bjBYaHU3clF3blZEZit2LzlpejZ2?=
 =?utf-8?B?eXhqWTRncmNHbzNtR3NFbG0rT1B3bXU1SFRadnphenQyUEgxUTRrWFlTZ3dR?=
 =?utf-8?B?OTlkRGh5NFAvV0RNNnNRTTNoUzg3MXpwNGpBWlBDRmVnMjhWVmhHNVFFSHZW?=
 =?utf-8?B?dHZKajJwSlcvcU0rTDdmV0NFbXFPN0FtTWVkS3pwT1hpWVRwUlMxMXlYYU5t?=
 =?utf-8?B?TStCaGc0STlRS3p1SGI2ck5lOVlrbUwrbWwxb3IrakpxdmdtN0p3cGRVMk5Y?=
 =?utf-8?B?WVVvRmk1NmRNejNpbm92bVVZbFNBbVBNVjc4S2VPQW9CTXp1REpCbUwwT1F4?=
 =?utf-8?B?Z3Q2QzhkcTVad0pxRjhDVm8yNkxxbXozWmJ1SUc3TEI4ZHc5eFZSeXdobWVW?=
 =?utf-8?B?RmRwYTBmUExOMnliNFhTcUlheEhiZDMwUzh0c3ZiVXdTMnBuZFRINkdaVGIz?=
 =?utf-8?B?di8xdk1md09YK3hRaURJMkJXWjQ4MXczeVJ5aGNmQ3p2Uk4wVGwwc0pMNXlQ?=
 =?utf-8?B?RkpTYVZxNFFQU3ZkZWtaOVcrSDFyZjVIT29wMStKWUNDcE8xam1GZW1iQlly?=
 =?utf-8?B?eUZLaTFRZlFYNGpDUS9RODhsSHZHR3JHRnZKb2IxMVIrQjVOWDdLQTA5U1Bh?=
 =?utf-8?B?YUhlQjRjUENTRTNGVlY0b1dudGp4WkE4Nit2UzVWRGJWVS9VTHBXYWZyQWx6?=
 =?utf-8?B?RjVjY1FEUW0rWGN4U2ZaZzNZMWNzMzNUWEVPSzdBWjlzSUhNNWdReStvMHVq?=
 =?utf-8?B?ZGNYS1lBWHdPWlN6MXBNenp4SU9yNHhsUU43dktKdnF3ZS81Qmdjd04zYVd0?=
 =?utf-8?B?V3FiNmxkRUVjQThZV1lyU0VSMUhFa3JEL3ZGNitkdWtPYVJ6VXRJa0F0d2FI?=
 =?utf-8?B?TjdZWWd2WCtxaFo1alhMSkpSek8zRFB3Vi9tVjJ6L1dPUy9INDBKT004MWNG?=
 =?utf-8?B?SGNMMldLTytuQjVLSEdmRXJBdlNIK3djQTNERmw0S2JFYU5ob282czMrNFdS?=
 =?utf-8?B?VnJFbEtobklvUzBOclo4dWNCcGVQNmVBdkM4OFdtWkk0UG1kcTBJSTY2SmRM?=
 =?utf-8?B?Mm0xdEtDSnNtL01iUVpvMnRlbHU4R2d2NWhJWkVvWXNFMHc1SXVlRkdqbFlS?=
 =?utf-8?B?UlJvTWN0RG45ZE5oWVN2VjA1alZFU2p1M0tLMkFuVExRcWZZbVpZT0doVU5y?=
 =?utf-8?B?UmpUNXBIK2pqcGVkZDBhMFRXNS9jNTJCTWZWbWw3WS9rRFFwNGpSWHFsZlF5?=
 =?utf-8?B?OTg5c29NQ3p3S1l4S0s1Tnd1cmFFcEFsS1A5MXdxWUVzU0JpQWcxVmpRUmNR?=
 =?utf-8?B?eW50Wm1INWF6M1k3aytObUFaRXh3dHp2RUFnbTU0SGNvazZPVURpZTNzVTI5?=
 =?utf-8?B?OXVPNnROeDZGYjdxSC9haEhLbzBmV2ttdDFTRVFQNS9KZVd2TzFZYVNoYWFp?=
 =?utf-8?B?MkZneU51YmErdWJ4cUFCZEIvaWZra05Kak1HTjM1UjI0QlRXdG0vVWNkLzFK?=
 =?utf-8?B?WEkvKy9xZXZ4TDRNV080K2w1YTNFbnUyaGVhSlAyUlE2ZWZBbW0rNVhpbVJX?=
 =?utf-8?B?UUY0bmhOTGovT3FBR1NqUS9Ma25iQzhkZmVKd3dxbWkwNitKbWJGeWFmdnJn?=
 =?utf-8?B?K3hTY2xsQUZmdTZCYlFKekVWalJ4c0FVOVJqV2VaQi9hMkRDeFByMllnbUlD?=
 =?utf-8?B?alFSNmJoYXZrS2o4U0R1c1plbTFSczluNjNOOVV5K1E0bWYzRFdRQVppcG5N?=
 =?utf-8?B?WlVGS0JCbVlkL25aRzlhZDlOc2tmOWtqcFFTK0ZIM0dwVnYzV1BxRGY4anB4?=
 =?utf-8?B?bzM2TUs3RVVIaUhlU3cxcm0waEh6RlJjTmtXV251TWg1SWtiYUh3dXJGei9N?=
 =?utf-8?B?UStJWXNOR3hCdy8zS2xERDRBVXhrbXRJeE9yVCtQZzlJK050MXJ6UT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pXYafTgeOKxIryBBo+3+uPyf+9X47B3Ov6g9gbyhMjzMQrUVxle+6DlLAYs6ibZDA/PoNnTsnbfHR9mS4ZPS2FDpnW1mzRwx/9rcSdMSwnG8Zqn/w3ps8HSiyggvGC13xNySkCEdWASUOrpHmdr+5Ufe5fdRpPdnnyUI8D7adn7br3cTwmvGpveT/m8L33yVGE0ylmXdgCJq2bT39UJQvF+4LYAp91FQK2QmT2a9yltknNXQwoAg/g4RMQO+OMWLpbSp9/Um55EZWuKCklJU7N4WbJwo8RyWm3ZOR9WQ7Dm5KHM4IQ7EWyzns1Y72W4nWcBpFLnCWKJwsdn5IZHqB73Kc5L2cbksffwAwdBVZMAG/m30UL7V1u2FO0JBG2aPLxWUTBGbUOcxw1a/PtOxXdIaklkLxE8iLbL/MxwTFAmIvY7w3rJikPj5l2ZE/EFvjumQzFWBJWtA4B74cgwMuRL4l1AcrYe6s6YcyojznkqzQuauViKw9JaubIDGFXrlGq8hr3AQdDWPXvzeuBL9ZIWXyanlIWncQdajkdXy64BlEAYlvZp6UF5OyAJD0cFHykB8RcFf250tplWLF8W8XodSE8gDdXzewyTR3ZMXlzM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d87998-5584-4167-88c8-08de5ff9ffb6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:20:47.7449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EgS9GhvgYviodN52kxSlxXgLO0naxwNAa+cZXEp3kSea+bBmG2fh+uUzcW6MNIAAyB/jWzw9OCoNOShprhEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601300100
X-Proofpoint-ORIG-GUID: 2hz-mwvUlQjuz2N4NOQqY0emWu-m54ZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMSBTYWx0ZWRfXwuukAR6Lz9na
 gfNUDtukhUPf/6bENeqDlBtrVZEfZstT8Wf6oau/aBHkCX3vuEejWEYTh7TRICr4WIh2TWF2ney
 LtQvySXoYgnWz6MinzwFRVyy25lo3VMPvRU5EMBugr5GbOGl/70/gTAS/ibPedFD0ZMEeEWy+gi
 7Ptw7AXKYg1Em3/dzRHmOzyQnIldEGt0DZ1Ch3oaWTowRKj4uj0WDPwiiqRpRAcwKtRfZ5hSnAk
 xzqFEMUtjW7Px273GPrZrS/0OBFFOmF1WJLTUGK4wpsF8Krf4OipZteSWbpBhFDSymRumVhYs/p
 iuRwjXaTNrWRRaDI0ljkLbsiKgE3au/rZrw4aoozoqSzeXFzAkUJYbPWNSACt4rvMuVtuF9imwo
 7J6cDaG+R0oW3+XfFkTatfmEyWqSTn98oyYois5Kr7Qwx5r3HU3LaMayDOVmJoLd9D5aXIDQZ+4
 FBgMejLbANG+emaceFA==
X-Authority-Analysis: v=2.4 cv=Qe5rf8bv c=1 sm=1 tr=0 ts=697ca225 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=9luPVpUbj2Hk0mRT4F0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2hz-mwvUlQjuz2N4NOQqY0emWu-m54ZR
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13050-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: EE7C4BA6C9
X-Rspamd-Action: no action

On 25/01/2026 03:55, Huacai Chen wrote:
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks

So can a loongarch maintainer pick this up please?

> 
> On Wed, Jan 7, 2026 at 5:48 PM John Garry <john.g.garry@oracle.com> wrote:
>>
>> The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE - which
>> is a valid index - so add a check for this.
>>
>> Signed-off-by: John Garry <john.g.garry@oracle.com>
>> ---
>>   arch/loongarch/include/asm/topology.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
>> index f06e7ff25bb7c..6b79d6183085a 100644
>> --- a/arch/loongarch/include/asm/topology.h
>> +++ b/arch/loongarch/include/asm/topology.h
>> @@ -12,7 +12,7 @@
>>
>>   extern cpumask_t cpus_on_node[];
>>
>> -#define cpumask_of_node(node)  (&cpus_on_node[node])
>> +#define cpumask_of_node(node)  ((node) == NUMA_NO_NODE ? cpu_all_mask : &cpus_on_node[node])
>>
>>   struct pci_bus;
>>   extern int pcibus_to_node(struct pci_bus *);
>> --
>> 2.43.5
>>


