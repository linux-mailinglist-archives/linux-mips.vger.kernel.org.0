Return-Path: <linux-mips+bounces-7065-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3759F4D61
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 15:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0898B188D61C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 14:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9911F7073;
	Tue, 17 Dec 2024 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PF5qt8yq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z6NpaXMi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826F1F5400;
	Tue, 17 Dec 2024 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444731; cv=fail; b=vDmylZnPu3cCoVJKzbzr4Ghh5jlLdm28OvunCR0qzNR/B0nqozO+dk0e/FBLj3OHz6RmJvdZuQm+wM8urUZIrHP1kjR6/HW74DjpI+d5Ux48avzrs5DrMYt9VROfrL3C0j85y4oVv9Nr3KF+P2SbORx8DOXPkkhZ8VlsAfBruL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444731; c=relaxed/simple;
	bh=ZR/gbEqYBc+NOrl80q/PlrbCEDhNMvXarrmyoWppTAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=feOttp1lcBpm5JGJGof9gRIb2p13mgzFLbyz/lEMilyV+hjikwR+KSOFVhhh8EAiUcRsNL9kxx0AH3JI60zeHmpEd9avAMOpdp/EAScC5uNwmPOlhJV3odsmBBStS6mbvJCUr/GJRQOsmdakmulTGxaG+4bxZIQaShytQSYdP8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PF5qt8yq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z6NpaXMi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHCuQlG012363;
	Tue, 17 Dec 2024 14:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ytBIwcbb58TmJZpw2p
	WVvh8Agv9Zy52+v7ngNhPy85s=; b=PF5qt8yqpPzQzKzFwRMnDBA3teJFszzTmv
	gBDguzMXD8mekzaayyDHYWMXYQ3lbvwezDb2gNbTTU6+j5B/x2ARhiWYHrgG3plm
	TEqnYsoLbFx0QZrE8WG/TMVmQjkbWwIOw5ypr8BpTa9PCLRkiPjR5XEzjXG+vduN
	c51d0sXdDK7S4ljeSQfqGqUzdCe6h9YAS2vq8h81wkEeIbF7XlG9KfP+BIqaRaaI
	zTSVWKcBhgP2TRQFxIAk3zjG1znrVQ8vP2v8qXrjM+QvDByVTEkuyiUoTeW+4LVP
	lb1Eiro2K5rkNF6qWvURUp3m4WfGFlbTlNhmkCN59j88ited87iQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0ec64fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:11:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDabV8039263;
	Tue, 17 Dec 2024 14:11:41 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0f8pffs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:11:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6xfbdEJxSAJTNcIHm0sOidUky6CltXZI5CgoCdBwMj2AqrWPLl4xp0D5tOMJJ0LjmrKEQiZwFrWIEr/4Ob+yDT0Rp6B2y69t4stb1WzN+2HJ4L2k4SmHsFe5o5evaop6Ghs3U/0wS7rrKReSY9+QxKLnl7Tt7IxCy6sKPUcFDV5wxQXVBmE7+sMtGta0SoT2072VFfhWnyITCnF8iCi6lrZNRGaekEYS2YPYm16s56Smb1TZH+6cTVAUlJ4H1cU4lZCJH77UWLDzV4UbG9sHCQYtKLEE2l2CgZTKo8J3RtF++e5rEtrUPf3cswvTYwltamFAyKRjiKacFiEYw9zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytBIwcbb58TmJZpw2pWVvh8Agv9Zy52+v7ngNhPy85s=;
 b=gJDkVT+7vSVurKZFqMZUueTkoUgFjb1207ehOXEyr0Q3lxgkrfqpXroZqbkLfD8z/UE0LtaKngpspcBIXNAT6p97DKxzpK8Qm+LSk/gQJ6yWWAOgPs6NBV1spjfe3SA9bOKLIej/4zVuw691heJSOMG3Mc7e169CaitvuUiR2yYAnNRNjCOx9sBdtxOc0dd5swEu3uXO1TBj2P0scV/IXBT+8EB3jUB/I027eLi0j57dUR/wjp70JJYJSh7NVcuaILcs19HFf7+H1FCZ3rEmCK9WodO1NqH74xlwG//AXzDBhgEUagMz0XCqe0Hisd384Z3t1mEP/GVmzqmdj66cYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytBIwcbb58TmJZpw2pWVvh8Agv9Zy52+v7ngNhPy85s=;
 b=z6NpaXMivC7fCVyUM2PE9uIHYtWAfvSbd8M++XkKi1MrlpZjlmMzhcR5ENZzsNITVnFt0uS7Vj8XLmaWsRohq4eXMhXF3oKUlTRkuJ/VPihWJwUAbGG2DI2BIEt8VYBGBydCLpkIzRwCpTWVcIgQSR3VyOYzsatKggUAUo3CJZI=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB5770.namprd10.prod.outlook.com (2603:10b6:510:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 14:11:39 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 14:11:38 +0000
Date: Tue, 17 Dec 2024 09:11:36 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: update mips to use do_mmap(), make
 mmap_region() internal
Message-ID: <r2gwcapbifzvycf4iqpdfozggqkjckwd3lgthovyuwq6xprz2a@ofcgu6eigkf3>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
 <Z2E06z9yw+/Jb4Yo@alpha.franken.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2E06z9yw+/Jb4Yo@alpha.franken.de>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0292.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::16) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: e74e2933-769d-48f4-e6d0-08dd1ea4b92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aIKqagN1MB1+VPLsH/vzZo2YCMGXRNad4t00Ftr3+vdCPfwhN7oWARDJhP9J?=
 =?us-ascii?Q?091Xfnov2uYtspykwBRxcwx/x+yub7WON707eB+Ea4wRra/Y1/UOnz1e/j4D?=
 =?us-ascii?Q?BOfYYEDDmn7qSRTfpZ0fv8/R1dA6cX9IYMbI2OsKVK7m/FFPnFPpIFhgxABs?=
 =?us-ascii?Q?LjnhjtHH4IcT/zYmbnkyA8IWLuB/Ap+qRiN9ZTy3uA5/zTHk8hocadTzYc++?=
 =?us-ascii?Q?WcHeWGLhIrlIM4VQMsvh1atyiwCGgqod19yDAY4ju+F+OXhFa+I5Z4kl+Tft?=
 =?us-ascii?Q?12cbgefpEs7Iq68MyGvHe/kMBNTKi3X8apUGnHtAGzyvC1a0f4KlQMqUW3Wo?=
 =?us-ascii?Q?zXP8u84WM4jGvmh+Uce5TMR7cfjYAJwLlmIDPFY+DffgfRF1qc4tWF9fY6Go?=
 =?us-ascii?Q?t011Sw9LdU4SWv+eubxVC0eTjTv27HY0cuzGbE/Ej98Fv7Wy50e4YmJN+qkQ?=
 =?us-ascii?Q?EN2xnkGbpIVhhM0uE7myFNC5LOQr11diTBWN9U5QkDcR5Q8KWvBVBUf/CQPv?=
 =?us-ascii?Q?1/voiUYic389ymq/BysSqHuju7+tsZ3kh1a2oki4PkJduOakTgXEiI+M7/6q?=
 =?us-ascii?Q?ePrtNT1zH3cvJ4ZuYvJNdoYW4V0EcgXe7YTb/ZFBdwHe5PetnF1YfLwsW84x?=
 =?us-ascii?Q?3s2hSaUNwF7R8r+uH2wt+1KTir5tEqaeivZ3BqBfZUjE4THcnPDkXFbuZq1E?=
 =?us-ascii?Q?xxikG5NiVigdS0oNnM3vUGXx7xQs+Ioh3cc6ACQnsY1IbcqQjAQ1mnm82+Oc?=
 =?us-ascii?Q?P90Vyu/3EACAPPk3bNsnb7J6mUxE2MCNkcFJpoTprLLgz2u3UOle77/qnAU/?=
 =?us-ascii?Q?MxTJal6QMswPv7eLdm260wdIuSAF9nmzmjlmvVcz2fY+6JmgAsNI2zByT43O?=
 =?us-ascii?Q?+7/aYgfoFi9CgXYszEgLHHWkWGofdpArAoTi+9jocpOKmQ7LC61R4NHOmkLO?=
 =?us-ascii?Q?Ewf5oy2nzNQ3RWwiCsDJFp8a1/9MBiTAy9kY2SmvoeR9kqcKDSLDYkasVxsn?=
 =?us-ascii?Q?FTeb0TkWFH3wumHlJXJ/5biRkueTgAx2K6ufMRhoHw0/GL7vDLUVmCkWLD+Z?=
 =?us-ascii?Q?ZBB2sJDbaa5VDQlKGfhcKzuJulJgAldPzWvOuHT4GSC7YMtppYuXrOYVKBqO?=
 =?us-ascii?Q?io/1IO42xDjZ6ZWjFlV7nrSD2AzfkEXiRBFBW1KTq1ViWojxCz5DGhlODExn?=
 =?us-ascii?Q?V7oeb0yiBG6meJXy+fVtvteUZ5ELRAQ5ghwiEJycct1RHcKlmGklY5LpjfsW?=
 =?us-ascii?Q?0b7ZfE2B2DrTLi3jnyORIivRuUw8gjrhMFaiMol6TiYxazOTYqC6MzFRIAS8?=
 =?us-ascii?Q?K5ZjAaeSdaqICT5u5a2cLxzWysMZlqfLUPgamPKExOIMVAef7pQJwEnCDPVY?=
 =?us-ascii?Q?Wujq9YkoDG2OSQHbN+Yn4oSTpfWD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jOOrqbr3cKmhVkFWab9C1p30VTWV2Cm6b/dz2pyVao+HoPZ+2hyI7G98pqA7?=
 =?us-ascii?Q?AXDT+lYwziZIIEUkuMuq59FcmlN0Ildeq6e4u4rrY+8Q9NmZRB9pBdHzZUom?=
 =?us-ascii?Q?x3zMq4zKObJk/0aESKU/zKVuyuj7XSbHFsdrjsVaosyzr4M3cU5ceuBXIoIj?=
 =?us-ascii?Q?A4GrEcvl39bJR+IQIovPm0HGUIPuRJIG9WPFHWKXSKeJlzQyxjh0qn2NJdC+?=
 =?us-ascii?Q?NC98IHT8rcH/D60AoDvZdzdBkQwyaAlwF5p/2LeQCJCOPsMYDNXP7e5C6v0G?=
 =?us-ascii?Q?qurORpIF0ZQXAfw8hhqz0mzSWTlaDVA+5lTeo+R+iRF+GVwv0tYQnKypJ5Ij?=
 =?us-ascii?Q?z5j34NUYKGbfVCFPQmtJ+XaMBz/KvLQgzIzomKTBxudCoLnYvpOr0tWaVlP1?=
 =?us-ascii?Q?jRBCwICG9vfF51DzKh/YhpQMZMpyE0BcjDYwaHtZutGhGm4SFWbAkEm5Wuj/?=
 =?us-ascii?Q?r7qjErLrUSRwHKGi+MAUIngPbsyLPdynYB9AVBzKg2KX348iVL2BTCzGqHzQ?=
 =?us-ascii?Q?vM8SfM2gfuq6VOfZpGA0PJxpAAqrwsnkvdXY9s+z2N8yknIaZH3GBpp9M6VE?=
 =?us-ascii?Q?1/XElW/+lScNetbFSpfdE4v3JG+R15aeTh8MWkGu8ZdvfUSIB1f66kI5OOQt?=
 =?us-ascii?Q?p89jaDIyGWW3UdIDEcHIUX2C6YNVca76HcBtGh0vdswD4PW8CglJgtAMKRCr?=
 =?us-ascii?Q?AZUzi9LKMSoxEcN+N4N/hN1caCLD1o2BK1u8xaEDQEgFWkmucdIAyDw5lxuh?=
 =?us-ascii?Q?dYjRDTOBDxxQYYGg0Nf8uxyyHAT5rJ8gu50bZpeZaB5TkZJTA0CTYBYRvjJB?=
 =?us-ascii?Q?UbzhhO01FxxcG/JZzyAVdZbq1cBm6kQodn47blLhMpH8Luq9iV/2k7DA3Yuo?=
 =?us-ascii?Q?dUa0mBn0O2Y7EX8KoIbvjEDDr2K9pi6tUW+7lbirQwc7iXvVYVL1g+hC0PQ9?=
 =?us-ascii?Q?gfYDFyCLIkahgqDXwtt9Dll9FyjhFmHNGiZL+XeC5ezIj+w7Vdyz/BQiam2D?=
 =?us-ascii?Q?SmF5TmqrVJVADZWvDamyDeNEAfM2BUXA58G9FDuBOptgzGFu3gyjBYX1ZNMV?=
 =?us-ascii?Q?ck6oBlIHW76j2nIpS4Ehc6YrXlMjMlk0OMmiiICPsxBM/j9+gxwMzeqs+hba?=
 =?us-ascii?Q?UE4hzbJfozytbIMgZJVfqMm0zIVS9AeXRfvcv0nqvs4H3hrxe61Moj7p/RlU?=
 =?us-ascii?Q?n+WUp7qoE5krlEHna6qhPwZ9Scd2YeV6pqEqPhokUBk3VI26NfPZDlZuRRXk?=
 =?us-ascii?Q?aGBcAnNvPm9rCzx9z3QRZJpQZD+EBL68o67+7ydzS6pbIWmESQK/muivHwJk?=
 =?us-ascii?Q?NpQwZCkinGZ7789VA6wH95YradoLIE0c9vr+jgMqHVGQ7K+0Io+j6ahVCvwX?=
 =?us-ascii?Q?X208IEOrPHsAs+H6buvhxG+KQGaOzSOFaRdLSOSkz10SROPABnfJADqLutvu?=
 =?us-ascii?Q?fKv1Lf5cjySsTyJV+7Yss3wfziykEDDUfh2V0hE0a1oY74qWd0qBudbCZAk+?=
 =?us-ascii?Q?asjUoy1ymxU7DLcepjOiVbL8d2LXrCe2y5wgZIHgwBGPpWCZutTEtTOvk4mA?=
 =?us-ascii?Q?m+GJUoMF9sQlMaPNwcbONySjOUzCutMiuBS/5lRL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	187+TEIxwOQklGwDB4Ge9OBP4F/ymHI9Zt0wBWeIs6Xe382z4zKJQtB1FzJ1rKIdF6KtWY3KwftatptICP7RqtujBIGcNyiJIkIYQDR9AhCjxeO/T0TRJdhwcKChnwpm1B7HsxewFUkO6uCUWLeY8vVaU1VJi/5yNwY+BWRtneP/htYYdABcVE/GnLO+9HZg4cnIPnktPuNFPcMiBNmvIRisc5aUU8ELuUyCG2PLKbcmcEsoNjSubx7tz4tUW+5rtS2Xdd56s8jKkv++8j0ywlz9wW3FjeCdOnOETQVeq0vyeYSKEcaXAlCEKHcMGu8XXwxgXyONzm4BCiQ2MqoZJG5LFIKE9UJ7AucLPIIqWKV4Y++BjEXPoRQ2deZhQLd09KIJ+rryfmulYQWz8HaAwsIJlBls1Uc275POCAdf/JVsTcf1244rUz85lq5ETBpjAocEr3qu5icTT1oX45bvPUE6L57b/FHoM+dTbC49EQJfW6Lm8iSJjUgy6NmExFgMEnS7U7+jCsTzsHodDb8HVFcmwo6PSjyBlnPSuWSJRHkaRhi01VmaP+mkTDVOemb74Ry0BvajPk+8LDfo60y0dTQWDhPB+cZqqAmjlF9495I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e2933-769d-48f4-e6d0-08dd1ea4b92d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:11:38.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rChGdSIHslRtdaLaFhxkagshQLSH7EyNPaCn6LoNjvTdo1ACdeqpu8IibtkxD1GB6hCTei4ahAMejjRoV/Tkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_07,2024-12-17_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412170112
