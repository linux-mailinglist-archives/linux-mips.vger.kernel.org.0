Return-Path: <linux-mips+bounces-11603-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C9BB74C5
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 17:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15315189E54F
	for <lists+linux-mips@lfdr.de>; Fri,  3 Oct 2025 15:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1393284B42;
	Fri,  3 Oct 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iNHdl4cr"
X-Original-To: linux-mips@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1826E16F;
	Fri,  3 Oct 2025 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759504578; cv=fail; b=c+LC5ETjbewzBs7xlOKWk+RJXqmwYE5gfie/MRSKYYMJGgNrXoINXM/2rQaOzXVBCnEAOlhUry7YpzrMExj7Vkfrk7ZtPjX/ONoJhVC9lwx4csfLpjgmhHgXOQCQgz28tszaoHRrZF4W4/qLJ6a7e3n+WrxuFvamcYjV/1AX0gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759504578; c=relaxed/simple;
	bh=ai410uu5TZ5ITz9T8X0M8QWURPeiWq0V8ZGdf2C9hns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=twkESpmDjLYCPxOhL9UrbqQtUrv5ZM3DoGJpQCNDs9hztofgtqVMXHdjmdzZ+SKUa775C8FrVXiVOmE7vJXd43LnECnK9xXBZqXvGk3yHpKeEFJv0fhth5QpPcOtX6DngWpJ8vYU9/L7wc2mYGYD/3ZoJqsTWM1GKTXzz7ZzL90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iNHdl4cr; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cItCAxl0GmRtEJVri6KK18BEXXrFclUcevyXwsUWlq93KsZ85Q9brWfbIVk1aKv5zV9VUs5ujXnNGnPRj5h2ykWMsdVTBwO0UnM6HaGZECgjVt3S9LFVMHFW2cef6tqzhaQHvYQaIBzJ6oc2BGMB3R5LvVvXA+9tzWiEyHS2LnV2IQzduPrB92IYW7gjDc3uBw6l/D2BBogz0lMpqzfkOsM0nJXmKqUtH1BVPrfzIJTNr21tuGN3LoZ/sjK9Eg4VPQbf6xIIelew71AOkqSKA8Nvxui3QcpOs/BrQnF8gmAFUjA09TBU9+7QVL2lu8SP2CwaGzFt8RtRVOspE5VBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPYSWiN69FNJ6BCr9dJhfnrMQrdELm6tdxvTRfK+buQ=;
 b=J+4qhXGci9h5w50g0eALBhDajGGQ1BAEgZbycazVbKao0U0Bpw16/RvH7xAOwGefB8LPKUplQHDzhA9HqaKWYJubwzZWn9D0fCXZrysXB0nVh0AINJf+NAvhLgCEh+dnGvoXhMj98JqFS8qmUPLgE5sMdNc3/mtasGcd+5hPEZRdZ5J+VaOomRUZsZiOnjPdj1lnlfz80SxwkYWxNHWragHoOfJhiExVh44NExx/f8OENPkofYXSkv4jT+OuZed/wkC+4F/zhe0RgAGFIqE6+Qk2SUK3IJpiiQGaCtvl7ajtAybI2JtKmrz/hYR1lJ8jkv382B2WTioJqMpfzuY6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPYSWiN69FNJ6BCr9dJhfnrMQrdELm6tdxvTRfK+buQ=;
 b=iNHdl4crpGGbJjFPjtUWePQ3Z8pFRJfXxD4aDeXYwYLR9oxw2ex5Al1rT3gItAGSHclaAO12Ql7QS9SB970w2pZZDUKhvYso9j7jKL48RUgdTPGhPlk7l5zHKE19z8SVLVyKR+7SOMrayNVcDS2sRHjD59L4D9OprFuXurfW3P6wkvAcK9sy5OcTnnEKYmct50JOYCTepbE74+o7CetRPz7r3wphfDSAxcw1hgGe2futUuNRQHZmdhJJPbOsoo+BJtesSk3U8J8+csiz0zhiIXxiFnbIX8wM43remBgbDS7CFfGHOUzYbjVzDdYPH8xCZcBAafMcapcYwZ2bW82ouA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS0PR12MB8767.namprd12.prod.outlook.com (2603:10b6:8:14f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:16:06 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:16:06 +0000
Date: Fri, 3 Oct 2025 12:16:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 5/9] sparc64: Use physical address DMA mapping
Message-ID: <20251003151603.GD3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN8PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:408:ac::20) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS0PR12MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 84162fe3-4517-4f78-89c8-08de028fc5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LFUScImPXIVHU/v6lTo6N7NsFa6Q/zqblbfn6dWppF6za9YdQ9sACsvGsJRQ?=
 =?us-ascii?Q?PqvbaanWEl92sQix4wHUDE18g0z2bpvaI8EssLNPzlbzGcwrgl/JXFb4VjBR?=
 =?us-ascii?Q?/p4mk17zCEvNe89vgrAr+UgtLop2Xz4uH2gJH152+suGZ4FXusZh52fXZxjV?=
 =?us-ascii?Q?O5EzNb2c8oWL8dRAxIBiRGCKI4KFYtl30HsEBxKiTyeztii71C4XIqqCWIns?=
 =?us-ascii?Q?rA3oLdHbTEh+6wr9Ymo5/F5RKMrtmjoURF0jVPhQDaME9RkMslGMBCJNJDOb?=
 =?us-ascii?Q?HH5H48NyuqWTOfljincrxLJDyn4u2Rc0DByU7C8qLVCOJ+JK7fxvmjhHvGck?=
 =?us-ascii?Q?OqSHkGiHXlCj2IJ0UPJRzQG9zt0YrC9lAof+RDzQogw8dSUFySD3HKrAoOtR?=
 =?us-ascii?Q?0zbPq8xaj8VUECESFT2HPRjCi1g6e5gAUigTJhQH+Q496wP2mxT7qdZdjShH?=
 =?us-ascii?Q?QTVc1QnNSYzya4aRaghNk/CEtUYLBwP9mc368dLCxWll3kNQxeWdbi5bovdV?=
 =?us-ascii?Q?mB7rJXiDbgXHAOVHUq2WG1saoWiC9ACf7OzwTZQ0DoYvbbnuwxiJvXhaCPhe?=
 =?us-ascii?Q?GC7rcBgwj4811y1HAZIRcTlmoztyEq1OlyDC8jjHbz0yOr0NpwIiM/P4DrJs?=
 =?us-ascii?Q?/aIzZyIWwpaz599u4/mMybNRbV5cI0J+bY0rgbdF6JP2CBAXlFq7UAymxLrt?=
 =?us-ascii?Q?3nML5h1aju+W8B50n0iYuNXptlhgAJQlMM6z3xzcT58eRdEWLEv5cNUp9QuS?=
 =?us-ascii?Q?z0m0Bx7brXRWD/EyoouNDJ3v+Z++TP6XZma64J5iIZOsA7pN/ywiZUMQh0ya?=
 =?us-ascii?Q?O2LIvMuglB+RmIJuOBus1SpjtuLA5+iypo245P1fH0r87a0T6av1nMI0bZew?=
 =?us-ascii?Q?wdSx3icoq8sEUn6NDpT3gh9KgyD36hDRNLnYRpbs00vUptpTd+UZB5EaRotm?=
 =?us-ascii?Q?sKHwjjeZQ0ckAarCeafptdFFv4pwUBCxe+ZK6TbZdqbv3nSAPTaHz9ZXDefT?=
 =?us-ascii?Q?HrqgoZZi404H4Q2LpuEv5UuxM4bCEwiYJv1yFAeCW9wBoR/vSgX+2Eo4t0DF?=
 =?us-ascii?Q?CJvDPi8LqUq2YJvJvTAS90SjHQZAxSixAydpLlmitUmH32elTVuBRFN1FTKH?=
 =?us-ascii?Q?LoaAwJa6Aa6UeKH4SMdy2dAtQxxoIGdY94fcKjJYq5KHglqP1SrypjEFT265?=
 =?us-ascii?Q?sto9kiDK+RcPCoTnS4a+MT+rVBzBKIPfQvWvo0572fRDQmuVnOHrTEbhL8XZ?=
 =?us-ascii?Q?AQchsoBv9+b4/+rpYvPLbbUTGsOhWPpmsbAFuz5zCXDD/HPstDjXCOws2Ix4?=
 =?us-ascii?Q?A8n18/3nKp3BcSWK9wkUqhvp6mD5V/mQPJTvOAQ4qM4GDaDyvbKurtG1r3o8?=
 =?us-ascii?Q?mqsH/XDxgDZqD3Xbie2nhhsHDukhlYWqZoMmwrnlEYcS7vz/6fdG3qfnwbnx?=
 =?us-ascii?Q?eCh9YqD76lVaPdMXM5eRyIIVtDZo9mbM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LxB/1ik1cDSHM+fAbzIm29ewYGBxWCvOPcVONIEbKu3KLV0cClgHYtNeGOFp?=
 =?us-ascii?Q?CGxO0WliF6UvQo4mjREOvoEDOTqDeVtN7pT+t3UjUbWg2RGT8PekgnE1YTht?=
 =?us-ascii?Q?c98drg4c78HQf+HqAiY29RuI9CxNPRcn3EJ+SGrnCv/We3f6gwFqn53YiNNQ?=
 =?us-ascii?Q?Je7IOXwAwA7qhzKMx6DPqO070gRLrk7rdzLyfOtxaQ/B9sH/5ke5DqIogcO9?=
 =?us-ascii?Q?cBGpcAWcnBtEqYK5CJfKVRyaNUQ8sqDKkOZbs3A8e+f+KPiKRbag8/jjN0Vk?=
 =?us-ascii?Q?a7p8wZE4QyhKgFD1xTqG5d+PSUaYz4ZGIXJKMpowPsOEJY9tagdYOEq99Qr9?=
 =?us-ascii?Q?hld2CgWGZux3FNZUVQ5tktbDROdbRd+3VLtRyM0if8VKQk981+x5pQcI7eXJ?=
 =?us-ascii?Q?0sHwJiv2WeXRdofxgEivcl4y4AAeqQKJ/mJO+wMIWDTNZLG+s/X+bdAVs/VL?=
 =?us-ascii?Q?6p8eBWjRk4ACAR/AWHlDIT/aZAq8sz1vwuH3MtiVE3zdrDCKH56AbJXoAbxF?=
 =?us-ascii?Q?9sbcSmQCiqWi3yXqe6qLTYRXxTFZL+F7cvnkPkfCzeeB/XED8LIlGu3acwmB?=
 =?us-ascii?Q?pAoT+2LEy5q+G5iJJ7g690/Lu8WM6TnMT9lD0jwqd2feYeS9If0KY0TcxIC2?=
 =?us-ascii?Q?lZAeRLKaJzaxZB+uIcWjAVfdZcIjsSL+AdDEL4+RWumKUau3a3koqfpL15xs?=
 =?us-ascii?Q?10Kx/MMhPTJ2onthr+qgjst/xc75KEqcppD5DxitQfAOBEngpELaMwENslnY?=
 =?us-ascii?Q?nbKZsyeNhXD4B2Npntm+XgPxqzerRQFTAquPEW/jg8/JRa2+hQfAOptx6bAy?=
 =?us-ascii?Q?4RTgCha7TTNd7TlKCuVaU0881JT86zDwvown4byzA8ZFPX+djgDxFHkR7bpd?=
 =?us-ascii?Q?ngR3V3Ny7HdwuJf+ayEpeHpqkwRxRI6J6YADgvhYY0RF37w0DYTbSEjPYsdj?=
 =?us-ascii?Q?s1vpdofr2r1X32/zlCTbdtDyqCtK5y88VGZgI/4cD6f8vSxJDIC+R5FdSxsF?=
 =?us-ascii?Q?9+EcTMQSDOuPsovP4aIMetWkZsgqRGsMLxFCGU4g8tiUHIssWlP+t/Yy74bt?=
 =?us-ascii?Q?/5mcr6bi5v4JAt1d+uWzPEyxSb7FsI7J8brixsHq0fZaxThE40T+2GYc8Bty?=
 =?us-ascii?Q?IwjzYNiQ7AYdDC0EwQHJX+ZyOm9kDXPfvCrNIfMw4R9F0uwIGNjNnIKW4VOI?=
 =?us-ascii?Q?VPRPHAe59sL12wQvWp7TRi3gx5A+zADcx8v/yORlQUlK7ukSSl3gOQ7Jxr/4?=
 =?us-ascii?Q?CJg4qbsZeI1ZtjxTIGKkY7ADDKjdYQMZl9Ykghu+CUzoPLz1msdjR/xdiD1E?=
 =?us-ascii?Q?9cwAnhk1NQ6PiHoTXK4jUo9LrLz0FsxsgdcvTRPMGf06AVKkxMf3jxzJXkMH?=
 =?us-ascii?Q?4DYtvHrMnnkjEDJ0ZfOiMPStY/qtrYosgW5JpGHys2fngpkWKn5zoBuqyxgk?=
 =?us-ascii?Q?CcCoDisbDRjY0jrz7CV6oIBDCiLun6dRIopNJs9lcQCssg9v+Fp3+sSFcCBn?=
 =?us-ascii?Q?dbpCqnwZew1HSZ2wrNryDfV71GxYluSYMXDPARbhpl8ebjmSWZQkFOpqtLbu?=
 =?us-ascii?Q?cs9CNWjuYKfsIQ56pBc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84162fe3-4517-4f78-89c8-08de028fc5e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:16:05.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxUw7IkT9hD+DVbAJ3aHs+AcxnWd5OgF081XDgB36nRH+2INmQVAxkk9ig2WraGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8767

