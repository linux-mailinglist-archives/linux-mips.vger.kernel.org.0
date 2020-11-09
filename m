Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B012F2AC76D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Nov 2020 22:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgKIVi5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Nov 2020 16:38:57 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43493 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbgKIVi4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Nov 2020 16:38:56 -0500
Received: by mail-ot1-f67.google.com with SMTP id y22so10461985oti.10;
        Mon, 09 Nov 2020 13:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QwirU6kkf63KJCDD+jAsA3fw6SonTwARX/7N4DiFX1U=;
        b=emNIx4lOM1SYg5h3exI7W/ntBXDU/2xEc9hqwGfmlN747R86d6gejMX8ynAtrxyo2R
         Eb/DedSLcjERmgX4j8BF+0VU0HYyfdkzJlMA2PwcaxXxfnS7jUThDPuPar35qs/7HSbh
         iBFJDR5JXAYm4Vo/aFPyBS0GqRJHxfVa1kppXCQk5tV0Izd47VbX8oBfZa1CfJHOrW60
         x3eE0ML0zC0Z3/oEc1JPGU420WIqC67/hI4KohrDimwzgL9R87RY9U5cOIBbDl33X0BS
         kUftgTiX9kcimb84kF7VPN2VRaBXV0XwfTos+wnkFxVeOlEfJoPQidTaM/Dx311FBIzp
         tJ9A==
X-Gm-Message-State: AOAM532v/bZkQPt+HmQoY+oTMxniTr3t0B2k6bMuDeiC04hg//xvTYkj
        DaEo0cTehZcgZP7qgMwrEp8TuzP5Gw==
X-Google-Smtp-Source: ABdhPJxWanSxrFTRaRWG/6+/UQDzIFoGZ36WRK1SEKZ6/C3mMCp+LPra/plkXJY7Gin6d/Z6VCvX+g==
X-Received: by 2002:a9d:5388:: with SMTP id w8mr5929475otg.311.1604957935854;
        Mon, 09 Nov 2020 13:38:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b23sm645882ooa.13.2020.11.09.13.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:38:55 -0800 (PST)
Received: (nullmailer pid 1801928 invoked by uid 1000);
        Mon, 09 Nov 2020 21:38:54 -0000
Date:   Mon, 9 Nov 2020 15:38:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Steen.Hegelund@microchip.com, Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/9] dt-bindings: mips: Add Serval and Jaguar2
Message-ID: <20201109213854.GA1801898@bogus>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
 <20201106100849.969240-4-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106100849.969240-4-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 06 Nov 2020 11:08:42 +0100, Gregory CLEMENT wrote:
> Serval and Jaguar2 SoCs belong to the same family as Ocelot and Luton.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mscc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
