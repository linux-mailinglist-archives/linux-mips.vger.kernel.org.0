Return-Path: <linux-mips+bounces-11608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE6BB784E
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 18:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCB834E959E
	for <lists+linux-mips@lfdr.de>; Fri,  3 Oct 2025 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA53281371;
	Fri,  3 Oct 2025 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVpgAKEr"
X-Original-To: linux-mips@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2E130A73;
	Fri,  3 Oct 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508316; cv=fail; b=Wrl0B+hlbBxtnTiQPaN+9/yPI8OZtYCPO/vkln6d5rBAkVLrm/jgApuzVjFbcf/zkkel6wRXKc+YPk/fMSqE2FFyU4EKECQKifUtY2JXoE7DD6Nuw+In6EYa2FDnyfvH+LbHnNoZ/iwzLqORbq72LGZYhU+dbIS1qfh0IMagx90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508316; c=relaxed/simple;
	bh=MudxTZir2HOiiy7VWFZKsChXYY8N2VIp/969A/LOafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nWGOR/lXYVfvvcLESHc6OzG/ch2VT6yFdrsYdDMJrC3lyxPHwIWE4v98J9PdLreneP35s9E/VhvZ3tHPVPxKDFiJOTLGxQwflF0xBWD2p6vSB0JAuzsLWVTwP0wCgY4KXSawjpwtDSTMacFLKdtV1NpmsLuNnpQSVqN6JRb4pao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVpgAKEr; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZAxt1ZCmoaBU2MVKHMAe+JANSRjsCrK09Di8IeXmFwNw5uorYn4if2b1ZCp1Wz6RjM99z3oGAxsOl2LkfAOyffBAglZS+P1Fqy56vvNj+if7XtxiCc+vGjnJPt1RI8vPBQYpEX5LqifpRmjPhi3tD1npIVu43pLqpgB3OHwpw+YM6WtEi2Kk2p5yuPnN1pmkN5AaytJML/8B3H0c9DiFBTWCbZFi9/Y59LIEE9n1LFI1fR1SQf9FxLS1GN+P944EOrrcJEXdBHifMmLMWK9/gFB290akGNreF0C1IZzemRLGOhx3oNxzixC6N//2PtO57bRWajj644Q3URc1eji3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V49pYcr+0eeDSdeFjgDw9UEyVFhz0t2sXRuoEevw2I=;
 b=JxIJAcUeQdOvByLsMQyUn5Ta0P4YaSGR0JJhrUUG6EGM4MasGYtqHP8xhcCEyQLj6cFAb/C8rUtO/B6pGc3GcdApIzv8Vvc7L/lUg7oR2s2QFL3NKL0Uownqd6IlqAn9tN09AAIjc/IVflbBNe2fhetVZM3JSVnZAsxpFemeVezF0QjnL7u3cNWHTBnPbzk9RDyuXEkLIqtVhlcYzzhTD2qxnoZSn/oj8lDFoSodhO/G4Zl/kS+aTEKmFrV44SUSB7Az3Xyp3yNqUtXcoiAqqmxKqFGqjcJDZt0WE86GA3pvk1GlsmypJxdq4ZAgi3ToqtZniS+otW1wcN+Um6KwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V49pYcr+0eeDSdeFjgDw9UEyVFhz0t2sXRuoEevw2I=;
 b=bVpgAKErgW/ekPafD5ASNIo3c89Y1EQZD4JBqzZvDzqItk4olyp+kAmvSJA1cMN6nN3lw+S891iLx73ENunLZxiK4hV6uRuExfgwEdwWw2crXpltjyaiT0Jv19RZI0Q4oeZJmOOHdZ0S3UP+jO0lbZOuGolvh/XQ8Qm8usPWC79Xk6VDnZyov423g+UTfixdd8M7dgLJxioAy3SlqCA271a2OqpQVBVJxuj8Y2G377YV9UGlIueqEXpxVQredGDl8hMk9Spg50IMEHG1IMjh28uBjTslJPjXui5plGwMtPmE24RzVAlOtTfPK+WGUb/SpAY3Sj8sGY1lfTnjZYhKMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 16:18:28 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:18:28 +0000
