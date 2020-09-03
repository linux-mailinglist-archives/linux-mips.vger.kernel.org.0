Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7136125CAD7
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 22:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbgICUfk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 16:35:40 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:27232 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729629AbgICUfh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Sep 2020 16:35:37 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 083KXwGN024434;
        Thu, 3 Sep 2020 13:34:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=RvA/HSU7hsn38Sd1lcLoMPq6VzQ0ovMIPkqfZ0/bj6g=;
 b=LwXGg0mnLMfUKWLazwrq+yzJzr+36r+tLilOcM6FElaNIukbeQogKw3xv5OT6xhFw0ym
 7w5VpTINJcumtUnSsxn3mrUokf0Rf7bJe2s5II0ji8xv7oqDQbrIpaRI9k5Srw6VX7YB
 CA8PPdb+YxHREb78DdTc6ADrooZBNSVkU7Q= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 33879p1t4u-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 03 Sep 2020 13:34:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Sep 2020 13:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdp1eJ+v/8qTtXKwOeIFmW+8xuxpcHgfW/iXkKNKrlv43Dkmg138/0jEUBw74Cvj/LKdGS3iebig+xW8CWb3mmu2hyxNQRuahoRkx6VjFsnbPnDRMhc+KSb8ENvpmT5mfcmBR28BJsjSXID12imojzNiJvN2vUGH9UbClSHQ8adbmWFOJsi+pHDWjDHFRTQVdULssNITusBDv2YqQOnUWl+dyo0Rc0nQN9eELVDpPBupWcA+LXvwVwOTGj/OsjY5/KDZudJyd/2tptarBXbekvr2RDi1qgSKuH2et2PkKTUH+YsBDr4ikj7ii1fuMCwJo7tMusbWcWvBYcA3HAGSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvA/HSU7hsn38Sd1lcLoMPq6VzQ0ovMIPkqfZ0/bj6g=;
 b=NULf/j3LHOYa8y1X2jdBNOD0Ov+Bl6SVsCI6e7S7Un5/fycQKORaj6QmzgE4aYwI1+YBEdaMaI7rwbZs/xf/Qy7Ob7lIdLFKEHGhV3or+xKXIoGx+iDjlNH24TSbYSPpX2ofiJq6NEhc9KU1/bmhChqMAC6371oZ5SMMk4mtXI5fYpagjhKm72rwAynL+iHD0I94unsFMIBuksG3F+HFcKFAoBZY74Vi2184vwTYIRNeeAxSJnJVK9mBJgw/UMDYj2ustGfyTOAkAm7+Jpx5154pnbblrvNVp48zC7ar2ELJpE9t5pfBXW0OvhnRS/TRtUcKajRTMCBbkhAArYHsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvA/HSU7hsn38Sd1lcLoMPq6VzQ0ovMIPkqfZ0/bj6g=;
 b=M+2qfHU9iX6k9NXRFbQvnUuCPKdXkw0RsR1C7JR7Hvt2w1AjUxuhxVwjrIn3LrcXt97KkcbyMleIRbjEmqTOBvdxCVxrVlnZXzOIHQzT7fPdG/domhgkbYLQkwRLYjWVRc+F7f/mjMgsPWjiEnJm3Qvx/nMg7phNIHKd6EI5amw=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2503.namprd15.prod.outlook.com (2603:10b6:a02:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Thu, 3 Sep
 2020 20:34:28 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::354d:5296:6a28:f55e]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::354d:5296:6a28:f55e%6]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 20:34:28 +0000
