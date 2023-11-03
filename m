Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5357E0AD8
	for <lists+linux-mips@lfdr.de>; Fri,  3 Nov 2023 22:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjKCVs3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Nov 2023 17:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjKCVs2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Nov 2023 17:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADD8D61
        for <linux-mips@vger.kernel.org>; Fri,  3 Nov 2023 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699048059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
        b=RgRwyvVZweBgVGAk6L6MhvfxHJGscaB6d5jr81JqVo4s0w9hsRIIEJlnDURFJdyV/1J0iz
        /c/m5cNh+TfxAKUfmrEmNmD4fs0wdbDaZnpOKBltp0OAevh4Ooh51xDB1BjBakijtxwsnp
        7VVb4wGJKRJUy+7aoZL0i1bFIvOldb8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-NUnQ1bAIPXSCO0KKA2nC4A-1; Fri, 03 Nov 2023 17:47:37 -0400
X-MC-Unique: NUnQ1bAIPXSCO0KKA2nC4A-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cc1ddb34ccso20000815ad.1
        for <linux-mips@vger.kernel.org>; Fri, 03 Nov 2023 14:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699048057; x=1699652857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+aB8ULpCtjf+Gcfe540UtUd+NJKrSGjq+RpmL2JNA8=;
        b=Frp+LW2dLBxluw3JUZd+wqSbEmuHiXoCpkEH0YPaQDHSkK1fJ0cmnOzs9Piytmj/y/
         6UOfwE4wVQhkl1+ij41OSIs+BOc6mY89dViJqtNFuTwSGOWO4pxLybjtHiXRsyTP+rWa
         f13Hr5LmPOKUx9QQhjawQGxGadNMPG/ASUb2TmysMRotD9ri3qCrDnjBoSi//aeypYr0
         YHGxtfHdKZMYepFpVWsu2CJRlnPTJuCZ67E077LsbHW1DU/jMostkqdTcZ+iDFcNgvlW
         sBx6vy96ZeV+sO6Hvp/Q1mpowIG6PJFZTzlgEOfRa7hfDX9qM7BfLA3B64rSg1OL1AmJ
         LdOQ==
X-Gm-Message-State: AOJu0Yydqt+nzWH/06cC+N+fS1V34I6TPfUgcttc4AE0Dy2y4fQllCGd
        L4iPbxl+W2SiADeu/XEnT72rLyOI2X8AxeGg/cSBgtRvG08JAncEUtAkmfof5rIaMP4pympqmb3
        mqeGk2+0JbXxhok2eRK1sow==
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083774plc.29.1699048056771;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdAXninLAKiU84+Ewx4UvETdEvykTsgu1OMaAqceXcjYCMbCq9Ef0fn5aeDPHxQVvb9/cevQ==
X-Received: by 2002:a17:902:d28b:b0:1c7:755d:ccc8 with SMTP id t11-20020a170902d28b00b001c7755dccc8mr17083727plc.29.1699048056432;
        Fri, 03 Nov 2023 14:47:36 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001cc2c7a30f2sm1807591plg.155.2023.11.03.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 14:47:35 -0700 (PDT)
Date:   Fri, 3 Nov 2023 14:47:35 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
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
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <2qhocnpfy4lbmfm4erccztrwoec5sjphvktcyvxdb75qbjyozu@aht6gj2zzuhj>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <2-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ld3rrnpix5x5kirfjlk6oafhoikkge4fgvcljhmiljuqge5266@asdcw5cfp53e>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 03, 2023 at 02:42:01PM -0700, Jerry Snitselaar wrote:
> On Fri, Nov 03, 2023 at 01:44:47PM -0300, Jason Gunthorpe wrote:
> > Nothing needs this pointer. Return a normal error code with the usual
> > IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/of_iommu.c | 29 ++++++++++++++++++-----------
> >  drivers/of/device.c      | 22 +++++++++++++++-------
> >  include/linux/of_iommu.h | 13 ++++++-------
> >  3 files changed, 39 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 157b286e36bf3a..e2fa29c16dd758 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -107,20 +107,26 @@ static int of_iommu_configure_device(struct device_node *master_np,
> >  		      of_iommu_configure_dev(master_np, dev);
> >  }
> >  
> > -const struct iommu_ops *of_iommu_configure(struct device *dev,
> > -					   struct device_node *master_np,
> > -					   const u32 *id)
> > +/*
> > + * Returns:
> > + *  0 on success, an iommu was configured
> > + *  -ENODEV if the device does not have any IOMMU
> > + *  -EPROBEDEFER if probing should be tried again
> > + *  -errno fatal errors
> 
> It looks to me like it will only return 0, -ENODEV, or -EPROBEDEFER
> with other -errno getting boiled down to -ENODEV.
> 

Ah, I should've looked at the next patch first. So, never mind on this
and the question about the dev_dbg.


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

