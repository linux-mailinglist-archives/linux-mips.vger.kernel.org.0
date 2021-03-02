Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED2632AF8B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbhCCA0Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:24 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:29088 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1835396AbhCBTFh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 14:05:37 -0500
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 122J0edX018726;
        Tue, 2 Mar 2021 11:04:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=vCukpsUfSzoVlSGV3UDPLx7PovqhIGQsgkKF+k50tYQ=;
 b=dXkmYVdtMNxopwNf5gfccHI7NOVXCsKKLGILHdcFiOIpZdZOabylzOx59Evl0xfbeh3S
 ijcL4VGoMkdxXLqO1VaVcgFpG8rf+S7P4lKxnY2bPAUyjlAvw0h+F5W1H1/yxuEs/j1S
 McKIHbQZKOcHt0I3eK7tbCn809ObH0g2qJE= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 37071t59se-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 02 Mar 2021 11:04:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 2 Mar 2021 11:04:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnS7D4/IAnTcK6XwxDa/lfKTwps6cyuSDCneJF55KOoWC33kgB40SEiwHreD2PlCQZ3jK/Y+j50QBVpzBhPIhlyQfe0w3BsQVlpdEmSh0PqVGTErCuaDTOgHs4itPtEAgMRN4nXJcynlE/avI2s9ppAMR6Vp7AHF9aDVjjOpukCqxOQbZ4k5H2gQDXdxbDDMA8aHNhK36v0BiYS+wVc+ZwdOyaecpEst7UvEreK2vxYY3gAAZuH4F28L4QIoDQjxdn5mdFzGTtubHsbRTompwEd48uXRu5wnPGC9zfQhdPIUOdZsNpWkJNV3YL3Dszdkk67lu2cWuz3d/dJ8ypOCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCukpsUfSzoVlSGV3UDPLx7PovqhIGQsgkKF+k50tYQ=;
 b=IwZ1tJKM8VjiNs9TEHBwKcOnWDxak9NDvpu7ocPq2eCz3/f3XMNPwkgLtkcCN3qjKBBW0Et5NXB8qj7/pDvEzgshxpcfPulzwnr/H1FpqDZMSuJsAo/vPxAPYolL5+StkiAGrtYnpInqRK3eyGU78RtOEdpTVE3PoBOCyMPfm+dhn4kPRe9Hv8yJZ901UePxH7WFYBw7dm1fhV6APe4JzlNPkJ2pETHb1VuhdG4GVeVPwCL+1V2vMK8iWk6yw9/glgfyuO5Ox3qh9C99f8szA+ExxRkS5OaKYkl1Sd6OHLsVt0nsHQK6TVzEb0LXLBLhXoKZVWNW6KvCGck7MumaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2981.namprd15.prod.outlook.com (2603:10b6:a03:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 19:04:06 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1%7]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 19:04:06 +0000
Date:   Tue, 2 Mar 2021 11:04:01 -0800
From:   Roman Gushchin <guro@fb.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
CC:     <linux-mips@vger.kernel.org>, <rppt@kernel.org>,
        <fancer.lancer@gmail.com>, <akpm@linux-foundation.org>,
        <paul@crapouillou.net>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Message-ID: <YD6MIcfsS3o53Kto@carbon.dhcp.thefacebook.com>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210302041940.3663823-1-f.fainelli@gmail.com>
