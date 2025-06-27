Return-Path: <linux-mips+bounces-9540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F473AEBE77
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 19:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC891C2834D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 17:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343D12E92C8;
	Fri, 27 Jun 2025 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gQ3LYDiA"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977312EA162;
	Fri, 27 Jun 2025 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045518; cv=fail; b=jQwWPjAD+DbzoUAPZzNeuFP9eOmqRooUya/ix1iB9oSY4aH2ZmpG3flwTETZyeewd3meJPCeCLELwYkmazJZnfbpt+CZDVvZFdLyw+thoUXJm6pgeFth4qdgNXiPUMDwbJNcxPwsuqeCJZSlaKhS+8sztCH5I8pRxShqBMzolKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045518; c=relaxed/simple;
	bh=zW92uwznnUO+NSQXHS8EoUFSEJMNTkb+6H93121PE78=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jvgzxoowkp8jFeqeh9rGKDdq1WYUFtAg2g8SgYw5L88Gl2Vf65F01urdhXbg8KcQ0+9cZwMadAbkv0oOZfiuMOw4GvVUyS0BuvK0ofltacr6S7ehnMwImqb1cy/UXoYcsF0cEeFow0IJw809HaAIVJJggi50spyg6Rayb9JKEkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gQ3LYDiA; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1fH46DxbM6g7qX25mxGucC4oWu17RtmLQh6YXUYpRcMhmGhRgYTIxwzw9rsBSmTNdaAU0A0UjBJuzlhiiIRtJ6TVW/9nM6rnwA5cCofL8EzzAWXBrO7TwshsKvJXiYuIhRtSzAz5zcSDgKYkt7bKpjinI22mqJ9Tzp5tK94D3SbGVFdEFZlGIfUBTVl3TwRTLouihYq5OErBUVCnOq3eBCOy912j0z0xF4/ziitjpGDAMsKfhd1b6fKql/pWXrox1d9D0e99OO7NosbcEFu38+4cYFwm+VHvFL9Med5B+L1KOxl163eZ1/yFrmWn/S5nH2cGVJif5FhkAnhRaU9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36fW2eR2bkfpDQoezV+7kd7SwaC/8CZBnaiN1uOke/g=;
 b=ZT5X0XSg9joAArp183/2LP9Zr1Q71FJQhZIt/r0ImEar2b0EwFiGPGnGPDp8nTJJHK0tSxe/qq/gwiR+KzXQyQzavqkfhPkxcQd6+UmLjyNPOcxUZDKpmmLb7o/SVRTXn8LsxZ2XqLxX3Kl73zBcTYRZ1uLucjZC8L4yTYzmAVC0h1/h3xmZBtNNroVSuqF4RVgGsbp5TGYy18BCW4w6gS7OwCmILCwCuIV1yk3hk9iwFNhmjR5sMvvWvqAxSDpQpjDCcxwTXuRXbGv+u9UUir/L676VRrY2qT8Vb+0dVt6H0STr1x5wtOWaS/EZk+gRSAgYvg9q7KwA7x8d8sATfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=csgroup.eu smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36fW2eR2bkfpDQoezV+7kd7SwaC/8CZBnaiN1uOke/g=;
 b=gQ3LYDiAXy/wElWcgPIh0OLAgcJTz2Qx1DU7UeQKyWhfZKUba2YNrwYuhm6Pj1iX2E9M3Evz6v7huDYUmQhjU8t9cWbtvWH6CuHUoTMAs2lcQ9ugo+IlgYS9CCDASmg7bQO1W5S5nCKr/IBGgggqufo7BWzN5KveYxGpjBmjeU0=