X-Proofpoint-GUID: xb0vO9QGcofYX5Dsc3lqAR7ewKV6YCRR
X-Proofpoint-ORIG-GUID: xb0vO9QGcofYX5Dsc3lqAR7ewKV6YCRR

* Thomas Bogendoerfer <tsbogend@alpha.franken.de> [241217 03:25]:
> On Thu, Dec 12, 2024 at 03:36:45PM +0000, Lorenzo Stoakes wrote:
> > Currently the only user of mmap_region() outside of the memory management
> > code is the MIPS VDSO implementation.
> > 
> > This uses mmap_region() to map a 'delay slot emulation page' at the top of
> > the stack which is read-only and executable.
> > 
> > This mapping requires that an already-acquired mmap write lock is utilised
> > and that uffd and populate logic is ignored. This rules out vm_mmap(),
> > however do_mmap() fits the bill.
> > 
> > Adapt this code to use do_mmap() and then once done, make mmap_region()
> > internal and userland testable, and avoid any other uses of mmap_region(),
> > which is absolutely and strictly an internal mm function which bypasses a
> > great number of checks and logic.
> > 
> > REVIEWERS NOTES:
> > 
> > Thomas - I lack the hardware or set up to test this beyond a simple
> > cross-compilation test, so I need some input from you MIPS guys as to
> > whether this is workable.
> > 
> > I've therefore sent this as an RFC so we can be sure this is suitable!
> > Please could you check to make sure this change is OK and I haven't missed
> > anything?
> 
> conversation looks correct, but this patch doesn't apply to upstream v6.13-rc1.
> Which tree are you using ?

He's out right now, but generally he works on mm-unstable.  It doesn't
apply cleanly there either, so my guess is mm-unstable has been rebased.

We should do this, but there's no rush.

Thanks,
Liam

