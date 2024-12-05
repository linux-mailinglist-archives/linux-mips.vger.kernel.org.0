Return-Path: <linux-mips+bounces-6892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA09E5AAF
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 17:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3517188444D
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECD21DB346;
	Thu,  5 Dec 2024 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BYYX3jdW"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040621B59A;
	Thu,  5 Dec 2024 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414738; cv=fail; b=ouPw3O0L0II4oPYfm1GSFpccqBrVGHY+mTt6HMIppTP7bdX7JJNRRoUaaX049dccJHJ1h1FEvl5j1uTB/cM7pcbNzq5Ubt4u2Ar3GXuIhkx/d1vSyQ2bKNk7TKjMnBppE21dxGkbH5vlTP0L3lxSAjJZobYp+ggY47f1hoMl3MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414738; c=relaxed/simple;
	bh=vYsB5GENHKvBx6ZugqLJUXEzhFwhVIkhrLBk0Q07cSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZwfI1KEeArT/faqQuhM7xBsPq14XUr9LDo+NJJDDiUY8iFyplzWVn/zHGtowLBD99uTBnGV2yJdZVUeOQToKm+kEntGOwFwB2ZEQJcLkb1NXIvbKuHaE5Az2QoLhM0S4jLZkIQI40DCEYSaHXEVgPwc2gsBCowoorGSK/SCGB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BYYX3jdW; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZopuFiprqC+llIw4p2Da6m2jrFK0MLkF9YNGBmubDnZO9PyZJ/Y2hAJ/NaNip1LNhUsOPEimYzrHWlFo2wBpbmz2B2DoDLo/vxkUId+OP9nwrUeiVHj80yYCS0qOArN2bEEn0gRbnUkhjHHsdMQqrHKWT5MSD2u0RHl08dUOKhbk96+/N+8GPg1Fv0zVbUA8KNsqdPwDCkoZKAWPiK8YYWj7p3lSdntua0tBacltcSWA+1rsje/9aPut/UkCkr2Fg4vO0umufC13pKIKMtK5cENcptL6LcS39kGNv2nmeImLQDOAFxXSBKAM2JMv+ASWtrBtdQgpvEL8Qqj8tQFtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO55SAgr4HOMvjdz/8RbQSsJ/q0y4VsHp5EhF0smCAQ=;
 b=d/35GDIL5pnutWFLrvZhcljFY8HbtDUXxoMEudxO6zCnDpPRzTHkJnnCcgeVWSmPXzBKYTIzPw4JYedK52LsGEYMzMu0Cj6RSJYGZTK1jdM3zNTrQpB+f3WCoit91Q1LCvEPrCYkubMBVn7eXpHM8s8YRmvQNjdv59+ovxVDNeawM9wSlMDSZLDU8kvuGhjkf5qWyf1cbYWFGXg45s3gjpHnkRs7dqYeE8ahxrr1ykqZtdv2RF0HT2ru5H3fw64xYGKe62L/pYr7xXk/gmSiE0bnex/RfWRkPLOIthJfFnQzj7uxXthaSHR8VvZIDEj/ZXHCeBLnNlkT26+fzU4vjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO55SAgr4HOMvjdz/8RbQSsJ/q0y4VsHp5EhF0smCAQ=;
 b=BYYX3jdW9w3Jz6Zbi7eOx7zwFFFXTh/dh6l2qAAd70ux6b1c/37k5igHlUYVTYShQMBu4clnga6ElTCq4a9F2UEjeL3EkgzI+5bVhoEatqGEMS6kKScLQpxqhlN2n38y/iYWiKDlVERd+bvk9NSk5cES6f7eeP0+SVSaUPGhvHveLidfEEyD2CXJ5R4qRwc6iJ3K/B0tr5lvMipf/DR2W8ddqobf9BH0UCCXF4PQJYJLFziLwAVcXJovxpiKTA4NFZHm8AH6ak0Lv9qKbi+uCMKLPsH0rLDvxaPAoOKSA1Yj+49GEy0p6udVMGWgNx6nMUAU/Zqlchllnlu6eClFSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.11; Thu, 5 Dec 2024 16:05:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%3]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 16:05:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Thu, 05 Dec 2024 11:05:24 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
