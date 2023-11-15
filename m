Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256B27E5AD5
	for <lists+linux-mips@lfdr.de>; Wed,  8 Nov 2023 17:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjKHQLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Nov 2023 11:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbjKHQLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Nov 2023 11:11:44 -0500
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F18519A5;
        Wed,  8 Nov 2023 08:11:42 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b6a837a2e1so1343991b6e.0;
        Wed, 08 Nov 2023 08:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699459901; x=1700064701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egO/3A8usR47pYsFMHy7at49a3WUUkqONQqbQuU8j7Y=;
        b=uQod2uDabayaXs6n7pwKDCysCHgfTd9wESlvdVVu/fkWxQyzZ9A7WLlQiagmCnXVy/
         MNk/dfTd9iTDPTgBL00944LlP6QON7nPmmuq6LNrkUX7/e4U9gzyWnp1z3GAR2zMWrmT
         zI52HfydorbUqrEvI2Zgor+S7ZfCLWBUWUY0Ksgfq4m88rsSgp6NtcbyASZOpWQrHTx8
         XWvZUvMZgA7Oul39qQeb+WAVbH8PdIBbD458O6GhsqXkAqrOnAmj02lMwbJnSREPqkH4
         Fp61PR25gxnM72SeSV4M7hSutG/7if41F9ZPNLUfw8egVvxrZK6hiXb7mHCoKprIVKQz
         /bOw==
X-Gm-Message-State: AOJu0YzG5Ll5iELF/d99pw9llmLPrWJhhm49rzpE2822eRK/aVpabPXv
        lumrtbvPV7jeErhKVyjQjA==
X-Google-Smtp-Source: AGHT+IFG1ydbraxTf3qUlkUHE402Zq2u5RjAY4fdhcYCPQiBAZE+mNt+Ni+JkQlZMBRuNIEkL2d3Ow==
X-Received: by 2002:a05:6808:15a8:b0:3a9:cfb5:4641 with SMTP id t40-20020a05680815a800b003a9cfb54641mr3241896oiw.48.1699459901513;
        Wed, 08 Nov 2023 08:11:41 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05680817aa00b003afc33bf048sm1959000oib.2.2023.11.08.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:11:40 -0800 (PST)
Received: (nullmailer pid 2284755 invoked by uid 1000);
        Wed, 08 Nov 2023 16:11:38 -0000
Date:   Wed, 8 Nov 2023 10:11:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     acpica-devel@lists.linuxfoundation.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hector Martin <marcan@marcan.st>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Sven Peter <sven@svenpeter.dev>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Vineet Gupta <vgupta@kernel.org>,
        virtualization@lists.linux-foundation.org,
        Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 03/17] of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <20231108161138.GA2254211-robh@kernel.org>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 03, 2023 at 01:44:48PM -0300, Jason Gunthorpe wrote:
> Instead of returning 1 and trying to handle positive error codes just
> stick to the convention of returning -ENODEV. Remove references to ops
> from of_iommu_configure(), a NULL ops will already generate an error code.

nit: "iommu: of: ..." or "iommu/of: " for the subject. "of: ..." is 
generally drivers/of/.

> 
> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 42 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
