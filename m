Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520837E5AF3
	for <lists+linux-mips@lfdr.de>; Wed,  8 Nov 2023 17:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjKHQRK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Nov 2023 11:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjKHQRJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Nov 2023 11:17:09 -0500
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D0D1733;
        Wed,  8 Nov 2023 08:17:07 -0800 (PST)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-586f1db1a83so3843744eaf.2;
        Wed, 08 Nov 2023 08:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699460226; x=1700065026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhueBKTq066e4mLfKHRgK40ZdUHgCtrKWznR5J+LNwA=;
        b=ijubwwIxqgtyr2EjE88cpot+z+gEjSHr5mQW62uGJm4DU6hnnDU9uzPciPdhERCAwE
         3ji0RK/XwPOvTtI86jwWoPGhSiqhxWfqWCyddB2eNDrYoxl68FWT2uajoNYBy8QL30Y8
         hF5ub9foYDVSOH3v0my2P/pH5hgkcPMmEa49aqLNLqt+6iXscd5D6XQ4DNn/le+R2CqP
         iUOSFzQXm2GxwnBkne0XSYL1hJJ1Er65jtu6581cE3zS8CYglKbX71uBturZvJkdrp2q
         QO03y/P/GTT8wTxQcnmE8LMNJPoQo66wj+RzNHaXxfpmSr8OlpN2cWgHd17Nbcr6pCfL
         kH4A==
X-Gm-Message-State: AOJu0YytxFme+0A+U1gNMRLLuGIAUPQrOXirhDwmryojFUJzBMN10ghZ
        +IO/AoCpqNVQAtD8eYXERg==
X-Google-Smtp-Source: AGHT+IFe/wqQx7jqSarQLsP5AynmlF1OwPY0v3LIXJSKefg7OTaZGlvutVeUSHDrZS8dzbY2HrAlbA==
X-Received: by 2002:a4a:c208:0:b0:581:ff36:702b with SMTP id z8-20020a4ac208000000b00581ff36702bmr2227049oop.8.1699460225482;
        Wed, 08 Nov 2023 08:17:05 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d6b98000000b006bf0f95f702sm1914773otq.64.2023.11.08.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:17:04 -0800 (PST)
Received: (nullmailer pid 2331961 invoked by uid 1000);
        Wed, 08 Nov 2023 16:17:02 -0000
Date:   Wed, 8 Nov 2023 10:17:02 -0600
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
Subject: Re: [PATCH RFC 02/17] of: Do not return struct iommu_ops from
 of_iommu_configure()
Message-ID: <20231108161702.GB2254211-robh@kernel.org>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 03, 2023 at 01:44:47PM -0300, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 29 ++++++++++++++++++-----------
>  drivers/of/device.c      | 22 +++++++++++++++-------

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/of_iommu.h | 13 ++++++-------
>  3 files changed, 39 insertions(+), 25 deletions(-)
