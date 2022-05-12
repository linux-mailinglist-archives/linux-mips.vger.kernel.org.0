Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F883524165
	for <lists+linux-mips@lfdr.de>; Thu, 12 May 2022 02:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349571AbiELAMN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 May 2022 20:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349565AbiELAMN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 May 2022 20:12:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C70D880FF;
        Wed, 11 May 2022 17:12:01 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id t25so4549739ljd.6;
        Wed, 11 May 2022 17:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xtl42tJGJQcUUZDrUy9vvNDWPlGhgxFeFV6ayMpws/I=;
        b=UWaO8u2kTSmF83F31Mtvbda3aS0g8vjozqO84yBEum0G5CNm/1UGKpzavMVKkh/gsa
         uaKh5AUtdyGxvZyzj4imQYyGSge+8mN3oxOJwohNIyeM9oSRmjZ/KiP4zXBAbzBdmkeP
         rbpL7a3wCOClcv8G4Q1ZUuQ6azjWoAY5idAbk2NNbldifNAPXC5tf1lpPKMwgeQgf3yf
         hUKG+1AKW6xEh/DW7qO1E23nYXm7dUx/aRyeUoWVR0zGKpkDnJqg/i0ekYebCmhf/fWU
         IlIx8xmW70FT3hx/bJNN/C6LFxIqOIbz+aKNmp9nuvQUFT7xejAlS975FyUk4hLE4flU
         ko3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xtl42tJGJQcUUZDrUy9vvNDWPlGhgxFeFV6ayMpws/I=;
        b=qJtHf5WRPfSX9XqLjfy6Nw3yJvIFC0Ac6dfhQejJNHYVIW2+8bJyTdFbxMDWd22n70
         PWvDkTdOf9qr62GXEADdDvo1E+LGTrodT2qPfBPCKIo3ykJ8f9DoASJcX7pLm7WHKVQk
         WJe1mghjCDw1w5htnZY+fwQrVHksA8+KCzBqqTL2auYE1z0Op6AzjYSHhGvLGIu3FweU
         z1qTvrfVOVLNbSm2VvQJkahYURmJYKZ/ny9Q3SX9uPyfiTacs+V4UNd8i1EyEOnCTYed
         gInZLIPoO5EzD8UDyl27+JdQ5/zpLaioqDt7E6Mv1kzW3eSDdt0pOdHvZlDGx5tbK60Q
         MIIg==
X-Gm-Message-State: AOAM530udyG/Q01uSYl/E9JzXyLxxo6HEcfsiqlIokYPJxx9WD68Yanz
        iRkzwcBZDz09JtTe7cV37Wk=
X-Google-Smtp-Source: ABdhPJxxj90703Qs/KiALTn9feZlT3+GkzraAfNlp00WotYbVJL2rVbl32K6uN0WT/VJH+CjnpVYJQ==
X-Received: by 2002:a05:651c:3c2:b0:24f:b91:fcba with SMTP id f2-20020a05651c03c200b0024f0b91fcbamr18331300ljp.154.1652314319465;
        Wed, 11 May 2022 17:11:59 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id bi1-20020a0565120e8100b0047255d211f1sm501528lfb.288.2022.05.11.17.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 17:11:58 -0700 (PDT)
Date:   Thu, 12 May 2022 03:11:56 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: Baikal-T1 DDR/PCIe resets and some xGMAC
 fixes
Message-ID: <20220512001156.x6kqyhi3vjjpqch6@mobilestation>
References: <20220503205722.24755-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503205722.24755-1-Sergey.Semin@baikalelectronics.ru>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 03, 2022 at 11:57:18PM +0300, Serge Semin wrote:
> This patchset is an initial one in the series created in the framework
> of my Baikal-T1 PCIe/eDMA-related work:
> 
> [1: In-progress v3] clk: Baikal-T1 DDR/PCIe resets and some xGMAC fixes
> Link: https://lore.kernel.org/linux-pci/20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru/
> [2: In-progress v1] PCI: dwc: Various fixes and cleanups
> Link: https://lore.kernel.org/linux-pci/20220324012524.16784-1-Sergey.Semin@baikalelectronics.ru/
> [3: In-progress v1] PCI: dwc: Add dma-ranges/YAML-schema/Baikal-T1 support
> Link: https://lore.kernel.org/linux-pci/20220324013734.18234-1-Sergey.Semin@baikalelectronics.ru/
> [4: In-progress v1] dmaengine: dw-edma: Add RP/EP local DMA controllers support
> Link: https://lore.kernel.org/linux-pci/20220324014836.19149-1-Sergey.Semin@baikalelectronics.ru/
> 
> Since some of the patches in the later patchsets depend on the
> modifications introduced here, @Lorenzo could you please merge this series
> through your PCIe subsystem repo? After getting all the required ack'es of
> course.
> 
> Short summary regarding this patchset. A few more modifications are
> introduced here to finally finish the Baikal-T1 CCU unit support up and
> prepare the code before adding the Baikal-T1 PCIe/xGMAC support. First of
> all it turned out I specified wrong DW xGMAC PTP reference clock divider
> in my initial patches. It must be 8, not 10. Secondly I was wrong to add a
> joint xGMAC Ref and PTP clock instead of having them separately defined.
> The SoC manual describes these clocks as separate fixed clock wrappers.
> Finally in order to close the SoC clock/reset support up we need to add
> the DDR and PCIe interfaces reset controls support. It's done in two
> steps. First I've moved the reset-controls-related code into a dedicated
> module. Then the DDR/PCIe reset-control functionality is added.
> 
> Link: https://lore.kernel.org/linux-pci/20220324010905.15589-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v2:
> - Resubmit the series with adding @Philipp to the list of the recipients.
> 
> Link: https://lore.kernel.org/linux-pci/20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v3:
> - Rebased from v5.17 onto v5.18-rc3.
> - No comments. Just resend the series.

No comments for more than a week. There were no comments in v1 and v2
either. Please at least ack or merge in the series. It would be very
appreciated to merge it in through one repo with the rest of the
patchsets before the next merge window. @Bjorn, @Lorenzo, @Michael?

-Sergey

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Rob Herring <robh@kernel.org>
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (4):
>   clk: baikal-t1: Fix invalid xGMAC PTP clock divider
>   clk: baikal-t1: Define shared xGMAC ref/ptp clocks parent
>   clk: baikal-t1: Move reset-controls code into a dedicated module
>   clk: baikal-t1: Add DDR/PCIe directly controlled resets support
> 
>  drivers/clk/baikal-t1/Kconfig       |  12 +-
>  drivers/clk/baikal-t1/Makefile      |   1 +
>  drivers/clk/baikal-t1/ccu-div.c     |   1 +
>  drivers/clk/baikal-t1/ccu-div.h     |   6 +
>  drivers/clk/baikal-t1/ccu-rst.c     | 373 ++++++++++++++++++++++++++++
>  drivers/clk/baikal-t1/ccu-rst.h     |  64 +++++
>  drivers/clk/baikal-t1/clk-ccu-div.c | 102 ++------
>  include/dt-bindings/reset/bt1-ccu.h |   9 +
>  8 files changed, 482 insertions(+), 86 deletions(-)
>  create mode 100644 drivers/clk/baikal-t1/ccu-rst.c
>  create mode 100644 drivers/clk/baikal-t1/ccu-rst.h
> 
> -- 
> 2.35.1
> 
