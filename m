Return-Path: <linux-mips+bounces-6974-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C49EED0A
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 16:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC2A188E108
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 15:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7132210DB;
	Thu, 12 Dec 2024 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mtw6gbQw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gl8Y59Zw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA002210C2;
	Thu, 12 Dec 2024 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017876; cv=fail; b=syVyxJNsZ3xakGwjSTDwJrbIJ/FpJ3hGbvoC+xoGcOBklpPfF4wX3LXB9VTqQsH+4NXyn3XLlngQh0AFQkaorlK+k/+QvfENDg1oOVPMyRLoEqA/bmnJJteEI0wpaDC0INMPPMY00K/imDtucfQCxDO1d+135Y3VbNHPNUN0ebk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017876; c=relaxed/simple;
	bh=G1wO4jTZI7uKPvbXiynCZBKlr+xnaV5jx905RLFKXcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UJ6FPqW0ovmh7i0pP8Vxnb3Lbmr+rnEOlvDeBsq7PseQHk9RKCGTpHQ4+h08TQXknvNttrZ+Fd6EW51L0vTAmWGJuKZlKgdREcqGtGuFKawNRO636z5JdZK9DWxwY5S3zqwSfFr2l6tOv1NOdtdBvJTb4kYElrtOz+zj1AhKCMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mtw6gbQw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gl8Y59Zw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCCOBQR005387;
	Thu, 12 Dec 2024 15:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6HkV2lyfUu+yiBqw99Z+AS5m2F7z5xSUawErWoaPIcc=; b=
	mtw6gbQwGuy01rwXIduakFecrcKKfLEbR+SodFq7AkLJDKruD8V2t7tw7Z6kycP+
	2P/QYhAvnJnrnTm6xsbPYx5ULODZ4V4hO/cRbqcceU+KslubEBscw792CVn2vJRp
	mqRCq5yORwkyiGJCo/PuTcTHtVMQteEWoTW7g552tiWiapd6j0nlD3gB47ZAR7yG
	oFMKc6yIR+NiHIpQTwxopQaUTHkadaQ8sMrV9eKLixfPZm/3LMLNnQFOCIZUo9wx
	rNAvcHo7S5g5yPdMgcsNV25JSg5CvBHPi2SfMq8P8S6Je33kLeGWABk023Dw7M8S
	TpNbnL/Gx9nGLd+zS59zGA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cewtbgwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCEwPT2020564;
	Thu, 12 Dec 2024 15:37:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctbap6a-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 15:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru+WvEhb7A2g1vkMRDzwasnYbANkN+xSmaWHejjUIwUvTpUg9/8/ppxoCwSWiZAAzOtXmVmSijTvCFGORaq7OLjUvNESvCpn8uNVbLcbSh6yGoQIlnrWfVIYGUpG9DX1c6elRI03eH2zqbYMG7p8OxtFenVK07wL0U3gkB4eSTqfKXwbPRByAE/WP94cg+x6eFtVMaSaTLAXDa5rDbKSZdZF/7jcDbbyZmo35E04ujC+PCgCLxmDlFXKDm5ed0IJOZCidYbHQ3uWSjm/s8WYoNauJbJpYdjj+uhOrFiT08qfnSMTMi7MDASQ3UmVdsu9ttvV1yLf/gqTTVcskoWwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HkV2lyfUu+yiBqw99Z+AS5m2F7z5xSUawErWoaPIcc=;
 b=bWfFUAQi7t3g1gpsfJnAcMAJ3rdT6oBmeSUvXaailpvWJPoT4UENFY0KKmqcq5nxiit5CbTAdtJwmVVoiyC1pLeto5wUFUFC91VefQp5cBmCXwHMee6ATyMByUzjq/LXhWRP40BwFmDZpFY/qDdnoHaikPHpH00DC3qy57iZWopP3D9fv2JPwTa6PCh5qfvdcwzRqn6H3uRm1oH0Gth0whoCMmZQWqK8jQmFOE+3NVNtV4bRS7uMx6JohrnBeLXJdyit86ZZZkvDyI8BvWXXlXBJEk+xUdStOILHJ6ZiJG/1wQFvrYNRG/a2A+34KhVlp3OK+657qmiorcDWkz0HzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HkV2lyfUu+yiBqw99Z+AS5m2F7z5xSUawErWoaPIcc=;
 b=gl8Y59ZwHUclUhgCNoYcVyPXa7dXtCOYIIxbqBN4On/wjyvZCabSmrxtqL0gM6ecihJiWfKtM0icfayk56LetOFGEtShvQL6uaoL/r+wou5t2VNl4DQB26W+cLMDR5qKVDhZ1P2gSWobL4EfpYMBjNklsE1Io5GDfhKv2ie6/Ac=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB5804.namprd10.prod.outlook.com (2603:10b6:a03:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 15:37:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 15:37:28 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [RFC PATCH 2/2] mm: make mmap_region() internal
Date: Thu, 12 Dec 2024 15:36:47 +0000
Message-ID: <80b7c4ba4f0a2b3084117975bd1af62a403ac881.1734017293.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: fae87885-9a2a-48d2-3c2c-08dd1ac2e264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?upU9iMNSBTfqlKEWrzv4jHRv+0tmK66YXciEZJSsmBxi6mDzMsS/L8ME/QCP?=
 =?us-ascii?Q?WHHesINOlR/B/tJKmHn+9VomHrmI71SLaoe2gokyk6QNkUPteXJGrOPCeIvS?=
 =?us-ascii?Q?ClzUiZthxzRVqjNyYQheHwiidD2uOem1D+LmGbAp3Z/4ikwa7lCg7/12/ALy?=
 =?us-ascii?Q?UrguU2nKfH2mWdudvud4Utly2RbVEAvRWWVk9D+lP/HWy7FoGJLfsZJmjBjJ?=
 =?us-ascii?Q?DU/y5xvVLHdYf/bzj1DreohhZ65W8P/8Op0o0t7PRKdj8qW3k4SQ0rHVVWF3?=
 =?us-ascii?Q?77FJgnSrK5Yu893nwHpV3g2zD5+/xIaqr/rEl/UO56wTlRP+PBSn5oQ1EZi2?=
 =?us-ascii?Q?POKExBMHVQvlfi7kv+yZAkKvaMGcVC1n0eT/j+j1rbtPQwcimTTsqOtMv+iC?=
 =?us-ascii?Q?7mUPVN7k2xGdoY9SPhNXwWpg1CnIdxybmgOWQIFp8wvG+ZBf7PyO9H5d5OC2?=
 =?us-ascii?Q?n32H6G4PsGOps5+5QRBRqZyLsX0T9Mj2n2XgfoKZihC4YyhJBgiaaVPxZHKi?=
 =?us-ascii?Q?PllqQa4CnXEJpH44yZ+nUF3X7wsHAMLGufMptn7zkf3x9+S5FM5ovvwyyLQG?=
 =?us-ascii?Q?oQjGvDJL9nDmxR2G8uQjU5+omajpzUYOOTD44sY9AUAnZd3z0ao5WeB+mq7h?=
 =?us-ascii?Q?mp5ENyg3LgP7VZtNYhZR13v+ShRtOupPPY31z+ooCroOoOqLh9SKzhK/2b0R?=
 =?us-ascii?Q?nFSFswXaJdyKB5coWKHnmPZFbIgHpqyPWfkkvSyzU7yK6FRbLcmudFx0cQUm?=
 =?us-ascii?Q?O4inFtrGsoC/JAZJ5QP/oZQko4KRxWEAZ8vhKdA5iOEB4tQvnwOA6pl8Xj1m?=
 =?us-ascii?Q?NgBo4Bw7q+WO0RzXTdnMZ8duRBDxrKw8AGfUt11V7tfxdpSLFtceOZRFYfPY?=
 =?us-ascii?Q?/cy1k2djDBJtbFeE8V92AHhBGUy/yfbCGgv24fh+qog8kCi4H8JuPfesyQvE?=
 =?us-ascii?Q?SQlPXlWJdUDKBjzozXwyD3YrIFZIMKe5RUU1fXz7JEJIWvTjdhHITcoKivOr?=
 =?us-ascii?Q?d2QtFcJ4Wb55RAXUn3kC+ovwuq2bxM/Ft46yycNNsJ1oBhUr2ju3WK/MzGIa?=
 =?us-ascii?Q?yIu6BNgI1eLnwvUtB1ZvsYPzg6vq5RDI+zDl1evxBfVpPvuwevW39x6Umw8F?=
 =?us-ascii?Q?sgom7dQhTA/TAvVieNeV/bT8y5ZsY2SJZid4Xo/wflAb1awRgASCq6H4MCPn?=
 =?us-ascii?Q?JNmJEosbKq6dl4Kjz370ewqch1tYEqWU580qaIhd8TIrYv4eTi6WdKo/OPSG?=
 =?us-ascii?Q?Wt5W7YcYwO68A+cUATL3uJA9GUm+OOgK0mgDut2hQv4rd1p1FV2LnWi1JRsj?=
 =?us-ascii?Q?b+wCQipGeZx33L9QGvwgerUTonBM5AFuS+bafM2wzYh8Kw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m1ZYN32u0ggWtCEX610SbMhZ1vkk9NDhhuJm6tQT30RR9az9aIrgxdSDMQW6?=
 =?us-ascii?Q?XJzv7cCo0TE1OeYNrV/4qBAxmR4W9IflGk2+7bMNDtlBseOOqxdFI9disUhp?=
 =?us-ascii?Q?hAT798psFEG2EvZUw10OBmFlcaACwrMM8IKS9uWNqWl8trk2fu1w7uwH8k7U?=
 =?us-ascii?Q?DaMKy4cWgZpDnqYDImC1NKV8d+slERXaul5bEaPakUHrcglZE5tq+h8HycT6?=
 =?us-ascii?Q?BQYqbJ0Ugs+RhgB/EFpr+ndeHNF6grVqHlad2TOZe+Nd7mPRS1MpNiiE4Klf?=
 =?us-ascii?Q?TTjuJI9CLo+E5q402cnbi1HQratUQxTHV0NHRcodkg6zqVK5v+tC85oSimSz?=
 =?us-ascii?Q?3YuT82txO6+yBEWg6ZwHW+CDpoB8lj8TZufN5ExIyYaVq/9yz5o12kkjQIma?=
 =?us-ascii?Q?shXD3/m2FEnWmsZa+C0pQ3y8VvQpd70t2rtuiwgQ2RTA6fAxod25w54GJdYx?=
 =?us-ascii?Q?eUxogylsng6nNVOl6Bj8fRyEIvGwUJoP7MyRXXzBhTkbpa71hk/O4bHYvjwp?=
 =?us-ascii?Q?AJnQ+pD7wQqZKda/bUb178r3Gibby9kbNYwyWonIn3nRCeLBfnAHtripKbRN?=
 =?us-ascii?Q?5UeD7Vn0F9DqKi2DjEO8RmMrYzQIcJIUGJ0BlnfjbLUpaHnZdItZzGCsm734?=
 =?us-ascii?Q?4b/WDN8Fd4Qccq95BCzFh/Z/54iRWEHlg7RkTtcfozvoV4frKzY2kKYXF3XV?=
 =?us-ascii?Q?g7fDVbBWUMoMEF7OjZhkJq9Anppi7h8qBSR7hYZ+ethxgJ8d/olaN7xOAnIy?=
 =?us-ascii?Q?Tm3noE5nhWODG8MnXXQNJdspT4EH+a6OFpJLR/vnT29rmZhgBwGZRjTsWSEn?=
 =?us-ascii?Q?y2fERN71msaLKoES5QaHPd04hDwOzSlMB50oSfkg1ozD8D5jarBf8KpMgC6L?=
 =?us-ascii?Q?7a4jdIHZB2tKkxxk05jXwwpbEiqdxz7xhezh7Mrw/g0c2baZj3inKCngw30z?=
 =?us-ascii?Q?rECLX7Z7EggUSJFUY1V2QVIWFPuO2So4QSPe76zWRWdS9QS0+j4EtiSsNt4k?=
 =?us-ascii?Q?fuS2VssOkcgA33pqjSL5NAa1PiPa050Xv+qjz31rFfEZx3D+v2eUEn+32goB?=
 =?us-ascii?Q?lpux+oSE/I5eZ3NOzQr4ka0cnDW+hTr2TeB439Pa/iEL0QUNtEXovDWyjfQu?=
 =?us-ascii?Q?n2tXd8nmdBHwQ2kxAM53xkryadFacPrTemPeKayS8M1AZbDQAHdbqNauNDFJ?=
 =?us-ascii?Q?X6ktzE7JdVuQDFnvXSyyKZlXNgzFyY8EI2XkEcru/UZvH0Lfs8zUrBTKzJYp?=
 =?us-ascii?Q?DH7mT3+Wg91XSECsw8UAP1HnELQPIYkuwrj6QsgOQBga60BrjC9JFrHQhvwv?=
 =?us-ascii?Q?esnyz7rTS/mSvs2uM8Gee+M+UBk/CpQYtQmQfbmshhRQJs7jzZMcVfsv8Npk?=
 =?us-ascii?Q?942k6vgk+RriymdWGqR06pMiMSlzhOpS5MKY74ZUCc+m/Y7G3wLgSuig8qEP?=
 =?us-ascii?Q?/F1aQoMnrUqsEVTT3mfQ/kNMAhnIcoznAD3FJ5E7Lemv4gZiqzBzZTOi2H6J?=
 =?us-ascii?Q?uXqNGXDkWBau4fRcTGWA/iuHokJFFodlrJloB6sWtBjzhNvnJ2OmiOd+qCYZ?=
 =?us-ascii?Q?2qRw/DgG1bqXQ2ZKnN+Yz5rKbZFOSm+oIdHEqJ1s0s87YWp22CK+9AguBfhG?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bYzaxpnnJOlIZ/gf3gEfyrvrDWNk/uNA8G3n0gtdMuem3voYxl+N1yk4l8CGe6zQNJCu2R8Qgku9K0IghH9nMazqVxZxVs+9UrW0fRMkHJy+Q4Slph4D2eMxYttPpUeSb5DdQ5UkuBFXcldVjGzkAtx9SlJA21qpI7JpgDCxVLHgHilMESwtNPf0VWi7vxH0FQSp8ofhWRrnEoRKGaa7v0fzDvVm0OpLnq5mdlFhIOsgW0v6JOlbGQZWhAQFskfwR5r5m7j7kT2nqwNXxFIP+8X2sTNUHqkOz/R6KTYM0hO7lSsUg0S6GWupO8KFwrXRfF9RJWkdPtHFzp39jwAzcz/xUqJwvEYb8v/OD8jD+18khQv3x4BFKI4G+ikArj6ZA7TCpTR/qauaNY0jF78YMDpIWaWv2leCwBO5zKQxilQZVkjfpSoJnk/ctqS09zTHfI2+2dmrPOX72I7mWIRDyzpZp2W/LblSKd8HjRV1ca7Ad1p1vUQWgLYyUimhk6Rk8sqDOWZIMVrbnL1N2Wx9zzF9j5/jEKea0q5+3Oqqymf6aRMmOgbSa5SJoGVOmcTGGrXohQFuxWU1NdMw4m2ncdtj2owFFyFIsq1ddb1uiMc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae87885-9a2a-48d2-3c2c-08dd1ac2e264
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:37:28.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuiL4SAyk1bvAupcTCyyh7jyTAw/oYysoBb2lyachlE792shgHlsJ1JAI205AISwvuWnEtDrmZKBz1vKSpgal+Xg3AlJXMltVD540Nfnt7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120113
X-Proofpoint-ORIG-GUID: Std7YryAOEqZLVsKZWBmIZpozTHYyJu-
X-Proofpoint-GUID: Std7YryAOEqZLVsKZWBmIZpozTHYyJu-

Now that we have removed the one user of mmap_region() outside of mm, make
it internal and add it to vma.c so it can be userland tested.

This ensures that all external memory mappings are performed using the
appropriate interfaces and allows us to modify memory mapping logic as we
see fit.

Additionally expand test stubs to allow for the mmap_region() code to
compile and be userland testable.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/mm.h               |  3 --
 mm/mmap.c                        | 34 -----------------
 mm/vma.c                         | 36 +++++++++++++++++-
 mm/vma.h                         |  6 +--
 tools/testing/vma/vma_internal.h | 65 ++++++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+), 41 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a672339f2b8f..d145ddf1b2f0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3436,9 +3436,6 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
 }
 
