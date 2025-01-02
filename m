Return-Path: <linux-mips+bounces-7219-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD49FF93F
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 13:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4BCF7A15CA
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 12:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C81F1A2658;
	Thu,  2 Jan 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GYmzFhaj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="a5BnyPg+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2264315E;
	Thu,  2 Jan 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819940; cv=fail; b=jn1UHVDVhBNw+/jem3yqm/jvGdgD7XlMcnUqi7Rq3Gb9zvEfVhq55K4/gy12KUaHWNlqMLXBuyJsz0dyKT1uuGxW+/b4IXSSNTngy2Irvi6m6PWrhkPH18CVRdl5ht2aNiQRvQW/6aUsk8u/dnoKxcatoEYkpvyLsftafKp7HlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819940; c=relaxed/simple;
	bh=kP8r98iqbq9kIZlE1LvLl+7ZV24inI1jf0Sa39LptOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KFiJauUwl1GwDdAJSNutr12nDsequ3KYaYYzggBptS1TpwBbUMlwt7rEYDbg6cDLjLWt5egHjz8xhlo1GNJAATreww+lnlAYGDZdsKuTyatJtq08D3D0joUbLhsE6zb+BXEHPYp01mm3/DDKjO8LTgmBjVCZpxrIyfkg96jlpw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GYmzFhaj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=a5BnyPg+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5029fwB6015143;
	Thu, 2 Jan 2025 12:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=OCUZSpybfWaBV8wr
	M43CO66RLwQYEJKp/M+VHXgeOOA=; b=GYmzFhajHTuqvO7uIqfzR6VSIXCgh1qy
	UMY0KNWTDd0iNKCdilM/iyJzXdyUmMSHec3ZHmYrwrK+e7zyIHR0K8LCO9eJ4qTh
	dp3U42lysasuN1aWKeI3vMNVn3SCBXnPfKwCeLnRKac+xaaPRA+8ErZkCgM80TCa
	11E1/qNHq2UUZ57+hPCb8Xm9m+4x8KNBioG+fuZPpBeO7l++aT8OiB3dB8rMo7h8
	hxaPtcvGGHicmZfMgWSxRX3EWVPrrg254TkjHoAwAlhPCwp16fiNH4yg9Xxh4PnE
	1D6ap7MmPNBQ/oW1DOJBCdygeDV8hEWsUoFKcIngzEnAhvruGkvtgQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t978n5wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502BKqwJ009071;
	Thu, 2 Jan 2025 12:11:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8qyfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 12:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx6XB+t9VBLUbw4kw3+zyUL/eMB+yYpD0Kq2w6zvbf5Z0OcZ1IkFvT5do40eAy78oMXFTuuqVBgKKYf0fbrOk9L/n8PkdSumyoCsKUCIXbA1OgH307zmBFdJd6T/m5sJccM0ozf+3XOOWe1BPerTwww2YgsolkwA8MThqdpVdjjJO1PB0unu7jYoPsdnKaBtsDGLyAKlF50PQlGnmCcPW2lqr71ufVbFBHVQPQ8u4FN/qE4SYbZZqJb3xKsqQjxQkUlI7iKJEogpiUrk9TBtA7mDM7NTJ3VMC+/Xfi1di2kpjdxRpcvnyg/8r50w0qIezDsruwXcsoHeILkN1JczLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCUZSpybfWaBV8wrM43CO66RLwQYEJKp/M+VHXgeOOA=;
 b=fnPjOdzqvNzSywSKf5eXOFCqz2UW0TTNVOjodNkjoZxWBqpPNWBxhz69s/V/X4mFD0dfBHXGX+pYQH/7dYP+A2jENppa4hPIx86/wUDUOjHAq9KTmsRQ8h50WPD4cqQbqLsnv5qvYy3yrZuehbuPU6wv3eVwBRa3cPVsQMeKWWcvnbOVKrjbbYCm1hWGEJ6Xm1tx3RbJcA499WhcaXsAJosC6r4bkWmiFkJkxkamANV6zQKyw1YZbaOHkQkEG5Grsxde6T3vKM5Zapb1JLvryMfdH3tUiqHeL+7/rHsWTI9fqmPwZjQ1f6lTZ2R82qLYTKVLcae3cbEdvHRiRJROeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCUZSpybfWaBV8wrM43CO66RLwQYEJKp/M+VHXgeOOA=;
 b=a5BnyPg+FPhgDbVwDfJuTIumrT2u7aAIQeyrigWHAf3nu4XcNzDgb/jS5I02Y8dxUb6y5Sz0I/rUxaZ62zmmIjAWMiWLZFH6ir5G5e845xKUGLk0M4gaG5u/lcbl+FVe/hlUjZiFums6gZbFy4SnDHpRO042PDdm1JYQbiZCG74=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 12:11:43 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 12:11:43 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 0/2] mm: update mips to use do_mmap(), make mmap_region() internal