On Sun, Sep 28, 2025 at 06:02:25PM +0300, Leon Romanovsky wrote:
> @@ -273,13 +272,16 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>  	u32 bus_addr, ret;
>  	unsigned long iopte_protection;
>  
> +	if (attrs & DMA_ATTR_MMIO)
> +		goto bad_no_ctx;
> +
>  	iommu = dev->archdata.iommu;
>  	strbuf = dev->archdata.stc;
>  
>  	if (unlikely(direction == DMA_NONE))
>  		goto bad_no_ctx;
>  
> -	oaddr = (unsigned long)(page_address(page) + offset);
> +	oaddr = (unsigned long)(phys_to_virt(phys));
>  	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>= IO_PAGE_SHIFT;

This should be cleaned up some more:

	oaddr = (unsigned long)(page_address(page) + offset);
	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);

	base_paddr = __pa(oaddr & IO_PAGE_MASK);

Makes no sense to phys_to_virt() then __pa() on that result. Drop oaddr.

Then I would copy and paste the comment from mips about DMA_ATTR_MMIO
> @@ -367,13 +366,16 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
>  	dma_addr_t bus_addr, ret;
>  	long entry;
>  
> +	if (attrs & DMA_ATTR_MMIO)
> +		goto bad;
> +
>  	iommu = dev->archdata.iommu;
>  	atu = iommu->atu;
>  
>  	if (unlikely(direction == DMA_NONE))
>  		goto bad;
>  
> -	oaddr = (unsigned long)(page_address(page) + offset);
> +	oaddr = (unsigned long)(phys_to_virt(phys));
>  	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>  	npages >>= IO_PAGE_SHIFT;

Same remarks here

> +static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
> +		size_t len, enum dma_data_direction dir, unsigned long attrs)
>  {
> -	void *vaddr = page_address(page) + offset;
> +	void *vaddr = phys_to_virt(phys);
>  	struct iounit_struct *iounit = dev->archdata.iommu;
>  	unsigned long ret, flags;

iounit_get_area() does not seem to need vaddr:

        npages = ((vaddr & ~PAGE_MASK) + size + (PAGE_SIZE-1)) >> PAGE_SHIFT;

~PAGE_MASK is page_offset()

	iopte = MKIOPTE(__pa(vaddr & PAGE_MASK));

__pa(phys_to_virt(pa)) again:
  iopte = MKIOPTE(PAGE_ALIGN(pa));

	vaddr = IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + (vaddr & ~PAGE_MASK);

page_offset, then it replaces vaddr.

So I'd tidy this too.

> @@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
>	 * We expect unmapped highmem pages to be not in the cache.
>  	 * XXX Is this a good assumption?
>  	 * XXX What if someone else unmaps it here and races us?
>  	 */

At least ARM32 has code that seems to say these assumptions are not
always true.. Oh well.

Jason

