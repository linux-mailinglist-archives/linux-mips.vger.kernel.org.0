Return-Path: <linux-mips+bounces-11613-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F328BB7B90
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 19:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7E63AEB99
	for <lists+linux-mips@lfdr.de>; Fri,  3 Oct 2025 17:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF9F2DA76C;
	Fri,  3 Oct 2025 17:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d6fYFnYk"
X-Original-To: linux-mips@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C52DA75F;
	Fri,  3 Oct 2025 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512390; cv=fail; b=Tj5FP874ZrmR+g4dVMLG2rPyG/WhIW7Eb3CU++OxlpWjZ7s6CcVDiEB25u9rMI7NW/uU2mjTbrDkQ4oK5b4/n1rcTu1BrKcTKTpP7Z9pyRQBzIKijUv73FEf22eK0AbSSPaBnHEZS6rPSFcKb6CugnFk6hfTT/VDldzg4eRYp0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512390; c=relaxed/simple;
	bh=+B3ErC/QAG4lOIVB3LnZTmRMEQLKgPlCQayvTiHyR+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gFTg23Df248VWbO7cEaV9XSuok+AUTNRNgXstQ5CWcyHyzIK87SKtQkTGTkHpSZ3D9mV7DiaQ/uwIkTkOzWmGjSINRhKObhnGMrfrEqXI0twhcca0Ml0F73s9rPzgw+9clwBeARhBJBuA2ftZQfXVrWNXcNfzUSww0c3zjO6vuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d6fYFnYk; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfoEPWXDKBqrcU1OrS31SsHJ4QKpd0NgJ3BI82+J/CMK+o2d/L6RzBETJYbO1AReRaQWc1h4PqZAEPJ9BhZ9/bO2mlsDVza4iFe7TXEffZf9q5Ikk814qCREqOdKQ8Qu0CNW0OHdRrrczhMVsbdAPLQ7YfLG62pSRhu4kfVgBO3BZvSJEXQuJOqMS8guq1TRDRRP25Y/PeXoneOdHz9BayujIGxMpQlX46D/zJccAPUVX1B1wCnB9WmvdrMAmnfYJF5ssmDF9LSKoVKt4qQHSEDa/o8FxUnCipm5HUqq2DFtOkh5fiGpVNP2VsHlVgRcM/j7nhFm8qSiywy8SmrTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXhNRclvRQqPu5YaGU3lFoOJYwK/H8OlfrcScOqzFuc=;
 b=pytpJSNmrQuoXQ/HnCn4GNXqaxbW2OACqcmIHpFhgNpetqWi8Q6aU9IHxwifhkYjh7TzU5hUBxFuW4yjHu8UCvD75FgigpCbi3QSntRb6Voikyhf4OIcphEOgLhBYo7gG6Lj0GcRBKEQHxdQMb6Hjh8anNooPwrIXptaDw5fzPG6uGdu05sNVnshe/kJuart7piOuwHuyG3AdD7aq1cY7GbFBb3Sv4EMt6Mr8xhy1hfxliEnINboHAc2mJcfdUkmqlhTwYXa0vwRr3urSskhgRWC4GlgnqODUBYRrWZ2HbFaCmitvUYIFStlAS7TjqHOgzplsidXQI0crnDIeM4QDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXhNRclvRQqPu5YaGU3lFoOJYwK/H8OlfrcScOqzFuc=;
 b=d6fYFnYkuQCa5NhIMmrEQotVdpxWdvkBqKjkKkjsktg/xrnc1yT8NLxhjtBJwRKGWnzXaNYnBmA/Inoc351yUM2/1h8uXdfInkqQTOCs0ij7T6y51q6cW3p29BxwgzV0doBw+fRe01j01/UWMLcmwsTdEPh8bmySwMViZM4o4y+PXlkpvNMf7vwkSpnVlM3Es67Za5NT2O59CqqLYREk4D0P4FaS6nNxsFX2noQBR0j9J84nEMbYLPk4Hx1KV/rsfBK137C3manZUG2RfOXF+fze/d44dBUzq5wlnleoxSZil5GOD4Ysrpp9x/Di7z7Y8tmJY9jLnLjkp8lqsH20oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 17:26:20 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 17:26:20 +0000
Date: Fri, 3 Oct 2025 14:26:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: John David Anglin <dave.anglin@bell.net>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Message-ID: <20251003172618.GJ3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
 <610b10bc-1aa2-4fad-a40b-be5fcfa04430@bell.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <610b10bc-1aa2-4fad-a40b-be5fcfa04430@bell.net>
