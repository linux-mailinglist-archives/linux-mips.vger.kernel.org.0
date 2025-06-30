Return-Path: <linux-mips+bounces-9549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2010AEE0A0
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0AB81888281
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 14:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8207928C014;
	Mon, 30 Jun 2025 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Glpi3wiy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KkFmNRj3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351E28BAB5;
	Mon, 30 Jun 2025 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293617; cv=fail; b=c8b5Q1fAOvK0gwzK3Yqv068vv5n4emKa5iXyq5MG8IvSyU6tOIKwyMa6LCBIqvRTbyd0s439mr7TmrDkTeqIGraVxFAsEGfZPN6n/qs0DVJ+ZfxyHZNJxD7LQGLV5ZsTp+v6ALbugXGKNtD2IfSMYeoKW7tM8wkG3Vm2UenW3bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293617; c=relaxed/simple;
	bh=Ofu4EEvWYM5V4Vh8zh5kuIRpddH7AobLEHXbs/YeqKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGG1ihYgGGi976oWcf604KKlSPS6HiHFzt3VIWwmerX5xkyZmGkufViHGsvpFo5TL+yDM+aczBLxiRDpsozO7eNkZ/ng5yOl+AgVzFJZdFmViNKDWonSOpwPq/oaU/lj2mx5kCWb7G3sOMGZlf+uMvL1e4hQZTNiYNHuhZadoB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Glpi3wiy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KkFmNRj3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UDffNg017350;
	Mon, 30 Jun 2025 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vdTKdv8jxM7eOEb3fa
	aSKTYFFcen844A5gf4Zoj48F8=; b=Glpi3wiy/MJ6NLqb32+3pnVQFN3PJOedB5
	9WOJ5cVm0pW0nPFdcVfLEkdh3vZ7hs/mgDkzZ35EC2EEXAFf48233TTwezeEcsqt
	1xBIXLUpsEwSnzaXFI/Nq+tXOKA37rbVkVXaRY1/zbZBt7wiJ/V9MRtAxeYVPEnX
	htzJTOldGckaHXPSWkkoTBi1j6d1cCh5d/t+XT5edFICuM9Oe8qG19Ag0DE5qqkO
	sbUQ8Qin/JIPM8of3Mx6quXzxG9IH14G2qxzMAAo5DPmF4/Z9kQVDJZv4TJtaw5/
	QN7r7IImngKhAIRZSjiIJNfeL9HH9fTFB+JD5S1QmDCSyZtzeJbA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704an7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 14:26:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UE0SMD005961;
	Mon, 30 Jun 2025 14:26:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ufnc84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 14:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0/h098BdSHhJx9r+FXPl1kWaerRFojSsWCGz6ZorT6UOu1ukinZa2JWA56Gpjv0Ed9MCyTJy8FE6DKgaNAe6FdoXQLmUN0lr3S834l93OHftDfYWBpcsnUzu+gYmbFmQJ/nTXa1SLD3M3wPCMIlJEC7jFLWgVGmAc/+9vxXEiF+U7a4uY1QVigHNprBA5DEt9HJGc5pMUtbHcQg7yhPSvD5Dy1o5YUb9KRVzaD+hL7E2JKJpjeyis8Iury8bVP2k5SYZLm4lvs6tddLG2xGSvsgBdV7DzN4c6J/W7ftv09bCt8CbXZ/jG5AY3QFcg8/vDj0pqwKuqGdjPsyS4cSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdTKdv8jxM7eOEb3faaSKTYFFcen844A5gf4Zoj48F8=;
 b=jZw7KaiGMl7Q8TzSZVl0hx0SXey2JrTKilDaCv19aaFzegWobK75briEbfxZzq6S5nlpcu5++7mKGdPMAWhGFhBlUC9NeF/b2Fge4sLfob46arhCHb1M15RIqceOPOKbNfpla+XtA5Ij0iZUYOU9crQK22RoxwqWVgIg2sjC/bT+lkZ+kGLwp40RYvRFL/8p4ov7sg10/UgE33x9Zi2tuTfvRPCzW1O10iw7eUvNAAM8GdKel/V7R1ol8ZVWNyAMJ7RZspcm3WD9PnxUMpFc5h5vfelXydfR2Q1F1fLYekWwZmOGtdPMidhcWD1ghhYgsBBp5WHPSgKLtq8vPHVKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdTKdv8jxM7eOEb3faaSKTYFFcen844A5gf4Zoj48F8=;
 b=KkFmNRj3xla2tStX0nHX7/10jfDD8teG5HUZpAqLaosJ5F+SdFIvCkLIVotlmJwb5jkXcgtuOZSFAmx6HRaZtxrH+q2NqNoJGTiXr3X5/35Y42R15K4abTDTBYg5avpY4drUez4S5o6Af0xlbCt5aj7TI5oyOfHgC+xm0y15ToE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB6689.namprd10.prod.outlook.com (2603:10b6:610:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Mon, 30 Jun
 2025 14:26:16 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 14:26:16 +0000
Date: Mon, 30 Jun 2025 10:26:13 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
References: <20250627160707.2124580-1-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627160707.2124580-1-peterx@redhat.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT4PR01CA0317.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::10) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da75527-63ff-4eac-1469-08ddb7e212dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nFHPo0Qopgpzp7G1Av/zKSkQN5GXJu2YhzdxJ681H8t22r09bM9CkPpxPHLg?=
 =?us-ascii?Q?PhGunf7tiUEJxg8wz/fQ98OxgGazHmlOlvclCEZ5QNkekoz/gyd8sQAMkNIu?=
 =?us-ascii?Q?vk54Uf5EWil3tNp7x3cq1DNkrJ2zex3FzxiLy13OhGXUXaB8udWfvs1K9FiE?=
 =?us-ascii?Q?zSjesbPWWYUhCQDKOXw4JVTbn0OG2ktQsVylGBQqkAO2QG1E19zHeyxewRlX?=
 =?us-ascii?Q?ZPI8Wu1YSZ6afAywZBofrIn0xw8qc6N6t+BkVzNYQRRHApgWGVvQoO03EvLE?=
 =?us-ascii?Q?kYMUPzPPr4M9MCxuIW4nd/iZRrkcVI7aCE61IVZJenLWk8vf7JkefhjZLSLM?=
 =?us-ascii?Q?u1AK5kU1z+OVs9OxG8IIAm+G1wArdPltWu64Ya4fGB1XqiRupt+XAjyF3v2L?=
 =?us-ascii?Q?GxDuio24LgAWt2sOsoSFtQnBesyLsWuRwc5bjKmi8b5CaV6dQ6MlLo5MDX3J?=
 =?us-ascii?Q?8+x3ccQo+gKVeWqnkvVNoZ8BkoeZ5I13jF4W7bD270VsDQqsxVkEp8SbKKR7?=
 =?us-ascii?Q?VRmGB/yVpAp70VaaHF71UGp5uUWwUXgrvETLzWrdg5CsIww/s7BCpky5/zzf?=
 =?us-ascii?Q?PpX8JBCUWJ/3JRvftZFS6KNdsFVxYxdxbtp2kyIDsGfIe1xaV4XddFH3kZQr?=
 =?us-ascii?Q?SFK4Ttbq07LjXbDc9WIN0pIFwWoVfen4p9iM2O8Vq3TmNhHlTjqxN6B7rK34?=
 =?us-ascii?Q?Gu8q+Cp9mdSU4GssfjR2vXAoDCiQMeIYXK9v1va8Yd6cf/2Ar5321O85sNKw?=
 =?us-ascii?Q?hB0llqtGfAfPVClUjkDU3oPNMqdqkh2Tb61OpVP4L65nHxnSU7PcqWwINdAO?=
 =?us-ascii?Q?+FnbmHKltxd43UocGpdD39cbc82f0aokju3TyGwz7cOeNu7lPMD3wIcI596p?=
 =?us-ascii?Q?0Xlz/fx2c89fNwRCi/iYZk/LVOn0uO8/yIxpdeUn7kgvDzg3V2V39Qy2aGyF?=
 =?us-ascii?Q?b5orvXIz3JQA+QA3Nh+YkbZnWPUa6xq2rC3POrXaOC5+ry8ymFzu/F5tKqa7?=
 =?us-ascii?Q?vi75p9tbxYWo9j02il2WQOKDUkV+B0NiLEuo64GbVgcdJTBEbHHZKoyQ/z3o?=
 =?us-ascii?Q?o7ziou98Uvo/Zz9DWW2za0m8dIHvjIWBWg1b+ZGjLJLW6zsGPFjuBZZOGmyZ?=
 =?us-ascii?Q?af4B4S6rfjiv9G4cAdUU4jaJXJnaLMOfJTqWXDTnNpCl+lnLFrtRLPp1Jwl+?=
 =?us-ascii?Q?fRWrcv3A5Dw0I/22KZSmmBphpC3ieH/ljnFEZfSjZrWjI0kHBWn3LYy+gmns?=
 =?us-ascii?Q?kC11vvkHL6XC+OaNOc41mkaG1hIRLoqMjnI02Sfygx5fR31xEqIMITWsyh7T?=
 =?us-ascii?Q?Zt/hwEHYNfhVadZhGsyH6UCp7t9KtuY/dgvYivdhqQKovs/RdwA0Bi91gM11?=
 =?us-ascii?Q?z3EWZp55ExLtOsUFyeN+KwFE3geyitmJiStjG4yMy/4Wwi/39a99y+ZgZFRV?=
 =?us-ascii?Q?D8dBu0K9l+E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j9Ww4mhNY+ffUOsqarc9UmvFj500Z3hmEWKp+I+m9OZYgLN/XFoElfniC/2i?=
 =?us-ascii?Q?Jkqc5YjL0/2OakfxMxwjuoeNwL+GZvYBkqShnc7CVkBJ+tWBdLPhjjNQ/QBE?=
 =?us-ascii?Q?Ns6aRObCJ9L3t3hQ3c9hstZD4Nsvy4yNqZNMpfOyYmqHDtm6SnFIN2XBOFXB?=
 =?us-ascii?Q?O/3GvAt13POg2w1LNfMAniS08lZVAPoY3uQwGXav20F8VxOmoyFzUR+0mODO?=
 =?us-ascii?Q?d+ARDb3avAoD8ZAEEqjTcN1PKt97qWF/gGGithW8lxGHn6LucIbawTgppg2S?=
 =?us-ascii?Q?uJ5TO+Zt1YrsMq3sFik+oHNIdnTxYa7l1KSlYQJmv/yckebyG/cGk828WA6X?=
 =?us-ascii?Q?zMh2regvs6LpnttkCjda7IkGP4DzImYrtfNaodu3q1dAHopA370OFjjZL+6o?=
 =?us-ascii?Q?oLBK/ZPkuVBlf/Omm7503fL/6yoA1LIKf8Dr8uIHgVm8jtamhSu58ywsRFw9?=
 =?us-ascii?Q?xeQA8bgd1uB6Obl1qSfSfIIYx/0zWV3CmEAbDin/3dVAkY1b8ta/VoKtYb6f?=
 =?us-ascii?Q?A5ps9TtfOmneW1c8wBZ/G8C0J9QYBfCQ5LW0QDCgcGlNpeKBaBFdCiu/YuPv?=
 =?us-ascii?Q?yhRUdMDG6PnqvKtOrbwVb5kgfExwCEdB6aQ6oHAfCQrgqNvTiQLSlTTChL1u?=
 =?us-ascii?Q?+iMsbMROTuhww9Z8sqvTaf3kTggd99UpvWjfmsU8rKcczCIGA87AuonagtOH?=
 =?us-ascii?Q?i7GRc3upLXVJluhDNQTSouKOBETp36oxh+058WOeDj+WMkfVrhb/yyoRH5G5?=
 =?us-ascii?Q?aZakp1qLCb535/nlgKMHoH11GbOYv+5g4v9wxnggjP1WPejB3uvUc2XlgMeM?=
 =?us-ascii?Q?IvyAGjboV+AuGOKaWyWvMzPy2bWVrmu4lZFAS4oeLLc11kFh8PqsyHfWCh6n?=
 =?us-ascii?Q?3MW5kUSPBxhJPOP1VVw6HvCQUOiFm1RNmissbl5IDrpxly/gIAbfxgH6DnRv?=
 =?us-ascii?Q?ZPDvjlC/WBtDKU/czw4XJ+fgkqeIyZBnCCL6bVGqe/01FI6wxeKOnGKIN5u5?=
 =?us-ascii?Q?bTuVkhMCZ/9H+Iecn/ENw9JVZmUkxXU6W/B/KsgPOsXzy4GHAPG2dbvzbYx4?=
 =?us-ascii?Q?EcNnyxRwZ1G679PdhrogOVNrqGjl3EKdGjFOWnc72aqabOyDk8MsxeZj9Zbl?=
 =?us-ascii?Q?rtgQCR7MDPQfIXscP8O3XFUCqObxzLrDvnReTpRuY+1lzTmP0ahyRcrWC5IF?=
 =?us-ascii?Q?+Gu4M1tzv08m6W/3W5o9cmZhbDpOP5abJPeFF57ULFVkLi7wEqiQAbyx3RgE?=
 =?us-ascii?Q?/XklMLKP9xbs6g9feUj/UTIWrNb7UH88ioRiTTXh5CmJE9WagAs+/YYACSRK?=
 =?us-ascii?Q?hySGkfL2mk8BkoyA+Uj/x44s0rt8yAhNeIK029iCuItVbUbsP+dGU9ryPjFQ?=
 =?us-ascii?Q?SkDNEX08jHH/6JrcS0ig1Gd25bXlmr9VqTCd1mV18qlr0sibDH7JTiFJpcie?=
 =?us-ascii?Q?je1es12dWj7Q2bIe45qDtPniLW9TgB2psvoYqafdos4I/u+2ENa7bC2ZSUan?=
 =?us-ascii?Q?Dztv4fD4T1+s3vGaNzf/Xzz5aACaM6TIb5qcFGqxsq7StFGXARUOaSSxT2mj?=
 =?us-ascii?Q?1UWuvw/J4OzBI0AWRXjXqQGLTaJEuTyZ5624y2H7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jCr7zQsc+1yvQZbs/a6j/OigToCJULO8+k+WTti8jXLAr6u8DtIT/9Eg8X/vcxoGUgzG/yeyYjo0/dZF1kM1XTwE+P4pXLgKMNxL+xn+ZiFWEtP+tD+T/0+hCsPSzdDBxnJpyVCouyY5XgbcvRq7AU6QNZhRT3TESM3hR+sNKFviImvAAFUveMytIq3AgKs3hw+O7suoCr2A+pS14JJpg5A90rrAydHzTSKGyjtA3DOhdw091XVwx4GAdl1OkYYvhvzckB0vY+W14XK0RBqkryJODe3BaqhvYPQrBBpTs8uYmjghleHhAoe4hiUc4fXy7WCirsbI5aYcbHtyKcTCgz5qXQUtfVIKKuFRXZVsCBqla4VcUDGgn3APl2YHtKiSn1Yi1RQ2zTztqVmoSab69fwYyRdmUAaLoPZfn3HK4zicdoIbBHSYRLVcqqYRIhEIunV3lunhGULotEMaOlOOx3FZO6cAR6ARtBYaatyW1IBnmmmo7sgEK698PutKtqJj/mDKxiRW7WUvRwAIPQ5ZbXnGxLk0yhL6gUlVUpQALOPXES6sPeWFqyzG1FfTOv3TrNMerp9W6KMID1X9uv302FwdmKLgN7nEfPUZGwUwuVI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da75527-63ff-4eac-1469-08ddb7e212dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:26:16.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvanJgt43VUmzC28gXRoc4j0+F2b2x2qZzWXIp9kckNIuzhzAzFjQJPh6PR1zZJzx4Oz0k99q/uYd/xugpX9qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6689
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExOSBTYWx0ZWRfX7mCQ8oVFjzqB gwpB71RhLWQMhn72kPSvQLl78o0Y63n7U6CQ2jdo4OlnWQ+51k5Nldq5W+i7MTF8w6amT3JQaxU OfKhYQgaykw0MnIYXgLod97cWiPUP/8SnyC3nMhaJVj6GBzkluCv9VdKWBrENMuRFyun1tb5lFZ
 Mj5y6+2WQEAxsCfTYxGL+U21Q92UBvGvB1norubkc5XoZJzwWMIIRn4OOcIV+n79ZNyI9q21azU BEdee/2z+V0n+SYufe5Z7IGQrB1R+UeP7qmXVlYXY78NgcaXdqVxYaT+hWatWDyGbGHaZg2hmMh 0JiVAuid7EX4MEbPPqtuUGLAKMTgGf3hcUAFnlLR5UdFIpO0je+qSUhX9rNlgguqHkmSNO1kkMk
 v5YRPAE5j0hWfwuCF1gmZcfi6cY7ERZ4HcHMU1ZQoRMGk7ay4bVeE7OPErnHLmk5s0Edv917
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=68629e99 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=YDmsJLAXTuk0YopicaMA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13215
X-Proofpoint-GUID: wVo01pxcPl4u3o6AyYRtXj5ACeX8gOKL
X-Proofpoint-ORIG-GUID: wVo01pxcPl4u3o6AyYRtXj5ACeX8gOKL

