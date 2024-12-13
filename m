Return-Path: <linux-mips+bounces-7019-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3C9F10B5
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 16:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAA891881A28
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 15:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5571E2852;
	Fri, 13 Dec 2024 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l8kwmgbC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BInhiLZb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37001B412E;
	Fri, 13 Dec 2024 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103076; cv=fail; b=fLSEVU2nzzTKMwF144ABvieQhj+3vtNK+xz419m3fjvVC4364QlLBh3yrIRXDgaLf+nLZI49s45J2FepsObdYeftYEJIk8HoWBDJrH071R9SZeroFegp/u7EWoGZtVBVbFKLXGqE5X4iF5L/PZtYYFe13c6B3Sy2n0/2SVyTlFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103076; c=relaxed/simple;
	bh=uCROcOvu0Lt+4YtYB/tpSa+JddaDr+aJUe3IEfV8E3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HznUhsfzkuZAxkmb5BZZvf4+RFqJHts1CrtyWKzzy4pCnO58Cd9769jQoTnrVELV7TGHBxTAVskVQ+/jNN5NHM5Mqo/InWR7k5RQ0ny79h1C9DTOfAR7k1zSb1wMbkr+E5af1tG39WmYIJJwO4pR7OaAY04rBNVwoosNnE3gG6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l8kwmgbC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BInhiLZb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDDjq93022538;
	Fri, 13 Dec 2024 15:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=; b=
	l8kwmgbCyfwID1zP500UUVjej1s4KSt8C7hACK3L6KhIvDenB49ydXUJcLioDmGP
	o/Rc4pXegfBDl73F+wNadat7lgeU2IY0wAWIgbd/vIfJSqwt7/cXZAYQDZPFug9l
	39vcLSOelDobOG6t5rAhH8dXsZvkMEbCobVf7BTqMF2jH7+4X+LZVBGTxPHJa6tM
	tV5OP/wqH24q8CobqflkCPOsibd6rmZKuHD85QL5XvtUew6D1sZuMD+D4e1gr6Ix
	exjMKkA9SFwImtZAVztdTWajoIaAM7delNEZH4U94ASZSgRkdvsVU46X5M/F6m2e
	Y2F2z4RDdrocsTKbxo8RpA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce89de1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 15:16:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDERs4m038157;
	Fri, 13 Dec 2024 15:16:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctk6xnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 15:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH4vdj1XQH7GqpWmUAE00CCpbbiwnK5xEwmaBv6OPzZmAXHqplgJAVw/6zanqjdgMDwnmdpmPNIz/6sj0AhaOV6Cl1qRAIR8UnIEPJUp+OcgEXQf7Y5bJ0KHwgGqucas8E42eSJRpi63yNlu35Gz5aJqhWOBEMjTS+5uneRye3EZ2bezRtXUp5ajpcfrQL7w/X3SEkFYSvtq/MOKktZf/2O4RVYBwi/San07PTp1sJeyM8jMMH+CN0MTbeoZ0BT+3XtCHlvMhP350XHl/xNlN17hMGoMrBMN5aWlxa4uXbgGPLtRtlAO8Oaf30MwBJKXYqhecsJjQADdGcgomwLtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=;
 b=SRA2pGLzkDbAUFK2uvKwKSXnio0gxIlYKNgjToUan3x+pnmi3iXfF/tZpQ4g7frPl3XgtV28xh3pInTK8iu7TG+L88YcRW4QZaq9TovkbXA1IhngSKXKu66h9Jgwas8MFhi2zL29fl6E53BZwEds1CMi8Ki6faHuhdShjFdGbx4d1L+ZKqKt9dkhxttDPCP46RFHbJHz+lpF4C3IGvlUIJUFdLP7v6LT8xk1n+1lR0rZ5D6g+3GkNv3BahRbJ9sQ0op6ZtpITtQo1/cX2rtGe/Wo+tp13GnqHPuPjxPEeZDA5RiZuqWdv3xzjEunsQDLpa6xp5TE+BZMRuSKxEi7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=;
 b=BInhiLZb+C8EhaiqbGNnh/5N+rGFh4bvuLpSCH0pcuxgIf4dnJr8ZDqfY4cUt2n4Bzb+2scipyuggbCvgs8nr1Zln2GL8J40nVMKj43mdrY4vbQ/k+nmWBD++x4fNzksAf7NkNktSVRJ3KdSUDDAdKrBXDFEU6P+hLl4+g3ZmUE=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB7327.namprd10.prod.outlook.com (2603:10b6:208:40e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 15:16:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 15:16:28 +0000
Date: Fri, 13 Dec 2024 15:16:23 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz,
        yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com,
        minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
 <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
 <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a139600-7006-4ccc-153b-08dd1b891db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHlSNTdsTG9US1lZaTVxQXRnY3ZRVTlFSUJRVE5EYkF2WndWQ2tIU1VJNXZI?=
 =?utf-8?B?NDB0M1RQbTZxNVk3VUY4c2FkVmJyTnpWQ3dwTGY3eFVjcXFZTFNsN1Z0VUJG?=
 =?utf-8?B?UzZjc1BVZnRVMFJNMkJ3eVIrUzlmNkVsQ0g2VHByMm5aVkZ0QW5ZVVl0VkY5?=
 =?utf-8?B?UFpsRVdXQ3lIZGE0L0oyUXFLTmc1Y3RoWjlCYU9nQmRnTWlpRGpqZUZxY1pR?=
 =?utf-8?B?Ym1HbEE3NTBmdjR3c0ZWN1VYZllzR0pzOHBONlhTMkt4QlBvQjhoS3VDWldq?=
 =?utf-8?B?bXJJYUFGYlYwUlQ5czJ1MnRMY1JlY2RMdkxqTE1pVVFSNGV5Kzk3YTduaGZv?=
 =?utf-8?B?ZEtzeHpwOXZ2QjJHVXRnTUdlcmlxbDdYR2RNcGdrNVVlYzZ3SGwrdFp3VkpF?=
 =?utf-8?B?ei8wZHQrdk1DbWFVd3V6YUxlcXh2MXR5TnNvbUx3cisxaVhqOVltUjdvL08z?=
 =?utf-8?B?ekdVaWZNV09hdmRENWdUbDRQU2p0WkJVTWdOSFB0ZVpuMCsrTXAwUzE2YkNn?=
 =?utf-8?B?MzNLNFBCWjdMTW5EVC9tL2ZtSmJHTTd3K0JhNG4zWkY5Wi93cFI0WjRvL256?=
 =?utf-8?B?UlF1c1d3bGtUMEU5bHU2QU9aNGUySkczaDV2ZFpYNVpyZjZRWWlqUmJVVjhC?=
 =?utf-8?B?cmtTSU9ia1o1anhEM1R3VXFvaHJid2xCd2lVRFEwRDFvOHcwVGxmQUZXK0VW?=
 =?utf-8?B?M2ZLNW1OV2FVRFd6dXh2dHFmRkRoejdxbUJSZGdmRjc1OSthbUl6bG02WE1O?=
 =?utf-8?B?UDVxUkZhNmFmeGoyZW91Kzg5VmZHQjNrMFZubVJMUlpIWHo3elNVZlptbWdB?=
 =?utf-8?B?MzRyU1dDbjZvS3Y2dDRuWXpmM3ZPRElsT2l2UUFtaUx3RkFwcHZSRzZTRXd2?=
 =?utf-8?B?N21lNkppTXhzdklnSHhmOUVVcWg3UWxXQ2t1OVBJTWZseHRtOHU1OHp4V2tr?=
 =?utf-8?B?bDBtZmlGYmxsZ0Y3K1poaW01ZTdlRjRtMVNXemVtRWhoQkVMTEJHY0pvNWhP?=
 =?utf-8?B?MHlIcm1jY2xXWGFuZmRTN1Rpbmd6WkRvWTRjdmptNzBIRXphRCtsNmVPayts?=
 =?utf-8?B?Wkh1WjFEL2lYTTAwS09LZmlPVHMvVFF5b0dhTk8zdktudVZSaFQxaTNIYk1L?=
 =?utf-8?B?RVVZV0xzZjd0aEY3ZVM1ZXJwbVZyZFBqa1F0d2NkSDR1ZzhERlA5cEZrQjRC?=
 =?utf-8?B?UzdMa09jY3hFdzFveE5HWGcrQXBYa3NJSThXd3dvcXR1YVd3N1Rhc041QWRx?=
 =?utf-8?B?aWtFU1E4eE1NY2Zhd0MxT0J5VlBINEh4cysxR1lGQ1VBTEZBcjRYN3FsTlM3?=
 =?utf-8?B?T1NCeHZjdzEyQVB3QVR2OE5qditOeXdqT2pwN2hGWklDbmo4ZTBIbkFHcU9E?=
 =?utf-8?B?dzVEbVdKUHRocW1jd1lmTUVTVTFUanJJeERiOC9jL250YUYxMThRMDJ4OGQ0?=
 =?utf-8?B?VW84RVhReXJFbWlXTUNEQ3lmWTkzOEdwV3N3LzF2amd1V2dOVzdDdjM0dHRE?=
 =?utf-8?B?MDVyZ3l1c1NuOTlxYWZMcDJJMXExQmh5REs3T0ZhYjlZNWN1SkpXamJTNlR1?=
 =?utf-8?B?RlZTZnd0WjhkOGRMcDlJaitpTDJTNmN2VFQ5OE9VdG9TQlBaSjRPamRTMTJB?=
 =?utf-8?B?eVRWSE85T1ZHNjhrOHl6MUcvV1h0cFFFQnF5dTV3cW9pUTlINlN1cjc1RVhs?=
 =?utf-8?B?ZytPcEVxWDVSR0dvbGxudE5zRkY2dUlDdUpOV25UREY3dlo0d0xhbWpId21C?=
 =?utf-8?B?Q3ZseFA5K054eTNLSlBOSEpMNC9KZTRZQkpwWXF0bEFtc2JkbDR4UUgvcy9I?=
 =?utf-8?B?SEFWM05VaTIvSnBRMjJTMGowRHVFcUZOZ2FtUmdrUVdlS2hmWnRadXJlTDVQ?=
 =?utf-8?Q?a7B5faAgxHw4e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkUxMkd1T3ZpdWtoelhVc0FtZk1hMTJrZ1F0MDlrYWJVL3FJVkhXMWRwNFZu?=
 =?utf-8?B?TlVudU04aXFYeVpEQlpxQi9kSnVXYXoxODJQeHpNNHhXenZlQ256cXJYRTBt?=
 =?utf-8?B?dEFBdTNzbEVxS2ZCMVdCMzU5SWVzaHNNeUJLbEZEbEwyeTZxc1lFY09xRWtP?=
 =?utf-8?B?dTV2V250RDBwdG9rOGFEUTFIQk9PTldUa3JtNkRmanpOamZuVmJqT1ljV1hm?=
 =?utf-8?B?Y2x2M1kvOGZZcFZHK1psZ0h6Uno1akhHUTJSZHVWS2Y1SnNvOTdDbnQxbHBh?=
 =?utf-8?B?dmtjYU9uOTB0SGFBU3RvWkRYa0xtUDhvSW1wajJDUXRVNytsaERMS3lpMkUx?=
 =?utf-8?B?VjBrb1BDd1lFcjlBd1NyR3paNERieDdTU2s3ZTI2MWFyMm5aYzlKcFErbmE3?=
 =?utf-8?B?LytuRVczS3B5OFV6MTEzK2RaRGRncWNwQTFQYU1oUVJrS1RoUVVxc1Z3N3Vn?=
 =?utf-8?B?UXFKbXIrZWNQVVdTTGN5ekxHL2dlSXZ4VXg0WVpJU1dlN1dQbnZ4bk1mK0pI?=
 =?utf-8?B?QklWWFhvUG9WdkxFWFRyTHVJaktTTnJtZWVvZEdTYkZWNVJkZy9CYTZpdlNC?=
 =?utf-8?B?YTl4eWpmSlp6M1d2SWU1Tkxkc2U3V3RsNUFzc3dQSWNYRDdnSkZFUnZ4enc4?=
 =?utf-8?B?MUsyQjV0VVhZNjk1Z0RhNzhwTUFCemJ2dmR6ZGhkcXRLYk5NNDVxNEwzNkJl?=
 =?utf-8?B?cGJsWVgrMXFUQ3JNNlB2ZHU4eFRvdzhHalhKaVM4WnR0WDd4cllrTGsvOFNk?=
 =?utf-8?B?dTF0VnpBbDNkc3dnM3Rld3dPdjdENUhjOW53YWprNlg0Z01OZTNZNnl1TGVl?=
 =?utf-8?B?QmlxbTZwSlVYSEU1dzNURkxHdVovVUxwYmVSY0dXNE04VmhwRlQ5VGFnNDg0?=
 =?utf-8?B?Tml0eWdqMVVJMHhGNnR0WFlreG5GWE5ua3Z0Wmg1bEs2ZkVVWFg5NGpGK0or?=
 =?utf-8?B?TDh0N0tENVdYa3BmeXY3YmhNNzZtY1ZCZVpldVJLNFFXdG5rZUVQelVWak96?=
 =?utf-8?B?ZVFOVWhodExZNTNrbTJxYXNheE1NK05sRXcrSVJUYW9RQ2xWUWlkak0xSS9K?=
 =?utf-8?B?RGFjbG4rS1kwOEFMSTBXVnBzeVlxRmJVdVk4T2tya3YrZWgxaDg0TG5NZktt?=
 =?utf-8?B?RkdLbkN6UTVkeS8xZkZyaVZPQWk3WlFObFlZYWhTOERCOVh2a2gxTEtsWTIx?=
 =?utf-8?B?QkFkcE05NUY4VlY2MThDdkYweHdFbFlXYU9WSnVQV2xSOXkxK1gxRnl2T0xK?=
 =?utf-8?B?TWtEczFMSDBtQ2s0N0ZtL1VkNmgvSDk5ekJlNWI2MFZlWlpCU3lEYXZ1bVRP?=
 =?utf-8?B?a1NrS1RyeldMZUx1NFFTVkJjNHBGRFliWlZYM096dnpaV0hqQXdZcXBNWms0?=
 =?utf-8?B?ZkFoSHRBVGRkZDBaejR0dTU5ekw3NXZpckNZTWxrUDdpdDBtZFlMMll5TExR?=
 =?utf-8?B?bWNidTJWKy9INXhDc0tVWG44WnJJcUxhS1VUOFpsdGRZVnRna0dNRTNZSnEz?=
 =?utf-8?B?Mys5Q0dVbEY5YTFWaTRhSk5JSTJYOFBiaEx2bHp3d045NnpGK2ZaKzRKalpj?=
 =?utf-8?B?eDg5NEt1TFpTTTZSMGM4NkZFQnhjN1JKMWh3NUdjMThkZTZKcVFYS0hqQ3Uz?=
 =?utf-8?B?RlVNaGk3YjBUZFpZdHF5UDRBTm1ZVzE3Q2l1QUduOU9yQ0RJaHV3YURPK1RZ?=
 =?utf-8?B?a1Zlcm53TFpjcldrUVVsdHNSbzQ2Q25PUHVTa1U4MkpaelFqeVVrMTl5MDRS?=
 =?utf-8?B?SFdPVEFMNFNHQjlwNWtiQUhrLzM5NStHWUcwK3Y1b3I3cGpvalJzZFlCY29p?=
 =?utf-8?B?SFhyV1hQYTV1TXY4QlRZUFNublRyZDcwSWFCNjlhR3lyeGhJT2pRT3lCbjZT?=
 =?utf-8?B?RnJFaGIvMWNFT2RqVFRsZFRxQ0l6VUFKZ2srVEl3VFdvdUJLL0hiaVpmUC9m?=
 =?utf-8?B?M1RJaFJZb0ZSeWNxZEttVXJFOEpiaGVjZUlTNXpDMnZFTWhLb2g0VXVNbU02?=
 =?utf-8?B?SnVMajdib0JGOVdlazVrcXNQb2RTRWlCWFZNT0c4UCtIMUloR0FCMUFNMVBu?=
 =?utf-8?B?UTNCVFhabkNYWjllWDZyOVF0djNKdGczcE1jZVpTaGtVeWhpTFBOOUlzWFVR?=
 =?utf-8?B?VGdiRTU3aUlxaitTK0EyVE1zdklOV3ExSGloMHpueVlCK3QvRUFMd2JtOG5s?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TPQ/o4I8a16iJupjMMt3+EcahwbhSBl1attjn3XIvnC9/qwAgeJc0OGUlsU9s7kwJZrBJwjFX0Tr8P6qapX1vfGhIgx3JDjPqiSfEeGFbmVtXjzYuvCtClbvmk1xJdpMCsXaZlTLvzAFtRDCjiw+Qxb0v3Pb2ZHZupxxnVGkDMjFluOVqebj0XMNIM/qFvtSaWev5xMejXSTKu4wfMQQb1PCpR8J2axHCeiNRbFtEKdb+OfrWR7rien9Y3Wyf6oZOortYyKmupbqFM+lzeIl6C2Zyw3VV9wgoyR9TpBc1rLk4tGx8g3P3kAZaahvcPb088BCxAUGvmiW9EAIL/6ZW3XAMU7rVkrb0+lPpIH7EMRi3eIzkk46AemibJh4koEqXcvlG4utnEYORddWV5IDtHzxZ80QsGpw93xJlOLrczcMYcMsJZhYB0U39JY6fUG9Fc35Cojf5IxaE3lnGBomwbarodsFMSZrZuO8/qYTM5tZEaQwktnURpmXCk8bCdywFWRZ+5ErrJl/tyj94b01eTKDjePzphmnFnKnbaiDcW2c+z+3I6jjzq2f6+eadvgbPmUG7dt2KaiCKGLDWtjceqF2EN/nq4v6uJeMXyavY58=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a139600-7006-4ccc-153b-08dd1b891db3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 15:16:28.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHOT3CtpasFu5LPpzrUGqvLEvhOiENUXIPZ94+g1lFZNyBP22D38/SpVE6f14YrBX9FerilcZahQCfoOEUXvQmdC0UiLKus+9cLB9Tue/g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_06,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412130108
X-Proofpoint-GUID: Zb1VRrOwpvVqBlcnZc9VixKZF4E6txUD
X-Proofpoint-ORIG-GUID: Zb1VRrOwpvVqBlcnZc9VixKZF4E6txUD

On Fri, Dec 13, 2024 at 10:06:55AM -0500, Kalesh Singh wrote:
> On Fri, Dec 13, 2024 at 4:00 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> > > On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > > You've fundamentally violated kernel process and etiquette. I'd be more
> > > > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. This is
> > > > totally unacceptable. See [0] if you are unsure of how to do so.
> > >
> > > This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> > > and it seems reasonable to assume that key people are spending their 5
> > > minutes to scroll through the email subjects.
> >
> > In practice we did all miss it, and I don't think it's unreasonable to ask
> > people to run get_maintainers.pl to avoid this.
> >
> > In any case, I truly do think this series works better as RFC, I mean Liam
> > has already voiced the kind of disagreements I share with it, and we need
> > to rethink how to approach it in general.
> >
> > So if this is simply sent as RFC with the correct cc's (and ideally with
> > some review feedback applied - a better cover letter, etc.) then it makes
> > everything easier.
> >
> > As mentioned the timing is unfortunate here, this is a series we really
> > want to make sure is properly reviewed before any chance of merge so again
> > this points to RFC being the way forward.
>
> Hi everyone,
>
> Sorry for the delayed response -- I was traveling and didn’t have
> access to email.