X-ClientProxiedBy: BN0PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:408:142::10) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN0PR12MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f9b3a2-7185-4f61-5b16-08de02a1f777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M2WfAeViLK2Z2ZzVogh73RpdmLuIpUZq8Lga3fUgqNqD/2YFt13ug1cjDwY9?=
 =?us-ascii?Q?Ig3RcprHptmK9jbxrEkFksxaHhitCa3xhMrIicHiEwbi2t6Fz5NRI6OpvG61?=
 =?us-ascii?Q?2zb2/sp8Y9hJfKZpANJtkk3pD7FF4jg7IFHJ3yopMCluyxbrCM2imig0gSm3?=
 =?us-ascii?Q?tMY6raoXFnwbPcPMX/W4SGLPLV3VqdjvjqFT3GhHj9GhqC6Qb0oUvxag3n2x?=
 =?us-ascii?Q?6cI9ZXMdlJqd6sV0jJJd9AGdI4ulPOOLy/HU3dO5v8paoGMlJqX6w39gGRdw?=
 =?us-ascii?Q?A1yr3EgIrGlon4bS3KTjK12zeir0wRIpHZ0az/asK9Z+QnmRlSIeZ+3alsRl?=
 =?us-ascii?Q?oAhzBOUl8APhTgfGq708Ni/wzlI1mw/ziqqWDXyuO+laSeMGTE/XCLbKk6rl?=
 =?us-ascii?Q?vOc5/h1PNJTMaOW1a4hKt6CsjFUqrG2qA618X5vspe+np6OukzpMadWYv6Xi?=
 =?us-ascii?Q?whT1L+sfKsdGy3af8acp0dLwKIgYWOkmAeeZGemSxc3GZ0TS5lW0TSdIf0FD?=
 =?us-ascii?Q?FRnbVM9gZDc0BlMIgwc4PF4dkk5UcT8itjioVk0D4aUwYEwWFq0Q86an8PPf?=
 =?us-ascii?Q?fJAkMYRup5vEM2dMAUkTYR6E3ty31lCFFqzpr+gQSlOxdQdETNCuGwMkqCkg?=
 =?us-ascii?Q?U2wi/SCrOIYuEELkG5rGfagEJ/LRg3XRYq0VTFb68iMPMIka5im7ATj7SW10?=
 =?us-ascii?Q?4d31aR9jMUTUNrX84gW+QUS06VbTWY4vUZDFj9+qEDynIpE/4XCshZQ+tM4y?=
 =?us-ascii?Q?qpKN1IM2K37vlBp5gM5y5uOzHGkgHAsdeXytX5w9/hdEWEJDCkJwYY1birNQ?=
 =?us-ascii?Q?+wk9sAxJbYazNDa2g4bOIVG+xq+BCE+9KXZcN/OkqMi2GCcVbLido6qOMtAS?=
 =?us-ascii?Q?KKB70nw2DlCXOweFS0zrELlWnF2ZCtG31uDZc5n8jmYwG/A11/dVMyBpTUHD?=
 =?us-ascii?Q?lVqGfx/GfSB6TwRZVIkbtI0HGX5xh2G3VzmWujVjnQgSLDua3Hn4ly1BshWI?=
 =?us-ascii?Q?zCX32FyV1gQshOB/5N5mw5fJMnOIs+2THryDMqyCW8T9PilJqxsMQKjGauY0?=
 =?us-ascii?Q?LhTg+TgR1G53qxLd+AH+f1uzQoiQzjH+wpgi9VyWmWeJmfWJi2l5sKHKmU6g?=
 =?us-ascii?Q?EGNd+T+FyZaxRVyqYtYpm4+B3TmzUU8JYhAqWW+M8u6xliumGUDk6ypoTHw+?=
 =?us-ascii?Q?jjMDIsyQ7gEDum2428jLjCspdHcnxVKyBHPzT5Elpn5dH5IS1fhJY3LnhuYU?=
 =?us-ascii?Q?GDo8GtZB2PUDLDpgSQZNR1okrqrQSRp4IYXBMaPnEu8JJx+ot9DCNrh/81GN?=
 =?us-ascii?Q?J1Ap828Nzj3s9vIApjfH/NsAnuNcm/MCWF0LZzYi+xYm9E3JtJUJ6xWl7qNO?=
 =?us-ascii?Q?tbh/LvMHtikqO9synBpuyXizDWQAYLX0Op1G9q4iag7pxtW7ag9I52RchtD4?=
 =?us-ascii?Q?SqyLzGGwqx48J8c2as3BATG5Gqb2E/ia?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b2dRSWhXbxmXtT3sE2RMrQ67aLgQ2V7Flmt2lnt2xlF7nYDGIztwj3pS2uwd?=
 =?us-ascii?Q?n+IdGapB3O9UIiMQoPMNh6IsKYHCcZJkLY9xQZ2vWY9lFGHenkO2DBhU3N6J?=
 =?us-ascii?Q?3xKY2m84lRs19NYOk1XwBBEpQa2yslOb7KS2QaWxIRPyROCfzMwHPy69KJKV?=
 =?us-ascii?Q?BFF9EPR3++FXYmkvwoef2VCwXurc1CD8pRoWG2eGT/xdbHdCleihs+7897rY?=
 =?us-ascii?Q?UpLlBNjvUmF1eSfo54Cfxg3R6LD8MZWLlDlkBrCAAyukT3BRTsA0SRAGpK3p?=
 =?us-ascii?Q?Bp59mj6gjHzhuypvp0OrViKhY3n7/MpZUv2bGEu4J+aoQqHFoxJ83ce8pOT8?=
 =?us-ascii?Q?JcHnmOWlPs46u4tC4S6398hy+Z3WpA7MmjhGPCIpj+CObtQVGR1QhiW8rev5?=
 =?us-ascii?Q?m2YZzwpmfX26DMmNvVkOtdlYOzvH1AH9XDK0Hq2jTTX5AgyE8mBk5QZtYpmM?=
 =?us-ascii?Q?R24hixLtHwIoFy7i2Bnk72wUJfw8R+3UN81wnJjKAhBsvd15axwpv0CU1sxn?=
 =?us-ascii?Q?4zuWndJnlpZ4D9Pamflaj07NFS5mJTvW0RuFUT6eGoBnKk868wBzBsV8WS/Y?=
 =?us-ascii?Q?HbsK9l45plYcmvB262RVCdY51/glC2AAPyyebxH7j0qMMPZd08G8Mj2bhlYC?=
 =?us-ascii?Q?MK1JYB+viCh3E2zw4ExjRYn0U7BiINNFlwQDxXcTSG1WPgmTQNkl/8W92JMP?=
 =?us-ascii?Q?GsqYBPRN0Tk+NMKhDT1oCyB1l7GVV3it1b1zjWKZXNB19+B14A7resFI7n45?=
 =?us-ascii?Q?UxRno5xPzuUdgKLsrFfJNYyCyWJ4x/hC3IFxGvSBRDRCSR7gs0ubFj1rC+L9?=
 =?us-ascii?Q?q4kRWkmFD/vu/KhHNtrqULg9R96Y6cUYrBwF+ALXHd5Ju7aXW597It9vVKLW?=
 =?us-ascii?Q?OmFPn4E6Oclf+B0pmSeiKKCIuDfhsUlAt9AI7E573B6tBCUbdc/6fLr2rdI6?=
 =?us-ascii?Q?QwXWvOAOyh/x2eWZlycfF4sI3/2EjkEH7PM8stdkClNAQJ7w5UZif9hQQvSI?=
 =?us-ascii?Q?0aG1xck/nZ8SK0nvxkYGV18SC4MhMO/fx7OSpPbSZU5hJ8dzf42VKpBsW1ko?=
 =?us-ascii?Q?Hd2DGVH+Id5MV2x3OUFuLteRhvJpnJ5RoHIrXX7AadTB92BSeUwKRxD8vWOo?=
 =?us-ascii?Q?526CO+pAwdZXiKuf0+p166bkDVVA6pGBDOuBaVMy7Oq254E8I+EmFuUEgkT4?=
 =?us-ascii?Q?lnYRmakGc7nhByRNoxWPbPQ3903cj3yaZHU/YmrhWMpzU1bxviqqjwbigWvY?=
 =?us-ascii?Q?o9Lcx0L37MWjqshxuKdEPJXbp3kZp//5QtWhQklEK/ZcHzDNcMkEr945NiDf?=
 =?us-ascii?Q?wSvi0B0pICipxRbP7Hgf5oSsFnkZ7VAdgEkehZ9Vrny6i7NIpzzZgHUcoPBE?=
 =?us-ascii?Q?u59mrMT/zcYkE/T4cdL4hSqPdgeVLGJTEySRMF3OFKasyYh6Qzm6sx9PrFBI?=
 =?us-ascii?Q?snHORk1rGeKHm641Npj5XwUduR6t4sqNUe/YOQpz72qNfvYhkx7OL/ZWUluk?=
 =?us-ascii?Q?w/Ty1/+exY3HZiGuKEvVjBW0nKqBXCVfAgjunj3M8WsQJw6eQh8AyQt+fRZO?=
 =?us-ascii?Q?fRx73xbZvrOMSuHqXbk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f9b3a2-7185-4f61-5b16-08de02a1f777
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 17:26:19.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INI0kVWRWJoAj8g5ME8XCvKknEdjhjicXmAR32iWuNcBMkcBLPfGdUOAsp8SrNgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5953

On Fri, Oct 03, 2025 at 01:18:32PM -0400, John David Anglin wrote:
> On 2025-10-03 11:01 a.m., Jason Gunthorpe wrote:
> > This doesn't actually use the virt at all:
> > 
> > 	offset = ((unsigned long) addr) & ~IOVP_MASK;
> > 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
> > 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
> > 
> > And ccio_io_pdir_entry():
> > 	pa = lpa(vba);
> > 
> > Is a special instruction that uses virt but AI tells me that special
> > LPA instruction is returning phys. Not sure if that is a different
> > value than virt_to_phys()..
> 
> ccio_io_pdir_entry currently only supports KERNEL_SPACE.  For KERNEL_SPACE, lpa() and
> virt_to_phys() are equivalent if page is mapped.  lpa() returns 0 if a non-access data
> TLB fault occurs (i.e., page isn't mapped).  Not sure if that
> matters.

After unfolding everything the expression is

  lpa(phys_to_virt(pa))

So if that is always equal to pa then lets just drop it.

phys_to_virt() always returns something kernel mapped, and it can't be
unmapped.

Jason