In-Reply-To: <056a2305-db07-4168-868b-164493ff8587@redhat.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
 <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
 <056a2305-db07-4168-868b-164493ff8587@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:208:234::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a601536-aa15-4982-325c-08dd1546a3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnh3b0phY210R3cweGYyZmFNRTZLd2duSUJKNnpnY2tpdUVucElBbTkwUDQ0?=
 =?utf-8?B?RnZxWk9EdWZWS3hOMVRGa3BtOGVPOVVlK2kwdE5NaXFTSXdFWkRQRTdwcGZs?=
 =?utf-8?B?VXFNV0NVUm5kemhhWkxzVUplcjdmYnpadTZ1NXBjdjlOU09KdW94VUU0eW1n?=
 =?utf-8?B?MUUwVnpvRHNBVDBZbDlDbkt6VkVZWDF5b1o3WHpGMiswNzBGUjRvUEQyZGJz?=
 =?utf-8?B?czlHVlpvNVo4ZDlDMGlTdHVkTk1vMXhFL0xBZ0hGOEYvcitvUDhWQjIwd0Nu?=
 =?utf-8?B?Vkx5b1g5YllFOG5BQTZzRWlDTEpPS0dxWldQcFRsNUQzbkUxanVCWVJiWFdJ?=
 =?utf-8?B?eFlsOTdVN2lmdWtnSUpYMWU2MWVCSC9scHY4c1JQNkw0ODd3VXduNXNNdG9i?=
 =?utf-8?B?dkNqenBmMkJJRmovbWhRS1pwM3VpQlZtWjlUZ2ZzNWFMRUhtM1NCU3M4NmE1?=
 =?utf-8?B?QjFMZE5mMmMzTnFwQ01PeG52VEJ4OWRManFnOG5DN2NadVNWWWgxZU5GNVBx?=
 =?utf-8?B?eHFFZ1BTb2NvbVdnaWRUNlM5L2ZYNkkyMDN3SEpuNytVOHFTTDh5ZERuaHhR?=
 =?utf-8?B?UGVMMHZnbU9GQ0tzSnpJNitKWGMxTnVYVERXT0Z2a2xRNzAxOVgrUm1ETVZl?=
 =?utf-8?B?dlNHY0RKVEtqZEVjcnNIZ0h1VXlZWTVKYXJSUklxdDdWWVJMa2IzMGR2eUJv?=
 =?utf-8?B?NG9rZktLOUkvWjFadTBwRWU2aEpQYjJIZ0xkVkFUY3E4QitFNmJTMFd3dkpU?=
 =?utf-8?B?d0kvYWV0eWRhc0g0R21VNktXNS9sQW1jVmpuQ0g5cngwa2RhdUo2OUxvNCs0?=
 =?utf-8?B?MjlHWXJOR2pwLy9kQ0M4cTZ1VVFOR0pSYkJEVmlxVlJLTy9keDVGVmcrQ0hL?=
 =?utf-8?B?VUlDUUxZVTdFQXFzUnJiVThIcWRxd00rb0cybWE2Vkd1ekRhRk44YjJ0MTlQ?=
 =?utf-8?B?OGFrUkNzMU51d2FoSzg2V0ZqVU43TGcvTyt1bE9rc3dmbTVyVGY0UVU5TEo0?=
 =?utf-8?B?QndGS29zWWdoSkE1QVdLUjBVYzQ4bjZXTDkzWVl3MGpMTE5lbFdINVdxWXEx?=
 =?utf-8?B?c2hUaUhzQzd5Nzc0NmZ6NGlGM2dqVTEyd0xYVVFnUnAzUUprWWhHNFVOTjNY?=
 =?utf-8?B?WCtlUFh1dk5VMmtLL29IRHhGYk8wV0VWaTFKb251VkRnRlZQWnBROUVCeXdy?=
 =?utf-8?B?WjhkdkxyWWxZeHVXVy9jalVLeHVpeG5Ib2VTTmlXVVU2Z1VhQUJFU3daTHg5?=
 =?utf-8?B?a1AvaE41YnE0SDBldHBlYy8wMVpjL2w4T0h6dlVqWmtaSnF6aE5aSG0zZFhz?=
 =?utf-8?B?WUJDNkRVaEkwY2lFNjZHckVHaURVREdPTXRsSGQ4aFYrUFlPWTM5bzFraXdV?=
 =?utf-8?B?TTBCdnJmTkp1SnJ3OE56c0FaUGRPOEhXOWNtNU14WFpERTNxcXRwUGdXdnRj?=
 =?utf-8?B?M3BQNFBRNmFnUEY3Zm5hMnJBdlFKaXNkMHZEbm9yeWNPc3BieTkwbEEvcWlR?=
 =?utf-8?B?Qi9PWXpBRFBEajZuTDgvSXFPUnZLUE83NVRXVkh4U3ZxVlB3MWxaOTBMclVT?=
 =?utf-8?B?N24vTWJFZkN1c21UbUxhaFlRYTdIaFZ6NSsvZmNmQS9lc2lqeWxaQStUR1I3?=
 =?utf-8?B?My9aUTA1YytjdEs4LzBGRHBIUGo3N0hmeG0wZHRObUNvckowdlFwWjV4T2hw?=
 =?utf-8?B?dG5QbDNCak9hZHNXdmZaRTN1bDlxenlFeWJVU1BqSFhIVnhLdFUzdmNwdHpO?=
 =?utf-8?B?dytSWkYxOElrendjYjRzaVlrUFdHdDZkcmlRZVRFZ2FObmhjc3RzZ1Jpb2ZX?=
 =?utf-8?B?d2JkU042NHQvNUNkYVI5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEZJUDMvayt1aVRhMnJCc2tVV2JmVnZKVjdVOFltSDZaalMrS1g3U29ucGty?=
 =?utf-8?B?YlozelczVkRDemxNWlZWcDBUV2wrWXVQb1FjTHFEdnhEM1hIQXNuN0RQNFVl?=
 =?utf-8?B?U1Y1OUVNc0xiYVRLeVV5cndHRDkrS3hGdTJibkVSbEZ0M0hMODJCaElnaHM4?=
 =?utf-8?B?REhwM2tCUlNqS011VTlBZlNac0IzNnZmcWYwNFBvR3dCZ2RHVkZjSElMc3I1?=
 =?utf-8?B?TElIMlpTTk1pL09Wdnd0VjNQUk5nUksrbExQcVBualFTNm5HUUNiYkxCWjBs?=
 =?utf-8?B?WTFEcEtZYStEZWU4TW5xbzFRTzdQVUhLc1c1Rkt6OTEzZzFZRFVxaUF2eHFn?=
 =?utf-8?B?OWtZRE4xTlA2dCt6R2hWR1Q5RUFXSlNRVE5RLzNBYURCWkpHQVdteXlwVjJ6?=
 =?utf-8?B?NmZ1U2hkUkhWV0N0QUtxanVKb3NzSlNaMGhva2o0eHdsY2VFSUJKNW4xYUdq?=
 =?utf-8?B?REQ1MVp6Mk9YQ1ZQS2lndEMvdEhIOFhQN0RoNG9panRjcHdpcTFRMzdORzRW?=
 =?utf-8?B?enpJVDhNKytqTVQ5VnNpQXBZMjB2N25pclluQWNYK1dJd2JZQ09ndkpqZ2ts?=
 =?utf-8?B?SlhRbUpZL3dKWDlySERWelZoTFkwR3NWSEVxMmZpaVo4bU1PWFUzWmVMWUhG?=
 =?utf-8?B?UmZkdmtYM2JzeDdTNzY1MU1QQ0NYenJnRWc1d2phU1dFUXI0WjFUN2ZwUld6?=
 =?utf-8?B?cVhzRWcxSk5zUmJHZmh4SW9pNHN1VS9tUmZINTdxYTFFS2h0YzBFNWI3MEhY?=
 =?utf-8?B?d1R2WTdka3hUclRkMitWYXk2U1d3SWt6TVdTL21sbmZ6Zm1SL05aamtiVHll?=
 =?utf-8?B?WitJZDN4N3RVcHBJdUZndE8rK2VoNnlHNlNNdGFFTVR2YkJMVkFRMStWcGFF?=
 =?utf-8?B?THhPNVBkVys2LzdnWHJxbmg5YitnazdGVlg4bFllN0Zrb2RBdlRZdUVwN0cw?=
 =?utf-8?B?MDg5S212KzdoYkRVYzAzZ20rbkxDdGVFTy9pVUNVQ1YzbzJubkVseWlWdXNy?=
 =?utf-8?B?T3drckFCd0NqczRTRVJlUjBIUGVPTHVIeXkvZjVQOC96cjFoaFdqSE5SRlds?=
 =?utf-8?B?NlFwcnRZWE9Ub2RJazRUaEN1NUpSQ0oxUjhSOFFCaERERjlhQWdha1RRRzFM?=
 =?utf-8?B?eWlFamdYdk9ERS9PTlRTWUdwbytRQ2ZvWWREVEFqTWFkL0ozbXN0RTNDR2pp?=
 =?utf-8?B?d3Y0VGdDcmQ0M1dZZ2k5alo0bmxDQVB1MW1oL2tIdEJNZnBrM3FYNitGUll5?=
 =?utf-8?B?dFJpcmRPTXlsV25JNmZneko4aHZQd3d2YTQ3cWxmbFQxZkd5YzJlU09wZ3Mr?=
 =?utf-8?B?c1NITnhCMlUrQmcrQXRPSjFNK1doTEIyam5LYjlpdlFpTzFXb1hJdE9oeFAx?=
 =?utf-8?B?UzVINzg5VmJoNXpvN25qYnNGR2NXdWRKblJxSjZJem04RGsrUHp4a2FxUExH?=
 =?utf-8?B?TXQ2eEtnbXVmcEVQMTN4STA4QURTZTR2Nm5PRXUveXVZeStMVCtHeHU3Tzh3?=
 =?utf-8?B?N2VpVVpHeUpIbFFnNEcxYlE0ajV5OXliZ2lSSHJaK0VvTnQzR2lRanJ2Unh2?=
 =?utf-8?B?MVdEYkJEYW9uS3RBeXNqMFhkTlBBNllaSzZmZlVlb2FETnQyWGlRZ09hcm9l?=
 =?utf-8?B?YjBjSmI5bFhFTEpJdTRHdHEvdGFwNjdxUTJTT21NT1NNeU1RejRHeWFFeGl2?=
 =?utf-8?B?KzFDYWFrd2FPdGVQYVNBOTZZdVYvU3hidkkzcVE1QUJ6ZHBWeC9PZVg1T2RQ?=
 =?utf-8?B?MUNWckNRTllJUUpBQ3FONFk1ZXE1YWxoTEVPOWdkaFRVRHRBcEFlYmJxM1V4?=
 =?utf-8?B?TUJocU40TEREay9PNnFibDMwU3hpOTNxNDNMOGdRWlduS2tJRHR4YzRDMWFD?=
 =?utf-8?B?YkVKcW1TVkxrUmRmS1dVZlJqcngyOUVuUjlwdGhwNFU1VThSaWlLN3FFZW1R?=
 =?utf-8?B?NFhQc09ZVjh0YXBnK0pVcnlGVjNoeEgyb2krY0hTT2x1V3Q3NWpSS2o0WkQ0?=
 =?utf-8?B?Z2RhZXkvWVM2eTlJd3FlY0FOZDRsZ2E0WGtVZC93clkvczk2RnVBNG83clFS?=
 =?utf-8?B?K0NiOHA3ZXRTVGhrSjRScU1CTU9IbjMwd3d6ZVp6SmNzUWw3Q3EyRmZvZHhV?=
 =?utf-8?Q?0TbBHfPAbf+XoHoqaX88yKM6i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a601536-aa15-4982-325c-08dd1546a3f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 16:05:30.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGawVwKKFqN1gE42CusTlecxIuJ4v6cg45HfQYYK62iEuZD/0KsSoyvfp/X0Wvy8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494

