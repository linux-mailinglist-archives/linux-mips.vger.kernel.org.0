Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A827E26DB
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 15:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjKFOdH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 6 Nov 2023 09:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjKFOdG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 09:33:06 -0500
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F859BD;
        Mon,  6 Nov 2023 06:33:03 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-582a82e6d10so1012453eaf.0;
        Mon, 06 Nov 2023 06:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699281182; x=1699885982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdHOkDDDq2uDsqnfkV1g2ITyJ/uBNt8L8qaNucWn9Lg=;
        b=mok4LGaGi7OIvm5KmMRRjX7+qy9KKC3eAB9+DupJ6U0lyEXxUUlByepiaB8sslymVm
         7n6+TiwirzMO9gbq/oGeQ5z+fvOSMoPMRwAdcfXj9cY+OhUHjzERkbqlFUXT6aykHiZk
         QzqVvZh1lp9TiZxFpXCvUlM6BwcJfH7Ci4GMGuczSnssytKPApYaGJgA2dflWGAsM3rp
         JjxPJc5cF+ockZPGkhkmD5SvzDdNsDNKd1JtOyfcqyuo0+4Qhg2U1+gUMq+xPT5+oyGt
         wBpqE4EukcD0rXgrdWMUSyFHk3o/g60N+wFHFc+uV97+rnbtHVmHNvX9vulCm2ASZjWO
         Dbeg==
X-Gm-Message-State: AOJu0YzMFf4TI2+ysrPEt8vRjBECazKqYkhuk1HRk3TGjaQR0fph882X
        q87VQBkapYjLdT0RKf3tzDBgJRxgRRiDaZNLjbY=
X-Google-Smtp-Source: AGHT+IHyHB4kzvcjkEhTb+3sUVIPXXX0cO5Y7IiQxSg2gu4OXnnfVIuOscNqmkEqJcDtSiyYa7NRTI4+Cg8Mb+uLm9Y=
X-Received: by 2002:a4a:d68a:0:b0:584:1080:f0a5 with SMTP id
 i10-20020a4ad68a000000b005841080f0a5mr31132550oot.1.1699281182420; Mon, 06
 Nov 2023 06:33:02 -0800 (PST)
MIME-Version: 1.0
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com> <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
In-Reply-To: <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 6 Nov 2023 15:32:51 +0100
Message-ID: <CAJZ5v0hepKO0QKuBF3d38r=7nG0tjTtEwXdPNPv_2jYPnToUsg@mail.gmail.com>
Subject: Re: [PATCH RFC 04/17] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 3, 2023 at 5:45 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/acpi/scan.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index a6891ad0ceee2c..fbabde001a23a2 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1562,8 +1562,7 @@ static inline const struct iommu_ops *acpi_iommu_fwspec_ops(struct device *dev)
>         return fwspec ? fwspec->ops : NULL;
>  }
>
> -static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
> -                                                      const u32 *id_in)
> +static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>  {
>         int err;
>         const struct iommu_ops *ops;
> @@ -1574,7 +1573,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
>          */
>         ops = acpi_iommu_fwspec_ops(dev);
>         if (ops)
> -               return ops;
> +               return 0;
>
>         err = iort_iommu_configure_id(dev, id_in);
>         if (err && err != -EPROBE_DEFER)
> @@ -1589,12 +1588,14 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
>
>         /* Ignore all other errors apart from EPROBE_DEFER */
>         if (err == -EPROBE_DEFER) {
> -               return ERR_PTR(err);
> +               return err;
>         } else if (err) {
>                 dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
> -               return NULL;
> +               return -ENODEV;
>         }
> -       return acpi_iommu_fwspec_ops(dev);
> +       if (!acpi_iommu_fwspec_ops(dev))
> +               return -ENODEV;
> +       return 0;
>  }
>
>  #else /* !CONFIG_IOMMU_API */
> @@ -1623,7 +1624,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
>  int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>                           const u32 *input_id)
>  {
> -       const struct iommu_ops *iommu;
> +       int ret;
>
>         if (attr == DEV_DMA_NOT_SUPPORTED) {
>                 set_dma_ops(dev, &dma_dummy_ops);
> @@ -1632,10 +1633,15 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>
>         acpi_arch_dma_setup(dev);
>
> -       iommu = acpi_iommu_configure_id(dev, input_id);
> -       if (PTR_ERR(iommu) == -EPROBE_DEFER)
> +       ret = acpi_iommu_configure_id(dev, input_id);
> +       if (ret == -EPROBE_DEFER)
>                 return -EPROBE_DEFER;
>
> +       /*
> +        * Historically this routine doesn't fail driver probing due to errors
> +        * in acpi_iommu_configure()
> +        */
> +
>         arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
>
>         return 0;
> --
> 2.42.0
>
