Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6716DC2839
	for <lists+linux-mips@lfdr.de>; Mon, 30 Sep 2019 23:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbfI3VGw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 17:06:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37008 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730886AbfI3VGw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Sep 2019 17:06:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so12457760oie.4;
        Mon, 30 Sep 2019 14:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R+ScOBn956KzGEkg9VCnHI1hFy+s6fYadz+MoOpEicw=;
        b=pjMhvLmNowUPj7raJGbALN8qwn2QitiKVSbnhv+BIlTh+Rmd/0WCVMGtPBDmoI4sPz
         aahwHYHCakYIrFFOEND1JFsPVLyPItHuoEYhUg2HQ8RpAmpfYYZABFe+8JPQjWDI+APO
         Q1KthcPJ7n43F9YoLZTjU52JVkOjUvcErYOxzX0CI6YUMn45XMfv9GjwdEJb4vtUpb+e
         FJeONc84A3EtJUXFrCZFzLaZgUvmybymJbJf9zQlS/JTWnSQbHQdHHeSxmBLP4EGgHb3
         NHfz1ki50qt/LP18hQXOSq7p5bIBCxvb6+O8AXa/Iv6RWZmBClHkfvbhzV5ReWwEZ/D4
         kFKA==
X-Gm-Message-State: APjAAAWqkvhoApMoy1CGuFKaNYJkkGTzgBbc11R4y74q5tntO9csSean
        8a/YnCy1LNW52qxrJd0vlF/xeZM=
X-Google-Smtp-Source: APXvYqxJdj7UgIetkxyOJuuB+3gPijhJfnPX8rakxTFVB90F9LrBkIwQZ2VZisQ5soTIpdHmL7I2rw==
X-Received: by 2002:aca:50ca:: with SMTP id e193mr643865oib.110.1569870350475;
        Mon, 30 Sep 2019 12:05:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e61sm4090614ote.24.2019.09.30.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 12:05:49 -0700 (PDT)
Date:   Mon, 30 Sep 2019 14:05:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: Document brcm,irq-can-wake for
 brcm,bcm7038-l1-intc.txt
Message-ID: <20190930190549.GA21236@bogus>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-3-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913191542.9908-3-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 13, 2019 at 12:15:39PM -0700, Florian Fainelli wrote:
> The BCM7038 L1 interrupt controller can be used as a wake-up interrupt
> controller on MIPS and ARM-based systems, document the brcm,irq-can-wake
> which has been "standardized" across Broadcom interrupt controllers.

Not clear that that got much review...

We have a defined way to indicate wakeup sources (which maybe didn't 
exist in 2014), why can't that be used? If a device can wakeup the 
system, I'd think we can just assume that the parent interrupt 
controller(s) can support that.

In any case, I'm not going to stand in the way of this:

Acked-by: Rob Herring <robh@kernel.org>

> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
> index 2117d4ac1ae5..4eb043270f5b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
> @@ -31,6 +31,11 @@ Required properties:
>  - interrupts: specifies the interrupt line(s) in the interrupt-parent controller
>    node; valid values depend on the type of parent interrupt controller
>  
> +Optional properties:
> +
> +- brcm,irq-can-wake: If present, this means the L1 controller can be used as a
> +  wakeup source for system suspend/resume.
> +
>  If multiple reg ranges and interrupt-parent entries are present on an SMP
>  system, the driver will allow IRQ SMP affinity to be set up through the
>  /proc/irq/ interface.  In the simplest possible configuration, only one
> -- 
> 2.17.1
> 
