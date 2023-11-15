Return-Path: <linux-mips+bounces-74-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF27EC666
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 15:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A00E6281563
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 14:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538A02FE0B;
	Wed, 15 Nov 2023 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWHStGJM"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E52F2EB08
	for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 14:54:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122B5A9
	for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700060049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1FlIYAXhM/ERDubCadB5WwuUe+5s0MuhfY1IPTS1Qc0=;
	b=JWHStGJM88jGe/q5f8vrrxlo4hUJlOjY8I/eoB+acUopDKN1/+AMqZ4ZqsyS6y+AJfOITp
	Fhy/iyHy456Te5Sxw8yhfOhrDBRKkcvcdpsXOyIF8jDE75C0IK9zOqIdf9wA4k0fqiJEJ8
	GJtLtt6OdkCMA0aiLCestTSWcRNva5M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-IhWJ1bfuPXqmLpw1WbG-EA-1; Wed, 15 Nov 2023 09:54:08 -0500
X-MC-Unique: IhWJ1bfuPXqmLpw1WbG-EA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7789a691086so807353185a.0
        for <linux-mips@vger.kernel.org>; Wed, 15 Nov 2023 06:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060047; x=1700664847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FlIYAXhM/ERDubCadB5WwuUe+5s0MuhfY1IPTS1Qc0=;
        b=qAephmlAs96Fcoo7c6qj0SufvxbeD4AsChTybkui6O7nvaxMojuMOtxzGuS1Sx6SJa
         avRkdqb8omjIUipt/MQGFistPsT8HVfJc+kMrD/0rdIoU++3io50AmUNH4LIlzJjfoDo
         UiNeGiG2yqaiRdLMesQbXtnC4+BKMjEwEq2GxjQYiD/SoLiZwh6wz03mtbwumoWIV66d
         0o2FdpmvqAnsP4GwxG7jRsHjyOMGZ5+ANRwfNqKMQXtGTnqmyxVoPqTUc2mtjg9FE8AS
         d+39T12bmppXSi6yu7J6LhfPWeQNgoSYa8qh0aBXUdfHLRj1zr167OnWlTCoxeLnhBvB
         /2rw==
X-Gm-Message-State: AOJu0YwuIy38cwpMMag1Iu/qPATkxkgP3xepSS65lC7gJKccX6EjVGb/
	f2aYVFDY34hPw2VBH4C5IW9psXhi4f8KMCBk7FTIM3rmnn/TudoaxlLJtM0NZSUVFgDVIICvyrd
	WE20ERyjya3BQ2LxTpDzC3w==
X-Received: by 2002:a05:620a:560b:b0:77b:b34e:6262 with SMTP id vu11-20020a05620a560b00b0077bb34e6262mr6700764qkn.46.1700060047605;
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8Q+hB6LwGEOpBjf0tTy48HeUIb95APpcQR8cIO4M7kaLSCpN0/vvs5U/8Y5mL2TRIxjAUaQ==
X-Received: by 2002:a05:620a:560b:b0:77b:b34e:6262 with SMTP id vu11-20020a05620a560b00b0077bb34e6262mr6700714qkn.46.1700060047365;
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id dx8-20020a05620a608800b0076cc0a6e127sm3521399qkb.116.2023.11.15.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Date: Wed, 15 Nov 2023 07:54:05 -0700
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
Subject: Re: [PATCH v2 00/17] Solve iommu probe races around iommu_fwspec
Message-ID: <ah7jh6pi5o3s47mz5y4tms46fvpbmaisw6orom6tke2vdsqejm@qvjnxhejqs5i>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>

Did patch 12 v2 get sent? I'm not seeing it locally, nor in lore, and b4 doesn't find it when pulling then thread.

Regards,
Jerry


