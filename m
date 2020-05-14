Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A021D3BFC
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgENTGj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:06:39 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39394 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbgENTGg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 15:06:36 -0400
Received: by mail-oi1-f196.google.com with SMTP id s198so1674769oie.6;
        Thu, 14 May 2020 12:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DpxmqheKh5hWBkROUkM/LZbskUu+jI9OekkxfEH2TJU=;
        b=jKy7Tet+7kDtJP9R6aI+d8Svebs+UjREUdZ4tc2TdAvfvztTuKXHjAmyRSN0CBV1Q/
         dxvG/6SUt6irrsNnl6a0dPCzvcj4TdC5IMnDOtDFVUJadbHI68V2GPc/9f05cZniOtzK
         r9C+YtaerxaUcO9+HPJlpz4nIAPTWxRRCcG4zaicP583zNnhEq7PXGRURF1C3vEMx4mi
         hgO0UABInDxKiWNjWhBYll3gpmk/LJv70q5UuGcPnC5tHfGGYPzuu2DR2bI6P1sBxkNt
         E8YRkhn/S554bIy5Z6oAdajQqlzO3/aGo24ltCKJg7mCc5yBgKMGMa11x9bgNBkD9eth
         1jIQ==
X-Gm-Message-State: AGi0PuY1Gl5VTAaxaKzDUO2jOMhYMI2HC5m9TVwbAco1zgpzuVr8zFSy
        kuocz8Wlg9I/fG8v2+Igug==
X-Google-Smtp-Source: APiQypIbLInN8eILN1YNFZkdZUWzlrI5ZKISbq/8Sj2LCEhqvwhh/jfweZsVFtDXqGRZI3Q/OW8ccg==
X-Received: by 2002:aca:3254:: with SMTP id y81mr11673521oiy.172.1589483194829;
        Thu, 14 May 2020 12:06:34 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 130sm3531979oid.43.2020.05.14.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 12:06:33 -0700 (PDT)
Received: (nullmailer pid 10001 invoked by uid 1000);
        Thu, 14 May 2020 19:06:32 -0000
Date:   Thu, 14 May 2020 14:06:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: interrupt-controller: Convert
 mti,gic to DT schema
Message-ID: <20200514190632.GA9943@bogus>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506214107.25956-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 May 2020 00:41:03 +0300, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with DT schema. This commit replaces MIPS GIC legacy bare
> text binding with YAML file. As before the binding file states that the
> corresponding dts node is supposed to be compatible with MIPS Global
> Interrupt Controller indicated by the "mti,gic" compatible string and
> to provide a mandatory interrupt-controller and '#interrupt-cells'
> properties. There might be optional registers memory range,
> "mti,reserved-cpu-vectors" and "mti,reserved-ipi-vectors" properties
> specified.
> 
> MIPS GIC also includes a free-running global timer, per-CPU count/compare
> timers, and a watchdog. Since currently the GIC Timer is only supported the
> DT schema expects an IRQ and clock-phandler charged timer sub-node with
> "mti,mips-gic-timer" compatible string.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> 
> ---
> 
> I don't really know who is the corresponding driver maintainer, so I
> added Paul to the maintainers property since he used to be looking for the
> MIPS arch and Thomas looking after it now. Any idea what email should be
> specified there instead?
> 
> Changelog v3:
> - Since timer sub-node has no unit-address, the node shouldn't be named
>   with one. So alter the MIPS GIC bindings to have a pure "timer"
>   sub-node.
> - Discard allOf: [ $ref: /schemas/interrupt-controller.yaml# ].
> - Since it's a conversion patch use GPL-2.0-only SPDX header.
> ---
>  .../interrupt-controller/mips-gic.txt         |  67 --------
>  .../interrupt-controller/mti,gic.yaml         | 148 ++++++++++++++++++
>  2 files changed, 148 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
