Return-Path: <linux-mips+bounces-7242-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE51A00C00
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 17:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B7597A1DE1
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 16:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96501FAC23;
	Fri,  3 Jan 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oYG40q2t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q02thkan"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CB1F9EA4;
	Fri,  3 Jan 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735921428; cv=fail; b=hHzrKqkndRfVFLlv4Qo7SWUcqmQkq562+uxAWOO4RhElo4baB/JszQ8Oegg9+QtwSFhwoh97haFeov+1Lc1kgbznEUfTTzh/jywqxMNQhvDPJwKR/FlYBWEzRK6uHZ3XTwVarcl45vxe6kE5cV+7GDlJSP59Cdm//LR222nwMJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735921428; c=relaxed/simple;
	bh=hLM+Oc2eoBdxDAwR0eXvaESgax6iyb2Zd0lvaj67XqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jfwLZngSvpxvDHmp2TTKJU4d8hanUZhcE1C82tA3KrcDf0PwW0MoTUi4Z44xnqL5ZgcvVROXm3ey4U66qqvqbBga2fdF4HGknAAuJPfWhFc8jYch5np6laRCf7B39nOC8Wrh80HhbiMYAV2yO5AfjrMBgJgdI/vVYBwHp75GIdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oYG40q2t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q02thkan; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503FUQgn010960;
	Fri, 3 Jan 2025 16:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=6oKXQtsuxmYWvjP0Pr
	LDWe/017/sHtGEp2wthy6hcDk=; b=oYG40q2t3nP7D3Jt2rqEkBtnesW2Yvv2D/
	Zc04sGFCoUE5ZfnN2E95+Lic2PUFFWCQ7qy9flvhHKg7ANxnObvDzLIz/fz4rgOe
	lRHOwbQAETLe8W3radF4Fn2iwLhWtSR1iFbG+535m5MDA7DXkCdmWsOcbGUvXx9E
	Mt7bfpgs2Hlr3hAHoN2WU3KlAbseI89jb+6irKQFAlEOK4oybIXojjjEjKVx1M6U
	7bR/rlAk0X0iY41iyYG9r2JZX0c9LvmkaNdPR+r3TK2yahMP/OCppO8XqbSyjRN7
	JqVXtxKRV3WpR9K3iqTCojn2djl1jvaJOzaK8NrmgzPKiP1T0EvA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t9chgdww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Jan 2025 16:23:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 503G8VLP011741;
	Fri, 3 Jan 2025 16:23:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s9w8md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Jan 2025 16:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN2QJb6ttF2DQ0P3B38DVZsq1sndKu9YKMcbd2T88zsChr7HjdMdFCIuLCU+SQFmx/MRXY3UccQ3pSUis2Yc4dGYi6QUUwcCKGKqG5XxkTKdls24vhMSQ6yqmstm9vbhSpukhb9MqiZxURfVErALb7f08oXGA7DczVAUBJsRhUfTRS38qzktXfILUG9IH4Pc14vj1NpPSiORgIJEgqa4ZmZr8OxFoTa7xqVdhx1G5k8BA7qL/uzeEe0Vq0xV2E0lpBvUNoB9dkC6zqYKrKUm7ubKi21IudE2VZu/mGf1qmqMfcawT/ztvYLuH0NjjXPm8IXUR+HcJF7RECmNVNcbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oKXQtsuxmYWvjP0PrLDWe/017/sHtGEp2wthy6hcDk=;
 b=w21IPSlSxhaGEvkS+5/ZZy/SA9xYwrnVM7b+ZTsIH+RunEwzThn9Y+6+5nkzujJ0rXidKcbEwOdgdatSCOzZpHzDqewy4Un1kt4QnQoMaOe7F1e/tbbfiJ2nvpProjmrZVT6Vp7X1/z4RiXbTejHX7euXQhRqLLSDlCijw0MkWQf4h8YXXhEqlzdtfZT/07IcGSKw5pcygnThMV8OOrA9Cs35qnk1JadwdAJqDq3BgJJwzdU8k6KJupZQV1yjmlkL3FGWaZUx2chj9AGRW0SM25qeKM602qND4Y192R8nBMesp9GDBdr2C8E+ZwNt6rHho6yrYKa5eg1lpv8IlH+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oKXQtsuxmYWvjP0PrLDWe/017/sHtGEp2wthy6hcDk=;
 b=q02thkan0dFDfXRfpjsdXX9n1fWf80x18nd51xGJCES2M420u5oKAJZ/0LRCL1ghOn0iEL8YWaAsIO0plN5DneUArWpNDa5iyOhDnaHCv2yy2JCIBkWZgr7dqrTPowWjNkV96w/xBhcpm/+rcVT4uWF2NaIFmhw6E24ms+tp+8U=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW4PR10MB6584.namprd10.prod.outlook.com (2603:10b6:303:226::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Fri, 3 Jan
 2025 16:23:01 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 16:23:01 +0000
Date: Fri, 3 Jan 2025 11:22:58 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: make mmap_region() internal
Message-ID: <hjd226olq54jbxgxp65j4nexqflrmkqrrgzwfbdpjkwnqg4e4j@v4fev4d7yfhn>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
 <de5a3c574d35c26237edf20a1d8652d7305709c9.1735819274.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de5a3c574d35c26237edf20a1d8652d7305709c9.1735819274.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0363.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW4PR10MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e49b769-12e6-44ac-96c1-08dd2c12e469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8rWksUigfN/BgYT2KQGOSs6oMJgXsdm59M1P7asFL4S04pMjanwROnTafCRu?=
 =?us-ascii?Q?PdvZmjXIoa5BICA2YXMjJYD3eCbNvQ4YP4h2D+n6QxWdqjLPSwLA4BM+mNxE?=
 =?us-ascii?Q?bbiZEpGr3YRxgQsv45nrswTHSC+K3i1N69i+u1kkGhWjaocvmIrM1yvp9SnX?=
 =?us-ascii?Q?yPP9bFpOpnqwbjd+mVyq9bUdr9WFc32IE5fl9/9ZG3M9NR/euIfSzW5yKSQb?=
 =?us-ascii?Q?8OxpV+nm8Umm1kYMq5tAds8NmkTj0F6lIYgWxNQDKClBXaCilY9ZyKzlGA04?=
 =?us-ascii?Q?axgt15cM5l81COe/3BFwe8O30b6fbcrYziQVNLv7+EPez3gVShupAVucrEAs?=
 =?us-ascii?Q?wBwPWaRfphrgun1uWCZaXISWODhWN34ESur+B9A4c0KTf/ksJwPNdWZySqBx?=
 =?us-ascii?Q?ogus04yt1tkInCNzsG+3ZKs82duG6wO3C8fCrOOdSQImV9S7pnBws6oOucAj?=
 =?us-ascii?Q?YNGc4xEko42haqxwg3xZFhCDgzV1MgeZLGLQ949XViHKpKQcKrpLqM/YHA26?=
 =?us-ascii?Q?hGNs0FBg2oJNQlsZtwIb2eaZWxjDu4vC9BHqjMUg89CCQWAgk+MSsPpkH72w?=
 =?us-ascii?Q?b67hXemi5apPejitD7TMrcSbl96Y8Ynx/IblA2J+bfVS+B/2KaTtoV5jx//a?=
 =?us-ascii?Q?RRfOzVcvEomMGnZjhgTNMEwG0vQaipqID0aNoJXlHKzxURTTlBsqdqu0Xixl?=
 =?us-ascii?Q?ANcPQicWobMYdVIE66cpBIbxp/64/UDV/OW05AIkMZA/gICAIQTG5XbS2BT/?=
 =?us-ascii?Q?Ur0SjIrVo/NrgdRwE/2x0bJJi35b9gh41rcOWPjzgie09sIgAh0OtVjFwUcX?=
 =?us-ascii?Q?3fq8GmVXVJDkcB98A2R5Yw1vhjyHkKoJjFWnb6Hujlcs7DOdlpIPFT9dhmdj?=
 =?us-ascii?Q?wn7/TC7e9FKLhXvGcRtHwII+V5v7Jr8pvhX+cCekLHKAV2dbqXhS6x+aGOEX?=
 =?us-ascii?Q?7V5kbWYXBpxdPC5tyiuZaf5qrZmxGJ8CwDgXqHAoq1org3fb5kzgz6BRaRn2?=
 =?us-ascii?Q?+dg5rcxmAapOO7pRnB53flZZpERCdZjUeY4lfeHMx90oy8sb/t/yi5tfqshB?=
 =?us-ascii?Q?cTZsSZxSJ5KbG1xPCcMfscVpVeA/preteUX21dZIaHdAD/4R+0ydVU/Y7SWO?=
 =?us-ascii?Q?v7h9n4aFrhPCuGRCvBw057ae68kK8rsTVqOmctnb3RAnATPNW0ChTG591krx?=
 =?us-ascii?Q?K9a/YK3ph79rHkxyXMMYj9KytXfYMwc8JDS0JZqU3Azp09Kn0L+pXLEbAY/1?=
 =?us-ascii?Q?p3eoyx4PQ5P/jsdSNzE6f2Oo8gr8WHiWBOXMGUCiWB8qXJRBYnq2U0lMnNVL?=
 =?us-ascii?Q?7iLliXbIiPJvfqALHP79i3ns6LH6V+qzhgNc0/5wxNhVrqF7bxP6/U2DTrQq?=
 =?us-ascii?Q?j/2mmHQaSnvglyAljcwbDc5bzZIp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d732uu7Be0urwaXwC/kAVzdzemGROKMy9QZUF2oTBiLYhzYzu1Be5PxB9g8S?=
 =?us-ascii?Q?P2t/rzf7wk75svvkQtPVIFySx4yVCQE1sEiyXFFNEQpsn72dKbxkeyKjSuu1?=
 =?us-ascii?Q?GCZqbv0hvACNQod5nF33Ier6kXQ3qTjThl3He0rce/Au8e+UR8MUOzC8ee/y?=
 =?us-ascii?Q?e0nGK/JuGhGsk+B1WMB/Kx+qibI3pssQnpRfzMElyN/Deobe0UO/0FWqU6ND?=
 =?us-ascii?Q?0NH15KZM6udDbpYX+Ri2GtSZgcUc2S42y2KdoNN7Fnop8DYonwwpm9uBFQiq?=
 =?us-ascii?Q?sv8GxMl/qVnsa8gA77Q5/Qz1H67iCQ1uriRqIRKWUBL1pTkb22RlocEn4pE3?=
 =?us-ascii?Q?C/GEVZDFz7ED+AxjpQF8Zg8Y6rVqi0W+d8wixAsKGmvPQ0c7N8D0HyDE3ccG?=
 =?us-ascii?Q?HWrxMelVm+vPQaj9v9t6OmHGXlYaYkCcI8IvIrQdTR8f0OPmUTBKs6i3ovLs?=
 =?us-ascii?Q?mg444ecxKmciNLqmCwK9Jd1DX+oXITG9+9RGhrva3NOdGi8WDIipT/1kZIND?=
 =?us-ascii?Q?NSAyBNrjOQJAZN3lPWy7WMOFaDhx5kWQRbFfceL9fgPVJjjAurMpITcajhqG?=
 =?us-ascii?Q?2dpnL/zS/KFhlfZICwcWwJTKVPZjZ9yMAPFZODNPI53Fi4oE1EclHXrXpceW?=
 =?us-ascii?Q?HWRtRQPDUOPmQsZZ47/qUlhmRT02AGkYsbhFpuU+5vCF3XP1r3F6lhyxUtMh?=
 =?us-ascii?Q?Ow0r8Ya9VVNZMlddHucEuFeJW883E3BW1vKHtvrwB27Om1uV3k7tzRxUczoR?=
 =?us-ascii?Q?fM9iqN31IWY7V2js9Gq0/iPHGuOCzgFnMpNb6djKlooDbz4ErI92B4UFxDE7?=
 =?us-ascii?Q?jktpAssEviDpFL0snzBNF/kvOYkM56qcpZPODodT1OuoznrrpxE1i5FXDk55?=
 =?us-ascii?Q?g7QYy+G6B15NdNcjR+y5LUcy8sxAWizjaHfNNtV2hd3MDL+AKBAag7FKznwq?=
 =?us-ascii?Q?ppc/bKsCVm2VRCGguqnqeNSWGdTINE+Vl8wZRM871PlPtliSJ7OHH1e+KYBa?=
 =?us-ascii?Q?zuMaxgrd9Ohw1zT9/LLk1OuxTY+oDh2LhMVOGAwBQYe/74xrSY+QG0pZo7ST?=
 =?us-ascii?Q?/PliflffQ0urVPvgWfVJeMtZDRHbksx8s6KtrxCfF/HP8rR1dOwTycTz9eRx?=
 =?us-ascii?Q?OoDXeOWfBQ9LGefdCBGYqjNDvwoBnASkAY4SMe6R5FqDb6e0p4cHft2Cb4Tz?=
 =?us-ascii?Q?Vo6c2EnEXIbf1bENXomkOD++9M/TbtrNeiCRSepNyn5oNYMf5XgWYKP9Wze2?=
 =?us-ascii?Q?QX/bAO+4vXp9r4Doc1qUtzcye1dpvzx+Uk2+9mECfEaEYgrSey1A4m/SAhpw?=
 =?us-ascii?Q?9z5B8Ftci0MaxAlzTYf8g9QZGo0lBNKBnsaH+ZZ6SlxocL4mRv34YkekUpnC?=
 =?us-ascii?Q?xuZEyRN0JDlqzt47QUow72YnZ2QEldzS7dSZ72DdL1oHp50Gx22AVnY4fbER?=
 =?us-ascii?Q?6y2VCkpzP4qcymn1louT8RPB3k8vzXQ6Ji/Sna/cHvEoU5vON+Lwlu+sGxK4?=
 =?us-ascii?Q?QTEy+7b//e8l9yFCxg02U8Ck1aewtULg5D+1uCtUmeuvaMfWAOGFBJUgbVev?=
 =?us-ascii?Q?vGPuaj6OQZy4oVxgug1ZlQHuZM8DlLr8SN7+IjiH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LFvKbGjzQY0Z/8QCKfqxNHszd2DXSPjD/eG+aSfBX3vx8vYIogEhS+IIiwNkRbWzeZY/7RdsjXW/uqDcLUYPDZAu+PAqMlYwWpRTl+0cey4ZVQ34DDOThQWzC4jU6uMFqq64TQv0XRBAAd9n+/NZO05tBtRin6HOHAOLVPgbZ5kWvC4eCcJJGM6pba6ewPFdlVQ9ymxvht4lY++EJs9ViAetIaon5eHExCCqWeJOKRDAVUmSh+ovlTIELQZ1Yh6Mx1v/MNzqL3787A1EV/XkpzwAK+eJXIDqlJ00bL85EMoowG0NNzr1y0mIm3gtBifqlDfUTqcXV6FZb/NTbfQVt1VQbHWExc3b/GllHy4j3wvim4iCNEQpqoJPmug69VFj20JFGBGd+t9y0OFhnoIgh4sd5lsEMTDz1yVncQMegJLW3ShDcKaeDWYTfDsdJBXib4CrA2CYulO40POVhy5TFNzrToSQ/bVRxObPzx+kODBos7R3oGZK5CnqMy78kbzJXbyvHB8VQ8tMwbuB45sOYz79PDautAamjee7LoT04KMZJSnQFL4Daf9yv8A5IlcLc553RxlZ+ao8dNASqi729RlBIYJsWrl32BcUTD6/la8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e49b769-12e6-44ac-96c1-08dd2c12e469
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 16:23:01.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ona9vzPm/Nqzi0Zwpwwuz2Ou57Q+9umjqFnvGN8xsFPLS8EBhpjJFaPbT+vReSseJpIn7URFxfVaGQCTy/Stg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501030145
X-Proofpoint-GUID: AwVNTLUbLClmoSCrsa0sTOw8Jmfqf7tg
X-Proofpoint-ORIG-GUID: AwVNTLUbLClmoSCrsa0sTOw8Jmfqf7tg

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250102 07:11]:
> Now that we have removed the one user of mmap_region() outside of mm, make
> it internal and add it to vma.c so it can be userland tested.
> 
> This ensures that all external memory mappings are performed using the
> appropriate interfaces and allows us to modify memory mapping logic as we
> see fit.
> 
> Additionally expand test stubs to allow for the mmap_region() code to
> compile and be userland testable.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  include/linux/mm.h               |  3 --
>  mm/mmap.c                        | 59 -----------------------------
>  mm/vma.c                         | 61 +++++++++++++++++++++++++++++-
>  mm/vma.h                         |  2 +-
>  tools/testing/vma/vma_internal.h | 65 ++++++++++++++++++++++++++++++++
>  5 files changed, 126 insertions(+), 64 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6939c2a8d90f..1a11f9df5c2d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3446,9 +3446,6 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>  	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
>  }
>  
> -extern unsigned long mmap_region(struct file *file, unsigned long addr,
> -	unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> -	struct list_head *uf);
>  extern unsigned long do_mmap(struct file *file, unsigned long addr,
>  	unsigned long len, unsigned long prot, unsigned long flags,
>  	vm_flags_t vm_flags, unsigned long pgoff, unsigned long *populate,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 7fdc4207fe98..7aa36216ecc0 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1072,65 +1072,6 @@ int do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
>  	return do_vmi_munmap(&vmi, mm, start, len, uf, false);
>  }
>  
> -/**
> - * mmap_region() - Actually perform the userland mapping of a VMA into
> - * current->mm with known, aligned and overflow-checked @addr and @len, and
> - * correctly determined VMA flags @vm_flags and page offset @pgoff.
> - *
> - * This is an internal memory management function, and should not be used
> - * directly.
> - *
> - * The caller must write-lock current->mm->mmap_lock.
> - *
> - * @file: If a file-backed mapping, a pointer to the struct file describing the
> - * file to be mapped, otherwise NULL.
> - * @addr: The page-aligned address at which to perform the mapping.
> - * @len: The page-aligned, non-zero, length of the mapping.
> - * @vm_flags: The VMA flags which should be applied to the mapping.
> - * @pgoff: If @file is specified, the page offset into the file, if not then
> - * the virtual page offset in memory of the anonymous mapping.
> - * @uf: Optionally, a pointer to a list head used for tracking userfaultfd unmap
> - * events.
> - *
> - * Returns: Either an error, or the address at which the requested mapping has
> - * been performed.
> - */
> -unsigned long mmap_region(struct file *file, unsigned long addr,
> -			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> -			  struct list_head *uf)
> -{
> -	unsigned long ret;
> -	bool writable_file_mapping = false;
> -
> -	mmap_assert_write_locked(current->mm);
> -
> -	/* Check to see if MDWE is applicable. */
> -	if (map_deny_write_exec(vm_flags, vm_flags))
> -		return -EACCES;
> -
> -	/* Allow architectures to sanity-check the vm_flags. */
> -	if (!arch_validate_flags(vm_flags))
> -		return -EINVAL;
> -
> -	/* Map writable and ensure this isn't a sealed memfd. */
> -	if (file && is_shared_maywrite(vm_flags)) {
> -		int error = mapping_map_writable(file->f_mapping);
> -
> -		if (error)
> -			return error;
> -		writable_file_mapping = true;
> -	}
> -
> -	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
> -
> -	/* Clear our write mapping regardless of error. */
> -	if (writable_file_mapping)
> -		mapping_unmap_writable(file->f_mapping);
> -
> -	validate_mm(current->mm);
> -	return ret;
> -}
> -
>  int vm_munmap(unsigned long start, size_t len)
>  {
>  	return __vm_munmap(start, len, false);
> diff --git a/mm/vma.c b/mm/vma.c
> index e37eb384d118..4cf2acc378ba 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2427,7 +2427,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
>  	vma_set_page_prot(vma);
>  }
>  
> -unsigned long __mmap_region(struct file *file, unsigned long addr,
> +static unsigned long __mmap_region(struct file *file, unsigned long addr,
>  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
>  		struct list_head *uf)
>  {
> @@ -2479,6 +2479,65 @@ unsigned long __mmap_region(struct file *file, unsigned long addr,
>  	return error;
>  }
>  
> +/**
> + * mmap_region() - Actually perform the userland mapping of a VMA into
> + * current->mm with known, aligned and overflow-checked @addr and @len, and
> + * correctly determined VMA flags @vm_flags and page offset @pgoff.
> + *
> + * This is an internal memory management function, and should not be used
> + * directly.
> + *
> + * The caller must write-lock current->mm->mmap_lock.
> + *
> + * @file: If a file-backed mapping, a pointer to the struct file describing the
> + * file to be mapped, otherwise NULL.
> + * @addr: The page-aligned address at which to perform the mapping.
> + * @len: The page-aligned, non-zero, length of the mapping.
> + * @vm_flags: The VMA flags which should be applied to the mapping.
> + * @pgoff: If @file is specified, the page offset into the file, if not then
> + * the virtual page offset in memory of the anonymous mapping.
> + * @uf: Optionally, a pointer to a list head used for tracking userfaultfd unmap
> + * events.
> + *
> + * Returns: Either an error, or the address at which the requested mapping has
> + * been performed.
> + */
> +unsigned long mmap_region(struct file *file, unsigned long addr,
> +			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> +			  struct list_head *uf)
> +{
> +	unsigned long ret;
> +	bool writable_file_mapping = false;
> +
> +	mmap_assert_write_locked(current->mm);
> +
> +	/* Check to see if MDWE is applicable. */
> +	if (map_deny_write_exec(vm_flags, vm_flags))
> +		return -EACCES;
> +
> +	/* Allow architectures to sanity-check the vm_flags. */
> +	if (!arch_validate_flags(vm_flags))
> +		return -EINVAL;
> +
> +	/* Map writable and ensure this isn't a sealed memfd. */
> +	if (file && is_shared_maywrite(vm_flags)) {
> +		int error = mapping_map_writable(file->f_mapping);
> +
> +		if (error)
> +			return error;
> +		writable_file_mapping = true;
> +	}
> +
> +	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
> +
> +	/* Clear our write mapping regardless of error. */
> +	if (writable_file_mapping)
> +		mapping_unmap_writable(file->f_mapping);
> +
> +	validate_mm(current->mm);
> +	return ret;
> +}
> +
>  /*
>   * do_brk_flags() - Increase the brk vma if the flags match.
>   * @vmi: The vma iterator
> diff --git a/mm/vma.h b/mm/vma.h
> index d6803626151d..41bb52594ffd 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -245,7 +245,7 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
>  int mm_take_all_locks(struct mm_struct *mm);
>  void mm_drop_all_locks(struct mm_struct *mm);
>  
> -unsigned long __mmap_region(struct file *file, unsigned long addr,
> +unsigned long mmap_region(struct file *file, unsigned long addr,
>  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
>  		struct list_head *uf);
>  
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index c7c580ec9a2d..49a85ce0d45a 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -41,6 +41,8 @@ extern unsigned long dac_mmap_min_addr;
>  #define VM_BUG_ON(_expr) (BUG_ON(_expr))
>  #define VM_BUG_ON_VMA(_expr, _vma) (BUG_ON(_expr))
>  
> +#define MMF_HAS_MDWE	28
> +
>  #define VM_NONE		0x00000000
>  #define VM_READ		0x00000001
>  #define VM_WRITE	0x00000002
> @@ -222,6 +224,8 @@ struct mm_struct {
>  	unsigned long stack_vm;	   /* VM_STACK */
>  
>  	unsigned long def_flags;
> +
> +	unsigned long flags; /* Must use atomic bitops to access */
>  };
>  
>  struct file {
> @@ -1176,4 +1180,65 @@ static inline void userfaultfd_unmap_complete(struct mm_struct *mm,
>  {
>  }
>  
> +/*
> + * Denies creating a writable executable mapping or gaining executable permissions.
> + *
> + * This denies the following:
> + *
> + *     a)      mmap(PROT_WRITE | PROT_EXEC)
> + *
> + *     b)      mmap(PROT_WRITE)
> + *             mprotect(PROT_EXEC)
> + *
> + *     c)      mmap(PROT_WRITE)
> + *             mprotect(PROT_READ)
> + *             mprotect(PROT_EXEC)
> + *
> + * But allows the following:
> + *
> + *     d)      mmap(PROT_READ | PROT_EXEC)
> + *             mmap(PROT_READ | PROT_EXEC | PROT_BTI)
> + *
> + * This is only applicable if the user has set the Memory-Deny-Write-Execute
> + * (MDWE) protection mask for the current process.
> + *
> + * @old specifies the VMA flags the VMA originally possessed, and @new the ones
> + * we propose to set.
> + *
> + * Return: false if proposed change is OK, true if not ok and should be denied.
> + */
> +static inline bool map_deny_write_exec(unsigned long old, unsigned long new)
> +{
> +	/* If MDWE is disabled, we have nothing to deny. */
> +	if (!test_bit(MMF_HAS_MDWE, &current->mm->flags))
> +		return false;
> +
> +	/* If the new VMA is not executable, we have nothing to deny. */
> +	if (!(new & VM_EXEC))
> +		return false;
> +
> +	/* Under MDWE we do not accept newly writably executable VMAs... */
> +	if (new & VM_WRITE)
> +		return true;
> +
> +	/* ...nor previously non-executable VMAs becoming executable. */
> +	if (!(old & VM_EXEC))
> +		return true;
> +
> +	return false;
> +}
> +
> +static inline int mapping_map_writable(struct address_space *mapping)
> +{
> +	int c = atomic_read(&mapping->i_mmap_writable);
> +
> +	/* Derived from the raw_atomic_inc_unless_negative() implementation. */
> +	do {
> +		if (c < 0)
> +			return -EPERM;
> +	} while (!__sync_bool_compare_and_swap(&mapping->i_mmap_writable, c, c+1));
> +
> +	return 0;
> +}
> +
>  #endif	/* __MM_VMA_INTERNAL_H */
> -- 
> 2.47.1
> 