Ack.

>
> Thank you for the feedback. I realize I missed some key reviewers in
> the CC list for this patch.
> When I ran get_maintainer.pl, it returned a large list of recipients.
> To avoid over-CC’ing people (which has been an issue for me in the
> past), I tried to trim it down to maintainers and a few others I
> thought would be interested. Clearly, I got it wrong and missed some
> key folks. That was not my intention, and I’ll make sure to fix it
> when I resend the patch as an RFC.

Sure thanks :) Much appreciated. Sorry to be so curt there, just I think
important to underline.

We just want to make sure we can find a way to get this series sorted out
so we can get it merged in a form that makes sense overall, ultimately! :)

>
> On the technical side, Liam is right that the copy-pasted arch code
> has inconsistencies (missing checks, order of checks, ...). I agree
> there’s room for further consolidation. I’ll take another stab at it
> and resend it as an RFC with an updated cover letter, as Lorenzo and
> others suggested.

The most useful thing here as well to help us understand would be to write
more in the cover letter to expand on what it is you ultimately what to
achieve here - it seems like an extension on the existing THP work on a
per-arch basis (I may be wrong)? So adding more detail would be super
useful here! :)

We do hope to avoid arch hooks if at all possible explicitly for the reason
that they can be applied at unfortunate times in terms of locking/whether
the objects in question are fully/partially instantiated, VMA visibility
etc. etc. based on having had issues in these areas before.

Also if a hook means 'anything' can happen at a certain point, it means we
can't make any assumptions about what has/hasn't and have to account for
anything which seriously complicates things.

Ideally we'd find a means to achieve the same thing while also exposing us
as little as possible to what may be mutated.

>
> Thanks,
> Kalesh

Thanks!

