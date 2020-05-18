Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB171D895B
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgERUhB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 16:37:01 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39601 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgERUhB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 16:37:01 -0400
Received: by mail-io1-f66.google.com with SMTP id x5so12205449ioh.6;
        Mon, 18 May 2020 13:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=maD0ppKYJ7je4QqoqARMwqKB21hv70JnBqRQ8v0vZmg=;
        b=a427LGABgzvym5luL0Z940CimxBSSM+9osWrfJZEowuf0B7BqAk3Rfc+YzhaxY1ogb
         F8PaLtxBnJzU5ccYa/bFM2VoxyZWQ3SAwQ4s1n9TIdHGQGUZgRE97WxfddKgW7YJeCFy
         Nh458dY+gFS8R6MOM4RR2PPqMjgULvyeEVIWAzko6UFW1vsauvHKlx5sN594XQEoCzpO
         KJhNft5+TaQHAWRsySTaZucRv8g2z5IbNnYOYgpttXKqgOXalViRC0ojzrKyC60ANi+Z
         qczdGM7nE1QEKMXCZSU7cnzj6hKpWgpC0U+m6eOEVhdFfurJTGdxKMwF1uQBSv0XNt+1
         akyw==
X-Gm-Message-State: AOAM531STOZ34Z02SDOOdhhx8bEN+kbPWHpHizX5Xlj6FaUC1NfO+T7v
        /iTeGBK4DwvQjmC5Eq3nGgKzUJ4=
X-Google-Smtp-Source: ABdhPJxE/qWKbc17Mtav/AVaoDCy+0wh0bRCLCebBPZYBi35q0xepdmj6CiWSymLoooGykarvJZnqQ==
X-Received: by 2002:a05:6638:277:: with SMTP id x23mr17549228jaq.122.1589834219099;
        Mon, 18 May 2020 13:36:59 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d29sm5200575ild.42.2020.05.18.13.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:36:58 -0700 (PDT)
Received: (nullmailer pid 4708 invoked by uid 1000);
        Mon, 18 May 2020 20:36:55 -0000
Date:   Mon, 18 May 2020 14:36:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2 2/7] dt-bindings: watchdog: dw-wdt: Support devices
 with asynch clocks
Message-ID: <20200518203655.GA4570@bogus>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 May 2020 13:58:02 +0300, Serge Semin wrote:
> DW Watchdog IP core can be synthesised with asynchronous timer/APB
> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> a separate clock signal is supposed to be used to feed watchdog timer
> and APB interface of the device. Lets along with the watchdog timer
> reference clock expect to have the optional APB3 bus interface clock
> sepcified in a DW WDT dt node.
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
> - It's a new patch unpinned from the previous one.
> ---
>  .../devicetree/bindings/watchdog/snps,dw-wdt.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
