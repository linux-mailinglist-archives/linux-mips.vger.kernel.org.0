Return-Path: <linux-mips+bounces-6977-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 731569EF327
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 17:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08841290B02
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 16:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B0E223C68;
	Thu, 12 Dec 2024 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CwScXlr1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RmAHIny8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147FC223C59;
	Thu, 12 Dec 2024 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734022172; cv=fail; b=mBq29c5udZ0lKx3RBtvwWsDHIMzemJHWYOwCMgKEDV80+7wOwm8AQ5jxIik1zzXR/gR2DpKBsBN0GKHbjPi5zIP2+CQymoCYRSY1U5PQ/PaoXal7N4tE/sTIEdwHA3IuB8Wob4cPrvM8Lp3H+hQ8gzR+KUTd6eW5Cgctnh5BwYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734022172; c=relaxed/simple;
	bh=LtQ1k8DdKWVmp2foWg5pGWPCpQgLI7coopz80zzrO1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ondd7e4okTRrJf4i97O/fUOqCFrq1j67GC295DFoQDOAupNpG2rXXb713K/H4gozxAcz8kj8WLEjj9cKSX6wCJFcYDUK/nCPmFEQR/dvOtWRR0Udb61SyOqJLJJANRNgSG2w2Hfk9v1pu8vNOPs2EjLZpBoTTB2nAw+jPmOWdLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CwScXlr1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RmAHIny8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCB9na3026505;
	Thu, 12 Dec 2024 16:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vYHEiN4erYT6LClpMr
	LVF9Tk+q7fdGorGsDPx7AI4JI=; b=CwScXlr1ogjPeobOWWOT/rvBweDE1xgQ/7
	wNRKcrB4l7LHQVMqd4fWJqtGK/661W7LCoTPt0h1IRZ1dxBLcm34gt32ra0JF3sP
	6CHMK+JSBdNYDq6IWfQmzjrepNuASW21sMUsuV4HmwrLAizLoKl0FK8mzIMTMdRU
	DCZT+Uf2a+759WJ+2Vnpb7TKP+2xiJn5+Zu58LpjxN1SU5JlKWRwmeMCeIE0i9ch
	1vu8vdeUxVU9HrSJ9uDkqoTyXIzKG3G9LdsKxaSQVjLQHV5tjM/xKeeW4bkNJewC
	xk/jPgbWpOumCvJXIXIR10cwlLKu5N5+g6pcaYwksu2eL9/xMjsA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cedcbnv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 16:49:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGa5qf038126;
	Thu, 12 Dec 2024 16:49:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctj0aah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 16:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxrjRjHMc59kD3NdYk6fqS0BIAefuTbELQzxo+3BrgiWSy1iBtK+7OcHZoe8/IdH3sNrHnPRclCyM4MwOWkz1cED+WtwMHwM0ICOA9lpdOIlgIjYM64uPzv6qhAsc8HMjfaPJfcsg9rq7OVwrM5I+XzG4mwaUkDiEnmJMb3+jE6UnSOL3kvdc5KWbumqMLW1cQWgp3Rf8USEYqkaxmWo3y/s9ciNeUl9VDWCvIqtE2fKpxR59r3+4dhwN2lFm1WOR/1ArtjPqDmLWCYEOmI9PY/aA4CdXtENskgCcSJnfT8Trw3ssILNRTWsI7fTi8T6wgklgNOG55T5YCgMnXi1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYHEiN4erYT6LClpMrLVF9Tk+q7fdGorGsDPx7AI4JI=;
 b=x1pN6O5uyzEpfER857vRKAZGUXW++uUf87GTYYW7W7qmYc/WYZL26LRc1hdhPR6hgHQsczw0K0unZ2xXObuaNIGXee67IWycLmIUzUaQAl7C1KOuGwhJnfKqgBqNZkwdAyGOwPYkv151awwaicuEAyhkEtAjJjg1uceKG8d97Ju6B1Qj0HzhPELgyCadnyCtUQ0m2U6a8Lfo6uGY3+zjGjk7q8ZHburKXpXogJMtdns2184wIKpBTk5RSrs7QiqjLMRAtm/bw9kwJeeqJB+0OKsrqwwxjSnF1g8LdKObZXBxVzasuzeF8SLCJ1I8ShIoHih8reQDevX+9TG9s7E31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYHEiN4erYT6LClpMrLVF9Tk+q7fdGorGsDPx7AI4JI=;
 b=RmAHIny8s2FAcl5IYtXqKQI95ffTb5JUPwkVlq0B0UKJr2nDDy6uKxzzpSDZDcdwrRRDDlinDvwaUVxYvtkReJ9u6qTCCwrBvcu3OvGgXNpxMkvuZqExg/nBpRGd6Z2CzH8OLKn6+tnNaNDluFqILD9CxYgGL3OTG9lpXaRJckE=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 16:48:58 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 16:48:58 +0000
