Return-Path: <linux-mips+bounces-11623-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393CBBCDF4
	for <lists+linux-mips@lfdr.de>; Mon, 06 Oct 2025 01:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFFED4E70BF
	for <lists+linux-mips@lfdr.de>; Sun,  5 Oct 2025 23:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5241DE4CA;
	Sun,  5 Oct 2025 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LHPrPKOV"
X-Original-To: linux-mips@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEF18B0A;
	Sun,  5 Oct 2025 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759707104; cv=fail; b=bR/lH5c5hA1oO/IFWjPcIhUzyWJsM7A0XU7PydckP+09RmY2uEREB7JVMsnSnm1Aq65IAzFNkzHk+Xt6RVc86mQfNb2c9ZYouqH0/PfzA1NXQpNkXvoECKKtk6bQtSj7LU9wp4JfROB3NIirXlW0JxqEoWllrjr0wkgZw4OhHFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759707104; c=relaxed/simple;
	bh=ruzZdGxk783b9Z7XRPcIzN0Cnzl9nRcMb3m47IquyVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ph32TCA8d3KA6jZVx++6szQSNELNoNPLSosGEO94Ax3m8bAzVqC/vcGpmBE+GpSluTQae9/3Mcvqs1gP6hBRjHPfvgQZCMEE6RfD2WNkDkoCFoqsmstetDWG+PWIezC1ycKhwYDy0z4roIS2KBD2RglEsjf/j70Cx+OO66c6yJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LHPrPKOV; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btyAggyeWvns5xtWH/OLtTgUi1ZJ5fOxc/5KIU5v0oxBdgtCBLYmkr2/OlFujkBellNdY8UxzcIeTdksK5MPCpyXG/Xa66EzE+hOOb+RYeKnDBSemOJPaubij+RvvWVfp1BcNJzRrIv0BvQoEGb9mN+NEnWDalWbJWm01QQvQ0IJbdcHwcbY1xJgjJAzzxiUn9QAyMDiy6MBegzro1+HCGKb54hzxdr35GyZI5DOfjOOeFdDQ+G6+IMLo5smgsOI4e1DjUvete/FuN5FW51/NuiS8SOz/xLb957ZqcutQHtqzKCqHgEs3H8iX1hMhrSp1PZZiiwisCBiewrPyjyLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3VfeQCUMUsmMpFfPOO4y2t7ySTZjeGBUMDQ/ZIED6Q=;
 b=UhxCXNLWQoRq/7sszZhKicDoYJR+m8EhWMDZUJsD+mYuYEhpAwN5SfUZdAi2uGBSSw0Pt/F2XN221/BLOhpjc2Oivmdk4M3KtyEbaYYHz5uiSrQsO+x1sCB1FVxt0YEKwdt8gMnqBJ7Hlz8MsYbtKqwgu0LBGD+udNb1Pi3jt2zkJ1+DPfdkEu7P6I1SXxregyWxg2eYAGLugmUEqKnxL9OpPyawIAaEO1A8FlrByhWaj8w/5tBenSiNI1vVEu+yeQEX6i6gJO9aiYx8Lh38ye2eM6I07UAjOJ9YUej6Z/e102dnI0WGGjLOxVE4uNcF0KahPhTxryElAOvM2dk/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3VfeQCUMUsmMpFfPOO4y2t7ySTZjeGBUMDQ/ZIED6Q=;
 b=LHPrPKOVugldV3CsBIIowMzOUt/IuOo4D5Hy4V+TzivSl9hYyNheHEcyaTd31TsQJF46HcJvhLQydcUtAea8d10NDIQY42TyAgX2s0ib9j/AIAyCrw4wDSs2ICW/rAhoFTIHvd3Cyn3+FtyazGd0kkHPmnI5qRReIsgLHt7seiRDWvoVtFdJFnLyG0td1voZow7sotmXmAXV3ANcCMKkjOJTygTLt6vye9r8bcyPBbNXe4uO4FX8Twe7ATdB9HixyNysVAsTuSdNbdaRLE0bmMDUBhaKGQaymKBlAJxLVfbCAWx+RGMKoVy1LW5MDeBMZTcluFFVIG6NOJfbXrdwig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Sun, 5 Oct
 2025 23:31:35 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 23:31:34 +0000
Date: Sun, 5 Oct 2025 20:31:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <20251005233133.GL3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
 <20251005132259.GA21221@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005132259.GA21221@unreal>
