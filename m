Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774D91E85D6
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgE2Rya (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:54:30 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35662 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgE2Rya (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 13:54:30 -0400
Received: by mail-il1-f195.google.com with SMTP id a14so3378180ilk.2;
        Fri, 29 May 2020 10:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JRLQD8tZL6OQnQHTqlPhbsa62qbf/5d0HG4XhZBvQ5w=;
        b=h7I2XJDxPcRk8BWN5nPZe0cF09lXraftJ4Ivi3ODU4Zey/LbVGBT8pHBlp5uEHaAuP
         WE+z5Lx0ObSQR6jFzSPWuPXEjGO1uvHKvjP8cXzrIAlUETbZXCG5nQ4aeT274G9J0UrD
         C72g6nh79iM8gcFidCPd7T3lLC2sfSrByfiDlSNIWs5LfIjBF6IBVJkeApj/9N3I1+7I
         jorzyrmkJwnX3I1clZjriKo0JSk6BhtxmguI8rZ1l9ewSrlFcXLdaQypw9HaYU3htbBF
         o3cLTeMyjmXDfghQrvT1tTe1sy/eEdknJEKRdQK/oAxakJJ1CYzymHD7zOBAp7g32skK
         a0Zg==
X-Gm-Message-State: AOAM533+nQksb7cAbnBmlKu3OVTVpON3AUClF2ixTrRUSgpPz8HRo/Xu
        5+CmdEN3VuO/tW/8gWeVHw==
X-Google-Smtp-Source: ABdhPJw3BuIponOiJUvjhEg0SQfwbXTvL50hkGcPP9yZXqPug/g0lgkyMlDOD4T/PK7RUlC/nD+QzQ==
X-Received: by 2002:a92:d591:: with SMTP id a17mr8913352iln.13.1590774868655;
        Fri, 29 May 2020 10:54:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p75sm5118764ilb.23.2020.05.29.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:54:27 -0700 (PDT)
Received: (nullmailer pid 2652931 invoked by uid 1000);
        Fri, 29 May 2020 17:54:26 -0000
Date:   Fri, 29 May 2020 11:54:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
Message-ID: <20200529175426.GA2652858@bogus>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
 <20200526222056.18072-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526222056.18072-2-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 May 2020 01:20:53 +0300, Serge Semin wrote:
> Baikal-T1 Clocks Control Unit is responsible for transformation of a
> signal coming from an external oscillator into clocks of various
> frequencies to propagate them then to the corresponding clocks
> consumers (either individual IP-blocks or clock domains). In order
> to create a set of high-frequency clocks the external signal is
> firstly handled by the embedded into CCU PLLs. So the corresponding
> dts-node is just a normal clock-provider node with standard set of
> properties. Note as being part of the Baikal-T1 System Controller its
> DT node is supposed to be a child the system controller node.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Rearrange the SoBs.
> - Discard comments in the bindings file header.
> - Add dual GPL/BSD license.
> - Add spaces around the ASCII-graphics in the binding description.
> - Remove reference to Documentation/devicetree/bindings/clock/clock-bindings.txt
>   file.
> - Discard redundant object check against "/schemas/clock/clock.yaml#" schema.
> - Discard redundant descriptions of the "#clock-cells" property.
> - Remove "reg" property since from now the clock DT node is supposed to be
>   a child of the syscon-compatible system controller node.
> - Remove "clock-output-names" property support.
> - Replace "additionalProperties: false" with "unevaluatedProperties: false".
> - Lowercase the nodes name in the examples.
> - Use "clock-controller" node name suffix in the examples.
> - Remove unnecessary comments in the clocks dt-bindings header file.
> 
> Changelog v3:
> - Get the reg property back even though the driver is using the parental
>   syscon regmap.
> - The DT schema will live separately from the system controller, but the
>   corresponding sub-node of the later DT schema will $ref this one.
> ---
>  .../bindings/clock/baikal,bt1-ccu-pll.yaml    | 131 ++++++++++++++++++
>  include/dt-bindings/clock/bt1-ccu.h           |  16 +++
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
>  create mode 100644 include/dt-bindings/clock/bt1-ccu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
