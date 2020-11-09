Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49432AC76B
	for <lists+linux-mips@lfdr.de>; Mon,  9 Nov 2020 22:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgKIVii (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Nov 2020 16:38:38 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35737 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbgKIVii (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Nov 2020 16:38:38 -0500
Received: by mail-ot1-f66.google.com with SMTP id n11so10478143ota.2;
        Mon, 09 Nov 2020 13:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=THbpsAgZffwkJyrnzFdQ9z7KMTPF2guFD3oxlAfzckg=;
        b=PPsbPVR0HTJqERtBkXN1pyyruo97+wT+0f3lMoiZg+Ok5sYBpZB8j9p90lGXp3g/Qy
         NrhQ62l45lM3sPoaxD357rn0wrA7E8m1pYPJr8KwGLrMGx4NmP5Nu6kXSOLS9gzwd2AG
         oakSImKOo40GO5dNRPObOuGr5vJYGXZZcx6y0HYLzigWiThTtEC5vmpE3uaEVYQxYjGq
         FO81EJDoXNyKRSWXYxplnRY9lxk8Ai0H5M8DKGMMTSM/qL7tEaQYC1qv2dpnx4PGtfVV
         onNa/nKL8ivx6wxeBHDDs3MsLZoMqQNYYLgXkPBBC2YLGOmUln1a8sOiUYeCD8ehbelD
         4/2w==
X-Gm-Message-State: AOAM533tqnlpKiNOr4QiY4YP6rp3BIlITUCSDLElw0UhJhBkuqv68/4P
        T01MNdkUf51dlkJWV48F+mMtYmpKLg==
X-Google-Smtp-Source: ABdhPJxkPD6M4wVAJu0cXAumUtuTLR9OdyJSYc9ZxFSWyAmt0pCSirtgBQjilZxUFtmvxPiLwS+ZOg==
X-Received: by 2002:a9d:7692:: with SMTP id j18mr2256368otl.132.1604957917361;
        Mon, 09 Nov 2020 13:38:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t199sm2654565oif.25.2020.11.09.13.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:38:36 -0800 (PST)
Received: (nullmailer pid 1801331 invoked by uid 1000);
        Mon, 09 Nov 2020 21:38:35 -0000
Date:   Mon, 9 Nov 2020 15:38:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Steen.Hegelund@microchip.com, devicetree@vger.kernel.org,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [PATCH 1/9] dt-bindings: mips: Add Luton
Message-ID: <20201109213835.GA1801281@bogus>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
 <20201106100849.969240-3-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106100849.969240-3-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 06 Nov 2020 11:08:41 +0100, Gregory CLEMENT wrote:
> Luton SoC belongs to the same family as Ocelot.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mscc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
