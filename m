Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6291D5FC90C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Oct 2022 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJLQVU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Oct 2022 12:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJLQVS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Oct 2022 12:21:18 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6A622528;
        Wed, 12 Oct 2022 09:21:17 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-132af5e5543so19995905fac.8;
        Wed, 12 Oct 2022 09:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdkjtjQe9y7QrqNfE9DE704tTUxuuSLHdhelufYZEXY=;
        b=ujkdGq1ktp3lf3tYeTdVKOtlQQRAjPaVt9dRGLLmLuX+fgAZmGi/kmUcM7+kvX0X9Y
         0lZi6JOxXMorLtfbKREGxjAMRPdB2eWfeo2LoIg0MeTJpwB69zZHP3kIn1Qkp6Eqc/CY
         uEEk4JLWmojl05jY7vPAqucfJBCfr1h6G/DXNg2qCIbuwBmqBuOwSdSVASPTJ+9Oiz/Q
         3hcaOlWLz4VoZsTYIsY3zG+zp9djPVTqkIyZUF1PBV0+DJztUuLGBKyeVMgwZiY8g8AZ
         Tztm/QzRlWZRnusK8Djt50FUAjb5MIyG8GajXxJLNeeElOmU4q3qDxod2WbVT4sHyQJ8
         bcRg==
X-Gm-Message-State: ACrzQf3sZCpVp7557L+7iogAChPIjbM7ERs7qMnWfHEV1r8DN81Pbu9I
        qXQ4jUKurMLCdNqvLTvD+g==
X-Google-Smtp-Source: AMsMyM7nAruUoSXYjluWMGl/KdX94bPKk33igtUxV/7Po/YMVByuG51WIBady0DgwT4LlWbabg9ulQ==
X-Received: by 2002:a05:6870:eaaa:b0:132:e501:4053 with SMTP id s42-20020a056870eaaa00b00132e5014053mr3005462oap.186.1665591676702;
        Wed, 12 Oct 2022 09:21:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ek19-20020a056870f61300b0012c52bd4369sm1335901oab.19.2022.10.12.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:21:16 -0700 (PDT)
Received: (nullmailer pid 2281844 invoked by uid 1000);
        Wed, 12 Oct 2022 16:21:17 -0000
Date:   Wed, 12 Oct 2022 11:21:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
Message-ID: <20221012162117.GA2275712-robh@kernel.org>
References: <20221012050442.6815-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221012050442.6815-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 12, 2022 at 07:04:41AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Most TP-Link home routers use the same partitioning system based on a
> custom ASCII table.
> 
> It doesn't seem to have any official name. GPL sources contain tool
> named simply "make_flash" and Makefile target "FlashMaker".
> 
> This partitions table format was first found in devices with a custom
> SafeLoader bootloader so it was called SafeLoader by a community. Later
> it was ported to other bootloaders but it seems the name sticked.
> 
> Add binding for describing flashes with SafeLoader partitions table. It
> allows operating systems to parse it properly and register proper flash
> layout.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix typo in commit: s/same/name/
> ---
>  .../tplink,safeloader-partitions.yaml         | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
> new file mode 100644
> index 000000000000..e38aaea5aa11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/tplink,safeloader-partitions.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TP-Link SafeLoader partitions
> +
> +description: |
> +  TP-Link home routers store various data on flash (e.g. bootloader,
> +  flash layout, firmware, product info, configuration, calibration
> +  data). That requires flash partitioning.
> +
> +  Flash space layout of TP-Link devices is stored on flash itself using
> +  a custom ASCII-based format. That format was first found in TP-Link
> +  devices with a custom SafeLoader bootloader. Later it was adapted to
> +  CFE and U-Boot bootloaders.
> +
> +  This binding describes partitioning method and defines offset of ASCII
> +  based partitions table. That offset is picked at manufacturing process
> +  and doesn't change.
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +properties:
> +  compatible:
> +    const: tplink,safeloader-partitions
> +
> +  partitions-table-offset:
> +    description: Flash offset of partitions table
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Don't need quotes.

> +
> +required:
> +  - partitions-table-offset
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "tplink,safeloader-partitions";
> +        partitions-table-offset = <0x100000>;

What is in the space before this? It is part of the safeloader 
partitions? If the safeloader partitions are not the entire device, then 
perhaps we still need fixed partitions.

Rob
