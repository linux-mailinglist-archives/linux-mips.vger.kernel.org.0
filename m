Return-Path: <linux-mips+bounces-73-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA267EC631
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 15:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BFDE1C20443
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 14:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED7B171B6;
	Wed, 15 Nov 2023 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJWPUdGx"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FF3EA93
	for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 14:47:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F29A2
	for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 06:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700059632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=bJWPUdGxP+MzSmDf/bB28c3afDoz9TbM51ZV4MLWFr5JSYfS6IzazqaCjq9GkIlpFFTwaC
	QaHyF2yC3G/x9IWzMm1ehLT7vOYvHyNjeEaB5TWcmMexGAYsDK67TNrN7/nWqoZiJOzedh
	e9Tv0iUsxsa5xa+vSz6HWaPt9q3HcAA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-HI4dDACFOkyhe35MkuUE9Q-1; Wed, 15 Nov 2023 09:43:13 -0500
X-MC-Unique: HI4dDACFOkyhe35MkuUE9Q-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66da680f422so81189376d6.3
        for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 06:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059381; x=1700664181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=LiyMy437Taos3P5ZysNIaJCI8vbI6uiNEVXikuBVRzgDW0GIj38njJuiBtxm72RiYa
         FfVXJ5M4vDrVHoGdwtednDdW1Q8Kh6JXX8NklGaZuDDUPQx+TF47EnZOhwnyJ8OkGSUF
         jWfYsHkWOLdEDT6Bq2sLudV95QZIzThluShzc7iNY9Zyirs/7AYI1IMJppqvzAhNEVaL
         AcoH2Ae1BMxkdTsio0uTrkFAKsJLrlv3erUHmRtTo7vPgyu/Tz+8gP+8/k8mlFKSpjJZ
         v1QfLbh8Jf2MolL1UcPkv+q8tfs36SOmJ3mNULzvyBdm0M3wyxFgISPFADauOdERzUzT
         zm2g==
X-Gm-Message-State: AOJu0Yw0f2KaDDW32AgbPfwKuXcJY5mZ/vGNR9+AdS8kML5qCnn5yBi7
	7na9JIHcWJPB3TkTlKsPgjOAuLvyLEmffCyQmc033o65R+RLJOB+WYoNwbAr7G7uze16RKRcY88
	aOesX+dJAej71SKJJusU90w==
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491045qvi.18.1700059380985;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0jpQrK9oJO86ojMSo1dc0KOCSp7+RBS164Fh6GwHlgBAjmWNWgSHBdIgtMHXFSNVSzkNNdA==
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491005qvi.18.1700059380669;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm578681qvv.88.2023.11.15.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Date: Wed, 15 Nov 2023 07:42:58 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, patches@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux.dev, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Christoph Hellwig <hch@lst.de>, Moritz Fischer <mdf@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/17] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <jtgj4qfpqzj5zowqwmcniaxd77kqvirspm2a7jkgg6vgmo2scy@5jpoatxkrkid>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


