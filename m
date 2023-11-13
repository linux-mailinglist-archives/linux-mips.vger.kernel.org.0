Return-Path: <linux-mips+bounces-43-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E17EA493
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 21:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE2F280FE6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 20:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DED24A0F;
	Mon, 13 Nov 2023 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BTAMur/c"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1132420C
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 20:13:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422D5D7E
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=BTAMur/cBw2cWs7noaCA7jACSGU6/fvCxXI4GJgjtzQYKK2uSIjJubLxewIvr1eKap3KxK
	okVLNJjrjh79wGXuQUJU3CJDv2c8C3wHRnDIMnjE7dvjZ80shYOXX5AV8C16fIIsH0ZUWh
	jVvWHxvR5bZzXFBHvR2B3c+tOforPGk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-_GSltHLEMLCkMVqn7piHBg-1; Mon, 13 Nov 2023 15:13:27 -0500
X-MC-Unique: _GSltHLEMLCkMVqn7piHBg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d08175882so54858936d6.1
        for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 12:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906406; x=1700511206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=Mtgm5G01ZeEVBOzqbEBfe7tmBvNgp7O3ki+J/wafvSJcEKE7BYKoSE9UW0stXa//Ys
         8uN2H3qM2nMsevFOVFJchpsVeFEwlWQoxvjLJSQucAFqeGtfDQKpHr/DIDUlYDsNFEMt
         SfcIiByqNXYd6xCIjt51jdH0kGgW5o0hlzEDh+XO+/7x7R8AQsnta9cmeoPg76DOoQaz
         KAvQJWGBFLnzef9oBhPrGCpKouCnMtwdmmpNLC8F6WreAaERC0gt84RzuwOxDgVsd2eY
         uIDp4S8SdCktpkXyNOSN6SchiHRCMdR1skjgWkiU0EOKOILrjVkNyr/HTG2XmwdGyd9T
         N+Fg==
X-Gm-Message-State: AOJu0YxvaxaBier9RFOd31hGci92AoJhY4W9apzpdwAaO9owv9hv5lHs
	NYOwOZ0BSFtXt2QROhI2JW/a5cNFsyxQ856d2vDXoE8tfmbU85KL+45yz5JD0C7gtog38W8mxrk
	0XQ8THu5tNpn9Cojm7EYRDQ==
X-Received: by 2002:ad4:4bad:0:b0:65b:2660:f577 with SMTP id i13-20020ad44bad000000b0065b2660f577mr248790qvw.3.1699906406576;
        Mon, 13 Nov 2023 12:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsDIxiixJLIxKwkxODRjUhycdO5JesTQ8JOYTeYOzxmk+ReEPp+gf8876uIJbrOmvoudG57Q==
X-Received: by 2002:ad4:4bad:0:b0:65b:2660:f577 with SMTP id i13-20020ad44bad000000b0065b2660f577mr248760qvw.3.1699906406355;
        Mon, 13 Nov 2023 12:13:26 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id c4-20020a05621401c400b006754772bfd4sm2302000qvt.21.2023.11.13.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:13:25 -0800 (PST)
Date: Mon, 13 Nov 2023 13:13:24 -0700
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
Subject: Re: [PATCH RFC 10/17] acpi: Do not use dev->iommu within
 acpi_iommu_configure()
Message-ID: <aqbuvpgu577fdpf4ndhoghfgewki7lg4hf2yewljonxf6y6oxv@xisq2p5bi3kb>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <10-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


