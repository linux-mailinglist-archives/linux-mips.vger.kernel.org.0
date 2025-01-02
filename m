Return-Path: <linux-mips+bounces-7227-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 903919FFCB4
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 18:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F21A1880139
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 17:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F086E7442F;
	Thu,  2 Jan 2025 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AvT5hG/3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QE/Xf6Mh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09898AD51;
	Thu,  2 Jan 2025 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735838740; cv=fail; b=tWVlXqvKXCsV9sV3Qwli4H0WK5o/aheA1zg1YoC6lM6hLbb1mA/6AyqVu0gGJnhwjkUr0qb94rzBfZ9422tCjbY3QvGOP58MN2Nan/Ltwg029nM0XRLV6sHIHHS92J54+gWtr8PGlm9ekpw37HsMmXz/6KDNF6UKxSFGcyMikOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735838740; c=relaxed/simple;
	bh=YoC5AP2GdIstZuT/w8k7At1LQLYA5N3ByUO740cz5w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r7sBC4oTsfGIwUXsnPeFTpi72qpUQZjGsFf47VphlqwQQXxZNvLAn1AbL5Ud9L7Se743dXT4WvCyg43v5W8Pb6SpQDHG+S4zGqcrrOJEiapZ1hG1y19IlgHdeu+LvWoZvxXSCn91AebE1fc3eL7otI0LEYgmN0Sg3H1R+Fqqu7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AvT5hG/3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QE/Xf6Mh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502FtnxJ003470;
	Thu, 2 Jan 2025 17:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=uJ9VorlKID07z95mM7
	e9mId3aab/VIEzNfdQyfUh75I=; b=AvT5hG/3gECzQseMDNSYMlkFSVUK7WJGz2
	wjx7ND1jW5yNAu4CVTPyrh7aZTvibRsQlPC/W6V5KuhNpSuw1+EDTnOaEgVap0rv
	yr/yvGWkqPox1TbD6SZ++q7BMCsB3t6pLMDKsIrdA3VXzVFZhv5CW2Doo4iNkr+8
	AOlpTR0OroaCQFzoay5nAW/udB+PT5b6RHIj/9OHOcb9iAeMZlKgGzC5eIRU6EcT
	KoSksD8qeMszUN+lHr6CNfMC3SUSdB7PwS/aY3p5dq7+MsE2RLryr9JazJy9e3dW
	WVLqETxD1Wrb8az+zsT3UzQyU1idfs535cMO4dAofqTp0RrjUNzA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t9che0au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 17:25:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502G4VDC012118;
	Thu, 2 Jan 2025 17:25:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8ugv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 17:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5HYX1f3GWqhX/L4+g+ljwv6lU9nNbodYt5F/C8MzVo6XAAvk2ttJHKSWgJ/7CulonNyhiSphPI8V6KRWe4ORGyckVO7Qukr7YXp1OM5lX5mPm9gxU3+k5psACHBqTfnQtMfMXdvXEL5khgBU+gjsIclEECy3oZWeQPcl9gqdkjSrTRhlE6GUxm5HyLRbgwKBmr/pbdOlLTyWSpT+ycUDkj7jjcSHgblSaJyPfkCUxVbInlyglckwyZKp4rjG9nyHEcBv2YCkOxioxCrjlnfV9FFmzA8Navg7PRG5vOaQCuSHvCXiXNELBDWVQaSHbLWygj7YpTSOLB864GY/eQ/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ9VorlKID07z95mM7e9mId3aab/VIEzNfdQyfUh75I=;
 b=KiPzb1I0OwCG74SiEEKnJeUGSEdbuaAU42GNPjcUwiWkxIw1C5HdljEB+ZD+fN83BVs6INVQ7tqMdI5MrZ+uT50B43q0n3jTonfFW2JuLuL7+QoggxAc7tVG5bIL8VKIHmEK8i8eTGbzupBuzVuuIZgOn3AIkTcipXTIZkJU8VjFal/1D6nbSQtLd961c9tSSXgNskhqf03UMso2rYVrnHaa7mm7j/rwYNezXcPu1gufiegEylTD72Q2mL7ms3ygs8HaGBHFiLudjyBLnqn/vQukzVCAcvk9yZEt0IQx6l7tfEKsc3rwHYFn+JjcQVQ8/qAkZ2MW9BA9cVGa87HkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ9VorlKID07z95mM7e9mId3aab/VIEzNfdQyfUh75I=;
 b=QE/Xf6MhY4PpTDwUzweF+Ah7BZYLsa4pPDJ6XaxLr2d3Ch3/R5Q6cPd1YN4aPiIErx0Rw6+2LJhb7Y482Mzi5E1RI9bCLijTCSIC94GH8vJ50uj2w8/VWnmtCW++eM0gCyCNCEpsmvdw+GfiK1rT+kDz/X72uMzwg3RGfVByr9A=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB7317.namprd10.prod.outlook.com (2603:10b6:8:f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 17:25:10 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 17:25:10 +0000
Date: Thu, 2 Jan 2025 12:25:07 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] mips: vdso: prefer do_mmap() to mmap_region()
Message-ID: <f5cuqzzcy6kqskkpuk4hcagteqvxghnj43563felem7j2nsk2h@fgrl4ctbwgpe>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <cover.1735819274.git.lorenzo.stoakes@oracle.com>
 <ef076e381570f709e5c2c142dc030ec5b3309a0e.1735819274.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef076e381570f709e5c2c142dc030ec5b3309a0e.1735819274.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0500.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::29) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 658a7ddb-bd97-4e55-d742-08dd2b5268e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L5QfNRNZu0iFSCQZ9vy1xPfmDOeRdxucWZlT9aUBpVMGCMytlnbgCZ4TWe27?=
 =?us-ascii?Q?L2J0nJd2f5wXlXGwmSdvL0e1rcio+hgmTsZQcIDPkfrIjAbOWom1Ot9Bifjq?=
 =?us-ascii?Q?YFEahfQ4Q4d2L2GzScRjneFi8vqLPw3U48zq3klKBFrOEzCxP708/KFgBFsf?=
 =?us-ascii?Q?5T6m/nWHZ/ST9ZH+FEJE7rmtYCztUjRp2C3FEntD0GwHv75RNrcM/Gl7unqP?=
 =?us-ascii?Q?/khxIZZc6tDdgOEBNa5uTjvhgFTk8Nup0mHaScHfy4kV/Kty7NpmcHJYwIPt?=
 =?us-ascii?Q?7gYPwM60Yj/Uo09/iwqxyYrvWi2iAmdnGyBbCmVIcY+nFv3N7yxjkKFhr5AX?=
 =?us-ascii?Q?pD0nZ6ZYWpQB8qiNvLutms36H737ZVcA8wJJasX1GTbDJfGp6RFUwHm0Mlk2?=
 =?us-ascii?Q?dDEi/Hko5JZlOoOCRs7D/vvCGNbeopHNPoYOL2wq9Z4JLzKVaWep9fyhulOc?=
 =?us-ascii?Q?tui1uppOOkuV16ZRnzTFlc4Wv3lk88HFxCu+wbEOPpPTCpnYYqY5TiF2mdUV?=
 =?us-ascii?Q?634JFbXwJapr0XQG/BjV6hAOeimr6yEx0jDZiWTFGuOsBjkU9Bk+iZNsYiKq?=
 =?us-ascii?Q?3uYb+nkNKNirSYBcq8nqT24Xs+XDyksLeCrkOpe8cIe7F1RC/sTN4lwIG88B?=
 =?us-ascii?Q?kKQCSKGk0vLD0tFPZEe8kAV/S0NmDIcA/sFBZAMIJ3LP+L+9jz6i1uKTS382?=
 =?us-ascii?Q?FHcFUY+miIGGmLBKq8Z2KEhS2BMzdziLgvsvmdKcW30jtACVHvfGZDwh0npz?=
 =?us-ascii?Q?hcPGd/MdDff1npQp1/YH6lLK1oTCs5JMBnXmSxggyVc06Khr2Pwy40xFjttZ?=
 =?us-ascii?Q?+p3CG3RdfZuw84+wsg8+BYSMxXOATGIifC8uX+qBpA1IDL5c/nLAHod0pLsM?=
 =?us-ascii?Q?1rmRiLNP0JLtnpAQOxdguYqehqIbpm3AmgvGSMTMl5hKE1+ec0x9if0rf8ZS?=
 =?us-ascii?Q?hy+jCbhZu82WAXyMGIx/mnoHX647nNL4eEQAsQWxA143p09jHiNYA3Nhtypn?=
 =?us-ascii?Q?ZF4q+/et4JMFCI0+IdFsYwXSzCK6PVVCsqhVM0gWIjJ+vmjadashnBO9GpBQ?=
 =?us-ascii?Q?VEEOIDQWaMN3qlsNbow+uGsQ4A0kD+H9OB2b8vOwDDx/7VXw/CeF19g3HxOr?=
 =?us-ascii?Q?Y2wifvguZYFvmv3QAyAeXS7MAsvLd1hoeJ/uYho2nJzwejLROAUyOnCuX7Tu?=
 =?us-ascii?Q?m6sgOE+cfDAnQG1LTnJO+5d/lZrsw35MwueLY9JvILRWJRomjjNjSzs7cPXs?=
 =?us-ascii?Q?SxlGv6fzbGd4UNX9ivePdRp9UpEowa/7va5DtiCdEMIyxsDpNsgT9DsbG3nz?=
 =?us-ascii?Q?14SkVBTRatWiC0Ot6Db0i9BdqxatNTpcfOdMIwuBuYaupgU1R5KpddxAmeNe?=
 =?us-ascii?Q?E8R8CGqqU4X42IO9lTVuixi0CqpU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?whL36X7tkHUhBB2W2p6I0Be4FXJv38mlGFBk9Lvb/QiwNnyRhwQa6WBiVk4C?=
 =?us-ascii?Q?dpQErkqEem596H5keHM+vPmp9w9DjmA09wUwGPD9bCOzf3BJh1okCeoUfwLV?=
 =?us-ascii?Q?qy8KJL/zDXQUXl5ex09G9CvyYUY3B9AwFyg3qiTyXCE4v8srgJgt4qaEfx4N?=
 =?us-ascii?Q?4bvByz6htvaTLUwr8IWxTiUZpBrwGLPKLB6cQbMN5VDHUn6axlcw2ZhTEiIb?=
 =?us-ascii?Q?CvFm5m/Lu86EPiJI7MUkQVb/owPNds3mwQpTY4NK+a/G3mH1LYgySlp64xFH?=
 =?us-ascii?Q?UP0DyNVZC7dFa6R/0vdr9w0YaFg+/gLtG/MU2kB8i9mSTCCrWV6dROGuSxfu?=
 =?us-ascii?Q?+7TjaxobkgZg1wSAE/yQZ+rve67tCdwzVQ+ezk0q4dVtpK/+bro+0w335cnz?=
 =?us-ascii?Q?tnOr82v+YutlMh6hTDOwHL3m5ceHT/9MftbCyAYP1LFZ54RGEd79TNaAsZgr?=
 =?us-ascii?Q?Udphu5OmV8rgI/3eBTeDpg6NqiYDnjDpJ55LPCojTuHKZOxXjwjkzvJ83mT3?=
 =?us-ascii?Q?Dys0mFCqWKZ6Od+9b6nfYUjH+BVjSX30ECrYxIH3XL8pVjcNJeT+o4oYNgU8?=
 =?us-ascii?Q?rUBDzHkAGrgnCbcRUO1eJe4RKmOaxloio/Q9mBJ6a1gWDM0yXkXgk9CTf3Sg?=
 =?us-ascii?Q?/4GI9VmWMbyBgd2iJ27TkfQmM6F+DLW9Iz88YaSQufMYWE0jyClqzBpYIwlp?=
 =?us-ascii?Q?Um5l73Hk7+vdS1m0mwiB9z8TJ/B2ciOp63lGNo8l0XtDbZ0OKXsc17ubVAGy?=
 =?us-ascii?Q?SHeXAZczerdZb91ZcYQ12CTDEK92WsDOveLxzwhSQ7rwciLE2GUqgekTq49s?=
 =?us-ascii?Q?sDZwxDjWM4SxAHKeqbPsLSfi24eq2feUYvvkJiHAvvtvBfLT87JPTEex9RE+?=
 =?us-ascii?Q?afaxIStY5Hm4S0GnxZOLLtwFE+f5QAx/2exx5xbzf0D/bSXcYIhJIqBBbQkv?=
 =?us-ascii?Q?WWtx1+K5bWe9xTYPAj6BoVJI0HvhmtReL+RQtfHe0o6U7x9vutO/W1dTBrFp?=
 =?us-ascii?Q?Hy8BIBg63Zg0VAQBUTa2pl4hNLTEFYLFD61ZnMnrfvtH3Hu64JBwyd+Dwi89?=
 =?us-ascii?Q?m5/DtXWUAoYlsMOXxY3h3khH3k9nFWhMqz08Tip1mQbgVzeUHFwlFMBnlYWd?=
 =?us-ascii?Q?A0L8KgKZ6mvK0NmBJRvlLZ1Ecg21OKxFa66RquKpaob32T0P54PWzXjP0T15?=
 =?us-ascii?Q?VGebUmPGbP16pAibOatVB6XBgk4EG6g6jA6tryD72wWwHMyFWFM5DOP9u7AK?=
 =?us-ascii?Q?NVdqoRtr0WPf0AdkznD0JhykXDiUcqfKQpS/CMUYCoJFhwoCgRYzZHIptjFg?=
 =?us-ascii?Q?TnKmbfG+worS2+wy1abxd8pDKEBGZeHmZPV5VCOWCCmff7P0NL4ugL80BM2Z?=
 =?us-ascii?Q?o/hxEyZdwMxmukofCohS8eXmIxQnGMQgr1FBtsr/caHhDOmu24eo+FDvsf6/?=
 =?us-ascii?Q?QG2MgvGKwQ6OCYvxAYCw7nEg5Qew9LoNlVMfIwoKOh1pN3xD9Hh0p58Ff15y?=
 =?us-ascii?Q?FNB7b+9KKPEUrcgEA7uuLOu/QtT2jeT+oFKs7nehYMMI2k7Zi7i8duBiFJA6?=
 =?us-ascii?Q?hfvr+vwKftrjKwEMuGDsXjb0s7lSTE5wQwj31/Pe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VQqw/vd9K6GqwaJ2liV643Ib1wZyaxAcxbm+LV4y80gxT/gWs/ZnEV0VDfWoHEvbkcPzgdCzNbyBzNUoHwzIyhbvw8ZYBCepecL2Z7heeW5A8KzcFmhow5CxZxhWQ9v2ju2girA7h/9yaVt5LWwORm4kAip+F0Tt2KhBk+172sbxlbCctvhnDvKrjGgZnbF7Bo/6W+LbsDIEq9Dx3aGHjJ9VXW3E2Y7sBGLztdd6sdxzDhwmUw2ZEUmzvokCFiV84g94nHSXFwsYRe3PsmuYC/Inkb3eGFWdQnDetz4O0CbBN8ZmQOMHVSezW8AwlXc9qtEMXmeipUR9mh/qFMOqcsI4xQpztevZu+9w+3w3AyjynZCdbf4KnDvc7lhcFmjZijxPvdIxGKkwsEcw6o8aY0rXNUy9w6uxL+ZSI47QgC4p82yiZ1qafsExyC4AJ9xdpfQOA0FOVTsd30ASmZWZo2K/9C3DvjfeqyeVcOe/+OXfMNWygj5oLeXV+nbh4KcMTU72172xeJ4ReVzaLQkPJEgjC1IQv8XRUUpR+CsUM4xmg+wxMgQ7nCwmVxl3zAbdchNiY2CsRT32vw2DIfVuH8tCyW6gpG9MMkvqvjMuqnY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658a7ddb-bd97-4e55-d742-08dd2b5268e4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 17:25:10.4872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMhDocFfkOMs5D4zqqj8HNj2D3Mez8v/0hCBpZPRB6H4XXKbkA+E8XtQQlEaF3uYSc4ssoPvgIV1aWUqutoL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7317
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020153
X-Proofpoint-GUID: ZG4jTtw7_FRxRy8dSKJdX5B_FAlLc_Q-
X-Proofpoint-ORIG-GUID: ZG4jTtw7_FRxRy8dSKJdX5B_FAlLc_Q-

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250102 07:11]:
> mmap_region() is an internal memory management implementation detail that
> is not intended to be used outside of the memory management subsystem.
> 
> Map the delay slot emulation page using do_mmap() which makes use of the
> already-held mmap write lock and bypasses unneeded populate and userfaultfd
> logic.
> 
> This should have the precise same behaviour as the existing logic.

this looks to do the same thing, but a bit heavier - which should be
fine here.

> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  arch/mips/kernel/vdso.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
> index 4c8e3c0aa210..75c9d3618f58 100644
> --- a/arch/mips/kernel/vdso.c
> +++ b/arch/mips/kernel/vdso.c
> @@ -11,6 +11,7 @@
>  #include <linux/ioport.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
> +#include <linux/mman.h>
>  #include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> @@ -97,11 +98,12 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>  		return -EINTR;
>  
>  	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
> +		unsigned long unused;
> +
>  		/* Map delay slot emulation page */
> -		base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
> -				VM_READ | VM_EXEC |
> -				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> -				0, NULL);
> +		base = do_mmap(NULL, STACK_TOP, PAGE_SIZE, PROT_READ | PROT_EXEC,
> +			       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, 0, 0, &unused,
> +			       NULL);
>  		if (IS_ERR_VALUE(base)) {
>  			ret = base;
>  			goto out;
> -- 
> 2.47.1
> 

