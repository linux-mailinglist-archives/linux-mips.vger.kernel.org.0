Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EF720E64E
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 00:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404127AbgF2VqQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 17:46:16 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44090 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403971AbgF2VqP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jun 2020 17:46:15 -0400
Received: by mail-il1-f193.google.com with SMTP id w73so4008872ila.11;
        Mon, 29 Jun 2020 14:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uyW+jW1awHxTjKyRxm3xfnDiRBllSD4XGWQa5b78Aw8=;
        b=bvczna650WplwrbE2t7lBZio1h82/M0jvHqMsVdFzDLnwQFT7OHKuk6ME5eHq6C7rI
         INRc3gxByEzTCDdE1Rblvl0dRi0VUEOIiz/eUjDXGg+7xEJ2tj7qevgFZHHMV85Xvswz
         cDvF/sAXKN8AoSqsNLHiTrwHZ++2hmE809fM+zcOpevJuL7j4TfKaJfdNTDT42MIukqU
         w7cw0uatIu09PN4lUBHI+UxikLJQd6m2SQ5F2FChin9O56LWMKkhwVG7E3fS2QxVFScJ
         VOm1qsH9Fspg8qd90mqmE0PoPtvpXRLndSEzDQTT2u3CPLJ84Jhddiogeou/pgHILVMX
         GnrA==
X-Gm-Message-State: AOAM530t+ex3qOLtQ+bOv5I1nLSdenyrJEMRcrLykP5qF6glB9Tm6xCN
        p6h69JFn1NdGNlHJheg1bQ==
X-Google-Smtp-Source: ABdhPJxBseoySQnNrO/ucBAVbxE8Ve40ZGwZtZVMP9DsPrIAMec0KapS8vUwFpWKDddIkdU/wn0rOw==
X-Received: by 2002:a92:b684:: with SMTP id m4mr17425649ill.153.1593467174525;
        Mon, 29 Jun 2020 14:46:14 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id z9sm612748ilz.45.2020.06.29.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:46:13 -0700 (PDT)
Received: (nullmailer pid 2980772 invoked by uid 1000);
        Mon, 29 Jun 2020 21:46:12 -0000
Date:   Mon, 29 Jun 2020 15:46:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: power: Convert mti,mips-cpc to DT
 schema
Message-ID: <20200629214612.GA2979868@bogus>
References: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
 <20200617223201.23259-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617223201.23259-2-Sergey.Semin@baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 18 Jun 2020 01:31:55 +0300, Serge Semin wrote:
> It's a Cluster Power Controller embedded into the MIPS IP cores.
> Currently the corresponding dts node is supposed to have compatible
> and reg properties.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> 
> ---
> 
> Changelog prev:
> - Reword the changelog summary - use shorter version.
> - Lowercase the example hex'es.
> ---
>  .../bindings/power/mti,mips-cpc.txt           |  8 -----
>  .../bindings/power/mti,mips-cpc.yaml          | 35 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 8 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
>  create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/mti,mips-cpc.example.dt.yaml: example-0: cpc@1bde0000:reg:0: [0, 467533824, 0, 32768] is too long


See https://patchwork.ozlabs.org/patch/1311661

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

