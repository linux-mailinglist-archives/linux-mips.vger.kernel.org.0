Return-Path: <linux-mips+bounces-8620-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7BA9203B
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 16:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA7D16988F
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 14:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C7374BED;
	Thu, 17 Apr 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ClQFD1Fc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z8/nZ9+j"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0335250C1D;
	Thu, 17 Apr 2025 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901492; cv=fail; b=Kmh1lcp6olx3o4Qcb0X+wfDTSojLWk1uOOWAaPT9VuiRW80xcRjoEk+dBZ0m+8s2+lH9yCd0Xn17Bc7JrjS0tScgJ7KndmQsCctdRomviwhtw+h8+AjKH4cy5fgw4pXpbfKC891L8uoF7bhUpBUBpFRyZNTqmLxeRNiKMg710I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901492; c=relaxed/simple;
	bh=Brh5InMvtyd51WnPbrDbLu4jWO/pBZlUrH6fBWZMSjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pfeDPJh4hkozHVg9HbDap8PVF9YFfII6BtgzFtiwJ2x4oLreHLTLb7atfX6j0qimC9dAauqRm5OQqnxahBPbqQBi7Opd2IL5b9faipA+LRcSeEQExB+AaM+7yRhX4J7V3CQ6Z9MSVk+UDgJt0JNvm3FmNMI4ylcjeo7SCRQx0GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ClQFD1Fc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z8/nZ9+j; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HBpd0O002448;
	Thu, 17 Apr 2025 14:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=eohhg2mmHhROrmnBXP
	G7c925vNLiwi+CDpP0CEmcUGI=; b=ClQFD1FcOJ2T+s4RrAT+GP+WRhdlIjqnXG
	W1AnjayD9dlM7np4rxNpJKZjlL5O1eY/eItUkaS/pPZFBRymSfhH2EtFWZ43UGwV
	XiVT4M4dTzg8mPDReXkLCF8zHg24vvLKb+Rf9fCzga3u4qcMdN2lzFTkmMBR3SJi
	N3mMRTUkQp6kxZmy1G7ZqpN7siSb2HZgbiDmSNKTtAAC6PTH3ZyFfUWrjtgUkXZA
	G2euMZIkVaOx30s2DWT0McFf/RedUG2ZIHPphJ/gK+GdNcKCZSDD+/7jntR/WDcj
	UlXUz3QfK024dcjVQMIrf9yTrmG6YspyqtBjL2EHXGGwd9AcVPcA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mxg71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 14:50:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HEP5qX038897;
	Thu, 17 Apr 2025 14:50:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4umuqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 14:50:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc7v1xCQoIf4sALLBKTSp7OYbMa/F6W3YuIrSdg5mBI2WyCALSc+nnqRfcu8EJy2Y11neo66iw3FGjcBDvxMGMxkHOJP0Q8s/8AruRIXTCSVbosu5MaU/CnDxfHQ7f/MeskIAu+YWC4rhd8viosDYU51MZE5YaEHbG9e+1pu8U5w8jtheou6RY3WIxFNv5Sl7GMMuWn9/uXl+5+KpwwOEDoVBb5m4z9HUhCTlVVjyCkIVb0Mh/Kls1yjaIL7X78XCgbIlErzDQpQV9z9TaSq3qGqdgY/WzQBEuMtBZOCFomEytedq94k0YDxd2YERAFFAdUuWimLoRUwPQOkKvf6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eohhg2mmHhROrmnBXPG7c925vNLiwi+CDpP0CEmcUGI=;
 b=b7//jcVQm0o98hucYgHQT+bKYUs2UXxN7r2WrmlrW20Q0MdHFE/qQfUC0PaNA/ruHlbknVPe2etyw25Rb01w+w67pHFwBs7qCrZrYCcBoaJ+3z2xU967PfeTnj9ymP6m8Hnm0LVz0bs0gTSvceBs/Z94P+pNe5hZbveJweMyn3XNdN9g8xxAcy63J5XRxs4ctpukmXfujIq+pA4oo0LBeJql7b56qEumPuHZuiFJBsdjL4RtqhFF9cTjUfKa/V6znIrMojQbHrSIqcxyxgY2WW1LYqPnhw4ljmulkEweu4jEPvdfQytZVe0VTloNx3UDt10SDQyOtL4Yuz9FLx0Isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eohhg2mmHhROrmnBXPG7c925vNLiwi+CDpP0CEmcUGI=;
 b=Z8/nZ9+j8xt2BeYx1NOV+jFa7RhEGdMp4HYISWDlYf17Is6lTlWPSlJ7wcqYJbitNNoRntS0Uit73Zt5dFuIknwOFaigYaolhZHlDmfiOEfXXDWSenJPY78JZzhy28z53S/Vs3AHv28NEqeSBsddLO8K9inQQu1DBd02XO7fWGs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7821.namprd10.prod.outlook.com (2603:10b6:408:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Thu, 17 Apr
 2025 14:50:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.042; Thu, 17 Apr 2025
 14:50:19 +0000
Date: Thu, 17 Apr 2025 15:50:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: WangYuli <wangyuli@uniontech.com>, corbet@lwn.net,
        tsbogend@alpha.franken.de, akpm@linux-foundation.org,
        jeffxu@chromium.org, kees@kernel.org, Liam.Howlett@oracle.com,
        hca@linux.ibm.com, takumaw1990@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        thomas.weissschuh@linutronix.de, tglx@linutronix.de,
        namcao@linutronix.de, zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com, Erpeng Xu <xuerpeng@uniontech.com>
Subject: Re: [PATCH] mseal sysmap: enable mips with LOONGSON64
Message-ID: <ac2638ea-d44c-4b3d-b7a4-12862c7d58e9@lucifer.local>
References: <7EB087B72C4FBDD3+20250417132410.404043-1-wangyuli@uniontech.com>
 <dpagj64oai5yn45poxfr36jtliwpbueu3pvhbrb5flxgu7hnql@7rarpfgkf6wz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dpagj64oai5yn45poxfr36jtliwpbueu3pvhbrb5flxgu7hnql@7rarpfgkf6wz>
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: b260f0ad-8c68-4b50-b60b-08dd7dbf2c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tf52KR6Z/OzBXjuq2iUSycso61qVj/gkkIF3Uu8VXKTssLc8SRP+E5zdmjHz?=
 =?us-ascii?Q?VQa1qlrUTKZ9srtAPVzcf4oolEhqfI9AK6D9ikT/05z9zz/c8w9Ja5GcNcGd?=
 =?us-ascii?Q?pFaox2v7wN0txQ7HqwOUvM2qF6uIrtKAwY3D+a1Xo4JrInn/FW5/RJk811Bp?=
 =?us-ascii?Q?/Abcztgo/r/+53E+Oik4lHIIPU3ITtmbPRJDrC0M+q3faZsm8RkHmdb/i9Jk?=
 =?us-ascii?Q?hpk8GGOc78eSO5CPMZtRRbqpjNNhvKJUrba2d2/rF2ty7Q3QmNJZ1lbethCe?=
 =?us-ascii?Q?ZXuhwYKRVEE4YN/jtj6i0ZmO2cs5iJ+C3chJGeP7TZoGF/1Ye6kSmToO5QOR?=
 =?us-ascii?Q?ireApHHS3oJVRo+TLe9z6tIiUZRu3A7U4JP4ZRRoKZOJCcFQkGon54av/9eF?=
 =?us-ascii?Q?7xzO7bp+lU05HRh4UjfVWGDz7KCpSTttOZLv60L5vS7veIz2iujJjn2tK9tr?=
 =?us-ascii?Q?2dLG24vJVRYYNyvv9i8GwNTiviMs3AiWaYvTQAaF2sAKR8CLO0mXGi8OS/br?=
 =?us-ascii?Q?3MXzV15S+GSNtFGR54rCyTfwtXUB+0ol+CFFRHXBtMCMMf1dUHNkR/Rpa0+9?=
 =?us-ascii?Q?NYc88nxbSA9OZpKaeMgqzHLgg7opWRAaeAE+5drU6/bqakLm8SrFfskiCRvK?=
 =?us-ascii?Q?xU4KG+xxJfFFs3aJXzjGXlWtDYJPtQfA01O8uN1NJjQObZTxP59XqG1XTCUZ?=
 =?us-ascii?Q?0Id3svU7XRoxG/XC8wfyZbqDxmQwwxyQIfLaZ4CXOn+EIId8w+9ebmOkJKcJ?=
 =?us-ascii?Q?KHG8hFp9CrupJAHufVa/V8m/ZXCL28R6zd3hq8b2NQ5I02FupvPIDV+1LCsa?=
 =?us-ascii?Q?OKDhYGttHA7miCERsziYYwbctAF2fhEpt9eb+xRgi0Dgxi9Bwehydf8b/0R5?=
 =?us-ascii?Q?7iIDqi+nTuxdHRpEheW4+4D2jHy6gg1Iak5SUmcRT/teh4kWMzxkFiFUCkWT?=
 =?us-ascii?Q?VPLnFJPhoOc1f2DYbIKPjlK3RVFkJkP7vzunMR3wJP6Y5cZsYpcH/5ySutdx?=
 =?us-ascii?Q?c8DfYr2Mbv2kol6414NUH2yhEQ8y9b1GPxGEC/cMdVZw72mgwfdnGm459qeL?=
 =?us-ascii?Q?EPdPZj/v5kyLE7zSCUdPTaqa9eC3/dQWL/Zc34rF3P2NuQelUKMkiho8ihz8?=
 =?us-ascii?Q?j+LAUrdcRctW+7/tcKh3GaANMUE700OvBlM/1L23q2jL8RA3EIYq5ISajw5+?=
 =?us-ascii?Q?zs7I9GVrJT8rKQYe3HoKTJd1aZHgQjd0QFd39keZLJcbOYdHkmYRiD/AUtL5?=
 =?us-ascii?Q?AqFSjDXIReqSB4knn3AC+DJqXv7vlDAUXWJ5TY7KZycMngJWtVoja6UKoFc0?=
 =?us-ascii?Q?R6XEghjY3sO8TTJCHgGqXZuWX/7S3g6IA/LRMbaypLhhgVqn7azBQ8Mv2NuV?=
 =?us-ascii?Q?iGPIm31XDbC+4+Eo7uaivZAoKtwPWocFPv09/MxMCHSOZgYr+OxXsEcmS4wa?=
 =?us-ascii?Q?iJECggvxM5U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FC+MnDWaE/Aqt4No6E8vTixQADuK535QWzyl7ra5lTpMkozm+n+GwOXpjXMe?=
 =?us-ascii?Q?Tfu07+zruKMupCXrg9rlAED4sDN9RuHSDKJbNbc5QBqi7SghbKhXB5G+DON/?=
 =?us-ascii?Q?iO/5uGR92DPHmZnt0Wtty5Mhmrhxxni/DOn3TD/lzy4OlJRdwgqLUI7t0u34?=
 =?us-ascii?Q?h32pllNkX176xz8JalEptzGd//4XVEVgxUYmJ6LU0gFseBx00tAtt5CgnVOE?=
 =?us-ascii?Q?7aFWH3uAvZI0S7PSWZjMagKpdw9ax3BwA9xW2jr3XGoCbAvykap4l4i2SDIu?=
 =?us-ascii?Q?jAfxhLSvu3broPzOVE9wif0SUpLtIQsMo9fImpRlC6FobQ2V5j9zPiyykR6L?=
 =?us-ascii?Q?i+letMkFrlMmqyUi9yogN7JJpAIpiLUTbIT9+igxVK54GQSFL9IDahS4AAQG?=
 =?us-ascii?Q?cCG0amfOKJBGorbO5b4Jg1c2B+7SjRC6sSJRwoRiAYiHDpHfzuz8KaLBGt8a?=
 =?us-ascii?Q?hH79qGuprldAvOWUxOUycrqHwiua9RxnsMVCQmTYU/NGnpsAewgIVW8YjBAW?=
 =?us-ascii?Q?KX8rsjVFS11Kc0VAlnnSaf1H2JgHjE2jBqophSVGZNEV5SumsFdJaDbYYHnP?=
 =?us-ascii?Q?ogblHrqwLXFJtlO4aJDenJdOOs4dh8nrLntyw58obvoAY38lK5746wB5EWqm?=
 =?us-ascii?Q?YVAPYnRBazIcMf8KkCa+C+3GF/00JJtsFmK9Du9NpeYZK8TAB94K6ax6fS67?=
 =?us-ascii?Q?hNDXZyZ+Was0tjn64zI1hox9kgJsCqcuNzW6Z4oIf6haSiT39jC9vDl1uP6D?=
 =?us-ascii?Q?Zn88inI2NGUg4PEQ0LF7woQVyAbsfEjH7FGpo1qhw1tWh3Bi1SCPCk6n3qKC?=
 =?us-ascii?Q?EJWlrl8Snz3KQkV+3bAxVH72iVCM7YKldSeJz56S1qcKwnM5W/SIsB2E73HR?=
 =?us-ascii?Q?LOguSCIoLNJb1OZ9Hb3H/bZXLQHrTjurow/l0Yfyo1ri2hy6tSb7Fnlb90U0?=
 =?us-ascii?Q?kcTzKYBUF2vYfXV2mYCAV3PT8Rcx4+Y3lJCzbxqLW5HdCqBktkZ99ehN5xDa?=
 =?us-ascii?Q?0BPUcZJO1frj/9Wj63wuHF3Rw57XB/hSU2r5cmgmxCid5gO5rW2c8LAfVSqP?=
 =?us-ascii?Q?DqddOTxo52rxudwE/6NqgG+0TCE/s2yNGbbF7cINi2nkwDpiOReg8YOO2r2C?=
 =?us-ascii?Q?bFtUuG5p3QJ7nJCWpavbA9H6rD1JleuoCO1yN9Eb1G3MxOwygLzVXKMaBTjA?=
 =?us-ascii?Q?ScVnQQHwEgYfEXy07ENxaUlNSQaqqueQMSQPIhZx7ndrBBpYi15kJfn5CO0L?=
 =?us-ascii?Q?BJSSnlVOkqeUbcXdYx17QK4oCt2c+s4mG6wsrtZ9LYGk7BTDssr62iEY+zvk?=
 =?us-ascii?Q?QthZvdNlR8hCyCKDsJMRbXVYOu+JMbbyM8A3cbq+JxNQnaiZiEuldX+QjXQ8?=
 =?us-ascii?Q?rV+EtlSvQD2zz9KY+6ylSSXzh/h+nGiHlh44I5nUaAZmUR6GZ0jQics0QPVx?=
 =?us-ascii?Q?9I8pGULje4UY9bP1hURuDxtq70maTjfpbWpSo8Wef0W0gjMGvqSUe/V9mSHw?=
 =?us-ascii?Q?NdCqKDmTcdNwlzajXTF0AfIiz6NAThkRMqjxucNZUbDEj1hkr+CHGsF1QZm/?=
 =?us-ascii?Q?gFq3NO0zjK4kebt1yuZE9ex/OuOAQ2wPosnyLwq+KCgqvzIQy6QnSMXrfeCw?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3pjW21t8tozE7qMth2LW23PwTmhptkO8VIg0RjzqnkAc/v2zc/0TrRfnpfsyRIjfEFabsJM+U7UyPDLOU/am1pBNwnngwnHOCLBH80mYR07VzEi9xagf6XEs3TSyLR6dBlo4p1ePn1DLMpF1VMmwfiNVOowjMolzIqAwkyQCSwOKin9I3hs4fUuC1xE1dudcdSMzf5XjvVXO8QBLSXmJ7D3j8HVVuOMog8dmOq7tUdhLdoK9iE1WzaRf6Jyg2PvjY0u0PizSlBvhYBuvkcu/rCaK0fOf/2XP0HjyF1xzT4KiPkxeOiiKfqoXDTv2Z7hGKa28snqQYAa/Rhq7WufYlaKtUOTpo+rGVZ3mXRp+dx+5Vu60YLHLTPRxrO7IrIzfN4ruCqT8IOrxaPlD0GZt4tT3JAzZXPDUdzFBQhv/dQ72ym1MNxFCWDTFeYTPKgdcdZbtDTQuagFEU2GPufo3Zl1o15rQbYBWkn52zQM1R/9Q2YrOH1LjVFonxFtxs3Ix+7N2VemtTmfp77KfmwhQZIlbhwGJR3MOSDvzuapBhHkmT6zfo6500FrjJi5mU/xz8WPDXRhfct6IxKGW0xyo/Ar6D2NYB5tRcvysjCwaeBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b260f0ad-8c68-4b50-b60b-08dd7dbf2c11
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:50:18.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEQCuSju/Tm2bA/gbJTRSBEqf09ecjujx8Iavo8zct+ERdpNbaZFCCLE1sic/8ndunVH2tdUmFLbmiocELbD8JflAfSnvOIafgmBhBOpzRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7821
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170111
X-Proofpoint-ORIG-GUID: abA8LQkB3fbg55ocxf4OsJ1g4DHVJmHw
X-Proofpoint-GUID: abA8LQkB3fbg55ocxf4OsJ1g4DHVJmHw

On Thu, Apr 17, 2025 at 03:27:16PM +0100, Pedro Falcato wrote:
> On Thu, Apr 17, 2025 at 09:24:10PM +0800, WangYuli wrote:
> > Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on mips with
> > CPU_LOONGSON64, covering the vdso.
> >
> > NOTE:
> >   There is significant diversity among devices within the MIPS
> > architecture, which extends to their kernel code implementations.
> >   My testing capabilities are limited to Loongson 3A4000/3B4000
> > CPUs.
> >   Consequently, I have not enabled mseal sysmap support for the
> > entirety of mips64, as I lack the necessary devices for testing.
> >
>
> I strongly suggest we don't do this kind of stuff. Lets keep things simple and either:
>
> 1) Check that there's no problem for _all_ variations of the arch. Then enable
>    ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS.
> 2) If not checking everything, then don't do any sort of enabling.
>
> It should help reduce confusion.

