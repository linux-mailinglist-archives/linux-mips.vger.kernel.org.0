Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 894EF1261A
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 03:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfECBoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 21:44:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35526 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbfECBop (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 21:44:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id t87so1473881pfa.2;
        Thu, 02 May 2019 18:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0nrMTxs245O8nXXx5BH8Cly3ldRcaEr58uJxaEc0foM=;
        b=EJwEB5Pil+8RHcFooouIl/TUbVS3rl9joo5MoXVSfcDPxqeDNt0qOcT+YBU47pRyA7
         PyUTswKHdjPSXFpqf7HQD1UkMHiYJGqsAUdltUkQigEvGWOmkShNZ+DenOLV2LiId+nD
         fXbpckomAKwdvGs7nCUyTSeI/K8WeXldiqLoJ2Pv6vrEbloPi9/C1rT4rPjjHyiAYcHH
         0GiKHwpW7R71I+chMK/ZTFMdItKlMzg+eEoEB7NyMGGEyo0WddmGReH00M1g1KrSbJ6P
         WO/koXJhwKgTt/XnwwBuISqQePIYybXpSXCuYZJgPQMNeG94QQ6gXTHHer6xFU96HTfv
         CCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0nrMTxs245O8nXXx5BH8Cly3ldRcaEr58uJxaEc0foM=;
        b=JjRh173zD0vgM+wQqEwOpVGtgPqjcnJ4XtKNmCooBngOc9iuKskjlzNHFDmNk2OEBw
         9IhG0g+M/fxF//2+6UDLOo2CX53uQv8S46WTxrQrl79NBbyzgXUG7fmn+gOG4WRwAG6X
         2uA7FaHR6tbndsp3Q4+W7QwZcCJEHe0NG3ImDHFzmfK7ZHHMMqp/XIYqtRFOfL/1MLPH
         JpaQb0qXwa0sU5uY2SJG43hqXpfY2fYBhDd1uTKov4L+1bzcyq5YPo0mFAYuBSjIzltZ
         3TCm/elo2F6UlYKHe5rCJPbckAE4A6VFLHlm/+1Y0gut4gKC6z5JL7cD860/cubTNnKI
         Tw8w==
X-Gm-Message-State: APjAAAWOzjb+OkTUJ5HMXGpmkrG1ZKhps7m3u/wnyzCXeo97+ZGrYo88
        A4epGZH4IZ4KKWKyw/vMDGk=
X-Google-Smtp-Source: APXvYqxNY0xtwadcYbK37MNq3RsPF7Jhrdqu/SPcx/DEQzX3udD2fIzcn5qG27cOjXN/WF8A5RwkWA==
X-Received: by 2002:a62:46c7:: with SMTP id o68mr7860805pfi.54.1556847884792;
        Thu, 02 May 2019 18:44:44 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id m21sm584878pff.146.2019.05.02.18.44.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 18:44:43 -0700 (PDT)
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <27a90951-9525-c9b2-2c61-1a5db345cd70@gmail.com>
Date:   Thu, 2 May 2019 18:44:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 5/2/2019 5:26 AM, Jonas Gorski wrote:
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
>  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> new file mode 100644
> index 000000000000..3041657e2f96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> @@ -0,0 +1,22 @@
> +Gated Clock Controller Bindings for MIPS based BCM63XX SoCs
> +
> +Required properties:
> +- compatible: must be one of:
> +	 "brcm,bcm3368-clocks"
> +	 "brcm,bcm6328-clocks"
> +	 "brcm,bcm6358-clocks"
> +	 "brcm,bcm6362-clocks"
> +	 "brcm,bcm6368-clocks"
> +	 "brcm,bcm63268-clocks"

We could always add 6348/6338 to that list later one.

> +
> +- reg: Address and length of the register set
> +- #clock-cells: must be <1>
> +
> +
> +Example:
> +
> +clkctl: clock-controller@10000004 {
> +	compatible = "brcm,bcm6328-clocks";
> +	reg = <0x10000004 0x4>;
> +	#clock-cells = <1>;
> +};
> 

-- 
Florian
