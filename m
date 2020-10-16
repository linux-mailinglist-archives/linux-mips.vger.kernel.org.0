Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8A82908B6
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 17:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410364AbgJPPoJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 11:44:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37991 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408644AbgJPPoJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 11:44:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id i12so2800149ota.5;
        Fri, 16 Oct 2020 08:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y6uUrO47xJuekVbKZFp61eOF00usAMuQ8nla70UX51Q=;
        b=bfDZdKMfUChC3ieC0oqXkGkkXdaml38F0N2cURVjGWfXPSVXFIus1hgl2LHdt5HihK
         hlNITOROAV46r3pLknjiWtb3HapuWR+0gT9ZjdYPwUR+jMRe9L3XqOLauigKxB5OCs+j
         f6MgwXOefI80oL3AUJxbtz2+H5R0RG5fVlk42nDp+5qqK5+FP4TBI39nhLXNq0Ea8aoJ
         ALGzxcgupEPcEjL/Sj3CxrH6YDMkUyp88OpOBR73Gaz2bqhbIy0g4+dStcxZXKTz4uZN
         3OrzUjHyv/lYU37P0hAm52VHz+tfTbgrliTlGANcx8KyrERBaF9Bidk7NWzNaV9ccw2x
         rUvQ==
X-Gm-Message-State: AOAM5337E0LJ+GwuXG3ypLikjIzjhAZYxnZoXxagjvC0q6Y19uy0sUY+
        /DbkwkDWjeXyIjHb3cw+1g==
X-Google-Smtp-Source: ABdhPJzyKW8ZO4qbCpHyH61FZ7oq0uCuGGIquis4K3Bt8t41p/hh05+oeioUYSSIX2RPEiqRi1znjQ==
X-Received: by 2002:a9d:7387:: with SMTP id j7mr3154048otk.18.1602863048717;
        Fri, 16 Oct 2020 08:44:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n23sm1257578oon.14.2020.10.16.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 08:44:08 -0700 (PDT)
Received: (nullmailer pid 1466778 invoked by uid 1000);
        Fri, 16 Oct 2020 15:44:06 -0000
Date:   Fri, 16 Oct 2020 10:44:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201016154406.GA1452617@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
 <20201014132756.GA1538723@bogus>
 <20201014172710.iay3lvb37saeksaj@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014172710.iay3lvb37saeksaj@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 08:27:10PM +0300, Serge Semin wrote:
> On Wed, Oct 14, 2020 at 08:27:56AM -0500, Rob Herring wrote:
> > On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> > > The host controller device might be designed to work for the particular
> > > products or applications. In that case its DT node is supposed to be
> > > equipped with the tpl-support property.
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > 
> > > ---
> > > 
> > > Changelog v2:
> > > - Grammar fix: "s/it'/its"
> > > - Discard '|' from the property description, since we don't need to preserve
> > >   the text formatting.
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > Traceback (most recent call last):
> >   File "/usr/local/bin/dt-extract-example", line 45, in <module>
> >     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
> >   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
> >     return constructor.get_single_data()
> >   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
> >     node = self.composer.get_single_node()
> >   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
> >   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
> >   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
> >   File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
> >   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> > ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
> >   in "<unicode string>", line 27, column 14
> > make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
> > make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
> > make[1]: *** Waiting for unfinished jobs....
> > ./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
> > make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
> > make: *** [Makefile:1366: dt_binding_check] Error 2
> > 
> > 
> > See https://patchwork.ozlabs.org/patch/1382001
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> > 
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > 
> > Please check and re-submit.
> 
> Hm, that's weird. Of course I did the dt_binding_check before submission, but
> even after the dt-schema repo update I failed to see the error:
> 
> $ make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/usb-hcd.yaml
>   CHKDT   Documentation/devicetree/bindings/usb/usb-hcd.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
>   DTC     Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
> 
> Rob, any idea why has the bot got mad at me?

Humm, I'm not sure. We'll see if it happens again when you send v2.

Note that yamllint is also run now and that's the line with '[error]'. 
So neither yamllint nor ruamel are happy (could be the same parser code 
ultimately).

Rob
