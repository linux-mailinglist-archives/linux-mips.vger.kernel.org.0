Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783BE2AC776
	for <lists+linux-mips@lfdr.de>; Mon,  9 Nov 2020 22:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgKIVmD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Nov 2020 16:42:03 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45496 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgKIVmD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Nov 2020 16:42:03 -0500
Received: by mail-ot1-f65.google.com with SMTP id k3so10456527otp.12;
        Mon, 09 Nov 2020 13:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5NBtqR8i94SwVOiMrtP4aJkCAY5Lq2mIHTo/oqPBKrU=;
        b=frzbbkFwlICECJcZ1dRyINba/URY08LGq+cUm7LMnyTbF0faKi6v+LoT9HfE65m3+g
         afto+hg6c5Ps66MLt+YSjk408bNy+yhdhMTXn7oMnIxnMcYjX7KziuQ8IgYUuSb4LqX2
         DKV/TR2vSUPrXhUBdSTA+y8zKQQr7Pa8jf68ASzp/NBQze5124D5zgfeElZh1Wjj4t48
         wDE5fd9huE8mPKMHzsfatb5/qzr7df0uWPz6QVVzD72I9TWXnbsFnVVzuV7GoF9Jb2fw
         +gws/GJwBSPJDje0HI6nyraRIdJnX7eS4Jo1EjdPiVJgFtDM5X/tEIBQ/4pU1VQcxJzG
         bCkA==
X-Gm-Message-State: AOAM530myuu7cBbcJ2azuNaTHnUwVyIBxdea0CCn1zvBWY0hvBtYWMS3
        ROJn07hVbhBtklnUGFlhBw==
X-Google-Smtp-Source: ABdhPJwsPPQMMzZPoKOY2gw0t7VfNaJh2KH/fUWHrJTJPnFOlsViFYjAaXukaUT5imJ1SYtyyFO9DQ==
X-Received: by 2002:a05:6830:2401:: with SMTP id j1mr11154131ots.235.1604958121837;
        Mon, 09 Nov 2020 13:42:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i8sm2804911otl.60.2020.11.09.13.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:42:01 -0800 (PST)
Received: (nullmailer pid 1806194 invoked by uid 1000);
        Mon, 09 Nov 2020 21:42:00 -0000
Date:   Mon, 9 Nov 2020 15:42:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH 8/9] MIPS: mscc: Add jaguar2 support
Message-ID: <20201109214200.GA1802298@bogus>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
 <20201106100849.969240-10-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106100849.969240-10-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 06, 2020 at 11:08:48AM +0100, Gregory CLEMENT wrote:
> Add a device trees and FIT image support for the Microsemi Jaguar2 SoC
> which belongs to same family of the Ocelot SoC.
> 
> It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mscc.txt         |   2 +-
>  arch/mips/boot/dts/mscc/Makefile              |   3 +
>  arch/mips/boot/dts/mscc/jaguar2.dtsi          | 167 +++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_common.dtsi   |  25 ++
>  arch/mips/boot/dts/mscc/jaguar2_pcb110.dts    | 273 ++++++++++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb111.dts    | 109 +++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb118.dts    |  59 ++++
>  arch/mips/generic/Kconfig                     |   8 +
>  arch/mips/generic/Platform                    |   1 +
>  arch/mips/generic/board-jaguar2.its.S         |  40 +++
>  10 files changed, 686 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_common.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
>  create mode 100644 arch/mips/generic/board-jaguar2.its.S
> 
> diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
> index bdbebb525393..cc916eaeed0a 100644
> --- a/Documentation/devicetree/bindings/mips/mscc.txt
> +++ b/Documentation/devicetree/bindings/mips/mscc.txt
> @@ -4,7 +4,7 @@ Boards with a SoC of the Microsemi MIPS family shall have the following
>  properties:
>  
>  Required properties:
> -- compatible: "mscc,ocelot", "mscc,luton", "mscc,serval" or "mscc,jaguar2"
> +- compatible: "mscc,ocelot", "mscc,luton", "mscc,serval" or "mscc,jr2"

Goes in patch 2.

>  
>  
>  * Other peripherals:
