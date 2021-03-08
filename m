Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B65233166B
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 19:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCHSn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 13:43:28 -0500
Received: from mail-il1-f176.google.com ([209.85.166.176]:42864 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhCHSnM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 13:43:12 -0500
Received: by mail-il1-f176.google.com with SMTP id p10so9765432ils.9;
        Mon, 08 Mar 2021 10:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jh7iFjBHPDZdJduTxw8HFwjFLedtkUjhMnAcCxAiD+A=;
        b=FT4/zlWVeRqW+92kpCAiPVkZ2OWIPupHGf1BkWMSgI8lcl5msntMIACCyCKPGjHJVw
         GTby1lzTiItF/748ZnqY7HJk8C7Y5z7CTciDMNFXqJ4c24FHj/4tN3PBmYYcxV/HG5nx
         cKE7osXxcU/US0ayEsJys9VBHffFk+9PvjgIkF01apBzbKdnVTD/bbrpQd8a+MtbRkyo
         bW4wi6avnDZBYQpkkYCwnmgJJPBF/2NhS9yDytJURQe9ErFJHLFO2un6BB+3DUr9yOFT
         wvbBh3fz0ubyyrA+0COzNZuCS6W6YXFQjeDBRAHSF89xlYKhBtTuihAQ1hKDa4czNMkR
         eqKA==
X-Gm-Message-State: AOAM531JveVe2upXqI4CA3aHjrtUlVWDUyDRv16yXYUXm3MjaCS8k1vu
        0cesKJXJ/JaIBH69axw1ug==
X-Google-Smtp-Source: ABdhPJxVRU/h8AM9ikcethHPFJPjX66VEBWGDEcbM/g4PtT9ad3HXxLNZYvqCwDFsrGUsFXuPt1KOg==
X-Received: by 2002:a92:c567:: with SMTP id b7mr21930432ilj.25.1615228991466;
        Mon, 08 Mar 2021 10:43:11 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e2sm6383747iov.26.2021.03.08.10.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:43:10 -0800 (PST)
Received: (nullmailer pid 2766749 invoked by uid 1000);
        Mon, 08 Mar 2021 18:43:08 -0000
Date:   Mon, 8 Mar 2021 11:43:08 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH stblinux.git 1/2] dt-bindings: firmware: add Broadcom's
 NVRAM memory mapping
Message-ID: <20210308184308.GA2762703@robh.at.kernel.org>
References: <20210302074405.18998-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210302074405.18998-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 02, 2021 at 08:44:04AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> NVRAM structure contains device data and can be accessed using MMIO.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/firmware/brcm,nvram.yaml         | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
> new file mode 100644
> index 000000000000..12af8e2e7c9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/firmware/brcm,nvram.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Broadcom's NVRAM
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description: |
> +  NVRAM is a structure containing device specific environment variables.
> +  It is used for storing device configuration, booting parameters and
> +  calibration data.

The structure of the data is fully discoverable just from a genericish 
'brcm,nvram'?

And it's a dedicated memory outside of regular RAM?

> +
> +  It's required very early in booting process and so is made available
> +  using memory mapping.
> +
> +  NVRAM can be found on Broadcom BCM47xx MIPS, Northstar ARM Cortex-A9
> +  and some more devices.
> +
> +properties:
> +  compatible:
> +    const: brcm,nvram
> +
> +  reg:
> +    description: memory region with NVRAM data
> +    maxItems: 1
> +
> +required:
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nvram@1e000000 {
> +         compatible = "brcm,nvram";
> +         reg = <0x1e000000 0x10000>;
> +    };
> -- 
> 2.26.2
> 