Received: from MW4PR03CA0116.namprd03.prod.outlook.com (2603:10b6:303:b7::31)
 by PH0PR12MB5677.namprd12.prod.outlook.com (2603:10b6:510:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 17:31:54 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::5c) by MW4PR03CA0116.outlook.office365.com
 (2603:10b6:303:b7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 17:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 17:31:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:31:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:31:52 -0500
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 27 Jun 2025 12:31:51 -0500
Message-ID: <49ff7c4c-6503-4c45-a8cb-91068fa9afa8@amd.com>
Date: Fri, 27 Jun 2025 13:31:51 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kmap: fix header include to reflect actual path
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Vineet Gupta
	<vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
	<guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov
	<jcmvbkbc@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
CC: <linux-snps-arc@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<sparclinux@vger.kernel.org>
References: <20250627153259.301946-1-aurabindo.pillai@amd.com>
 <5c371310-525c-4432-88f2-7c62ed563c9b@csgroup.eu>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <5c371310-525c-4432-88f2-7c62ed563c9b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|PH0PR12MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8a7c28-8746-43db-8941-08ddb5a081f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkFJTyszZGgxZWRmN1phbnpOeVZMRldYcVczeWl3UStuVUtCYnhkWm9jODky?=
 =?utf-8?B?RTMxTVZsQmZVcTZWeXdPZ01LTEJyeCtpRlZQLytaMUl5amZrZXdkM0h3L0NK?=
 =?utf-8?B?cjU1bWVNQ2E2T3BRSVA4SEJhWEtCOWFrTFZuNk15Mm55MHBzVlBtdjdmdXFV?=
 =?utf-8?B?ZGRMRURjVTdLRFJkcjlZM3k1N2xKSlpwaUR6bEtSN0VyQ3ViZjlVWVgyRC9T?=
 =?utf-8?B?VlFJMTd4YmtucHpwemhGWlNVRzBVRXJHbkgwa29jMEFzbkpTWXhRRkVwT0ZQ?=
 =?utf-8?B?VE50S3RwVlYrUThPZGRyVnJ3c0c2NmlvaDFBM21YdzJUY2RtaG1FbXBpcm5R?=
 =?utf-8?B?UjNMRnBobldrQWFCWmpHbW5ESHpjcmhweW0rNXNsb1dMRGxYV3BsbmFtS2U5?=
 =?utf-8?B?THM1bDJNSXJSRDc0TlpVeWNxeU91YWQxMEQ4WVdoQXl4Vy94RThkRmdsNUNu?=
 =?utf-8?B?M0hEMWdIVzFGRnJsMWlNaXRPc1dtRUpTVkRzRTZBOW9nS3pYdExDRFNoQ3lY?=
 =?utf-8?B?bkxBLzNYRkt3bG5xaThmZ2lOQnFsUDFRbWNGUXI4aEZ3dHQ5SndsaFFFSlIv?=
 =?utf-8?B?bnFwQ3BiRjM0WXdKRUNlQUd1TkZOL0NobU1kZ0NZMTE2ZVlBQi9TUlk4NERO?=
 =?utf-8?B?OHhCaXRaSHRSQlpGUHJJR3Voeld6dXlCRHRscXk3VEd1dmRZWGk1UEdUVUJ2?=
 =?utf-8?B?VFQxNGU1VUNJSTZ0SGFrem5HK2NQZTlNbTMwRFV6WXltdEtSOW9XYlB0c1NO?=
 =?utf-8?B?OEQ4eHB6WU9sTVB0TCt5WUprOGRGQ0djUlRuTWljdVlTSHVIbmR0WFVqRGYv?=
 =?utf-8?B?U3VTemFnKzJlZ0NUMjBpUE1KVHA4UXMwdDF6QjBGL3RibnMrWFFkTlZRMzVX?=
 =?utf-8?B?V3B0NUY2dnpta1p2Rm1LV2JxVWVRWjBKdVFkdzdqNzlCclRTSFE1VE5mWS9M?=
 =?utf-8?B?blZnWW1rOGpXekx4cmdXdi9ETm5xVlRkZlp1YXcyL2dKNUlEeXl0TTJqMGY4?=
 =?utf-8?B?aDBieG1yVFlrRDFSUXBXYVpqUFRTcEpOMEVaQW5QbDRJdkNXWjZnV3pxRjZs?=
 =?utf-8?B?elZFU1JiN044OXhjeGNqQnk5cW1aSlVnTkI2WjRXdkVFWUR5NGZBSFpGNTIr?=
 =?utf-8?B?ci80Yjlkc2ZxbUdtZ1A5RzZ5MWVYTHp5WHVuYzAzeUFKMDRXWnJOY09pZU5C?=
 =?utf-8?B?OHJWZWpYcTNqaE1QVWhnNmFhYlhoNnhSZ3RMNlFNdU5MUkxTb1J6NTZsMVo4?=
 =?utf-8?B?TUJ0R016VmlvcHRiM3dSQTEzZ0cvVVhmWmU4THZGWGZVRE5mWFNzOGpOVTdK?=
 =?utf-8?B?Y2dlczNLcDJ2RDVmTUg1TWRJd1d6TmtONGJqbXFiRnROc2RCeHljYmhvSURR?=
 =?utf-8?B?WmZlSE9EZDBmYlBkbnQ3enJIN2luMDRzNEUyV3RQOXNYeExFWFpCeXZDNG5i?=
 =?utf-8?B?MjhJeThqa0lrU21CY0xiTWk1WGxTdDRxQ01BYkhBZ3hyUlJZVVJMd3RFWG1p?=
 =?utf-8?B?M2FSWXArd0Nha1dDRUR6VG9Iamk5YlFOSnhFZUxYTFMzRzFieVdDcm5RZmlv?=
 =?utf-8?B?c2t1aVlKaERmaVZjQURSaEVWY0lPa2ZMNW9GNnNSWDFXUldZWExVazN0WkU0?=
 =?utf-8?B?aG1rRE5TYVJ5b2p1T25DVW1iWURyK1dFQm5oRmxwSXdmZTBQcmt0TU94VHJ2?=
 =?utf-8?B?SGZDYVk4TCsrQ0ErS3JXL0cySEZKcDk2dWFNeG5sVXlvZ3JWem4xOEZ1UDFn?=
 =?utf-8?B?aDFmKzNwSjVsVzdUY2paL3F6T3kyL3RNQ2NkQWtSV211bThMTDRzTGZiUDRL?=
 =?utf-8?B?UENURzY5dURnRisxYStlbXd1c0laTEw1cENKL1piWnl2d2RNOXZlb0l0dlJI?=
 =?utf-8?B?L1BpRmtvUU1aQkxYYkh4R0UxNkdtY2VkYWNkeUFPZkJiaENCQndZbXgxVGZT?=
 =?utf-8?B?Tk9XYmoxc0pVOGZka2NBem1yQ1Biek1OL2dxYnZRaFVMVlViUXd6U0lCRTBi?=
 =?utf-8?Q?uA6BfNuUyFtjsFzSDWaNvfNaPnhVS0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 17:31:53.4603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8a7c28-8746-43db-8941-08ddb5a081f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5677



On 2025-06-27 12:34, Christophe Leroy wrote:
> 
> 
> Le 27/06/2025 à 17:32, Aurabindo Pillai a écrit :
>> [Vous ne recevez pas souvent de courriers de aurabindo.pillai@amd.com. 
>> Découvrez pourquoi ceci est important à https://aka.ms/ 
>> LearnAboutSenderIdentification ]
>>
>> There are plenty of header includes like:
>>
>>          #include <asm/kmap_size.h>
> 
> Yes and in reality that includes those,
> 
> ./arch/arm64/include/generated/asm/kmap_size.h
> ./arch/riscv/include/generated/asm/kmap_size.h
> ./arch/arc/include/generated/asm/kmap_size.h
> ./arch/x86/include/generated/asm/kmap_size.h
> ./arch/powerpc/include/generated/asm/kmap_size.h
> ./arch/arm/include/generated/asm/kmap_size.h
> 
> Which contain:
> 
> $ cat arch/powerpc/include/generated/asm/kmap_size.h
> #include <asm-generic/kmap_size.h>
> 
> So what is the problem really ?

Thanks for the explanation. I was trying to reuse some driver source 
code in another project such that it compiles the related files in Linux 
and ran into a compilation issue, and the error was that the header file 
asm-generic/kmap_size.h was not found.

I just realized that once the kernel is built, the path asm/kmap_size.h 
will exist, and hence there is no need for this patch.
-- 
Thanks & Regards,
Aurabindo Pillai