X-Originating-IP: [2620:10d:c090:400::5:45ae]
X-ClientProxiedBy: CO2PR18CA0046.namprd18.prod.outlook.com
 (2603:10b6:104:2::14) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.dhcp.thefacebook.com (2620:10d:c090:400::5:45ae) by CO2PR18CA0046.namprd18.prod.outlook.com (2603:10b6:104:2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 19:04:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f40d23-5cf5-48b2-417c-08d8ddadf3bc
X-MS-TrafficTypeDiagnostic: BYAPR15MB2981:
X-Microsoft-Antispam-PRVS: <BYAPR15MB2981E837ACD58A678CF84355BE999@BYAPR15MB2981.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQfSunKcnQBlFBMM8SGrsa12N2mKQyeBg+V6+c+4dU15mYJUx/3vmtj1El7c0Rm8Dxc5cRMYIFfgk0syPgg3rB9w3k/C5GM1+3tKuqHcdHAfmSuuUTFx/g3qerA7rs4HGW9wQSKOBhjuqTzPU7zNBLmCZfNfP9A05owGUMVBIP/gBxDZc3DLKJU85cxwtMtej6KgiOTxF3+lJx2Y3HMHkuRQTzaEt/9F9K2ieujm/gc2FsUOnizhobJykrtt4oYFGNxuNLKBugpd8GddVCyTcGp/3iW5BIUuqhUhJEkqhFx5Xg/QbdkWA9EAyiboR4hXb4hyYLg62Lmpw+rnskffm7qbTxk3xKkwM79M35t1lheJsx3kwzIpDraV7AzC6mI7mI274mLrVGbBA8Pg4pUOCDIz0whYvDseY8pnWSfedqpzXofyqtGgJdjtuOFwYLNCxQHYuAe3B6B3bpijDprDP2sD76raifQwA89Ek9L8p73WDIAY5lTRO8bRSpPRnuxSZwtSUyDk7hOcr1VTkcv5Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(6506007)(66946007)(186003)(6916009)(52116002)(8676002)(9686003)(83380400001)(16526019)(2906002)(55016002)(8936002)(66476007)(66556008)(7696005)(478600001)(316002)(6666004)(5660300002)(86362001)(54906003)(7416002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6LGbFRH0WK7KH84fm93RA24o+syqcJ1z9ewdFYPuDoqZ6vB6DsF+AYB0gjMf?=
 =?us-ascii?Q?9AF9JgVtCXPonv1tLuDwUwz2xXihWkmY90WmG142WiZ1eSz9kv8B3UD+mljQ?=
 =?us-ascii?Q?jxdkCLAievKLsOK9n2ZofGEGqBeM9KwUYjS4NgaaWuGqqF+7LkFjRkxP6p/E?=
 =?us-ascii?Q?Brd3aCwF5O38qNlGyYes7A/fhnfmrUHTlC/BSDX/49Xnj3tBu4JeHINi2JIm?=
 =?us-ascii?Q?nuslh5dAScQKlyRHBQZOHa41BWRZg8pbTMg6B4uewsfrzQrfOpGcdEMfVDy3?=
 =?us-ascii?Q?09nXlEZBxigPBC8WZS5oFIfuwKSrzOR5HHwP0pBZlaRggWPnFj8v2t3DwSHM?=
 =?us-ascii?Q?/SlcGpknBns0vc8HGRxs80krhvstOCJb6XTfKtDOg2q2fuwyNAQ3X+ZZJgNM?=
 =?us-ascii?Q?ciSdiWyTsYrk3bZFPhnHuqgrHrCWhZTSgh384iZCqkt8CVNhdpJTTADvgeyt?=
 =?us-ascii?Q?KJEbsGru9CzMMsWIUBNRs/W07m4oPzIPirW7iKo8e479yuRwc43jbxvZ9wqC?=
 =?us-ascii?Q?S6ooeC/+CeRAjTSAOM6lOTKEQ3hjxI7Kzf5FXhp4sqnZ2SneSq7GT0VJ9+Fn?=
 =?us-ascii?Q?1+A7CZhTtjkTd5hOgC1Vr0sIS+y/Z8knWmIG927OX545azKcUWUq0+GKJKfj?=
 =?us-ascii?Q?Nv34nJABEyc7woMObxGw1BmJTS3SmTxcA3CAJofjBYcR/iiW7OrnLW2wSqNj?=
 =?us-ascii?Q?1Xc7woqthUs6yVBUbicXEbrAaGsYLc8kLpxZNUnXYStbfPfWiHOFTLKQSYdF?=
 =?us-ascii?Q?GsxsWbgV3ceSbDGRBt2rL1Yz2AiOcR8ew99reWd31HGLVMjmuK/umbqdDa2j?=
 =?us-ascii?Q?SDG5NNWE58gUd6YrQGv4Utuj3uXoc3lx7lg1Ja2EZQ45+ChESl8ARmx/Qc2h?=
 =?us-ascii?Q?w9o0lcSOMrdY5leRhRTOI9pJnhETbaUpiAulJ3Ydzfkv1anOGhQ2HLM6y6lH?=
 =?us-ascii?Q?kzzD5735aoBa01O0c7fLfeOy2NzSWb3kLnUsqZ7BPuU9thdQ9ba8YiW0JGq+?=
 =?us-ascii?Q?xO8NQEcCWispHlRsYs5vUmsPFZu9/K9ML9ZeCRZFh/GU1bQS7JkguPj1uPPb?=
 =?us-ascii?Q?FlkKxAeQlH5GFsDmxA9lRHKT1BSf1PmyAVycczIxZS+Soqts+5wb7M3rX5vt?=
 =?us-ascii?Q?bfDThpNxJ6Dc+ZrscF5Ck/EcTIXkTMyI6Oo5S9LTC6IsNfc9wS5VCqe+b3oM?=
 =?us-ascii?Q?UhdekL8qr5eOTE0NhbL7HaOxyGWPtpkiOp+vXw1VER5ipNO0aRK/ydcpEzAO?=
 =?us-ascii?Q?RKW0eEk7MgwD/Q4BRQgqrJAgU5hL5/uzr6KrfJjY8Etp0MCv6Z+/KqZjcr3+?=
 =?us-ascii?Q?fWDbUx39e8Zjkmts8cOsHWTh9WsfWaACuobNhy/J63l9/YIwKcrKx8weSihS?=
 =?us-ascii?Q?XD3ka0Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f40d23-5cf5-48b2-417c-08d8ddadf3bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 19:04:06.3265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2a+mTFsVEof5jqgOeSs2D6JkhCxQjRHyhYXLU+RopTK2gPt+Rt+h5H05WqzOOuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2981
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-02_08:2021-03-01,2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020144
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 08:19:38PM -0800, Florian Fainelli wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception that is going to be installed and this needs to happen at
> plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
> finds a space that is suitable, away from reserved memory.
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.
> 
> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Roman Gushchin <guro@fb.com>

Thank you!

> ---
> Thomas,
> 
> This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
> by the stable team for 5.11. We should find a safer way to avoid these
> problems for 5.13 maybe.
> 
>  arch/mips/bmips/setup.c       | 22 ++++++++++++++++++++++
>  arch/mips/include/asm/traps.h |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 31bcfa4e08b9..0088bd45b892 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -149,6 +149,26 @@ void __init plat_time_init(void)
>  	mips_hpt_frequency = freq;
>  }
>  
> +static void __init bmips_ebase_reserve(void)
> +{
> +	phys_addr_t base, size = VECTORSPACING * 64;
> +
> +	switch (current_cpu_type()) {
> +	default:
> +	case CPU_BMIPS4350:
> +		return;
> +	case CPU_BMIPS3300:
> +	case CPU_BMIPS4380:
> +		base = 0x0400;
> +		break;
> +	case CPU_BMIPS5000:
> +		base = 0x1000;
> +		break;
> +	}
> +
> +	memblock_reserve(base, size);
> +}
> +
>  void __init plat_mem_setup(void)
>  {
>  	void *dtb;
> @@ -169,6 +189,8 @@ void __init plat_mem_setup(void)
>  
>  	__dt_setup_arch(dtb);
>  
> +	bmips_ebase_reserve();
> +
>  	for (q = bmips_quirk_list; q->quirk_fn; q++) {
>  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
>  					     q->compatible)) {
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6aa8f126a43d..0ba6bb7f9618 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -14,6 +14,8 @@
>  #define MIPS_BE_FIXUP	1		/* return to the fixup code */
>  #define MIPS_BE_FATAL	2		/* treat as an unrecoverable error */
>  
> +#define VECTORSPACING 0x100	/* for EI/VI mode */
> +
>  extern void (*board_be_init)(void);
>  extern int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
>  
> -- 
> 2.25.1
> 
