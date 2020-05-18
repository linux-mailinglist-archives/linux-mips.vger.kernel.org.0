Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847701D8953
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 22:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgERUfq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 16:35:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43242 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgERUfq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 16:35:46 -0400
Received: by mail-io1-f68.google.com with SMTP id h10so12150358iob.10;
        Mon, 18 May 2020 13:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JjYSpin899Gjim3f+QGoxZ4qTSeE2J/qf7iPbcWzPDE=;
        b=DbucJSVz/4utqvp0B/5RNXmetr0hh1ZPSXUzoteNtDDFY7S+RpD6PGwORIdeuAuKXB
         8EBLZ+uJ/IWlACHel13d9gScuv/ODr13F769KKcPO7loQcr1r4n1j5IQLtB3F0rcZo4z
         Ixe2nYAZzN41Lgw3DV4/Bp5zf3eptPVOWC2y6jTHzKMFxDT8UMU22JO8X6FRPBdHZAPD
         kmUDmL6g8ftfjWO6MYe5lyaFLNF4SCGi8xIMhgJoKhAfDFzHZ++neRrhuJanjOLrcHyv
         HDca5vZEr02V2CDItuWTbLzq/l3QSYp7zYaZ9nbTKYgv746qTlRuEu8PBz2DM68C+o4h
         VMCg==
X-Gm-Message-State: AOAM530s9j6omPBt+gd6WWwR0bDKIbpwvWeI5JRH0fTk9bNbUoI293Tu
        qc0HPQ+ttD0vGf1H2ihBPg==
X-Google-Smtp-Source: ABdhPJy+XxeBOrpK4uX07ks+Fl38Z36Sl0DOE11M4s2qvytoWNII6l9sRNIAJb9dbzonRTzVBICiJg==
X-Received: by 2002:a5e:8705:: with SMTP id y5mr16376190ioj.142.1589834145037;
        Mon, 18 May 2020 13:35:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u25sm4187718iob.19.2020.05.18.13.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:35:44 -0700 (PDT)
Received: (nullmailer pid 2414 invoked by uid 1000);
        Mon, 18 May 2020 20:35:42 -0000
Date:   Mon, 18 May 2020 14:35:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-mips@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/7] dt-bindings: watchdog: Convert DW WDT binding to
 DT schema
Message-ID: <20200518203542.GA2375@bogus>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510105807.880-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 May 2020 13:58:01 +0300, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with dt-schema. This commit replaces the DW Watchdog
> legacy bare text bindings with YAML file. As before the binding states
> that the corresponding dts node is supposed to have a registers
> range, a watchdog timer references clock source, optional reset line and
> pre-timeout interrupt.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Rearrange SoBs.
> - Discard BE copyright header.
> - Replace "additionalProperties: false" with "unevaluatedProperties: false"
>   property.
> - Discard interrupts property from the required properties list.
> - Remove a label definition from the binding example.
> - Move the asynchronous APB3 clock support into a dedicated patch.
> ---
>  .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 ---------
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