I agree, I think this would work better in one go for each
architecture. There really is no rush as Pedro says :)

>
> And, to be clear for folks not following mseal, this feature is rather small and not a
> priority in any way (and will not be enabled in linux distros for a whole bunch of years,
> due to the current situation being unworkable for !chromeOS). There's really no rush
> in having this enabled for all architectures.

Given that a bunch of userland is broken by this, it's unlikely to be
enabled by default in any distro any time soon (at least sensibly).

So this underlines the fact that there is not a huge amount of urgency
here.

>
> --
> Pedro

As for the kind of checks you need to do to ensure there is no remapping of
system mappings - generally tracing through how VDSO and VVAR is used
within the architecture code suffices.

An idealised form of this would be somebody stating something like:

	I see the vdso is allocated and mapped in init_vdso_blah(), and
	from then on in the address of the VDSO is referenced in a
	read-only fashion in internal metadata field XYZ, equally so VVAR
	[similar argument]...

Something like this would suffice, where you have traced through usage
patterns.

It might sound like an ominous or difficult task, but generally when I've
done it it's taken me 10 - 15 minutes. If you want to be thorough you might
want to spend a little longer, however.

I also would strongly suggest providing a motivation for the change, as you
would expect with any series - right now it is essentially 'just enable X
for Y' - ok, but why? What for? etc.

It's really vital to ensure you truly understand the feature you are
enabling, the limitations, drawbacks as well as the benefits, and to ensure
you understand what might break.

If I were to bet on it, I'd suggest probably only one or two arches
actually would experience _any_ problem with system mapping sealing in
_kernel_ code.

Userland is curently broken for a number of applications (only the ones we
know about, who knows what others are broken), but this is known,
documented, and anybody who enables the config option is essentially saying
'I don't mind breaking certain userspace'.

I feel like I might need to repeat this explanation a few times again :) so
I may bookmark this reply and refer to it for others enabling this
elsewhere.

Thanks, Lorenzo

