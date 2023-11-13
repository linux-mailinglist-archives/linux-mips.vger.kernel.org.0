Return-Path: <linux-mips+bounces-39-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7344F7EA473
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 21:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CDBA280F3C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 20:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C496C24208;
	Mon, 13 Nov 2023 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ad4b1lZt"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212FE241FB
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 20:11:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ADFD75
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=Ad4b1lZtd61Vuf5abjVAKldS78A63DVRnlTajGp5zX+H+Nag7ZYs6prr/HvWLA4QSSIDFa
	Ut0Goxb5lYeVCqMfpV7xQXKWfctqgN0Yy68GiQUW1l0Iteu04QSRIcCp3bdb/YlFo798E0
	GulQpfe+Pftp+oCCJXX8diIV8ih7Wuc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-W92m3APoMWauJj1rDg2IOg-1; Mon, 13 Nov 2023 15:11:23 -0500
X-MC-Unique: W92m3APoMWauJj1rDg2IOg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5ae5b12227fso66796647b3.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906282; x=1700511082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=ASBLVEDUIa1JRUzHVthX/taG7ocPQlPCVjU9dlxJWcG2XzNmSvNmQ5idbcRrh6NpKZ
         HQBk7z7U07VLLBLzhjfra2iOhYBomjTs8XLjgO0ZfReUYMD9pv0ieleDNu34fz0nbxnU
         DDINEwaQuRXTd+Vv8PQweDJosi7oF6J9K14WUjJlaashzMQFiqv+j+lAVQSch6G7fIBU
         /87fRglCBYeCP3mQsr5Kq7gJ++l6Xnolgx3VxgHwImUxS7nwe5D4ct/A9yOwwU4BdXiy
         L+3j+36+XgBsExxARjngORd/pMYcWKu5n8dH5djl4nc86CDwX0y0V4oK8BOhCvmA/mP8
         toAA==
X-Gm-Message-State: AOJu0Yx867Yq5tcETL+U609MJ3AflWcGLYW7T4b7HRldCCXJgVZHpIYY
	t0xsERP7OBhwS7LL34ZDZD6MFRxDzP5Djd7cH7aDCUa1CtY1ZdPHshzBcVO2BjE+gIxfWxfO1L5
	mZN1j6kUbrYLr+pRMcNBQPw==
X-Received: by 2002:a0d:ce45:0:b0:5a8:1d2e:e3e4 with SMTP id q66-20020a0dce45000000b005a81d2ee3e4mr8477358ywd.35.1699906282689;
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPvmsC2qHDAh0Qw02m6ztA4jHl4uXRCi8o2kOZJlZ5OQtATt5oXfPPiPdyIMyU/zTa6M8O2g==
X-Received: by 2002:a0d:ce45:0:b0:5a8:1d2e:e3e4 with SMTP id q66-20020a0dce45000000b005a81d2ee3e4mr8477311ywd.35.1699906282465;
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b004196a813639sm2170954qto.17.2023.11.13.12.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
Date: Mon, 13 Nov 2023 13:11:20 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 06/17] iommu: Add iommu_fwspec_alloc/dealloc()
Message-ID: <qc6zidfhp2x6jmkteemyvi55wnaxlnqyfurdmdft2huxjh26ar@ffbwr7yaa3dl>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <6-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


