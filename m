Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBF313074
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 16:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfECOgW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 10:36:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40142 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728315AbfECOgV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 10:36:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id h4so8174884wre.7;
        Fri, 03 May 2019 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gm/cdaSgtRnAlBRNt3auiLB75Wo4JXolxnlA9E+Cylc=;
        b=Kd5O6ob0i/ZsgsPwyVaHeKSDdSuKIFlPPDqLYVy1/xJi3BxJLkIdSmkTcYRgo10igN
         mfGVNnmcTvdnmqIJMNq9UAj2OyeLNL8LTdAszLulghyj4MqlHEJb2kMvtJfFvdxclyK8
         KwH5o1D+Hh1ZN76UxE9E+tWbh0vB4YSzkMIchZ/0hD+SdLxEj2Ua6qM4wywQzKIowG0O
         xxvON8xVdw3222ED7DON6CrWdhbSGRg8iVRODA7U0OQyOKjy6AYD9pOEm9rOX8WBrJaO
         ci1oFB1edqhBpKHgWivZ3/S8nQOi58RoX+kD9pUCYfXhZ3XJxQn3SXjBSwlkByMo/YRh
         Gm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Gm/cdaSgtRnAlBRNt3auiLB75Wo4JXolxnlA9E+Cylc=;
        b=c2CeQeP63eu+JwpAmttRDJ3OcjXongjZagVKBzH9kWfk+Qdk6rxe7+s9flw45kXVNc
         B5+wmlggNnLyKqd2TxlovbV7nhNDwVmN6gq9KDBSLsFqsoIbZ8EfZi7b3wqrnTqsjfZb
         7aZaT9fw1iA06uGx76ZiE2bcj6bDClsdPCdGZyyvyyr6O5wHOPAlMmcYc4JdeU4wGfKx
         pNNDS2mFOs/iK/fEcNExqTe/b+9ifjhdy/oPsTZFnW1bTYflcBLPOeDPaS0Xiltfot/9
         bfC134URl+QFznuyMY5/VoGYQNoYLwQ2IE2/pY9LPQMPReTj8GocGBLWbMIPlX0EiyXx
         otvw==
X-Gm-Message-State: APjAAAVbIJnqWV5h6rt6VYyy9tfOQJDB6Z7izrsxCfrlA+Y7trZ6Rk2x
        HOjS+Nhi/5jq4LMa5CucDcU=
X-Google-Smtp-Source: APXvYqyqZi4/oQ6j9TTt5g6ndRNCQ8AzTSmq2XqbUl6gaptlziGURfsdQjqzFU4osgF6j06NoHvqlg==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr7005084wrr.120.1556894179433;
        Fri, 03 May 2019 07:36:19 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id b184sm3279274wmh.17.2019.05.03.07.36.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 07:36:18 -0700 (PDT)
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
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
Date:   Fri, 3 May 2019 16:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jonas,

On 5/2/19 2:26 PM, Jonas Gorski wrote:
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.

I'd have ordered this patch after the #2 of this series, or eventually
squashed both together. It is weird to document an unexistant feature
then implement it, while the opposite looks more natural.
(If you agree, maybe Paul can invert those when applying this series).

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
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
