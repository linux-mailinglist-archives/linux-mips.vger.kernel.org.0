Return-Path: <linux-mips+bounces-47-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8657EA4B7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 21:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C2D1C20941
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 20:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BEC24A0A;
	Mon, 13 Nov 2023 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sp51ZmYS"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4B24A1B
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 20:23:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BFAD75
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699907016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=Sp51ZmYS9x/BflDpgG0sCd2pUV94xL+4ixa30IWCsJK/+IPO66UVCg8n0cD6xowr4L5dLR
	9lRkOs1F2hu3xGbsA0p6Wmka+YSR79LkqoQ9OAiS1XJUEynV19um3o3REPV0Wu2z7HDX02
	3oQW+NwzR3mwJVlG1alKoiPVbp07Qcg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-H99YBvrcPI2Uvl0ND5AcwA-1; Mon, 13 Nov 2023 15:23:33 -0500
X-MC-Unique: H99YBvrcPI2Uvl0ND5AcwA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cdc542b56so58426031cf.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699907013; x=1700511813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=cvNbkLKAPO0QsC/J+UyR/98GmfsBR90CrPnOqGvSiIQJAai4wcaIz5WxQBjNJMS7Do
         ISIjhUyBEQLo1NCf7GmYYu+ttkUHvp2ES5f/mu8EK7ZZnVoNcvmOEtFY/kdRoOKcEq+r
         sb1dAq5RESqtfaK3hx4wC5mGADaeNNy3Qci4szSiTT2ASTjeSuY53zaj5hM5c68lLd7h
         Q2bsDrwobb16+NWTuoPa5f08BtbjKHf7Y1rlXYVoC0fa9mnfVQQKAwkDG/MD+HrGvJFu
         v+Cj2jz1dly9Zqz3rvaI8Lu6Y/toCyi1FoqKxEV2/4ij1APuNzGEZweYW+1i+bxrmACs
         MkVA==
X-Gm-Message-State: AOJu0Yy1DZIbKl962Vud/idJzpDj+90D+oxT114InUOmQQnkBo688BtJ
	WfipRIcnMVRPbYgCEzJDuBDSj3TpS5cOgyeQcRLQN5GSjIaWVMXdOeI8B+pKfIvYNxP7IZylrUj
	FDnfmUC+VBX/8avoA108wuA==
X-Received: by 2002:ac8:7dcb:0:b0:41c:c489:5737 with SMTP id c11-20020ac87dcb000000b0041cc4895737mr181018qte.52.1699907013271;
        Mon, 13 Nov 2023 12:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETLe6ua2NZBk5C5HvQsSQRhq7xoJL++WLnwlLCZjQoU3YIRy9czQKgZx9fuBDkEqY7LDc6Jg==
X-Received: by 2002:ac8:7dcb:0:b0:41c:c489:5737 with SMTP id c11-20020ac87dcb000000b0041cc4895737mr180976qte.52.1699907013032;
        Mon, 13 Nov 2023 12:23:33 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b004196a813639sm2177639qto.17.2023.11.13.12.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:23:32 -0800 (PST)
Date: Mon, 13 Nov 2023 13:23:31 -0700
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
Subject: Re: [PATCH RFC 15/17] iommu: Add ops->of_xlate_fwspec()
Message-ID: <j56kfjb5dt3drcxh56lyc4om3qjnwddot2i5f62f6u6gwefj7i@rxmgclwaevf4>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <15-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


