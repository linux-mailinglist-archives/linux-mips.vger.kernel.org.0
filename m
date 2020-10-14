Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F7028E555
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJNR1Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 13:27:16 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49508 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732068AbgJNR1Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 13:27:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 68971803017E;
        Wed, 14 Oct 2020 17:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PkbvMsci3JDb; Wed, 14 Oct 2020 20:27:12 +0300 (MSK)
Date:   Wed, 14 Oct 2020 20:27:10 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        <devicetree@vger.kernel.org>, Roger Quadros <rogerq@ti.com>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201014172710.iay3lvb37saeksaj@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
 <20201014132756.GA1538723@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201014132756.GA1538723@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 08:27:56AM -0500, Rob Herring wrote:
> On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> > The host controller device might be designed to work for the particular
> > products or applications. In that case its DT node is supposed to be
> > equipped with the tpl-support property.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Grammar fix: "s/it'/its"
> > - Discard '|' from the property description, since we don't need to preserve
> >   the text formatting.
> > ---
> >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
>   in "<unicode string>", line 27, column 14
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
> make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
> make: *** [Makefile:1366: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1382001
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

Hm, that's weird. Of course I did the dt_binding_check before submission, but
even after the dt-schema repo update I failed to see the error:

$ make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/usb-hcd.yaml
  CHKDT   Documentation/devicetree/bindings/usb/usb-hcd.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml

Rob, any idea why has the bot got mad at me?

-Sergey

> 
