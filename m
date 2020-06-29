Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC47020E660
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 00:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404036AbgF2Vq4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 17:46:56 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:44187 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgF2Vqy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jun 2020 17:46:54 -0400
Received: by mail-il1-f196.google.com with SMTP id w73so4010394ila.11;
        Mon, 29 Jun 2020 14:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=93evjCDhdxZ5UWBeY+2YkNq7PalFs0r3h+XQkaBP8dE=;
        b=Jn8n6FSAMp1WRC9FP4nhYyc5yzZIUJrJYvbRitDXqTh0+9F2M07/kj959pmP8c+7O2
         163nyURuKwDEz9i35weEXUawZhSRNuDe+1nJQtKwjpOutQDmXpGI10KNgHkdbx0gNvx7
         Yz3H67uBzx5plqmfaxJZuOneXyewxlbR/5qcV285XVc6qW/OkrA6lb1GtqD+hd/xNuRh
         7CpUdLEfnjLJAxJTHK5S6GiHE1pF6kwd3Fb4tbacMb/Ef5vDDsDOyWWNvX/Z12gK/jIS
         Ex4xwE6Ews3MMf9pU1VT7sP87tNcUnxle6Pa3PPTa8DbZgfmBOcQ1kgo5QEmaJsQSXpc
         PVNA==
X-Gm-Message-State: AOAM5319guXfCAtwVpDMKvYyG/5KK/rotBknpcGCgkNSJNGUtivOiHG+
        221pvJd0LixWV7LzkfN0A70zvFBUQg==
X-Google-Smtp-Source: ABdhPJy5G6waKe2rY07vRikAafpF0kBxLxk5gLmS6+u89sWZvMM/h5dLNkW6kl0bObAjVL3Cfk1hBg==
X-Received: by 2002:a92:d4cf:: with SMTP id o15mr18251954ilm.25.1593467213572;
        Mon, 29 Jun 2020 14:46:53 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id k185sm654843ilk.16.2020.06.29.14.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:46:53 -0700 (PDT)
Received: (nullmailer pid 2982377 invoked by uid 1000);
        Mon, 29 Jun 2020 21:46:52 -0000
Date:   Mon, 29 Jun 2020 15:46:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-mips@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 3/6] dt-bindings: bus: Add MIPS CDMM controller
Message-ID: <20200629214652.GA2981813@bogus>
References: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
 <20200617223201.23259-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617223201.23259-4-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 18 Jun 2020 01:31:57 +0300, Serge Semin wrote:
> It's a Common Device Memory Map controller embedded into the MIPS IP
> cores, which dts node is supposed to have compatible and reg properties.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog prev:
> - Lowercase the example hex'es.
> ---
>  .../bindings/bus/mti,mips-cdmm.yaml           | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/bus/mti,mips-cdmm.example.dt.yaml: example-0: cdmm@1bde8000:reg:0: [0, 467566592, 0, 32768] is too long


See https://patchwork.ozlabs.org/patch/1311658

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

