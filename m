Return-Path: <linux-mips+bounces-7217-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D49FF8ED
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 12:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9AE3A20D1
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 11:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD65313D51E;
	Thu,  2 Jan 2025 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jFLjADh5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f0V0RZbz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4181758B;
	Thu,  2 Jan 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735818413; cv=fail; b=a+8Etx/wws35dz3z7zN8aeqwUqH//2cVZWfAGstfc9w/dC4Ub8yW/SBGnalJmtb6QWtoJJh0Nl0O/BXqESOScGRN+y6+QZVBPo74YcPOinomFUqOh49J6zfaSiMlIB8mHNN24P28aPNPhR3d7gpp3/mqVJJB3psR8g2fYoTvh4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735818413; c=relaxed/simple;
	bh=mS8JG41wUbyY/FalGNEJ+ru+YgsvJP+lf/6nFGmSE2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F6+XzlA5dTlSeqtdx4+f1PWAOE7yVjPTVQZAm+QJinCqxy5bLRimm5VbtwbdhSnZJXp1OqtCdS+1nh9uuN/Ub98nYkux/6alxcC+lhtLCupuuqPDsEL3ki1G5fwpxPuYJLrNN/4hKoMCHA1g8/XCGyI2EpJ2BK4E+5skTPPIGXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jFLjADh5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f0V0RZbz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5029g2K5015969;
	Thu, 2 Jan 2025 11:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=W/ZoDS8gTpML7UKUGn
	JPyeTMw9Yh5zm5AyiIvye5bng=; b=jFLjADh5hZNJYl6ed+LNx3BPnQwBUigHnE
	IzuQ1m4LgHqmFtmD1RCXoZ0pIRKrn1AoxDRLk2tKbNQcmakuv9pOQnVLI0QmH76j
	4z/WS9YYnQmxYHAxy47frINJOQjWcr7tvNO9ot6ReH4Mak64nEJ1iy/CK3snsiTI
	K1DHGrzp/WetjJCFX4WNOsVuMJxzoqbohv0yWsNJxYQ6VpW0R2Lfi7tI2Gy/O4Pl
	7Mo5P/VhQ7F1j7etfYspcCGt7BR+CSct+Z0rYH290NQUat4ZvCYy81qP2c/TSwVH
	IIvR4aP00jmHfUDRNEmbqwvbrFJcwO5qA1tMLPVBSXMCrbjHSQBw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t978n53b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 11:46:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502AZhTY012954;
	Thu, 2 Jan 2025 11:46:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8f89x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 11:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPs7/91AdU8SAtHZDg8aQCH7ko8+LzHO3tnCdPM6mdanjBU0GXv+9HUWB0nSFv7jM4EyYQC1Lav8tLcfrKIb3aKTP1ZXseaYkta3y5zke2fNZeh3ry35EWrZ95eQGQXHRrus2oG1SFKsunMPscrZda/ALSfNCQmFGpo/CMfa1qxWtJvumhUVjrE6gAbmSsUF46x3PalXjd+jpxLA1Y92b8+/pMzxGLNRLVdV+te0aKEj8MiHprdZmRfvGOI6A+JQNDoq5QaZf2vktI91uhL3o/Xq5x1UHDBNcGFCQ52Yvq+342bAi0H0pmzNzc8TNJg++pU4djPp6NsQv8LZtJW+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/ZoDS8gTpML7UKUGnJPyeTMw9Yh5zm5AyiIvye5bng=;
 b=PpH9BeFSHc2AKUoP9fAeF2nkRj6Wbsb2h02SekPPqRn2Cely/Lf9kEhYPvlTo1KmrGb/QzQA3SI6hvmmPHhL1t0FUAx/wBB44rQH0zSAhrgy5zu2m5n5VuwjDRh4e9pF0O8xzYaRS03q0xP1l9eZoKj4WkUhbUg6o6wk+znMg5OZF5KZ3CEnNiKiG3dduHMjCeQmbU+ahCkEC7Pf2iBojkmpLJ9HOxzo6Hv+pURFAJ/cxHZIYOEfcyCCCnMs0lDb5XYFi4hW1zqObZYdG2ydpBTGCP8DXv1uCBBoZkOZoeQMpHzY/rBfWj2TM0Fb5iIKYt2xXOQts5hAhcidDilMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/ZoDS8gTpML7UKUGnJPyeTMw9Yh5zm5AyiIvye5bng=;
 b=f0V0RZbz3cZrXH5wSbB1PDVL5kB1drlIP7a8AZVk6LWMuiFrg+KiFcNzO0EZryasaXCuMxZ6m38qtSxXLOaX/1O9bsJnsa98QunLIFbVAyPUuuG2Mju5WLLNTumFhDi37H9AZJLTZ2GFQgxQcHDDYLkFuxy9oJ75A1wBTo9H8Mk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB5989.namprd10.prod.outlook.com (2603:10b6:8:b3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.12; Thu, 2 Jan 2025 11:46:22 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 11:46:22 +0000
Date: Thu, 2 Jan 2025 11:46:20 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: update mips to use do_mmap(), make
 mmap_region() internal
Message-ID: <be0a25c2-fdde-4f84-b303-0ea9a13ad5a6@lucifer.local>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
 <Z2E06z9yw+/Jb4Yo@alpha.franken.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2E06z9yw+/Jb4Yo@alpha.franken.de>
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3f30e0-8935-4bb7-602d-08dd2b23149e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xqYH+CEdQb+vsT0lyAMVFrXk1Cb8GAcRSVPaq6UtKHUUjmDVkNQpOXSIPCLJ?=
 =?us-ascii?Q?zaqgkc76h78EYocqK7oJXyNJIYQfDSt9eafJtOFichYJ4x0Q9Y16wnCp4Obf?=
 =?us-ascii?Q?wn3KGDsza+ZOQs0QLTv1mvl3LjKefvddw+JlhQdT1BejHdvwWQzvjakMUkDD?=
 =?us-ascii?Q?3d2D5ZuRC6ah6d0k07uZGF/1ogdAxs0NwimR6nqyYd1K+8tlHvdoBxYtQPlf?=
 =?us-ascii?Q?JQ9dtPirkAcO8l82yaOqbRvF2fBW90RRbfiJLmxMWRF8GRCHGEJ+TasvUZ+P?=
 =?us-ascii?Q?Equ0Y8RqUL5KWQCAbqzFp8u1ny3+Xqn5SLCvw41zBecJo9gk476jtFzD4gLv?=
 =?us-ascii?Q?Tmp8rHgIACSpmYB92sFIg7u05ymzcTQcBCL1hpZmdafu/1EJYHZGQEKIcLgL?=
 =?us-ascii?Q?qzwVpsXAwej5W0bMHf3sLh5heAqi9RKahUmtYEGrHN/NIqy1S8RZnP0cwmjM?=
 =?us-ascii?Q?KPgkRM5sRj8esoy+Ky3RiY5lK5S5wcOabNdlCDwfGjVfvEQEgaYeH1itWtgr?=
 =?us-ascii?Q?KJyHEHL2cq/MXfWCHDcio4GPucyBQCRBIWW4BwArsvqp87aW4M7mC1+Tx2y0?=
 =?us-ascii?Q?nMAlzyi4RmCE1E0d5EOiv0bNpjXbGFh2NEFXScQGqBGhuZLUoMEKaErayT3I?=
 =?us-ascii?Q?5y3qsjL9sVSfCHTHcdUqifiEfp5OpvTgt29zekX8pW30nxz7DhbdEaNOwKce?=
 =?us-ascii?Q?sBacd8y9JfaYonQCK6eS2hVFXYJoz2AhyiVqYHFaKqftJD3HbkyC3H9Rz/FT?=
 =?us-ascii?Q?iHi8m0fgEVRSpn/qAPfV9l0skC1Ny2wexYqS8ZpANbF4Ttoik1en88spcwc6?=
 =?us-ascii?Q?phY3JiUWLRcoccbzAIUM/WJetFt7d5gBsoHCcZQlq5jMq25CKDkveaizpGTX?=
 =?us-ascii?Q?uke82IgNB4oJP80DoaStu13qgqeZN4bl4ahZOSC4C0XmOgxz3HW3yWXkeWKW?=
 =?us-ascii?Q?J1jjoMp2owDM7QstUq8sYZ4pJn2uUgSvf5+hppjNAZFeu46ahj33KnPYIWXw?=
 =?us-ascii?Q?PiD/sgV4tZn8d+DiK4orvMkPkWAk20dqHFTx4CAY1Xy20/xje92uqf08iFcR?=
 =?us-ascii?Q?rnyU1lvvE1AEyrWtFeqjoKOKwc6qycbvXxLRxKM54FwC+WHqylSQPTV3yx5y?=
 =?us-ascii?Q?qDeL0k6j0v1vew4d7u9iSaNv7OO+gEisnF8mHIF32q07Q2GFITik2VINGHzt?=
 =?us-ascii?Q?0v6F7HQM0xJYZqZKLAttwUk3KFDfnUhoiTROuhlq3U1BByFaXf9Qe8htRTex?=
 =?us-ascii?Q?Qkdd9+J3xmkE8RK1PTSp/bhXfEDvx8s1eqju/4sDkTYK5gF0yWOxR145KJP3?=
 =?us-ascii?Q?CDAuiB/ZCrrCZfiLQSnyE42VRTRSKmzFgkrSvxJqXa71v0ng+o504h75Od6T?=
 =?us-ascii?Q?gM64ltKl6EeIoA1xTiHbieUJH8+v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ypmhGznQ6/Ph1QhIZuHuH7FcmrDumwBuGbDvy3d91PKdVXvT5hlWLPpdUAb?=
 =?us-ascii?Q?TLzP8w1Z7nInQsKk6eSid0BaHLVIYkIt2AcryifMZrb19+4XcYvFoR/rj3L3?=
 =?us-ascii?Q?ebN9dY3CglzcWz2EYyhoTCmD+wmvOb9asWxaN2zp7SqaHrkmk5Z7PlA1mwC+?=
 =?us-ascii?Q?h19FE2IFYF6yUFmTrWQZgbb7N80rY2lv6FcDTnpIkQMV1HyzGDs4AKiVFEV5?=
 =?us-ascii?Q?KnnsubCMFI0181RlHu+4FlWTDkCJVBSS35Egy1PiNCPutKPXiZ9wNyK8wMJt?=
 =?us-ascii?Q?vFMIs1XNEQRp/gWoLpQjKEYxg9XOtNRjHuoUh1+6T3orTmOwhNNCB6295N7e?=
 =?us-ascii?Q?Pnix+ZP/wjyINCboYNwmWXbEzLxaxIYx+d42QuHYidZ/982Rj25QKFyWQq7M?=
 =?us-ascii?Q?boYTVhIJ0ASEGWwqZaNRCJFL4zuzArDNhX3Q5E38z8liiUpZsWDK3iaaWWxX?=
 =?us-ascii?Q?X/T5mFxT6enE2hVGn1/uZrqHTT8RfkiRyAEbc9SfEwOztbQ2XKfVEiSj3Q96?=
 =?us-ascii?Q?NKlCwfg4/IwVHYfVU9Ge/aq1HgG3RK0K1GqfdTXLdvbl0I+kBZOYqeS2uPIR?=
 =?us-ascii?Q?my3rIX09UFQ/tywCKvNlByLRF7IbjvoNNNn5aWI5hcvkJMw8QuX6TM2oFx7a?=
 =?us-ascii?Q?SwW80IN+3M2m4irIuet8B4vdow2PM2nZ40a6p3DrljdUoy2zMY5uIonB+Lk4?=
 =?us-ascii?Q?r+oETxy4N+Tc5ZIy9ORnhKVQDHADbBPviLIoq5U7YeATZDsa7CtUlp26qiEl?=
 =?us-ascii?Q?z5xjagDuPSgzTUuLOOJMfhuEmlUmJnEQ1h+UIvjDrDUj9kEpXpt1c+IGup2A?=
 =?us-ascii?Q?JWBjPB4C0GCD97OIELvon5ACW5VNKEI0L+clCkmBJfEyn9GigytqHp2KneeS?=
 =?us-ascii?Q?4RMf6JaZQ1ndsaFAAFyGXzMc9Wxb0Og1/hM0d3VyPWoAgqPRy8qqty7RNfnC?=
 =?us-ascii?Q?ApqlT3iW8hT2YBXFEqqJ7YZHzZoKTzrJUN5AmPue3K33EZ6HE3qvZwMDbn6o?=
 =?us-ascii?Q?dxdrHkc9ympZQ+9PBokiPzXrXowSyAnGmLXIWmjenvcXilx7oMfc/vacCRcS?=
 =?us-ascii?Q?1kWopH2rGvc3uKBV1vo+aSRBVtECwmmtkSMS2jPMsgYymYujmFVLxmreTZhv?=
 =?us-ascii?Q?iqcnJkmRMRJuYyI2txlPNHU4onrvGegIYiB48mPqNpSxvizNywoWQ3KEVMzV?=
 =?us-ascii?Q?f9UBTWilVlqmiWsn2HB1wV7kelK8WB7Aa9+Vc73DIRHOeDXbv9XL57LPiJuc?=
 =?us-ascii?Q?o3K1sT2g4Sn/j5r2uBAm22pl9ArPZibEOzPk54meXXe/w41vYknpDXY6RlbV?=
 =?us-ascii?Q?fzVMbz+tzx4fEaMVef6sT+c3NiPC6U9AxgolJ94R8G0PDIWToeUacMRe+Z7+?=
 =?us-ascii?Q?Fnpey4CbH3dor76CHHNl/iwm63JlVi2DpxoLgXVeLLscXRZW+3D6Mv8XR5tl?=
 =?us-ascii?Q?ZYt9cnNyoh4LwhnKpTfCu6UUN0e6v9UlMcoOt0bV63++E3TaaYp6iH9I+pWr?=
 =?us-ascii?Q?v9QnWvfFKcFaERflLLR3fSgkYAwC6jaENXsd4AvMuczpv1hA+tDnetZo1myA?=
 =?us-ascii?Q?Hkry5+3qEABA6wQk98Gp1TMeVEOyJspkKwfPy3400Zg8m4yLEMcydByhKYGR?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0dSDAZomxHUq/AtTvZFdKmmXl2u5HCaHfdPC+0Fi1BfBGEWJ6wHqpI4J7ojmjzitBlIgSNS7FcBrNvPNhbXZ5siESgwbIm/BRwt+PcyU99o94OD/9JYoIiBOmfZsd5fydv8NDJicNtyObk6IAVCh9E90Us2RQ5k1BFLj5OHFKlTCYAYbdQME8P6AszeRp1hRtZ5ghkrFhZApVYYkzRWude3EmKtWOIXHWv0t3PktU+MMzSOc9vb0kl/ssWZmLsNLbVZrFnUVVOeI5DG92FE71uRUiJ/tEuY6wNrZKYN9jaLH47BRvp4LEfh3vjx/AK9JXWa0yQD7BeH/FlNtEdLx9jjtYl7PEB9YyhW7i+1bV3PHgnFyxtGomrpJ+PSZneids+nWeIZ3q8K9KYAeVvmc5ZRdluC0Fo/jIiqv1kp1KikLYzUJAOdZLxksY09WwbJ7bZOzgXDWTwjgalWqucltiRHyMe2Y1K+yh0RWIwTnh9fV0gjEJrvT8JMnM+xPcyZbO0CGNHO05hgSsVvcljWf1fvTz9e/Tb8nkpfWW8BcQVNHd07Yz+hizfJuwquhWgqeshz/3+Hj2rkzJIup5iPpWCQAViyg4G+sZ61SEagkdNs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3f30e0-8935-4bb7-602d-08dd2b23149e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 11:46:22.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebp/3goSsBLNR0SqPzsSeeh7oFlt130/Dl12w5/xvF7TWchd8U46naL+4mPvNwS3GOlpGmsphW6alSdZfpzPSQjBZTO9YroJyF/ZD70SCcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020102
X-Proofpoint-ORIG-GUID: jsqsVkZPIB-VbZI7_rzdss1k678QdhZj
X-Proofpoint-GUID: jsqsVkZPIB-VbZI7_rzdss1k678QdhZj

On Tue, Dec 17, 2024 at 09:23:07AM +0100, Thomas Bogendoerfer wrote:
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

Thanks, yeah mm-unstable as Liam points out but clearly not the tip one :)

Let me rebase and resend. Thanks!

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