Date: Thu,  2 Jan 2025 12:10:50 +0000
Message-ID: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e064b83-9d57-48e5-cedf-08dd2b269f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AJ50XCmHPiWHagrhlVcFFqdT+BGtoSvz0zQ/KpOgkNEkgKzUuCD5aypjnFl0?=
 =?us-ascii?Q?mWkM1VjgzvJ18QysAyzHo2d9W7VQ/qTKx3NMG0wkwXrPb99hny0U8HUbMljZ?=
 =?us-ascii?Q?K783jfadt+TO99dnk2W6GNeHwzJPqAGEq8+uNlL+leLpH5NqK5XGcbBP6sSk?=
 =?us-ascii?Q?kjUUhChTclCdLrxVnJ+fr5MfWQnmgV7a4UK1GUKt6ELHxzVPCeQC6k+bpycZ?=
 =?us-ascii?Q?vkGeXL1EJ7il3ej7az0ChKMvo373cKG4+NsykbL8bep2PeeqO7nh+LTqDSBY?=
 =?us-ascii?Q?yLxioBKNdr/IWolckR9lScDQYA3Fivy6ksrfpAjqQoHi4j20ZfjZag+jfuQ4?=
 =?us-ascii?Q?m1Mb6WpdLquqDa5Zj8L5EeQDIZNaFyDzjl0/Edrw6JR6O8mQc7ltrUx724zJ?=
 =?us-ascii?Q?f+a0xqGRj3KCm3RDCwrJk3fDOLGnkxuOZm2gewMjmnWj3AySZXwkbdHiONEF?=
 =?us-ascii?Q?0MNZlk1gftZarGn+vE60R2gqwH0UWG6T7UAKD+79CvQCpSPTCnvmTEZ8ZS9w?=
 =?us-ascii?Q?TV0r5ngY9WV2mm/J7O1D4R3dks4Nn5gGjcpD2JzZTJZF3Y2iJFNWI/mqLHFl?=
 =?us-ascii?Q?Hpm/R83XqPq2BslkXZmYtylPhvocWTkgAt/ypAuA0OffO1F+SogEF1P4EkDb?=
 =?us-ascii?Q?HbyZJZGE2hKRz1g1u1c/M1xdyQWhuIpZGo/5ZsVmeKySYGN3yg4psrLPnP6z?=
 =?us-ascii?Q?UGVfsSGrBByuaiKNmRzctvjxMcUK4SE83IT7NXVu2+uTT8oPqsAe1iFQidox?=
 =?us-ascii?Q?TiPwxVMaoAMMD920ZqYhaRtBg6Gzj7t6tgnxrPH47wZ29fzHoMlbOPErHTf1?=
 =?us-ascii?Q?FdNcx0MyvL0fgEyt/5jkf74f3LTFQst2GLiR4fZZCk9/DGs0pjTkQR1YrgjS?=
 =?us-ascii?Q?Q9QHMCYq9YLMjAojVAdQ02eb3ynkU96nbrbC9MgdZo14hwmpmnL0Iscxj4gh?=
 =?us-ascii?Q?y4CbA55JNI4q1QOg8VudawOebWKQlWeoFR2VuGJsK9gLS4hwCU3rvrHA3023?=
 =?us-ascii?Q?TfuDyA0kGebQNFiinBwwRKCzuE9NoD13Cf47DJzAQRlGkqHxJLZXzQ1usshp?=
 =?us-ascii?Q?ZI3A7OrrI8YjRv/oTBE264UfO37dErkbfdXoYHiCKyc+ApAIlxSkRs1ZebYb?=
 =?us-ascii?Q?bfw7mGa0O/NvT4pIuiT85ahfFUWtyeK1w0bFXMTetIi50lPZTFk5kdtLRvZC?=
 =?us-ascii?Q?G/6IUb8A8MmC8Qb+D5JGbwJ25J9CuM2WDnXnvPFYyOTBRQTfcrqWM3TsW+39?=
 =?us-ascii?Q?tQ4FPH3lo36fbYiFRAt/vuwPsKWFsXKfAQmanr+lHj7CMQiaCNuaZZ1VS5SL?=
 =?us-ascii?Q?SqDzi2DPs8qfIrc/djXpb86rixjTo3jc6hgOsjA7bL0Mb/Ynv4VYcO62QJ3n?=
 =?us-ascii?Q?Zziayxmvg0B05769dQLrw1AWNSCm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WFFMFXmdIKevbaUiAvIAxKE+/ftlKOw8q2WjqiW7AHBdki41iGXlUngC0E12?=
 =?us-ascii?Q?D8D2iOtO7Gn51r5PhbswO9VPPT8b52qCqnyJnRnTM9KAFXgDO2zLrk6WmwJR?=
 =?us-ascii?Q?W6DL9h4hLrfA06KPD1I1pkRPgZAx+sI70aCWBwKKl+THwdTBLslUnz/I8QIY?=
 =?us-ascii?Q?clTYkoG8WLvhsMXG8BMUcukykpX8tBq1t4TEgAQHzpcMV86qWwRprg7TZwQ1?=
 =?us-ascii?Q?LripyjJYcouVvpEfBIfKiDsv6NTRlWePwcEOEi9VG37mm9zvxwb2Kc16CfKb?=
 =?us-ascii?Q?t1pbpGdoRmqOm/QQnzYH8UkqN5+dmGpZqRcfXhhvxtwJVtfOTQVpcr0nRHCO?=
 =?us-ascii?Q?EQkqzSMMHolT/X2pEsHPgEk5CiDGgw8f1NgC+GBaFjfiMSuOhsy9VB3Or6K0?=
 =?us-ascii?Q?zey7Zwl0pI42RhAFJbzRocAsGk5d5Ggo605E78UDdGkKavAFGu3U4IDedzkU?=
 =?us-ascii?Q?ORK6iT7kq6ASJ0YXepCX/KF416iHzHVV0Vh6i04puPRaDwAvDOYGArRenAtM?=
 =?us-ascii?Q?FzM5dIXINZUZbCTV/eGsvcbMjeFFeSukjleiRUSGRBIDOdoQJOskZFxeHPOi?=
 =?us-ascii?Q?vet1zlpjlYTVKGQPdOKA14cD5L6xWeHUEo7AVS6k0nJ5DAlQzK/VEbun6JZi?=
 =?us-ascii?Q?ZI0I5r8wT5WB/6RUh1O1DttNm0A6HZgE+oimmqHVGTLlttIfKOB3qh4r7sxU?=
 =?us-ascii?Q?0F3IWITSZhISId+BYPea/vVACz2w3RD5UvHTZK5I4GMoLYdJ+tNMTKulm/GF?=
 =?us-ascii?Q?NpQoopdfxq4k5xs8oqAz1nyuFr/q/s7wCYBVtWnQFK6kfy4e1MQsLWEQPPCt?=
 =?us-ascii?Q?ftwW6k8BtNubrEVMApCq4tp+/3hiTzH8PHlDhaXhka/7CCkwkrdF95oNY9Oc?=
 =?us-ascii?Q?b3GtnNtGciEGovUVyzAmTGohcVvjD5yAZnUipJEySQraY+gkpzmG2HyrqHmj?=
 =?us-ascii?Q?RnLJ0jPCcXLjf+y9e1dN3Ctbdl3LGMvZr+YH+U43Nu4qqUtpCl+0FyV9MtOP?=
 =?us-ascii?Q?1hbVDKlwHPBjguybaqk8XSgjQB+5+IdKoRd86xOYp7PFZPQ8XeJZRx+UzWF9?=
 =?us-ascii?Q?3ZNw0gfpkH5XgKkCxw7pBbbvrN1+YHx07F/PIYSx5TnfFu4WRFo9u0QFirkF?=
 =?us-ascii?Q?dPQMk+b2AmnQlTnrlkc7WXGmwU1dDPt4nwV2TUqf15nHgz0Cq02ceHrhPKrS?=
 =?us-ascii?Q?D4WBMuMy/hOKQ21RaJDqjhQR08AGreUSorza4EbFOQY4RBYHnXnNhhshMR2R?=
 =?us-ascii?Q?jtgvgJ/rDZtervNz4WTHQeStgnbhKjOJM4JlmhFMERPViYjQtPXPVFNthmcu?=
 =?us-ascii?Q?cyzFoTWlyyL59GG9fFP+hOq4c/F25J6tnYIAN827HRA3akafIve35rS5AMjz?=
 =?us-ascii?Q?1sdYS43+KYGeDWV0PvUgg412JyL1kVVAfVC1Lq11wdLXDzuOf7DJTMiaozR6?=
 =?us-ascii?Q?3rkJPnhb7FszPd3R43bTXWSA94FO60utJrocXgXF7dK/tNOi28/tR26n0Scw?=
 =?us-ascii?Q?iEEV/ekFi3G4g0zkkWI58W8I9w1TX1XtCKE3yqEnrSV4MyspHlzUN8TX2XsE?=
 =?us-ascii?Q?mALVXJmaOqRstDHWguccjjPs7WCaMBy0h6g/z10wIVKbVCzfvGOXb/iz0myq?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zoN2rIz9e9mAHHy1k4ZwbqH+Rd5UuLvLnHE/pKDXn7QZHtabJ5dy0Kl942kthcdlyfI90NIskt3blMDFyH/jnBYiacI5hL/8nWF7vhLT47ZhLX7NRo8t7Wipr0wTJS6TcPW8tE9JjPH7MYfpX3TemRBKWZrFMNAYc5JLty7dnWGABu2HHPJM+astRfnjC14y6ifcpxaYf2lqJkzluNNlc89OsqhyMB7pzUyUTHymaar4OJWrOOyxZsk9Qyy3sR5W2+KDYTKAbdahTh04jzM7uEg+SmxSxkgHW5qlGNgwu7HJKapeduE9A3NnQKK2nZGOuUexkYNKqHP/VZhNi0dfKFzquTqwPFfeU0SWkyG2EeR3cwGt5Y6ntTBkUVVk3HELwlYeMMa8u4Tu0Rgwdz8gQ93RNUPR+0lA4lc0F1y4KkoPI0qUkZMqR1HlBZ9e3CRP6isQ3utWXJ4KtNb2dGFgabbNytGweNItpApn7F69pJCecQpesyCVZeH0Oi1Lf3ZtoH02JYO3bafooxwriwkl68ZPg9u3qcaiswknf75pd49l/f5U3HE4GYbFPp8HxjIIjosDDu4pKR/Mz4AADaCLaHzxw5fEs/n1kv40DtU5scg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e064b83-9d57-48e5-cedf-08dd2b269f15
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 12:11:43.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/kBEu+WQqix2WpkXXiBWo2B4Y3inS6i3KNgQlHYhF4I59Rbd47d9WZJesmbPoKfS4Eq+IXCIfn5dFweVxkTiItpyWzRLTnWJ25PQVkiLBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=958 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020106
X-Proofpoint-ORIG-GUID: A3RBJMMcRUYL_tk2zOkWvsjICsyTTPh5
X-Proofpoint-GUID: A3RBJMMcRUYL_tk2zOkWvsjICsyTTPh5