Date: Fri, 3 Oct 2025 13:18:25 -0300
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
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20251003161825.GH3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BL1PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::33) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fe7add-e739-4cd4-94fa-08de02987c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HAa5uboeD1h6ARLZdwtCq9KRch2abHjXiw5asWTL4fhWGYHAm4C0BTqRq/O?=
 =?us-ascii?Q?dmtk0tB2KyqGE2l63Bf1irS8tAvd7JAONGy3x8jKh+XpIoIHTlNMTOMJpJTf?=
 =?us-ascii?Q?P18cschd/k74/bQqLgkfSsR/uqmhgxokX72ei7mbaj7ImypIqf0wvzYGT1Q6?=
 =?us-ascii?Q?fne8iZi9nWUUf2z7W+ecp6T/Llx3rWsGuwWX4ggTCpCuem1FqMAo4eWE4Moj?=
 =?us-ascii?Q?VddJzYxOz+oXc1VwCjrdjPIH01n90hxRhozWwYuR23i5TbtGCbX30FaumXCB?=
 =?us-ascii?Q?DYna2zeW98EgdY7uMK6CI1vxhzuO9f3PMWdqe2MvbYR4/5Vn8f3ldsBBFoxS?=
 =?us-ascii?Q?aAhDSiY6X1+H0j+Q8TlQM6KNfgeYBbeJB4Y09C7VQ5chRUlDPA3zlLVybnF3?=
 =?us-ascii?Q?CLjmr4spZSEuiQKDDzQbqDOOIAgVoh6f0yuKf5b3q475zkN1IAYnmBLWzhCg?=
 =?us-ascii?Q?WjnBwaqHqztih+129m4uifvk4daAhcbvDoUmQuKUN3tp83tSxWWA3Rs03pSv?=
 =?us-ascii?Q?WdDuEdtiB7LwZguIBr2tMHbPOQ94hkC6P5pbrn8RsHcXsX64VscByYt3i9Le?=
 =?us-ascii?Q?qEMjGuOxcKChDO4jeRwHJbJhetiVh1TWJeq03p5UdzXyXfDBeSRULFz4/Qp9?=
 =?us-ascii?Q?841h+wmQVejd5gNnSL/EYGc0UelHLTgHsFtvBakldWIQgjLh//bUfzW7c97W?=
 =?us-ascii?Q?UideQODf4OJv52ZBEne8IJgY4EhY8oPAOLma13QkczLzPKdUU8CUNZIqP/ov?=
 =?us-ascii?Q?JhWIAHkisSnr3pAm+Hp2/8ku10ueekdPlqZXxRdCiAMLDEFUU6+3PLE0xQcd?=
 =?us-ascii?Q?OWkMy2X8CLJ0O3xkKGmai7AOleY1LXHw/ObSc5dlf3koyBRkWDPSVFt1f3zC?=
 =?us-ascii?Q?z5UIjd84XikhBpavxdQexAO2sPD8otYE/LNJCqRpClURAoU2cPAHYLnYxroM?=
 =?us-ascii?Q?2l0pKWGFYmmF4RiE0v21zyh2evvtCIJGe9Dg5XZi/jWf3RGOH8Z/+tFJJYi2?=
 =?us-ascii?Q?w7J2+EJw+krm+1KLWqtYzUquw4gsHeA7vMG6QKg94zTlUN1EqbcSkd2ykYa4?=
 =?us-ascii?Q?NaS90dymt7sLrGFi9hnyMAxRt96LrBU/Sm6MGyJH1QKXBITIA2kFwc3cabd1?=
 =?us-ascii?Q?AC8XFT2IBmnJ4ufPvCoMdi77iiKMmqO8VUeIV1FY+jkbQPkJhuHIM2DjM9WJ?=
 =?us-ascii?Q?vPaPTfX0cAFMieY2mY1+VGKXK2J39+HTd8fcET/wkyrfkmQdzaMLNqjHkOjU?=
 =?us-ascii?Q?nIWi+ioLMKsiASDeFnLquC9qPwiZvnUtimGYuoRhbQY3Dv/IOP8QX3f6Tu+w?=
 =?us-ascii?Q?gN8IGXlG+V2qT9LCHEwIHdpQ0Qkr3NDo71/LG4J3hiJQhDVHtfsatxXJrvYj?=
 =?us-ascii?Q?/eyJj2z7+h0z5om6lwDXeG6Z2ETBco+YTBrvEiHq2qtFALgwnD+wKUaaQYql?=
 =?us-ascii?Q?Mv6JxRFw3K0l+Ck/M1ZYFF6mISsuAky3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJqu5HQWfVC576vdptBhQXSrPx14A7GicND2ojHAr9VkoWgx6aO9YKPabKXu?=
 =?us-ascii?Q?1XBQo8J7HGUPKPahD55FQQZG1JeiLZ6Vfwn/akyM8KF2DP1I+ho/EDYflZaz?=
 =?us-ascii?Q?GTng2DrKMn83xenHUnKDfS6LGzYqDwATpnblcigs1DEFk+dr4zbCgH5C+4Yl?=
 =?us-ascii?Q?iIWCBbtaDiQV7aO07dJiLEMLABl59SZFZlch56dq/9YNYZuCuGX2uJYyygf9?=
 =?us-ascii?Q?ikJg4lIgWvpeO/g9N9shdoD8XRql7fX85Uc3h0RsA1iNsPvvXIH9SqICuQu2?=
 =?us-ascii?Q?kcShlpCHhSDNQg5SWMb/PMKiAp6tbzO/skw+mveU6L8CIHbkYSEEH3c9TrNT?=
 =?us-ascii?Q?MWwShe332HFl00f1tK90tNUCl1vEGGBjXMVzE3VdJS7VHLYUSCEZNg+eVZ3O?=
 =?us-ascii?Q?pyVcqWnXxJG0cjGIdBRgkTO/p4DT7bFCf0obVQ5BbScSDs170C+TQY8aTAQC?=
 =?us-ascii?Q?xKm4UXedGymG8XOD1W1HdWa1Wsp+gL++/DdBT6yvR7L/N1BLmsXcpcZcOOwM?=
 =?us-ascii?Q?A82Zt+yMu/Up4GDw3eQ0vzhY/rqRkCvlYmoO616eGAQ7AE8CR7wBzClI4Rda?=
 =?us-ascii?Q?G+SnBcB+4DT6uujPboWDt3p+d1r7APKQxzWeKhJnhOhsiHRaG1Z6Hv63N1Wy?=
 =?us-ascii?Q?QOVqA8GvvQu/uxlm6Lz3NFFAGYr2j8LSw/b3j/I5PM8vXIhBDODKQDBUanaL?=
 =?us-ascii?Q?jic+jOUwcC4yAG6VfnKuLxRACpony5gMh7nTWm0xNkcn8BYMRiFxbGZI1+B+?=
 =?us-ascii?Q?+epFdz9h666xRcYSlhyOhYJb8ANg8AsNkbGiK//r/EaVnsPsKoQo0DwPF1ET?=
 =?us-ascii?Q?gUskWv/BtGlh92sp2hmq6JKoyCPp80iwvtAgFYcYld3zUvKEaDpgjw9ulEbg?=
 =?us-ascii?Q?s7BsdB/vkNhTHC+4sTWJaTroR01Ayh+IBtKZ3gAD1mpH664k6+3vq/eXPL1J?=
 =?us-ascii?Q?0qQxxKLLaksBSNyj970aVMqJ3Op4iPbf0sfxeeY0aN9KS1VwdiVTw555M4gB?=
 =?us-ascii?Q?KUUwxc/RZIe/5Gs7xnkHcY26PkCsIndKKCS+OFrFzqXPA7W60E/a8bQduBUw?=
 =?us-ascii?Q?DGMXPFMUkH90OvPo3tqHlFhIwl+lJhwYTnx/uaN8U2WGzkk7fxfohA4sD+Jq?=
 =?us-ascii?Q?5lhWH39Fou9Cd7Hsb3gMDgBnR8Co3n6U8WxD6cGRxjBnGgCMqNXR7Fk6An8C?=
 =?us-ascii?Q?FLuuLY6nz84JG8UoHLC++BM//3Ssz6Q1wAshNVXvx57XfzqEV1yG6TvHD2Hx?=
 =?us-ascii?Q?7KzTLpe+nlZ4wxYKhfBUaaiKs95yUYwQfLU5u4qeiAbTdrpCXwQfGcXn25JD?=
 =?us-ascii?Q?OZZtRrpgx8r4smqSBVcAZXaCUFE0CfUDWe7+2cEh0unZzcggQHvYklnLJiMF?=
 =?us-ascii?Q?/reTOfEjSYOT1KfqwDQwLkCAsNi7CyfJ0fRRMVLNbieVijVmJ25YGTniHvho?=
 =?us-ascii?Q?Qsn+tPFr7dW1aAUYMM8CpeZh+hnsYA2zqdo8snWiobGyvFefrU+yNBDsqXsf?=
 =?us-ascii?Q?+aaXM9JoVHxDYJ1ZBC8ZRmLsEEVedEmbP5vaLqGMN6rF0JDiVMFPJM5dr0lZ?=
 =?us-ascii?Q?dH24wRIoU7PkZZjJZoI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe7add-e739-4cd4-94fa-08de02987c81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:18:28.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JtzAxDmQJNnADOiQAKtwe+/YqCcJjOti1yS0z8wf0TWQHhO0Uypjly9OUjPMTlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280

On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After conversion of arch code to use physical address mapping,
> there are no users of .map_page() and .unmap_page() callbacks,
> so let's remove them.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  7 -------
>  kernel/dma/mapping.c        | 12 ------------
>  kernel/dma/ops_helpers.c    |  8 +-------
>  3 files changed, 1 insertion(+), 26 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