* Peter Xu <peterx@redhat.com> [250627 12:07]:
> Only mips and loongarch implemented this API, however what it does was
> checking against stack overflow for either len or addr.  That's already
> done in arch's arch_get_unmapped_area*() functions, even though it may not
> be 100% identical checks.
> 
> For example, for both of the architectures, there will be a trivial
> difference on how stack top was defined.  The old code uses STACK_TOP which
> may be slightly smaller than TASK_SIZE on either of them, but the hope is
> that shouldn't be a problem.
> 
> It means the whole API is pretty much obsolete at least now, remove it
> completely.

Thanks for rewording this change, apologies for the late response on
your change log.  I think it's fine.

I think the only meaningful difference is that the failure would have
aborted entirely if stack_top - len < addr, but with this change it will
attempt to search in the opposite direction.  Unless I missed something?

I suspect that this wasn't meant to happen in the first place anyways,
and I bet there are no tests for it and no real-world harm in changing
an error scenario into a potential successful mapping.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> 
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: loongarch@lists.linux.dev
> Cc: linux-mips@vger.kernel.org
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/loongarch/include/asm/hugetlb.h | 14 --------------
>  arch/mips/include/asm/hugetlb.h      | 14 --------------
>  fs/hugetlbfs/inode.c                 |  8 ++------
>  include/asm-generic/hugetlb.h        |  8 --------
>  include/linux/hugetlb.h              |  6 ------
>  5 files changed, 2 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
> index 4dc4b3e04225..ab68b594f889 100644
> --- a/arch/loongarch/include/asm/hugetlb.h
> +++ b/arch/loongarch/include/asm/hugetlb.h
> @@ -10,20 +10,6 @@
>  
>  uint64_t pmd_to_entrylo(unsigned long pmd_val);
>  
> -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -					 unsigned long addr,
> -					 unsigned long len)
> -{
> -	unsigned long task_size = STACK_TOP;
> -
> -	if (len > task_size)
> -		return -ENOMEM;
> -	if (task_size - len < addr)
> -		return -EINVAL;
> -	return 0;
> -}
> -
>  #define __HAVE_ARCH_HUGE_PTE_CLEAR
>  static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  				  pte_t *ptep, unsigned long sz)
> diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
> index fbc71ddcf0f6..8c460ce01ffe 100644
> --- a/arch/mips/include/asm/hugetlb.h
> +++ b/arch/mips/include/asm/hugetlb.h
> @@ -11,20 +11,6 @@
>  
>  #include <asm/page.h>
>  
> -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -					 unsigned long addr,
> -					 unsigned long len)
> -{
> -	unsigned long task_size = STACK_TOP;
> -
> -	if (len > task_size)
> -		return -ENOMEM;
> -	if (task_size - len < addr)
> -		return -EINVAL;
> -	return 0;
> -}
> -
>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>  static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>  					    unsigned long addr, pte_t *ptep,
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 00b2d1a032fd..81a6acddd690 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -179,12 +179,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  	if (len & ~huge_page_mask(h))
>  		return -EINVAL;
> -	if (flags & MAP_FIXED) {
> -		if (addr & ~huge_page_mask(h))
> -			return -EINVAL;
> -		if (prepare_hugepage_range(file, addr, len))
> -			return -EINVAL;
> -	}
> +	if ((flags & MAP_FIXED) && (addr & ~huge_page_mask(h)))
> +		return -EINVAL;
>  	if (addr)
>  		addr0 = ALIGN(addr, huge_page_size(h));
>  
> diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
> index 3e0a8fe9b108..4bce4f07f44f 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -114,14 +114,6 @@ static inline int huge_pte_none_mostly(pte_t pte)
>  }
>  #endif
>  
> -#ifndef __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> -static inline int prepare_hugepage_range(struct file *file,
> -		unsigned long addr, unsigned long len)
> -{
> -	return 0;
> -}
> -#endif
> -
>  #ifndef __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
>  static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  		unsigned long addr, pte_t *ptep)
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index c6c87eae4a8d..474de8e2a8f2 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -359,12 +359,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
>  {
>  }
>  
> -static inline int prepare_hugepage_range(struct file *file,
> -				unsigned long addr, unsigned long len)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline void hugetlb_vma_lock_read(struct vm_area_struct *vma)
>  {
>  }
> -- 
> 2.49.0
> 
> 