Currently the only user of mmap_region() outside of the memory management
code is the MIPS VDSO implementation.

This uses mmap_region() to map a 'delay slot emulation page' at the top of
the stack which is read-only and executable.

This mapping requires that an already-acquired mmap write lock is utilised
and that uffd and populate logic is ignored. This rules out vm_mmap(),
however do_mmap() fits the bill.

Adapt this code to use do_mmap() and then once done, make mmap_region()
internal and userland testable, and avoid any other uses of mmap_region(),
which is absolutely and strictly an internal mm function which bypasses a
great number of checks and logic.

v1:
* Stripped RFC, as Thomas indicated that the approach seemed correct from MIPS
  side.
* Avoided whitespace error as pointed out by Matthew.
* Rebased on tip mm-unstable, as previously a conflict emerged after I submitted
  the patch (quite possibly one I caused :P).

RFC:
https://lore.kernel.org/all/cover.1734017293.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (2):
  mips: vdso: prefer do_mmap() to mmap_region()
  mm: make mmap_region() internal

 arch/mips/kernel/vdso.c          | 10 +++--
 include/linux/mm.h               |  3 --
 mm/mmap.c                        | 59 -----------------------------
 mm/vma.c                         | 61 +++++++++++++++++++++++++++++-
 mm/vma.h                         |  2 +-
 tools/testing/vma/vma_internal.h | 65 ++++++++++++++++++++++++++++++++
 6 files changed, 132 insertions(+), 68 deletions(-)

--
2.47.1

