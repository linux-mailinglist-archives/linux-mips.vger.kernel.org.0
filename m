Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEEC11A493A
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 19:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDJRiR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 13:38:17 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38419 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRiR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 13:38:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id w2so1969304oic.5;
        Fri, 10 Apr 2020 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xMUIst4uwZNit/kezR50BEXwVLAD+7IMlqqlt2PZF4M=;
        b=MwN06PBL/Zz+t7pQqPpKtwGRhwv0uLVp6kWSeLkTUWLmw/YSEClMMAkk/0rMo5TLmv
         fwcEo8nSrl/yW1Ra35tB+Qx48Cpl3z8rrY9CHpTiZf9ed0ZQqgyLnUvt31oLWhzB4Hfy
         ErErJHK5ocFhbRhFaJWSykerVd1H31RyOC6PMMafzOGRl2Kzw65+xf3zwMPrV3r278tr
         /oPJ+ox2bY1yXvGeqwG7rirZLfI+mvESXlvb5QZ5kOSJbNLxyhaaEQTGmld14MGG/ARe
         VilhMp/GeVxz9DSiquYqkgmCFZ0aVxHKwE5k+LSoLErU8gJr9fNXh8HV6qBS8IvtvijZ
         xQFw==
X-Gm-Message-State: AGi0Pua0W++e08jKEEoo2WlJLxqz+oERP+omUjTabVkfoekaMFEt9kHa
        f7IO+ZR6vhiAsPOWfWoFaouQ36M=
X-Google-Smtp-Source: APiQypJwusuEqgU1CYkOWOgcrzLL32tqNKeweZKcGAtisZ1kThdf4338Sn41hKMfM5QqP5/sISiZCg==
X-Received: by 2002:aca:891:: with SMTP id 139mr4109648oii.137.1586540295214;
        Fri, 10 Apr 2020 10:38:15 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id 89sm1469196otj.66.2020.04.10.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:38:14 -0700 (PDT)
Received: (nullmailer pid 12197 invoked by uid 1000);
        Fri, 10 Apr 2020 16:52:01 -0000
Date:   Fri, 10 Apr 2020 11:52:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Philipp Rossak <embed3d@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
Message-ID: <20200410165201.GA9521@bogus>
References: <cover.1585503505.git.hns@goldelico.com>
 <000359713a45bb1a1adc0b609e4e659aedf99e6c.1585503505.git.hns@goldelico.com>
 <0E273453-861D-45A2-8FA4-D5EC4B78F490@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0E273453-861D-45A2-8FA4-D5EC4B78F490@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 07, 2020 at 09:00:48AM +0200, H. Nikolaus Schaller wrote:
> 
> > Am 29.03.2020 um 19:38 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > The Imagination PVR/SGX GPU is part of several SoC from
> > multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> > Allwinner A83 and others.
> > 
> > With this binding, we describe how the SGX processor is
> > interfaced to the SoC (registers, interrupt etc.).
> > 
> > In most cases, Clock, Reset and power management is handled
> > by a parent node or elsewhere (e.g. code in the driver).
> > 
> > Tested by make dt_binding_check dtbs_check
> > 
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > ---
> > .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 109 ++++++++++++++++++
> > 1 file changed, 109 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > new file mode 100644
> > index 000000000000..aadfb2d9b012
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Imagination PVR/SGX GPU
> > +
> > +maintainers:
> > +  - H. Nikolaus Schaller <hns@goldelico.com>
> > +
> > +description: |+
> > +  This binding describes the Imagination SGX5 series of 3D accelerators which
> > +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
> > +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> > +
> > +  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
> > +
> > +  The SGX node is usually a child node of some DT node belonging to the SoC
> > +  which handles clocks, reset and general address space mapping of the SGX
> > +  register area.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: SGX530-121 based SoC
> > +        items:
> > +          - enum:
> > +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
> > +          - const: img,sgx530-121
> > +          - const: img,sgx530
> > +
> > +      - description: SGX530-125 based SoC
> > +        items:
> > +          - enum:
> > +            - ti,am3352-sgx530-125 # BeagleBone Black
> > +            - ti,am3517-sgx530-125
> > +            - ti,am4-sgx530-125
> > +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
> > +            - ti,ti81xx-sgx530-125
> > +          - const: ti,omap3-sgx530-125
> > +          - const: img,sgx530-125
> > +          - const: img,sgx530
> > +
> > +      - description: SGX535-116 based SoC
> > +        items:
> > +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
> > +          - const: img,sgx535-116
> > +          - const: img,sgx535
> > +
> > +      - description: SGX540-116 based SoC
> > +        items:
> > +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
> > +          - const: img,sgx540-116
> > +          - const: img,sgx540
> > +
> > +      - description: SGX540-120 based SoC
> > +        items:
> > +          - enum:
> > +            - ingenic,jz4780-sgx540-120 # CI20
> > +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
> > +          - const: img,sgx540-120
> > +          - const: img,sgx540
> > +
> > +      - description: SGX544-112 based SoC
> > +        items:
> > +          - const: ti,omap4-sgx544-112
> > +          - const: img,sgx544-112
> > +          - const: img,sgx544
> > +
> > +      - description: SGX544-116 based SoC
> > +        items:
> > +          - enum:
> > +            - allwinner,sun8i-a83t-sgx544-116 # Banana-Pi-M3 (Allwinner A83T) and similar
> 
> Philipp Rossak reported on a different list [1] that the a83t tells to have a sgx544-115 inside.
> 
> So it needs a separate entry.

Okay, it looks fine otherwise.

Rob
