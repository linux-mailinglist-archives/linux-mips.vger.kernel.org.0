Return-Path: <linux-mips+bounces-48-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A249B7EA4BE
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 21:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42B041F2264C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 20:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C85924A0D;
	Mon, 13 Nov 2023 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsoPlO93"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ADE24A0F
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 20:25:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEA2D7E
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699907126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=EsoPlO93xa9IbDgvEh3uBrUaKHGA2TgVsMGRGD6Yx6oHWeRvWdx1aV+WWOGBv88/IX6hVd
	jV3XdIqepXP+Swe2na1/oMMYrFc0INXer/5N3Uc8mVMUhhyywzfPBMZg18P/bO1wHQLLHT
	5mWePEi+opY3VO3GMuFts4mAiSIzw3U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-c2pPeQFGM1mq0J8HvR3ayA-1; Mon, 13 Nov 2023 15:25:25 -0500
X-MC-Unique: c2pPeQFGM1mq0J8HvR3ayA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-670aa377deeso61987216d6.3
        for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699907125; x=1700511925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=OFGQH5IKGDFCcYky8eXFe7JYkiqWZn+ZOWAyNX1D1XsnoSsRl4Tkwn6dl6mbmGBBLG
         dR+TwhmfdE/W21I3m++VskuJ9DzTWhkv6mw2rlorPDd3DOvsIZZh25MEVIuQ557OHdv4
         1J9ljNuGIX3ZMQRzODJJTCBf91bR58J9pDIcvHBj5lE8rvNPjAcLUilVQaczx4DP1Szf
         xGVCGJb1KC/KIgOSKr7QvS67uK0OcgyzL9pDFlLgOckybX4xlBebB6YWXdOVz6xTdzT7
         /iVliH4TjjPwAyMIiTl05fjhtcVIvboceFbtSFOB7EK/qVd5ip4ctIXcANEW67Z8D4Qa
         19nw==
X-Gm-Message-State: AOJu0YxYXD/oE8Hd0JPcLBbWI1ttK9YlQZmydy2VjP+XJWIdmTL+hTRp
	5v7Uu0RLpfIlXWxlsLwlRVDVQIEgJQL+rtjrrCw4Php+jvofnmVBNx1fKUmKUkvOViSlhWsCm9Q
	HoekJ1NLrQMbWv+dJk8821g==
X-Received: by 2002:a05:6214:2a9:b0:672:3f54:b94f with SMTP id m9-20020a05621402a900b006723f54b94fmr343468qvv.7.1699907125255;
        Mon, 13 Nov 2023 12:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDuwvOtoyPZ5iPmtgsnzi3ZmT4SfzU8sjdIavaCXICAagXeDLzw8KJuwOG1DaOAnqE0bqGXg==
X-Received: by 2002:a05:6214:2a9:b0:672:3f54:b94f with SMTP id m9-20020a05621402a900b006723f54b94fmr343444qvv.7.1699907125050;
        Mon, 13 Nov 2023 12:25:25 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id qz6-20020a05620a8c0600b00774292e636dsm2120525qkn.63.2023.11.13.12.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:25:24 -0800 (PST)
Date: Mon, 13 Nov 2023 13:25:23 -0700
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
Subject: Re: [PATCH RFC 16/17] iommu: Mark dev_iommu_get() with lockdep
Message-ID: <avqfvjfck64kedxvjtsw5rc7x2dkubbpm5ytz6roog6pb7of2z@g6up6nxawsmo>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <16-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