-extern unsigned long mmap_region(struct file *file, unsigned long addr,
-	unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-	struct list_head *uf);
 extern unsigned long do_mmap(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot, unsigned long flags,
 	vm_flags_t vm_flags, unsigned long pgoff, unsigned long *populate,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..b771ae617629 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1016,40 +1016,6 @@ int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
 	return do_vmi_munmap(&vmi, mm, start, len, uf, false);
 }
 
-unsigned long mmap_region(struct file *file, unsigned long addr,
-			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-			  struct list_head *uf)
-{
-	unsigned long ret;
-	bool writable_file_mapping = false;
-
-	/* Check to see if MDWE is applicable. */
-	if (map_deny_write_exec(vm_flags, vm_flags))
-		return -EACCES;
-
-	/* Allow architectures to sanity-check the vm_flags. */
-	if (!arch_validate_flags(vm_flags))
-		return -EINVAL;
-
-	/* Map writable and ensure this isn't a sealed memfd. */
-	if (file && is_shared_maywrite(vm_flags)) {
-		int error = mapping_map_writable(file->f_mapping);
-
-		if (error)
-			return error;
-		writable_file_mapping = true;
-	}
-
-	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
-
-	/* Clear our write mapping regardless of error. */
-	if (writable_file_mapping)
-		mapping_unmap_writable(file->f_mapping);
-
-	validate_mm(current->mm);
-	return ret;
-}
-
 int vm_munmap(unsigned long start, size_t len)
 {
 	return __vm_munmap(start, len, false);
diff --git a/mm/vma.c b/mm/vma.c
index 2fabfd6c8957..218d8f154e99 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2432,7 +2432,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	vma_set_page_prot(vma);
 }
 
