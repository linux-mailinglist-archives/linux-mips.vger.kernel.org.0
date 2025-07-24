Return-Path: <linux-mips+bounces-9918-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA296B108EA
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AB9D1CC0258
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667A2701CF;
	Thu, 24 Jul 2025 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iZo966+Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tthtmpOq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856AA2701BF;
	Thu, 24 Jul 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355760; cv=fail; b=RgsTfrabPq9fn278R7qYgo0Y0i4m3LuQ25GQ8DpvHxxcghwMfIVRn7wXkkrD9jlHg7vlOeun9/RpsvL730QsTKJA4dSWRLUv6G1iHqpcR+pujbLnEZBER9l9/SifcqcRjWSnafzhsdy4bvS/r3s6YFVJ9Spw/p7Y+o4wF0YC8bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355760; c=relaxed/simple;
	bh=V5gqNA88EA+Se16dfVzS9vnbigJjE81P3go9FLc/vDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IES6JeaaADbVKnkHzYFP6JmIKl3TRFPmUlqlkHENfzQv3xUNIyUT1G/tDaCcQ3XJ+wcW2MDGXbwU2Ryo4sbHOIt/1jaZwZydAvACEA1W4V91XlFjNPOdkrpLwfcYxCe8gbLthYvITtzyhdw0KZYb6DhlzvOQSAsmT3xbWMdsMno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iZo966+Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tthtmpOq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OBCJUw008446;
	Thu, 24 Jul 2025 11:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=V5gqNA88EA+Se16dfVzS9vnbigJjE81P3go9FLc/vDM=; b=
	iZo966+Q3Ov6RT+u7ZZ3Vm9gF0u2pEmzv1zjb3iQw1pEDRaOEM3BggZOoBRLMLfa
	1xoulHim4swMaDoJyYCj/gFHkM5balOR/jJ3let0efcnODLFMvmylFQ6MVa+6yqS
	azbMEi/QylGc9MSZKnNPQM9ZIf3fIHHlxkoj+wsdmUJunJCL0SEJ4/eNS1L8dPX2
	PG+p4tcXoQu+FkKUbXrgjde3ofZfScMVnA9p8n9DXBat+vHefOVB/GDso1kUsDSE
	gF5i9oqssR+rjp+5gatVmpBeBuG384eGbGwEsMUzOHxWNZDMYcGNDS+6t3/WJk9U
	FBPRY+K9T2NbW+FJlyn6Jg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48056eh9b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 11:15:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9i0U2005940;
	Thu, 24 Jul 2025 11:15:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tbqmft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Jul 2025 11:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfwnbs90FMXeCfdItT25pWqyzMwDOT1qXHPHrqLbCqa3eG8oYmj/9FfBhp5f4jbjjamWoVVwW2riSWpE2icSTCo4R2HvBemTlrsjZqUrlz9e8PiI3/0JP8kS+mRBjxXJNj/eJ92dXEEBMIErAFZ40V0CWYg92JiWfDgQQ/3U9SEuRL9Ft+2F3PToTEpJnT6ehs6RSXa8YI6EiZQddVfTdfq3CEb91wfTTrN+XzBuxZSbqg7Fndwf2vLd2sIGQKT3fYFPjXJCAcWX3iQ1o2WFS8L+J+FCwy3fjenCnY66Rl69nkFG+OVlZv9Tu2Wnfw0nCm7fcIw6CxSLzgNRK2vw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5gqNA88EA+Se16dfVzS9vnbigJjE81P3go9FLc/vDM=;
 b=LTYuMZX8zF01a64jmtGCg/UrD0oBeCc21w+UcnCkJLjG4U8xe8+17tDN0J5YHmzLFN2TbRciAAv7wPzXWFbNVhAF4iFjj2t7c0Ozq83pf0qcDzczA1WjUr7+PeMWVq1Hbq6kJ9VZksBxzhTDVPHKmFZOIKAJ9j1P8d1J8GTF3gTNqymHZ45euXBlD0whLb0p8DNyi9cRS2HCTwPCR8+tpUJpQDhER9CmIvLdJ/MXTm1rG2umVfIpawrzZ1mzGOPPlFMV2CXSH9MV5FdZGARt4GLvaxFzhtcg6QMUBl2HYHEVIH9xEiN/iRADfCF8QVGJeckzadeahHbYjYS8MrlX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5gqNA88EA+Se16dfVzS9vnbigJjE81P3go9FLc/vDM=;
 b=tthtmpOqPVMj83mjQWSREfmpFiS0pqVjfJUcX4yh3JwwhAxwFAa9lxYk5BF0Lbm+29KQ46i5ZtoawNmaYHwnwNY+kimVX/4+miT+7nqfYDrLG/8/9jhXLu60Dhz5GOlVJAs0cuWRsyeD4HFK/CpZx+VZvyEfFiPPhyhY+9dpX8w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7370.namprd10.prod.outlook.com (2603:10b6:208:3dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 11:15:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 11:15:14 +0000
Date: Thu, 24 Jul 2025 12:15:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
Message-ID: <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
 <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
 <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
X-ClientProxiedBy: LO3P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 923d1bc3-4967-4288-a5a5-08ddcaa35d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTBiaDJqeFprdzIzMWtuY1lCcHZabVV4Nk5LM04xK3o2aGdYMkZSaVNFcUZJ?=
 =?utf-8?B?RjZtbGV1MmVlay9Rc25FOG9yZldkYXVzZnFsN1dJazdKYXo2VllJYXRSUEJD?=
 =?utf-8?B?blFucy95ZzQvL1VCcEtOSjFuVWhTMEY0ckJleTVrTllGaVN4MnlrQm41K1RO?=
 =?utf-8?B?YVNKTFE0UGM4NVh3a1I0UUE0VER1bytqa3M3dmVZdkVvL3drSVdhNFBDMmNq?=
 =?utf-8?B?SW9JcTZuc0RBemFNTEJDdzhLOWtlTFZTWFdUN3RoeCtiUlFKMWFJcUxHeEM2?=
 =?utf-8?B?bHpFdVBqTDZmaWxPUmtRSjE1S3hKZGloTGVYUkJ4bFUyTmk0VVI3S3BNNHBr?=
 =?utf-8?B?NVJ5YjRQUk5sbDNyVm5wNlR0c2dRZi9zdkRpNXlXYVhHM1JHVFplanFoeUw4?=
 =?utf-8?B?VmdFMkZ4ZmJBRXE3bnp1c0dmM3FuWFJsUmFkVS9nNEMyQUdINGcranhtWlZG?=
 =?utf-8?B?cGNUME1PRWY2VXFmSmo3Vy94enZSMXhtejFQSVFUcGxVaWI2aFQrN1Q3aFpS?=
 =?utf-8?B?R1VDNkxEb0dORzV3bk5NNXo5Y2xLNnFKSHo2ajJTdXovaU1sSG1VKzF5eVJM?=
 =?utf-8?B?d2hUeDNFbkNSNk00TFQ2MFRKdjVlejg1a1ZPMkozakRGbTFjek9DYmpGM2M1?=
 =?utf-8?B?SGVBcUxLaFlEV2JWUjdONkR1YzExcVJ1cFpha242aDkzcHg5K0hVT21reGVE?=
 =?utf-8?B?S2ZURTZsRWJ3RTVkN0VXL2FGSGtnSnZoZUZEaXdmRWVjQ3BkbEt2UW8yRDRV?=
 =?utf-8?B?VEpXcWtCWFpNenRMamVmaGhoZFpqSVFUdW81c2QxOG1UYmNaZzNOaHA5RU5M?=
 =?utf-8?B?eC9HVTlnMFNSdGRQSXRueW05MkpnMUQxWXkwUzdnMkhDbHZXLzJ3a2o0Vzgz?=
 =?utf-8?B?YTcvQ3ZBU2NlRFl0dkFRSEJDcWJlM29ZUXJnVEpNWFNtbm9iMmhmRDlIUXN5?=
 =?utf-8?B?WGd6a0hmYXZrV0lEMDFIVGc0NGRPc21hVlROU25WRStjMG9xQXBjMWdIczR5?=
 =?utf-8?B?R0lrNWpHWFlIM3h5UlVWckZBQzJFVzRFRVdxdExVL2ZWSko2MWlNNlJHMG1z?=
 =?utf-8?B?bHBGR2ZCSkJyeFdwMEgzaHZQQUl4SGhZNUIrc1UyRndFcU9lK28xWWFPNHhM?=
 =?utf-8?B?NmxyUXVHQjBBVVV5TUV4MHNoOG1rZkJ6dy81ZWpuYUViSXZFQWh2OTdxY1o0?=
 =?utf-8?B?dzdyMVd3VUxpYVZwb1hYWDQrUE0vb3A4MmhWK1IzVUpsSEtWUE52MnVUVUJB?=
 =?utf-8?B?dWMyRGRKYmIvaUovRWh6SE5VR3V0VDdkQUltMmREZ2pTaW9rSDUzUDRQZ1Z0?=
 =?utf-8?B?dnFpdmoyem9rWkdHdk9xNWlvNURHU1RvSmFVajJzNWJibGNKazY1ZUVIajk5?=
 =?utf-8?B?eEFIT3dXYm1jOHRxOVc4MGJEaHVnbFNxRTdMMTV1SG5vOHpXRVJjeExMZUZ3?=
 =?utf-8?B?WVhaMytxNFYvdjNuSWVCK0dnSFhlSUk1SHczLzVzSHdjeXNoUHNqdEZmaEJT?=
 =?utf-8?B?dWpJV2JuY2o1eTQ3Z3hhNUxqU2ZyMXNaSzZWdFl5MW4yRTBqaVNPZ3V5UHdZ?=
 =?utf-8?B?VlcxcGFuT29rVEgvdHZvekJvN0ZGNlNSVDgvOHc0eWNTa1NETUcyTVFWbGZn?=
 =?utf-8?B?NjFZdDZiWXZzaDlaV3BxQVgwbUlXUnZ2KzV3L1BVSUFqZE95RTNtOWV6T1g3?=
 =?utf-8?B?TlJDZ1A4Y0w5TG9Vd2xybFN5aGpKNUJmVWhHNHNsUlNPM3NqS09hTUcwR3lG?=
 =?utf-8?B?akV5KzdZanBhMmZzTitCQmxmTWdJNkhNLzlNY3ZuOVVaVW9QZkNtZ3FKODh0?=
 =?utf-8?B?cjg5ektWSm1WZG80bjRvVit5S2pGYXVBSFU4aXlTS3JhTFZzTlJEZ3RBNjJP?=
 =?utf-8?B?V2NwLzhIeXdGdWFKYkRFNWZtRm8wZW81K2ltYXBPcXZ2eGdJQWg1MFJnUlhx?=
 =?utf-8?Q?jwenE270N+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amtvSFh1cW1SeVhLU083b3Y3amZGamlxN0pGWUo5bU8xSWh2QU5ET1dKcjR4?=
 =?utf-8?B?M29TNllGZ1ZaWXU5V0NqQXFOR2huRzg0S3lvelduTEZwSncvNWhYcGl2WE9E?=
 =?utf-8?B?NXB1WkhPVHhsb1NaSXIvWHdURmQvQVl0Q0Q4T1hjZFh1OXJ3eVlhM1ZCY0ZM?=
 =?utf-8?B?bHIwZFZmcjcwMHh0QVpjbUtsYmk5MXBCbXVRdThXZFhOYkplbDhoTkh6eWlV?=
 =?utf-8?B?Yk9qQ0ZBaWdMdHhwT1FwK0F3emNOL2JnaDZtYnVXVy9BRkxjOWwyaXZRZDVC?=
 =?utf-8?B?N0FrRlpMczROQVdXWUlnRnMzdC8ra2k4NFhkT1J4Q2laejlNNnhHTld2UjJG?=
 =?utf-8?B?cjhVOGN4RiswVC8rY3BmUkowK21FSHpuajYra3BScENKa2p2M09ZL01ab1Rn?=
 =?utf-8?B?T3ZHT0ZUSHorc0plMzRzR3JSZVBIWUlHaG1nKzhUemFHSWx1MVFYZjRVdFZx?=
 =?utf-8?B?TU80RlpjZG54d3I0SUtGcU1wc1RnaU9ZUjRGM2RqT0lKK1VlN1hkcHVRWThF?=
 =?utf-8?B?ZGhpaTcrQUs1MmIwM2hURElXY1pyeGZaRGNaTGhYanY2dkc1VjdWUkI0ZGcw?=
 =?utf-8?B?ZTU2NWhXWUdJZm01UFlzNDJ6aUlyVzg3M2xqZDhzd0ltbEdxcmhjZC93WXlK?=
 =?utf-8?B?dGdvdGZDNEpsaC92L1N6RVJBemJHb09LNkR5ZEtqa29oYmhKdmtFSVpjTXEz?=
 =?utf-8?B?OElNMXE0TTFiZTRUNHV2NUY0bEw0U3F0eWhrRmkyQThRdW8xa2Fac1hkUk1U?=
 =?utf-8?B?NW5Ta2lsVEZ3SmVhSXk1WGl6WHVxRCtuSngranN0dFJkcFlkUFZkdGNHWlJw?=
 =?utf-8?B?aDNsV05ORDBpcjlFMkFBTWJrK1dvUE1hTlZuWDNsaHg5UDB3a24rcmQwTTNC?=
 =?utf-8?B?bkdWVENRUkVJWWdsQStXdnUyUGtvdzFMeTVSaEJaYXBmWVZpLzZJS2c5TkpS?=
 =?utf-8?B?QWJZVGd6c054U0VndEgwKyswNjFOYXU5ZGptU3N1N20zQkVyRnRYYjhMMVJv?=
 =?utf-8?B?am9SUkZYZTRzN3dKRENRNEVOeFFyeG9uVlpDZjFOYWhSR3Byd2RBYUZ3RERR?=
 =?utf-8?B?Z3h2Q1J1N0tOaEJpc0dKY2YrcTlFaGhXeFdYTDJtbW1ac3VpbFhrclQrN0o1?=
 =?utf-8?B?eSthK3BFVmY3aDhkM3MyWk9XMVAwWG9jcVNYOFhiK2dHaTB3dlpkOHh3SVB1?=
 =?utf-8?B?VE5nK2FYV1Y4YkZJUGxOSVRrZElYb3RabHpNZVZjQkk2blFNbnZUOExSTzgw?=
 =?utf-8?B?RjRQWUQ4cnljRi9QczQ1NUk5R2F6UkNUTzlrQ0grMDJWa25QWkN3WFZlanYy?=
 =?utf-8?B?alJOMEplM0VlQW9Ld1FjNWRMOVU3ZVJIdFBVa00rKzllZHI5R0xYcnRPUTJN?=
 =?utf-8?B?ZmRQU3JlNWdZT1duM3prMHpBS3lGMjQwQmhVaFJqR1dZSGJYQisrbnlCZFdv?=
 =?utf-8?B?RURiR2IwallEV3ZMVnNIMTNrLzM4cjhTQ1NHWnpwcXRyb05HRmZUb2FySEts?=
 =?utf-8?B?VGhvUm5tektIVFlLUi9hVG5OVUltTW01M3hQYXlDNjdFNXAvNkdzKyt6SDNt?=
 =?utf-8?B?bzM2VXBKYVM2Mkg0enYrWTVlQkRibDhIV2h1U3VrUGM2cUlyZ3BiT3FpSm5G?=
 =?utf-8?B?d1lOQjdKWnBFUWNTT0g1Y21iQ0hFanRWMlNHOHkyVDFnY3VsOVRWYkZtdWV4?=
 =?utf-8?B?dmFUb1NMbHBLc0N6bW42VlV6VVpQTUNuYkJwMThudyttWmk4Vm05bmNYb085?=
 =?utf-8?B?dEdNdndtb1ZEaHhuQU4wekVRbWtFdHBZUzgraVZ5WEZSNzY1VmlPemRxOU84?=
 =?utf-8?B?NG9IMmZyVEdsb0l2TkFRbjZUdmdZKzMrSjVUMGNWMGRlTDBpTHdXc0lqMTNo?=
 =?utf-8?B?aFlmZ1k0L3NUVTRoNzRRWlRHSUNrT2hZQjBGMjFjL0JqUHRGZFB4cEEramRN?=
 =?utf-8?B?UGhLQUZEbXZYdlMxTU9jcU9XU0pmODFjbmFYSzVyTFlOQ1hSbGVQRzlWazR4?=
 =?utf-8?B?NUN1RHc3b0RhcG9MZE9GOFF6dXZSWkwxU3RXYVYrL2RKZ2RqWG51blJYVWVy?=
 =?utf-8?B?SWFuM0lxb3ZGSTMxVFc4SkJlL3pTSVUzVE13ZnNXbW1tU29HWXpzbHUxY0hm?=
 =?utf-8?B?dnVSSmlYVGxUSGRnTnpkdyt3aTA1eDRsQlBnbUYzaXZHTEdVamcxN0lUcnph?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xHYFKvxPzX2fgjSdO436qeogbdlsdvesS4fC6c2x03Vja5B/BGPHoktogg59SamMQlL0Za16wuQEZkBWmzZmnL4T31j3iKcTQkeyQrRTd7uYh2s7zCippfg/v6Xcryang5zMwa93IYUa0XlW8tv9tdA5c8lHVW9mnyQUYwZhr6mSxNpTI1OFrGNFrfKwQOk2+derZ7wSR6/9GhGKFjujofTrYBJ8XAMfwAs8yDCU+ydP/dw83mgCy2FobZi5iZs72NYMPfmjjML/ttJvYKUHqdFCJwJcLJL3/24JiIJVCbSydeJ4vD5Fyr2aOXKEwd4A6p20g9vaIu6cbgJ2XlidK3nS5g64cGAsY2Ia+vQorrCiQrS0yZMT1rRwAmYS15NX2AnoDLgB1+wCXuAWTBaWfbo/bs1+xRfdDqpkSo+UGYJMgiJf+ALy+UwJWRuC8ax70aq0C7ZG5lR5hKyPYv2c9wojkz5vAwrpkrnNRrPu9tyfslyfiKkGMqXdP56/MGQbGBLqxwCKaC9MnMCMcB59/COmp8w7Yz07rs4iLLzhQV5neIsfxmouHHq6gHNZFs78ugvBuuLyOnXl0Ask3Qdupm2IzPNOeNQSo9BGxVYzq9g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923d1bc3-4967-4288-a5a5-08ddcaa35d21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 11:15:14.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW3s0wuGRADyTytASlVnKXSf9dfJ2D8U7SfGS8uNJEDKByCTooFmeSp0hOt1mrLkhChEeN+HPLhF5RI36Bus0AaZUwJJhXRpgTfVFXPnAww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7370
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=830
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240084
X-Proofpoint-ORIG-GUID: NCGckUdGrAtqsFI5v-3WaOmjCGC67-YX
X-Proofpoint-GUID: NCGckUdGrAtqsFI5v-3WaOmjCGC67-YX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4NCBTYWx0ZWRfX7XfkIC9AbQKh
 y8eOqfni8aMPycWL/bho8VW6xtVCynGDSV6B/BFMzyEHDk7erTZRFV1AO3C/MxmigWcx3HBXsbs
 8ZJhufHWlWV5V2zokHygh/NIfLo5odIZe2MkaNOxba0FYobZGR8m7+2xDkmjBn3sJzei+5Lr231
 w7sxe4EE5jrJsjQQNdPRyiyAXCpwc0KkEI89DbiNPHxBj2/CN5lbeSNMWtCoiQKkh7L8QbXq3Nm
 4n1eRDz0XsbS+f98DDtqhmNrCjjw2J1yRyPf+A1OM15GULTCx9XXEOA3HmxCm1aH/d3BMyVXxK1
 M/IaOJx9Nwt3isv50GZk6wWs3zF0C/wiSM/rJC43QW8+KDblBXkhRaz6dZOeYRK+RQi1O5NMqH7
 8qLwTKma+OJtHHqHFxhXbnESchSojWYcUh9rU021I1Ol1YAH8un5PbYDNzqK9CELoyHOmn9d
X-Authority-Analysis: v=2.4 cv=Ef3IQOmC c=1 sm=1 tr=0 ts=688215c8 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=uyqBjnzlUpQ3w6metvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10

On Thu, Jul 24, 2025 at 01:12:49PM +0200, Andy Shevchenko wrote:
> On Thu, Jul 24, 2025 at 1:10 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
> > > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
> >
> > Please drop extern, it's unnecessary.
>
> It's all over the header. This should be done as a precursor patch and
> I know that usually people push back on doing that. I gave up on this.
> Kernel is going to rot sooner or later... :-(

In mm we just update as we go, this is probably the best approach to avoid
unnecessary churn.