On 5 Dec 2024, at 3:10, David Hildenbrand wrote:

> On 05.12.24 09:04, Geert Uytterhoeven wrote:
>> Hi Zi,
>>
>> On Wed, Dec 4, 2024 at 7:30=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>>> On 4 Dec 2024, at 12:33, Zi Yan wrote:
>>>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>>>> So maybe the clearing done as part of page allocator isn't enough h=
ere.
>>>>>>>
>>>>>> Basically, mips needs to flush data cache if kmap address is aliased=
 to
>>>>>
>>>>> People use "aliased" in contronym ways.  Do you mean "has a
>>>>> non-congruent alias" or "has a congruent alias"?
>>>>>
>>>>>> userspace address. This means when mips has THP on, the patch below
>>>>>> is not enough to fix the issue.
>>>>>>
>>>>>> In post_alloc_hook(), it does not make sense to pass userspace addre=
ss
>>>>>> in to determine whether to flush dcache or not.
>>>>>>
>>>>>> One way to fix it is to add something like arch_userpage_post_alloc(=
)
>>>>>> to flush dcache if kmap address is aliased to userspace address.
>>>>>> But my questions are that
>>>>>> 1) if kmap address will always be the same for two separate kmap_loc=
al() calls,
>>>>>
>>>>> No.  It just takes the next address in the stack.
>>>>
>>>> Hmm, if kmap_local() gives different addresses, wouldn=E2=80=99t init_=
on_alloc be
>>>> causing issues before my patch? In the page allocator, the page is zer=
oed
>>>> from one kmap address without flush, then clear_user_highpage() clears
>>>> it again with another kmap address with flush. After returning to user=
space,
>>>> the user application works on the page but when the cache line used by
>>>> init_on_alloc is written back (with 0s) at eviction, user data is corr=
upted.
>>>> Am I missing anything? Or all arch with cache aliasing never enables
>>>> init_on_alloc?
>>>
>>> Hi Geert,
>>>
>>> Regarding the above concern, have you ever had CONFIG_INIT_ON_ALLOC_DEF=
AULT_ON
>>> for your MIPS machine and encountered any issue? Or let me know if my r=
easoning
>>> above is flawed.
>>>
>>> To test it, I wonder if you can 1) revert my patch and 2) turn on
>>> CONFIG_INIT_ON_ALLOC_DEFAULT_ON for your MIPS machine and run some appl=
ications
>>> to see if any error happens.
>>
>> That seems to work fine...
>>
>> Kernel log confirms it's enabled:
>> -mem auto-init: stack:off, heap alloc:off, heap free:off
>> +mem auto-init: stack:off, heap alloc:on, heap free:off
>
> If I'm not wrong that's expected ... because we'll be double-zeroing that=
 memory, clearing the cache :)