-unsigned long __mmap_region(struct file *file, unsigned long addr,
+static unsigned long __mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
 		struct list_head *uf)
 {
@@ -2484,6 +2484,40 @@ unsigned long __mmap_region(struct file *file, unsigned long addr,
 	return error;
 }
 
+unsigned long mmap_region(struct file *file, unsigned long addr,
+			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
+			  struct list_head *uf)
+{
+	unsigned long ret;
+	bool writable_file_mapping = false;
+
+	/* Check to see if MDWE is applicable. */
+	if (map_deny_write_exec(vm_flags, vm_flags))
+		return -EACCES;
+
+	/* Allow architectures to sanity-check the vm_flags. */
+	if (!arch_validate_flags(vm_flags))
+		return -EINVAL;
+
+	/* Map writable and ensure this isn't a sealed memfd. */
+	if (file && is_shared_maywrite(vm_flags)) {
+		int error = mapping_map_writable(file->f_mapping);
+
+		if (error)
+			return error;
+		writable_file_mapping = true;
+	}
+
+	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
+
+	/* Clear our write mapping regardless of error. */
+	if (writable_file_mapping)
+		mapping_unmap_writable(file->f_mapping);
+
+	validate_mm(current->mm);
+	return ret;
+}
+
 /*
  * do_brk_flags() - Increase the brk vma if the flags match.
  * @vmi: The vma iterator
diff --git a/mm/vma.h b/mm/vma.h
index 24636a2b0acf..dd943a593312 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -242,9 +242,9 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
 int mm_take_all_locks(struct mm_struct *mm);
 void mm_drop_all_locks(struct mm_struct *mm);
 
-unsigned long __mmap_region(struct file *file, unsigned long addr,
-		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-		struct list_head *uf);
+unsigned long mmap_region(struct file *file, unsigned long addr,
+			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
+			  struct list_head *uf);
 
 int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *brkvma,
 		 unsigned long addr, unsigned long request, unsigned long flags);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 3eeb1317cc69..9f6cf80c9682 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -41,6 +41,8 @@ extern unsigned long dac_mmap_min_addr;
 #define VM_BUG_ON(_expr) (BUG_ON(_expr))
 #define VM_BUG_ON_VMA(_expr, _vma) (BUG_ON(_expr))
 
+#define MMF_HAS_MDWE		28
+
 #define VM_NONE		0x00000000
 #define VM_READ		0x00000001
 #define VM_WRITE	0x00000002
@@ -226,6 +228,8 @@ struct mm_struct {
 	unsigned long stack_vm;	   /* VM_STACK */
 
 	unsigned long def_flags;
+
+	unsigned long flags; /* Must use atomic bitops to access */
 };
 
 struct vma_lock {
@@ -1174,4 +1178,65 @@ static inline void userfaultfd_unmap_complete(struct mm_struct *mm,
 {
 }
 
+/*
+ * Denies creating a writable executable mapping or gaining executable permissions.
+ *
+ * This denies the following:
+ *
+ * 	a)	mmap(PROT_WRITE | PROT_EXEC)
+ *
+ *	b)	mmap(PROT_WRITE)
+ *		mprotect(PROT_EXEC)
+ *
+ *	c)	mmap(PROT_WRITE)
+ *		mprotect(PROT_READ)
+ *		mprotect(PROT_EXEC)
+ *
+ * But allows the following:
+ *
+ *	d)	mmap(PROT_READ | PROT_EXEC)
+ *		mmap(PROT_READ | PROT_EXEC | PROT_BTI)
+ *
+ * This is only applicable if the user has set the Memory-Deny-Write-Execute
+ * (MDWE) protection mask for the current process.
+ *
+ * @old specifies the VMA flags the VMA originally possessed, and @new the ones
+ * we propose to set.
+ *
+ * Return: false if proposed change is OK, true if not ok and should be denied.
+ */
+static inline bool map_deny_write_exec(unsigned long old, unsigned long new)
+{
+	/* If MDWE is disabled, we have nothing to deny. */
+	if (!test_bit(MMF_HAS_MDWE, &current->mm->flags))
+		return false;
+
+	/* If the new VMA is not executable, we have nothing to deny. */
+	if (!(new & VM_EXEC))
+		return false;
+
+	/* Under MDWE we do not accept newly writably executable VMAs... */
+	if (new & VM_WRITE)
+		return true;
+
+	/* ...nor previously non-executable VMAs becoming executable. */
+	if (!(old & VM_EXEC))
+		return true;
+
+	return false;
+}
+
+static inline int mapping_map_writable(struct address_space *mapping)
+{
+	int c = atomic_read(&mapping->i_mmap_writable);
+
+	/* Derived from the raw_atomic_inc_unless_negative() implementation. */
+	do {
+		if (c < 0)
+			return -EPERM;
+	} while (!__sync_bool_compare_and_swap(&mapping->i_mmap_writable, c, c+1));
+
+	return 0;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */
-- 
2.47.1


