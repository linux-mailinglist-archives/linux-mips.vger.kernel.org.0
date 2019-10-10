Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABB2D2EAB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 18:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfJJQhU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 12:37:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35791 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJQhT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 12:37:19 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so6914246lji.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yfyOriptMBDiaNAXMAHeFqoD+N162h27NUaqIbiMn8g=;
        b=MStOefh8juSpz0SHnnQad09QT4Fa6DBUzzsFT+0kynCLK95vCaQjDcLVS5v/xzigeU
         qCpyG75sS7RxMUxZmmOhdOl/epXfJeRXXOfrA4nvR6kFbjPVCgFF5evbfVSP37qQYDxS
         fUfhRHIyYZrsNsXMHDHxL4hZCXSQD0rD3FYGQzoGBdIjSAdGPgN/CndJNspJ5TzDDt/V
         8+qfJjBselXWOwch9wHOBIMAbn0EM7xsyXfWJ/thT94GFR5K4sF+VRWYQS6DzF1vJIP6
         xnmDEvdwh7CsQgLndLAdyoT8cjr1XKTH1qVG3y9nHq3AYOlQ6yv2IxOHCjUIx8V4D+Gg
         6lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yfyOriptMBDiaNAXMAHeFqoD+N162h27NUaqIbiMn8g=;
        b=BWCX9gsh558guvZp1LoKbuMxjTkKmfWv9JtMPNqYcZ2mqN5ltyQWrXEavALr3pysbT
         7LSWoP5cvdGXEn+gAhFLI2Q+vf5BuP0LbvPoSPQCGLUAuU0+qZ/9Dl8cs+z1TbHXC6g+
         bikb4+Yi74er6FKtcARFpEG6amoQQIsVxFy3EHCDELeiyeRgjNEZiW7RHAj1eAmdxC3t
         EMNR9pMWjx2zy4ltmDQhkGZB7eHQ6CSca8Gqg8/Yd3imbx0SoQ8jnKUmLPQVyg3Gvx5x
         jmcPUpzsKVbpm+jEnsPslnAMDf5AUZqp6IwPmZgPOvcfEsHxx7p/YWBDhmoJsHysuH+s
         Vmkw==
X-Gm-Message-State: APjAAAXsCUrvBLPCM6lCR96j0L2fyS7FbTFcas7/F0a/UwAOSBID/97Q
        w3M/fkArUr0lDZa1P1bd3MiXuQ==
X-Google-Smtp-Source: APXvYqxQzg7PeYXEqZES/u8aJpwejbzcaBWpM2ZrtmNSR43Do+7YWdlXHee3xVamjDLKq3Nb1NVijA==
X-Received: by 2002:a2e:9119:: with SMTP id m25mr6930040ljg.106.1570725438077;
        Thu, 10 Oct 2019 09:37:18 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:46de:289:1600:123:1371:e3f7])
        by smtp.gmail.com with ESMTPSA id b20sm1328867ljo.106.2019.10.10.09.37.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 09:37:17 -0700 (PDT)
Subject: Re: [PATCH v9 5/5] MIPS: SGI-IP27: Enable ethernet phy on second
 Origin 200 module
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20191010145953.21327-1-tbogendoerfer@suse.de>
 <20191010145953.21327-6-tbogendoerfer@suse.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <102db20a-0c37-3e28-2d14-e9c6eaa55f5c@cogentembedded.com>
Date:   Thu, 10 Oct 2019 19:37:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191010145953.21327-6-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/10/2019 05:59 PM, Thomas Bogendoerfer wrote:

> PROM only enables ethernet PHY on first Origin 200 module, so we must
> do it ourselves for the second module.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  arch/mips/pci/pci-ip27.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/mips/pci/pci-ip27.c b/arch/mips/pci/pci-ip27.c
> index 441eb9383b20..7cc784cb299b 100644
> --- a/arch/mips/pci/pci-ip27.c
> +++ b/arch/mips/pci/pci-ip27.c
> @@ -7,6 +7,11 @@
>   * Copyright (C) 1999, 2000, 04 Ralf Baechle (ralf@linux-mips.org)
>   * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
>   */
> +#include <asm/sn/addrs.h>
> +#include <asm/sn/types.h>
> +#include <asm/sn/klconfig.h>
> +#include <asm/sn/hub.h>
> +#include <asm/sn/ioc3.h>
>  #include <asm/pci/bridge.h>
>  
>  dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> @@ -31,3 +36,20 @@ int pcibus_to_node(struct pci_bus *bus)
>  }
>  EXPORT_SYMBOL(pcibus_to_node);
>  #endif /* CONFIG_NUMA */
> +
> +static void ip29_fixup_phy(struct pci_dev *dev)
> +{
> +	int nasid = pcibus_to_node(dev->bus);
> +	u32 sid;
> +
> +	if (nasid != 1)
> +		return; /* only needed on second module */
> +
> +	/* enable ethernet PHY on IP29 systemboard */
> +	pci_read_config_dword(dev, PCI_SUBSYSTEM_VENDOR_ID, &sid);
> +	if (sid == ((PCI_VENDOR_ID_SGI << 16) | IOC3_SUBSYS_IP29_SYSBOARD))

   I thought PCI was little endian, thuis vendor ID at offset 0 and device ID
at offset 2?

[...]

MBR, Sergei