>
> I guess the question is, how *effective* is CONFIG_INIT_ON_ALLOC_DEFAULT_=
ON on systems to prevent exposing un-zeroed data to userspace, when it does=
n't end up doing the flush we really need.

Hi Geert,

Is it possible to run a 32bit kernel with HIGHMEM and
CONFIG_INIT_ON_ALLOC_DEFAULT_ON on the machine (of course with my patch
reverted)? Just to check my reasoning below.

Thanks.


Yes, it should work, since I forgot the actual issue is HIGHMEM+cache flush=
, not just cache flush is needed after clearing user page.

For arch which needs to flush cache after clearing user page, with HIGHMEM,
init_on_alloc first clears the page using kmap_addr0 without flushing
the cache, then clear_user_page() clears the page using kmap_addr1
with cache flush. After returning to userspace, the cache lines of
kmap_addr0 will be evicted and written back to RAM eventually, corrupting
user data with 0s, because no one flushes them before returning to userspac=
e.

For a proper fix, I will add ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE and
make mips, sh, sparc, arm, xtensa, nios2, m68k, parisc, csky, arc, and powe=
rpc
select it, then make alloc_zeroed() returns false if
ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE is enabled.

If my reasoning above is verified to be true, I will send a separate patch
to disable CONFIG_INIT_ON_ALLOC_DEFAULT_ON if HIGHMEM &&
ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE.

Best Regards,
Yan, Zi

