Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A001D3BAD
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgENTEf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:04:35 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34641 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgENTEe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 15:04:34 -0400
Received: by mail-oi1-f193.google.com with SMTP id c12so16157oic.1;
        Thu, 14 May 2020 12:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2wP+XM3Aov1bJkyBy7HnnvUXG3tbJVLAv2ge5XF7T+c=;
        b=faxcvlgwUQibnpoL+dKLuipk6cSDryXN6AkmbgdEmusYId3gGpEVX5Q+PaU4Ih12x0
         Ls1k8w6t8hLH6CkiE0ZtwwFYQ0RHLK8n0bZ0DuI5zQ0La7a8udDCpGtK+EujcJci0ElL
         5mYztB9RE5mGApFWiVl8M4PmLF9onJuaE2oKSIh/NXQdrvxq8AQx/kPgbWCRhSZv47kW
         XLgD8hH8bJ6Be2uADBKaLL6oAhUjdV0ytM3UeBd8zGnxMk9/BzUjv2L0B8NViykP6MyI
         G2raD1UYA/x8DFGS//OVCXKoPX92mntBfdnXmYQEcRBXVB6Ec7CJ/fHkOxlJy/Tno4do
         ZP+g==
X-Gm-Message-State: AOAM533yi00qD80ClJlgykchHgeyndAcSDX53Y263tQgTJf6aRGgVWNs
        V74OJ+TDmLHrmKAUslFlZw==
X-Google-Smtp-Source: ABdhPJzg7GDOldcvgZzJQS6ZeGgBC1ebIOzmAOdEuhqsKev8xcTta1lwZc2MiilTX0y99+1J1dhElw==
X-Received: by 2002:aca:ebc5:: with SMTP id j188mr2653350oih.70.1589483073243;
        Thu, 14 May 2020 12:04:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n2sm6881235oie.46.2020.05.14.12.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 12:04:32 -0700 (PDT)
Received: (nullmailer pid 7214 invoked by uid 1000);
        Thu, 14 May 2020 19:04:31 -0000
Date:   Thu, 14 May 2020 14:04:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-mips@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-rtc@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: timer: Move snps,dw-apb-timer DT
 schema from rtc
Message-ID: <20200514190431.GA7149@bogus>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506214107.25956-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 May 2020 00:41:02 +0300, Serge Semin wrote:
> This binding file doesn't belong to the rtc seeing it's a pure timer
> with no rtc facilities like days/months/years counting and alarms.
> So move the YAML-file to the Documentation/devicetree/bindings/timer/
> directory.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  .../devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml (96%)
> 

Acked-by: Rob Herring <robh@kernel.org>