Date:   Thu, 3 Sep 2020 13:34:24 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
CC:     <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Message-ID: <20200903203424.GH60440@carbon.dhcp.thefacebook.com>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903030204.253433-1-mike.kravetz@oracle.com>
X-ClientProxiedBy: BY5PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::42) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by BY5PR16CA0029.namprd16.prod.outlook.com (2603:10b6:a03:1a0::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 20:34:27 +0000
X-Originating-IP: [2620:10d:c090:400::5:6903]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0147670f-0797-459e-c761-08d85048c15b
X-MS-TrafficTypeDiagnostic: BYAPR15MB2503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR15MB2503444F8F64F6BD2293E949BE2C0@BYAPR15MB2503.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjn0fiu6iasvrumFLyF/s3uXERYN00m6vdhw/ru6FzyXfSpu3GoiTtAoerPKnvA8ZXAKk67t5y7muc2b+OiHDFtX8iDQ/wRmcYUja88npUgykRMOcHTtGwDPyEbnCuB3kcGXIPv9fmo8T34Ojk0Xu4khALOOvnk5AShSzY+KpM5xMc999JyFajTEmXiVr/8GbKpEx/Z9rjCZ4X4GaUqQ8r3nH57fPsZ+0l/C90+yvh5k2DwRnUIpAAsTXJpIFjxlqP9gRSjvjEiYIlJoQibCyw6KBk9gQWDqtDsHODp85nKh1liMPuNMZkoL4DZKa1WmW4KJqCrg7gs6lqK2nRrcIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(2906002)(66556008)(83380400001)(33656002)(9686003)(86362001)(7416002)(956004)(8936002)(478600001)(66476007)(66946007)(6916009)(6486002)(1076003)(5660300002)(186003)(52116002)(4326008)(6666004)(316002)(54906003)(8676002)(16576012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: K2r5na8zpl9Uj8iZCNLoYJG2q6MyXVt/M/EOv0iEa+z5IMLUiAo54mTF2k1WeOfjGHZuo46EK9FTyOASDEB7IUS+pdJDN/YvT9jzDUENOZa7QfoegLYNdlbH3d5lveQIF+s7cxSbROWEP98EIaqXh1/LLDG+hNLheNxyprNiFmSeJjqd8JkdEZVpM5blgxzn0L/dzxLQMi5H1V6zlOjbupYQYXpV3TIMhRYNZmuI43lnsNj3D8nhdInf1imbcS8/gZPY2jPRe2oA7bUKZycNSWmlk1tjfTbvf5eQ+3ciW460U0cNPdP/nxA8p+NUzpogVmYlKdx8PpRxI//XjpTlvzCPT1gU0Ma6XVhB8mjvDMYHyyNKw4vIihkakZhgDTpIVmVkvelTwsC5ZYHl7PdK4PQXxUo8XHc4Labpe6M4XyNwp1uh0PcGAN88NTjY9qWAFF0LmP/Pt4UWBETQS3OK2fPA0Atz2/2Ra1QKk7xs5nMtxsC4kr3mggVa2DPFMi3LpvC5iHWKewogLK8FfTFGc46CaxFQYzO+oQ2hYa4CYFzCueUBmffjQa54upsYuUXKIJJawCSojumE4TN340tWx/2KecJsSxxR9n6TGQNs1A8kyHwIcasBG69Nhia1hYsl7PbIcpkZmgY0nc2wEMMixdV9anlact7RK8OlFChdZIk=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0147670f-0797-459e-c761-08d85048c15b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 20:34:28.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUf3l0ixnF8zmjfMJopVywvteKq0w4xq79rW6IcUm9Kp7Yn9es0j7G9ZoV/Eg/3x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2503
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-03_13:2020-09-03,2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1011 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009030183
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 02, 2020 at 08:02:04PM -0700, Mike Kravetz wrote:
> The number of distinct CMA areas is limited by the constant
> CONFIG_CMA_AREAS.  In most environments, this was set to a default
> value of 7.  Not too long ago, support was added to allocate hugetlb
> gigantic pages from CMA.  More recent changes to make dma_alloc_coherent
> NUMA-aware on arm64 added more potential users of CMA areas.  Along
> with the dma_alloc_coherent changes, the default value of CMA_AREAS
> was bumped up to 19 if NUMA is enabled.
> 
> It seems that the number of CMA users is likely to grow.  Instead of
> using a static array for cma areas, use a simple linked list.  These
> areas are used before normal memory allocators, so use the memblock
> allocator.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Sounds like a good idea!
That 7 always confused me.

Acked-by: Roman Gushchin <guro@fb.com>

Thank you!

> ---
>  arch/arm/mm/dma-mapping.c              | 29 ++++++++++++-------
>  arch/mips/configs/cu1000-neo_defconfig |  1 -
>  arch/mips/configs/cu1830-neo_defconfig |  1 -
>  include/linux/cma.h                    | 12 --------
>  mm/Kconfig                             | 12 --------
>  mm/cma.c                               | 40 +++++++++++++-------------
>  mm/cma.h                               |  4 +--
>  mm/cma_debug.c                         |  6 ++--
>  8 files changed, 44 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 8a8949174b1c..a35a760cc0f4 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -383,25 +383,34 @@ postcore_initcall(atomic_pool_init);
>  struct dma_contig_early_reserve {
>  	phys_addr_t base;
>  	unsigned long size;
> +	struct list_head areas;
>  };
>  
> -static struct dma_contig_early_reserve dma_mmu_remap[MAX_CMA_AREAS] __initdata;
> -
> -static int dma_mmu_remap_num __initdata;
> +static __initdata LIST_HEAD(dma_mmu_remap_areas);
>  
>  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>  {
> -	dma_mmu_remap[dma_mmu_remap_num].base = base;
> -	dma_mmu_remap[dma_mmu_remap_num].size = size;
> -	dma_mmu_remap_num++;
> +	struct dma_contig_early_reserve *d;
> +
> +	d = memblock_alloc(sizeof(struct dma_contig_early_reserve),
> +			sizeof(void *));
> +	if (!d) {
> +		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
> +		return;
> +	}
> +
> +	d->base = base;
> +	d->size = size;
> +	list_add_tail(&d->areas, &dma_mmu_remap_areas);
>  }
>  
>  void __init dma_contiguous_remap(void)
>  {
> -	int i;
> -	for (i = 0; i < dma_mmu_remap_num; i++) {
> -		phys_addr_t start = dma_mmu_remap[i].base;
> -		phys_addr_t end = start + dma_mmu_remap[i].size;
> +	struct dma_contig_early_reserve *d;
> +
> +	list_for_each_entry(d, &dma_mmu_remap_areas, areas) {
> +		phys_addr_t start = d->base;
> +		phys_addr_t end = start + d->size;
>  		struct map_desc map;
>  		unsigned long addr;
>  
> diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
> index e924c817f73d..b86f3fd420f2 100644
> --- a/arch/mips/configs/cu1000-neo_defconfig
> +++ b/arch/mips/configs/cu1000-neo_defconfig
> @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
> index cbfb62900273..98a31334fc57 100644
> --- a/arch/mips/configs/cu1830-neo_defconfig
> +++ b/arch/mips/configs/cu1830-neo_defconfig
> @@ -31,7 +31,6 @@ CONFIG_HZ_100=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPACTION is not set
>  CONFIG_CMA=y
> -CONFIG_CMA_AREAS=7
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 217999c8a762..ea9a3dab0c20 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -6,18 +6,6 @@
>  #include <linux/types.h>
>  #include <linux/numa.h>
>  
> -/*
> - * There is always at least global CMA area and a few optional
> - * areas configured in kernel .config.
> - */
> -#ifdef CONFIG_CMA_AREAS
> -#define MAX_CMA_AREAS	(1 + CONFIG_CMA_AREAS)
> -
> -#else
> -#define MAX_CMA_AREAS	(0)
> -
> -#endif
> -
>  #define CMA_MAX_NAME 64
>  
>  struct cma;
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7d56281ff41e..a52345093f4d 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -513,18 +513,6 @@ config CMA_DEBUGFS
>  	help
>  	  Turns on the DebugFS interface for CMA.
>  
> -config CMA_AREAS
> -	int "Maximum count of the CMA areas"
> -	depends on CMA
> -	default 19 if NUMA
> -	default 7
> -	help
> -	  CMA allows to create CMA areas for particular purpose, mainly,
> -	  used as device private area. This parameter sets the maximum
> -	  number of CMA area in the system.
> -
> -	  If unsure, leave the default value "7" in UMA and "19" in NUMA.
> -
>  config MEM_SOFT_DIRTY
>  	bool "Track memory changes"
>  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
> diff --git a/mm/cma.c b/mm/cma.c
> index 7f415d7cda9f..2bd61137b2ca 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -36,8 +36,9 @@
>  
>  #include "cma.h"
>  
> -struct cma cma_areas[MAX_CMA_AREAS];
> -unsigned cma_area_count;
> +/* modify here */
> +LIST_HEAD(cma_areas);
> +static unsigned int cma_area_count;
>  static DEFINE_MUTEX(cma_mutex);
>  
>  phys_addr_t cma_get_base(const struct cma *cma)
> @@ -143,10 +144,10 @@ static void __init cma_activate_area(struct cma *cma)
>  
>  static int __init cma_init_reserved_areas(void)
>  {
> -	int i;
> +	struct cma *c;
>  
> -	for (i = 0; i < cma_area_count; i++)
> -		cma_activate_area(&cma_areas[i]);
> +	list_for_each_entry(c, &cma_areas, areas)
> +		cma_activate_area(c);
>  
>  	return 0;
>  }
> @@ -172,15 +173,14 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	struct cma *cma;
>  	phys_addr_t alignment;
>  
> -	/* Sanity checks */
> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> -		pr_err("Not enough slots for CMA reserved regions!\n");
> -		return -ENOSPC;
> -	}
> +	/* Do not attempt allocations after memblock allocator is torn down */
> +	if (slab_is_available())
> +		return -EINVAL;
>  
>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
>  
> +
>  	/* ensure minimal alignment required by mm core */
>  	alignment = PAGE_SIZE <<
>  			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
> @@ -192,12 +192,17 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
>  		return -EINVAL;
>  
> +	cma = memblock_alloc(sizeof(struct cma), sizeof(long));
> +	if (!cma) {
> +		pr_err("Unable to allocate CMA descriptor!\n");
> +		return -ENOSPC;
> +	}
> +	list_add_tail(&cma->areas, &cma_areas);
> +
>  	/*
>  	 * Each reserved area must be initialised later, when more kernel
>  	 * subsystems (like slab allocator) are available.
>  	 */
> -	cma = &cma_areas[cma_area_count];
> -
>  	if (name)
>  		snprintf(cma->name, CMA_MAX_NAME, name);
>  	else
> @@ -253,11 +258,6 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
>  	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
>  		__func__, &size, &base, &limit, &alignment);
>  
> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
> -		pr_err("Not enough slots for CMA reserved regions!\n");
> -		return -ENOSPC;
> -	}
> -
>  	if (!size)
>  		return -EINVAL;
>  
> @@ -530,10 +530,10 @@ bool cma_release(struct cma *cma, const struct page *pages, unsigned int count)
>  
>  int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
>  {
> -	int i;
> +	struct cma *c;
>  
> -	for (i = 0; i < cma_area_count; i++) {
> -		int ret = it(&cma_areas[i], data);
> +	list_for_each_entry(c, &cma_areas, areas) {
> +		int ret = it(c, data);
>  
>  		if (ret)
>  			return ret;
> diff --git a/mm/cma.h b/mm/cma.h
> index 42ae082cb067..fed800b63819 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -15,11 +15,11 @@ struct cma {
>  	spinlock_t mem_head_lock;
>  	struct debugfs_u32_array dfs_bitmap;
>  #endif
> +	struct list_head areas;
>  	char name[CMA_MAX_NAME];
>  };
>  
> -extern struct cma cma_areas[MAX_CMA_AREAS];
> -extern unsigned cma_area_count;
> +extern struct list_head cma_areas;
>  
>  static inline unsigned long cma_bitmap_maxno(struct cma *cma)
>  {
> diff --git a/mm/cma_debug.c b/mm/cma_debug.c
> index d5bf8aa34fdc..c39695d50224 100644
> --- a/mm/cma_debug.c
> +++ b/mm/cma_debug.c
> @@ -188,12 +188,12 @@ static void cma_debugfs_add_one(struct cma *cma, struct dentry *root_dentry)
>  static int __init cma_debugfs_init(void)
>  {
>  	struct dentry *cma_debugfs_root;
> -	int i;
> +	struct cma *c;
>  
>  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
>  
> -	for (i = 0; i < cma_area_count; i++)
> -		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
> +	list_for_each_entry(c, &cma_areas, areas)
> +		cma_debugfs_add_one(c, cma_debugfs_root);
>  
>  	return 0;
>  }
> -- 
> 2.25.4
> 
