Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 907291634D3
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2020 22:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgBRV0M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Feb 2020 16:26:12 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43762 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgBRV0M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Feb 2020 16:26:12 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so21628764oif.10;
        Tue, 18 Feb 2020 13:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FBPkXpeYhwlQjEm8h9p4qJHC0WNjgbFbJ3Ke8WGyPBM=;
        b=Rqgh2LWnOAPWjZ8KZl94JfvxtMHxu6vbYlVrPNWEsgs/AALWVNsh1NtJ5KrwOFWm1i
         NLim4Zcq0WJQkSHrLATBvI2mmSTjeUo3OvnKT+fL0niepXSbV/kd3hnGFZvLJ+53/FaP
         xLZUwd1R52xOB5xDF72l40ioriID9ov8XcF5Cqen+bvhEUtHy6d9f4o11zYYzg/YWh6s
         18ipi9sdUShAgmm+GMvW01FO+/vFNie/Mll1i1n8eB1DvOAWGYasrtnJZxlXftQFlXwL
         qK1in00QK5wQJLCW7fYrUm/xbQwZk10H7IttL26VcFzwtA/0twAiY2bur5iLtYUav4Hi
         ArSA==
X-Gm-Message-State: APjAAAWhwukuNfN/5Xyxzv9heQ34JG883/0wioVHAxV2f0iUSvBUfMus
        dZL9esWYdlFTV5prnDzFrA==
X-Google-Smtp-Source: APXvYqz+09mjoyPzbo4w/ESpYhcZUDvhBc+W905MCab1uX/0MfjKD0RzIRARpXpes5JkXIfdeYENDw==
X-Received: by 2002:aca:e106:: with SMTP id y6mr2629105oig.131.1582061171568;
        Tue, 18 Feb 2020 13:26:11 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y22sm1756180otq.31.2020.02.18.13.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:26:10 -0800 (PST)
Received: (nullmailer pid 32562 invoked by uid 1000);
        Tue, 18 Feb 2020 21:26:09 -0000
Date:   Tue, 18 Feb 2020 15:26:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: Re: [RFC v4 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Message-ID: <20200218212609.GA30081@bogus>
References: <cover.1581958529.git.hns@goldelico.com>
 <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 17, 2020 at 05:55:26PM +0100, H. Nikolaus Schaller wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> 
> This patch brings support for the JZ4780 efuse. Currently it only expose
> a read only access to the entire 8K bits efuse memory.
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../bindings/nvmem/ingenic,jz4780-efuse.txt     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt

Please convert to a DT schema.

> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
> new file mode 100644
> index 000000000000..339e74daa9a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
> @@ -0,0 +1,17 @@
> +Ingenic JZ EFUSE driver bindings
> +
> +Required properties:
> +- "compatible"		Must be set to "ingenic,jz4780-efuse"
> +- "reg"			Register location and length
> +- "clocks"		Handle for the ahb clock for the efuse.
> +- "clock-names"		Must be "bus_clk"

'clk' is redundant. How about 'ahb'?

> +
> +Example:
> +
> +efuse: efuse@134100d0 {
> +	compatible = "ingenic,jz4780-efuse";
> +	reg = <0x134100d0 0x2c>;
> +
> +	clocks = <&cgu JZ4780_CLK_AHB2>;
> +	clock-names = "bus_clk";
> +};
> -- 
> 2.23.0
> 