Date: Thu, 12 Dec 2024 16:48:56 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] mm: make mmap_region() internal
Message-ID: <7e94dbb3-e69d-47aa-bae2-741a94fbe23c@lucifer.local>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
 <80b7c4ba4f0a2b3084117975bd1af62a403ac881.1734017293.git.lorenzo.stoakes@oracle.com>
 <Z1sFDCx8m4-TPjqG@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1sFDCx8m4-TPjqG@casper.infradead.org>
X-ClientProxiedBy: LO4P123CA0398.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::7) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BY5PR10MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: e13f20b1-2c2d-4036-9811-08dd1accdfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QtJzJo6T9B5i30qclZkxTukEq9mn4+2Elsirenv7AK14rp/8AQRyjeTItiHe?=
 =?us-ascii?Q?E84SVPiYfi/7SZsooTOqZjTZGQZBmlFfYtEGtbhenJEybZQP1b10BPn9qSEb?=
 =?us-ascii?Q?9misu/zngw2kkOTicrgRth3EC97YMlkGm24d80C3cmonn6mENSmf1ef75j7V?=
 =?us-ascii?Q?IhqJprR16OFeiBLP1efRvB1MP5Zz3poMPvTBCWb35AI/TLnFarENcldVzKPY?=
 =?us-ascii?Q?fMAldlRxPUudAEV0ZWMDZ8bucDsQLT2SCza9YRRZ8xmfdZ8qMq41MG2OH3cy?=
 =?us-ascii?Q?OUJsCLa6RDi+nFfQBp7rcsiW/qCgE79vAONySydbaYBXBCJbxlMv2oFN1QGL?=
 =?us-ascii?Q?PA+Qwxz7uo6ctJWrQJTXExqxn3OmXJ64gbEaR/mvTtXkTEGEvGPuifwJuEYs?=
 =?us-ascii?Q?kKGzRcE9BcuTWgIfB+uwW/filw74S5HnWxV/PBykKCPgpMCs4G6O17ircWWz?=
 =?us-ascii?Q?Ad+Uj+PN5pOsdTD9NBNlX2O1X0V67/r8qJ/BEktgwBYy0a8WpwyuoBFqoQT2?=
 =?us-ascii?Q?lbDsNcTXT26eIawQgkvCfiouH7cKRwxrYE36NgExcdgtlI1OKQMIN0DF9Ze+?=
 =?us-ascii?Q?vd+Ne3uQzgtAEa08780/0NpPeOP/oLfRS7KH+0VO/WLCNEGaZm5GIeyeO6Mz?=
 =?us-ascii?Q?/vo9Mk13VGpX7q22kwwkToxrlOn5I9Efrlh9QyTSADUhuHNaON//3bxzEDx/?=
 =?us-ascii?Q?BihPpU4uAPI15j628nJhnzMyZIXqYUuCUcBOU5NKbUQP+UKkLXgNxoJ+lr8S?=
 =?us-ascii?Q?IqqNPVlY9wLQvTrIPnlCXZAUkSAEwWi3mxcrrApMmd7JjUvfMpmuIsy9K2vd?=
 =?us-ascii?Q?HoiqzmVz3JdHb5X/wWXJh59talG3U/0D+0u0JSoQLaIZLq/UvhQ4dIC9fUGB?=
 =?us-ascii?Q?HFjVX+xQRHofYS4uz/auHQ4c25Bbggb1twVMuM4CwyBOzrFG1L2iuxX2tN+n?=
 =?us-ascii?Q?Uh+ZtJehdEkpEGGGaaxaLogcfpBcSRu8tz210w11C+s7ONf6wLc4MUbP2/c4?=
 =?us-ascii?Q?CGo0+IkR3ZwXbsxWNBcmjH9bgYzpPaJnD3kHaGllT9h5iz2Ty/U0P1RbikIJ?=
 =?us-ascii?Q?PrUUNxdRYn0k4JkGWURyzsx+AJSqGm+/8UkXoqkEG2kyAFf5uxlrQxDDDl7h?=
 =?us-ascii?Q?wpvdqpB+GUYBX83cXxJcPPfC5ddr6C+NA89GEyMUPkbCLyMqFwfG2YvDT21c?=
 =?us-ascii?Q?pe1YZdeKF2riUWduIFu9i0EhXti9AlckT0zAmgoo8ZyGTfFx9fohaEljcxs/?=
 =?us-ascii?Q?/A5dANk4vRmNRdMcWObNwG7b1KyW00nUHiu3bTY8TF4RBfE01/d/yRubQqcY?=
 =?us-ascii?Q?jRqFhy9yAAtbpb/JOjGsrRz6z81ArJ/SWRQGsbUrMwMYLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mqxxT0sa8Wi1NWXTqR2fX2SPG/5JDUCDO6JgcIoRxmhOfMYb440b9VfpnGq0?=
 =?us-ascii?Q?TAPr8UnZJG+jDBBYb9MnTkBJvOOCIsLdkOODSx5MwI2jbwsereMZxt7xYcYl?=
 =?us-ascii?Q?4gHPzuq2hbgcAvbhCvqfNuBMX7NdnvF5HTLXFT4Q6UdEnge8NtPAXOsmSjeK?=
 =?us-ascii?Q?0Je2AbHo/vauWQ/TU/vw4dGYvJOL9FZ5LJ4ICvDC9nQZSopFM7K8KfUo+GR1?=
 =?us-ascii?Q?CnYTiKfgIjx7Bs+s+U7MxB7+IbVxUPLb7J/i05PR0CJM/lgEXmMsZZvKQAJH?=
 =?us-ascii?Q?7dIGn6srAwi/uGoxLBhmJER2fVWCD4u7LeMBfaUP4sAMneqO/G+WBq47gPBq?=
 =?us-ascii?Q?chl9mZ1OjiQ1Yig6uI3S9TFBaybC1VT0tiWVDczpyMWDSTu9TLf5ZTHEFpaR?=
 =?us-ascii?Q?eoAaP/b9mvwpxWienwn6SrbMB8wVnkjWeENgZHzedakkXGPaq+Zv7HIXfQLu?=
 =?us-ascii?Q?fF3qDRWRoUYZLWLzy9aUnhPiu1BVshoqdxKozTlYhZU4FPujOH2V8Fk1jEK9?=
 =?us-ascii?Q?KbIU8ug4AjzZ+x40vid/hKNeTcuDO9fqZyVO6GAUL5oASoqGI5iW2NJiXN4Q?=
 =?us-ascii?Q?MZ5UHreZdcpksZupEVlevpyCZ7jSk3ZZiWhPVEw/eT3EujuE5GNZR1B8skdp?=
 =?us-ascii?Q?EopjCnKlCU+G/nxfG7Lo2qsDfgm/UlZOg/jilFX1OR+n6Iz7w+bsASkCA1m+?=
 =?us-ascii?Q?zjTTO/sLdFcdwd9bvWImkB8A782jsc14V/HZ/kR13tM+DnbWVTdFq3qd5Y1F?=
 =?us-ascii?Q?zC75V+WeTl/9WzbLtaKflByCdG7glSfaJXmeeej/LpkK6AL+ZUF4YM+kwTmy?=
 =?us-ascii?Q?6fVrutHnq9OAqUGRyo3WemxACz9+nX78XhMh9nF2QQvuGcUGc+tXUNeUBHWp?=
 =?us-ascii?Q?AatOu0ff2atMYKoB0ShYDfWtancrLvmiygcckx2y+poloabq3rZCiY0Qj4RO?=
 =?us-ascii?Q?XJTqiYPiFwdfTvP/v/Qk2WmqPDCRAYgimG8zkaWXLSZUXdKbCLm/RalbokNV?=
 =?us-ascii?Q?EMUNw6rfEgJpj1H/hxxgTpK4eIuYhN5PDerlovm3H6ALidJGUAxigUZMAfgI?=
 =?us-ascii?Q?f4kxg7xHp1/mb9sEotBso7whdSz5GeXEBaUUP71ALv8tsa4nwaEBxdZhXb37?=
 =?us-ascii?Q?e7v2tIEFuJP9ZwCBekVi3Cq9ZSE0yn13TFWfJPFjsHgi5CuVVvUi0Hz9RSoS?=
 =?us-ascii?Q?7+lyO7ZbmBaEIlP7sxpEWjvb6w9HGqMrPh5Q8xXX+PUUm7YyuwRX0jIgBoY1?=
 =?us-ascii?Q?Op/5UrFv5ddgrb5gCIcUAT3wIQjabewMwcvDas1a4BxF0/R+6wD8KBCJ1ZxM?=
 =?us-ascii?Q?ZPALKKxBpqkoLZTSblrd6nh08shSrHeyNMWFX2uv7Nqwudcz2ja4WVcNIfex?=
 =?us-ascii?Q?QpZ1nGxVX1ls493Es8sdmUi5TspcWS/zFh1yVZxV/7JQk74wLLxTSyrOtZmz?=
 =?us-ascii?Q?JBY4l5Wj0ALCs+3ZVe5qVbPg5hMwfAxAJbwPrqX4sSICSr7NDn7V55Ltr5zq?=
 =?us-ascii?Q?bpj55fULCxPTCZtrj12FJbaVxnY/cA6EpXlW8MxXfviyH+cp2A6Lm7pHmDW5?=
 =?us-ascii?Q?V0ZCU4RfxzsIhpTKk1sVZPYvB+vAxtdImk6MfR00Nr9gQzWQXqp8jCdn5MdF?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LKmwGEu3B5Q/gPkE78QZjG2h4EPOsI7Xcpfc7azNXTITKEaIaxbkkP470IKtOIvyyGkM4RKC6MYlm0fTN4ErrMi28760WQxkDS0vvp6gERbfQ0ik+BUToUJye5a1ToG035sdWuupVq2QXez4/V+0kqANBPrKTZuBS3cubotvs0kkpABr3DxuNmXTrkpwlIhr3xyPeROr6jpdw0xfA4RhIxe81o+ItptCLDSTp5ccxyVSPwKvZOqrhGPHpmYIi+vsKwNpfPvWriB8qjDYCGbj9QvxV1dh7J9lByxUlZR5Wh0CNeBrip7GtcwpLlpYigwfkj4Mea/FXTDE1pKjXbvUMPCIUgAUM0UwpOdrgylL0Y27UPN9ZkBbwBbxAtqrYC77km53iXPLByai8yo0crQKBxNO1x9vtFRPYWu4O0UqjFmI483IRFFiujFswJcuhHWPgtbqqoWf2Ky5dHGrqIfJ76MNlUSPqsCttH92sovjGxJDUtd3CbWWUFDoUgQnsL/4Vc6LSxwGX0gnk1o7syRnguHtjoxildnjdHpIEw1lgsBp8MVgks4tGFYpylH7OcSShLOsnRH5JFu0+T9GRn+Wz0/+sr+EmtufnRzMql2cRbY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f20b1-2c2d-4036-9811-08dd1accdfce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 16:48:58.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMkHzK2Hlq5QVf5SMmqFOf6DMZiy1o68ncF7gLJZjipoAviQdnnVIoDJTEavxQjJ/weQ1ZKzICmvcT4PKcgdnCj+U1lDLME44Zf3bJg/VcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=742 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120120
X-Proofpoint-ORIG-GUID: o0jjNZPz73S0SWxrTTEqDnpjOW7EzIxQ
X-Proofpoint-GUID: o0jjNZPz73S0SWxrTTEqDnpjOW7EzIxQ

On Thu, Dec 12, 2024 at 03:45:16PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 12, 2024 at 03:36:47PM +0000, Lorenzo Stoakes wrote:
> > +++ b/mm/vma.h
> > @@ -242,9 +242,9 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
> >  int mm_take_all_locks(struct mm_struct *mm);
> >  void mm_drop_all_locks(struct mm_struct *mm);
> >
> > -unsigned long __mmap_region(struct file *file, unsigned long addr,
> > -		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> > -		struct list_head *uf);
> > +unsigned long mmap_region(struct file *file, unsigned long addr,
> > +			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
> > +			  struct list_head *uf);
>
> Please don't line up the arguments with the paren.  Just leave it as two
> tabs.
>

Ack, emacs likes to do this, will tweak on respin assuming mips guys
confirm that idea works!