X-ClientProxiedBy: BN9PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:408:fd::25) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: af03c48f-c699-47b9-ada5-08de04675295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+kHDCf2iitGPITE6yErE4/xfQVQOWnpyGjRHbIrpSBfWSlVQsiL3UIr6ae5O?=
 =?us-ascii?Q?4d9wWPmVeIndJ9TmEZD8gOsC6CwJ9Kr2V98w+WUMbjFF+/kH3VkvVF2yeBxE?=
 =?us-ascii?Q?GoBNao3y26MMjvG5cMlTT6FtDhm9NZnTXDPjij0BHkhjygNJd56jEAvE3Y8d?=
 =?us-ascii?Q?zS8spchMBEFgAb3cMwqfau1CGlN7DxjrbczDvuoxiE9GanpHm8N3H8nAcZdV?=
 =?us-ascii?Q?l7sG4F6AoCw4syE24IrKu/1LImTCFvV4+UvQKmIqOfmlBQbZYsGYW6/mvm15?=
 =?us-ascii?Q?Vz7UwvWnx1pU/HUh6yzpJ0M3IGPz2mYZ99dyu23hzq2vldWv/MJx022Ja527?=
 =?us-ascii?Q?VtHqKi8Od7YKo2oeO92JddJ/fQkBEf440Mm3Q76YiYvzPgWBLsCHdGBYfbRq?=
 =?us-ascii?Q?guMpoiuAuXFsXfKfLPKKBEiINx1nT6eKEODVE4V7JJWgVytl2X6gX4dZFpmM?=
 =?us-ascii?Q?TrAq75GOo9Jp3tNpDGW+wGQ60rAaHbF28MiAZGzrfcnAbHQYdxPecl1E79aa?=
 =?us-ascii?Q?BMsnMYP+cJwVETXYs8IIX3L+gauWjq6bqghWwBAYox31LE2CbhVikzVovBOd?=
 =?us-ascii?Q?EwHwwF5mHkK+RJPBp0t4uSOV0s9EwJJf8nXJcEkKA1LWHcgqxanvrKqBeyu9?=
 =?us-ascii?Q?69GCg9puOCO8qOfTNBzFtBkKZz98APggL7KnOgpdFYYcYqJCwSWg3421XTTQ?=
 =?us-ascii?Q?2LZAKBZXvNalfJ6+HZoJ4XwBK/sFqGdIT1qHiLiFHHAYfH8pBLEeuOSvL32E?=
 =?us-ascii?Q?drnEdyagYVc6d+ZytFvf0+9N/X6dQOPw9ey7dkByAT4KxEUQ6OdU/sfTFo5h?=
 =?us-ascii?Q?ycuXm46OXSLyp3bRKBFhTdJbQjLdD/sFKp/EOtafIH4g2arEXBczireY8WfR?=
 =?us-ascii?Q?WuK32402eL5xnBFnpBslcYuubsWF+V6t0uzuCqf21HyrXZJ8iDzPJ5jebl7q?=
 =?us-ascii?Q?gRLKaVcXEHjaAkGmhANBRFIqcrFs48/9pCUDiINPb0WloravAX/5XN/YjL/h?=
 =?us-ascii?Q?y+omkkzKGU7Qsw405Q+H7nN8QWkwkeeLHcsA8NPCQyjRphgDiK124JmeU552?=
 =?us-ascii?Q?AHeVVryzFcjIdYlmW8h2jo4JFGAd47gh6wtmAKelC/ifsnhRq9kuYIUzKsDz?=
 =?us-ascii?Q?BXyBEmFrk4z/JSpHYAdbWC7FuR5rfDwAmseg67hbiL0YRyP4YRQcdg7ihUl9?=
 =?us-ascii?Q?qjc5LTOkcmiLX/SAb5kwH4Su1GpYqQt3jesKzRsCxwpV5uriaECzg3C9rQ1S?=
 =?us-ascii?Q?Xuo8l5mHvVF9TUEMPVFozuzIoVLLLVfGK94+i818rLOIFCDZc8aDPxvl1Xrx?=
 =?us-ascii?Q?bfD6vTxyhlewQbpB0XEzQgRSSLCmwDeXeTeyH4Fj5tFz5O4rQpyb0bPXH9c6?=
 =?us-ascii?Q?ey03Yjh1Fp0vy8GNKlSDST9iZJgECGG5dL1gIR7y/s4mcOLEDO8Nt1XIk7Xe?=
 =?us-ascii?Q?5lEa9/dRwinMoHHmPCQNJMdcbCj4ETte?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F/GHjGCqffUgrE0EKTIMZKLnIBeyxCoqQT5UV/dC5RuJMYLNh//aG1+OACBj?=
 =?us-ascii?Q?056G56v2i+lu8kpP1pesRt4a9xrXy87X15lpaPrslDMczPuuO5qXmBrv1R8U?=
 =?us-ascii?Q?RMSXjOfA4P6K8gthADq7sBaq62heSM0lqO9J5nm1Yu8rSvNndlqymW5QzBGf?=
 =?us-ascii?Q?DLi6RQfTEyEZAn5Ag4pOPelufdEV/gEgI7Hi+d91s1nVtJxY0QKe02qNOJhE?=
 =?us-ascii?Q?Us2EUsQGitH5zLDS7U8t3jKnXOvs7G7WhcYPw0N0b9k2R7l2J55yvJQdU7GB?=
 =?us-ascii?Q?+p/uE2g6fc9F6wEU9iQuK2yB63QWywOhWtAQpnhoydWO08SFBYmnaG/lhXpq?=
 =?us-ascii?Q?OI/jFUpAbft1A3TyQye8VcY9B0PvyIPQpAMTZx2zxd4XvAneuAeVohlKtB0+?=
 =?us-ascii?Q?8Ob3DOko6kMYL9NkuFYRrNVEpzRghTFjG7/jO42TjgeFk5mokKTwaiVNxOxg?=
 =?us-ascii?Q?DrjM1du/WcCpCmlhc2vNq64xbs3xJfTBu52PF3wg5bg4vhv879PbnCutw9DZ?=
 =?us-ascii?Q?Ib3ivKwgWkj/h5QJh7OSBQpZva05WwrnvBsfDUIGpKqG+eFDd5J4RD1Qzo8R?=
 =?us-ascii?Q?1sCz7yCRaKqQjPy2h9uwuU/KaxuwNf47djmPf5VZglAob9qrOBzUwAsoFX+u?=
 =?us-ascii?Q?6YIuLBpak6q/pz6fAD+HWkbUyjTd3La9XL4ld7dz0CdepdU64vQUNVv2TkvQ?=
 =?us-ascii?Q?/Yt63aZ86rvyIibDKyngGMGZEEZ8EDnv7mL6X8FxEi5Cv049WtlY8MmipAUE?=
 =?us-ascii?Q?zbH0HroeikAIbUVvw5A2WaiWGJXiWTSIyL1bxdDALHKo77ltwxJpt1pi0QdK?=
 =?us-ascii?Q?s5SRP1UApS1UNhcUSx+fpV9kgJBuQt/YLtiMk7yScUXX5DMB0wVdzwqnYgPz?=
 =?us-ascii?Q?RpqYd/faDpEJ46+0cunSZOGRgw/DAt0/gAT+TcG8lFV50lqNTC01j8VR2YvF?=
 =?us-ascii?Q?WX8Vdn/pdXDN6ADzHnRZQYVUTehOBWbB1f/hJBSsXYJepJrUbixYjIMdyDYi?=
 =?us-ascii?Q?cdd9pGcuuLvYVpD69yu+XF58gjk2k3xGigz9i3o8scvz0BAuVu8JpaIRcguB?=
 =?us-ascii?Q?bQ+GUtjhnV2ku93Dtzzo4O0BxTFYZLwAaRtxD0AeNhymQ8PGosRAQr6dgeoW?=
 =?us-ascii?Q?8CVkQUDOH07nHuM0l8uE2tczG+eSsJooc6s+mIWCfVYPd65vBfDlN4zCQ2K4?=
 =?us-ascii?Q?HN6M/GFO4KiE8FDzu+qM56DuDcZIiqxpPeewGenLXf5J7vXAozASwzCwwk7o?=
 =?us-ascii?Q?Tg6MafOiTVinU7n56QYwb/x6NWdgP1p4+J303ZMu2pTjkkSaY4LUAp/YXPWl?=
 =?us-ascii?Q?JHTvqU/mu3E0bGYQ2VQCm0bNKGtDpN0E4ieVv6zUfacl58B9Hk2/z2Genjo8?=
 =?us-ascii?Q?QuE95BZF7YOtpZff2g+st3e3olAhujOIXEca3ASD3QKH3JQDdQixYsZr3cUw?=
 =?us-ascii?Q?dCvgYuKNUBoYR2d1iYb0Mr3sjLF0QybY4No9JN+TPFdVP/hPpY2dQlP1wI6I?=
 =?us-ascii?Q?+CtJCEkp4CkGMXtKsMbLXOOxGu/IjEQYs8G8T8i/Kz3f1k1cutXF3+Et/NAN?=
 =?us-ascii?Q?m0Aw+s0+LOdH43TQlTE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af03c48f-c699-47b9-ada5-08de04675295
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 23:31:34.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mi6mlMyoDyIEp8h5YorBbJ89sb8bIsaYMbnBLXKRmFw1RzU3ebao7AFERFt6Fvch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190

On Sun, Oct 05, 2025 at 04:22:59PM +0300, Leon Romanovsky wrote:
> @@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
>         ** Grab virtual index [0:11]
>         ** Deposit virt_idx bits into I/O PDIR word
>         */
> -       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
> +       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));

Don't know how I missed this, but this is the virtual address for the
cache invalidate James mentioned

So the optimal is to drop the lpa() and to use phys_to_virt() to get
vba for this instruction.

Jason

