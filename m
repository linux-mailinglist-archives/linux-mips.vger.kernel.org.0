Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7441704D7
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgBZQwO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 11:52:14 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46096 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgBZQwO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 11:52:14 -0500
Received: by mail-oi1-f193.google.com with SMTP id a22so114718oid.13;
        Wed, 26 Feb 2020 08:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CT/DItuaw3l7e50kJnxY0hxdVtAyvWVe9vwmyIht9Vk=;
        b=cLvf5gcfXl9dYhWCR+lSPdru8aPS2oppMuXJjqnTmRgfoNTN4PKCRE0wef1ayyJLVN
         Eo+5Cehlxv6a9dBF3/M3zDz6Hl4TrYTHpo8QYWYLXCa+Wqw773ph8nfKu3/RH1O/CexJ
         DMfFlaDVicUq2BDrhQmxeJfsRWEGAhAtW+7PT0EKq/d5NsVyafCtB9W2yfdZt6ZbMAcZ
         bUapXyWzKxf/Uu7I6f5FDFhriTLuwbUek4vXoj3fRjcIfAtSEE3xGglM5/OGHgG9mXsR
         mtMYN1G334SU2EVueZTdXC4RdnyDcZDa9ZClHcbHmrYnqGSlEwGQqrerSqAdym1gBbHq
         uqZg==
X-Gm-Message-State: APjAAAXR7lQXusVp7lDrZAZiPjlCKjCPBerkBsD4O7l0JcRcnw9Gg0sj
        KlbhgXUv8D2AZc217nLavg==
X-Google-Smtp-Source: APXvYqxEE7ByWeDuhPUb4V+kWugwfZsSqUl0AI3AjBihCF1X5fH3wv9zsrqmq9nmfmvQQ7aDM+oCSQ==
X-Received: by 2002:aca:2307:: with SMTP id e7mr3849467oie.163.1582735933081;
        Wed, 26 Feb 2020 08:52:13 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u66sm975100oie.17.2020.02.26.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:52:12 -0800 (PST)
Received: (nullmailer pid 25334 invoked by uid 1000);
        Wed, 26 Feb 2020 16:52:11 -0000
Date:   Wed, 26 Feb 2020 10:52:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 07/10] dt-bindings: mips: Add loongson boards
Message-ID: <20200226165211.GA20809@bogus>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
 <20200221050942.507775-8-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221050942.507775-8-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 21, 2020 at 01:09:22PM +0800, Jiaxun Yang wrote:
> Prepare for later dts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/mips/loongson/devices.yaml       | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> new file mode 100644
> index 000000000000..32bec784da87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson based Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +description: |
> +  Devices with a Loongson CPU shall have the following properties.

Perhaps some details about the platform.

> +  Note that generic device is used for built-in dtbs and will be
> +  patched during boot on firmware without OF support.

That's a kernel detail that doesn't belong here. (BTW, built-in dtb 
support is intended as a transition step for bootloaders without dtb 
knowledge. It's not the recommended way and shouldn't be used on new 
platforms).

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: Generic Loongson3 4Core + RS780E
> +        items:
> +          - const: loongson,loongson3-4core-rs780e
> +
> +      - description: Generic Loongson3 8Core + RS780E
> +        items:
> +          - const: loongson,loongson3-8core-rs780e
> +...
> -- 
> 2.25.0
> 
> 
