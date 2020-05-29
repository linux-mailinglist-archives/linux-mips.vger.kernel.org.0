Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F7D1E85E7
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgE2Rz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:55:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39940 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgE2Rz0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 13:55:26 -0400
Received: by mail-io1-f65.google.com with SMTP id q8so254077iow.7;
        Fri, 29 May 2020 10:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sCElFn+makF2xMc8PNzE2ZdGJ2SF/IkCYZnmaXWZ07M=;
        b=KwRTYO3GVz49OgLxTScBWlH2rqxuhPXxrcHA6AZL8tfnF5vOvbdIGxNHQy8F9FLs3k
         czNdazm7wpPed7/mpCmwKt97KRRZTc2YcWXIpinP0xF/uDIEdZpd3X99ep6PbIlvVX84
         FoWKWmIE2coM7Qf1Q3zeYjBE1GF1wUHFWntUv37SS2LDvl0X4Ky5ls4D/9wKnqy5Lvxg
         aSamg1Cshe04DKh0ov66Exb8ua2CwepnxVRhxNUiH/k4TbJN42/zwznPJkflkPvjIvxv
         w8NnHQqlDY8SuwrmbnfnmTajBqNwiSMG1vfHlSdkltYGo6M/1iT7gVfRFqHYs2Bicw43
         EuaQ==
X-Gm-Message-State: AOAM533hGY6WuoAOfsaMR1QWjX5NC/vbpGfwTOMXJtUXGCp4LRanhP4t
        P29JNYHcgXH/o32sNiVN3A==
X-Google-Smtp-Source: ABdhPJyGRSx1zsGx+aFM0ozLHvmn8pMnMIcHM8KSYgsavJtSR8i09xTEaDAwLEQvRAlf5guJKCIO+A==
X-Received: by 2002:a05:6638:272:: with SMTP id x18mr8282523jaq.122.1590774925354;
        Fri, 29 May 2020 10:55:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c70sm2626688ila.42.2020.05.29.10.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:55:24 -0700 (PDT)
Received: (nullmailer pid 2654498 invoked by uid 1000);
        Fri, 29 May 2020 17:55:23 -0000
Date:   Fri, 29 May 2020 11:55:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: clk: Add Baikal-T1 CCU Dividers
 binding
Message-ID: <20200529175523.GA2654444@bogus>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru>
 <20200526222056.18072-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526222056.18072-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 May 2020 01:20:54 +0300, Serge Semin wrote:
> After being gained by the CCU PLLs the signals must be transformed to
> be suitable for the clock-consumers. This is done by a set of dividers
> embedded into the CCU. A first block of dividers is used to create
> reference clocks for AXI-bus of high-speed peripheral IP-cores of the
> chip. The second block dividers alter the PLLs output signals to be then
> consumed by SoC peripheral devices. Both block DT nodes are ordinary
> clock-providers with standard set of properties supported. But in addition
> to that each clock provider can be used to reset the corresponding clock
> domain. This makes the AXI-bus and System Devices CCU DT nodes to be also
> reset-providers.
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
> - Combine AXI-bus and System Devices CCU bindings into a single file.
> - Discard comments in the bindings file header.
> - Add dual GPL/BSD license.
> - Add spaces around the ASCII-graphics in the binding description.
> - Remove reference to Documentation/devicetree/bindings/clock/clock-bindings.txt
>   file.
> - Discard redundant object check against "/schemas/clock/clock.yaml#" schema.
> - Discard redundant descriptions of "#clock-cells" and "#reset-cells"
>   properties.
> - Discard "reg" property since the CCU dividers DT nodes are supposed be
>   children of the syscon-compatible system controller node.
> - Remove "clock-output-names" property support.
> - Replace "additionalProperties: false" with "unevaluatedProperties: false".
> - Lowercase the nodes name in the examples.
> - Use "clock-controller" node name suffix in the examples.
> - Remove unnecessary comments in the clocks and resets dt-binding header
>   files.
> - Discard label definitions in the examples.
> 
> Changelog v3:
> - Get the reg property back even though the driver is using the parental
>   syscon regmap.
> - The DT schema will live separately from the system controller, but the
>   corresponding sub-node of the later DT schema will $ref this one.
> ---
>  .../bindings/clock/baikal,bt1-ccu-div.yaml    | 188 ++++++++++++++++++
>  include/dt-bindings/clock/bt1-ccu.h           |  32 +++
>  include/dt-bindings/reset/bt1-ccu.h           |  25 +++
>  3 files changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
>  create mode 100644 include/dt-bindings/reset/bt1-ccu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
