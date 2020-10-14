Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820E128E148
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 15:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgJNN2A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 09:28:00 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38931 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgJNN2A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 09:28:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id f10so3401313otb.6;
        Wed, 14 Oct 2020 06:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZL5zSCW4abwqO0FHpIH/hdReN6zUDlAhI8F0pVQ1+U0=;
        b=kXO9eeC5akv8dBqT/XWAq4daeyycPlWK0Nie/VEMjubl7kcRTOKkOM4aXLpF/4U8ke
         CpRDw/jk1yPBz3U1hA3RWVBhjeU7LWh8bmIOeQ7qtda5VQXXMfEvLborNwXl0yLE3SLq
         mPLMRFICFXvXS1PqXhT9q19K1LvV5lwI4cgAgBB082qpTbumQvoKZ3likx0WbmjdkEnu
         UkXL9C/A61NJ9t0QLxBBANL0Z2W/qwxVwW+Ty711bwsvChgynaSO6eTdVCOG/YyjELS6
         SvwLhylljwxwvbZvFNMCGzaxrvgFUHnXAZCFXiNBWiFvRErWvQAcvozyyqNMwf+DXt/l
         OL9w==
X-Gm-Message-State: AOAM531Hnru0L6S2TeFbJEUMPxtaJj1j38wjXcvYITNyUFBH2vFTIMgc
        bhuDPiFKdytU/G0+7D2OCg==
X-Google-Smtp-Source: ABdhPJx7vWvJU+mgKZyS7+CbeUNCduplAaoDS6csoJj2fWAGBxKcFikhthRG5g2vB1JTOE0K/Kpwlg==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1500221oth.1.1602682078846;
        Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h25sm1165503otj.41.2020.10.14.06.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: (nullmailer pid 1539238 invoked by uid 1000);
        Wed, 14 Oct 2020 13:27:56 -0000
Date:   Wed, 14 Oct 2020 08:27:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20201014132756.GA1538723@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 27, column 14
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1382001

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

