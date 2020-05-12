Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5471CFD4D
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgELScE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 14:32:04 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54620 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELScE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 14:32:04 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id AE8F7803088B;
        Tue, 12 May 2020 18:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yUvchHa_njd1; Tue, 12 May 2020 21:32:00 +0300 (MSK)
Date:   Tue, 12 May 2020 21:31:59 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        SoC Team <soc@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Olof Johansson <olof@lixom.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: Add Baikal-T1 L2-cache
 Control Block binding
Message-ID: <20200512183159.p5wvvozlvyz64rle@mobilestation>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
 <20200507230705.6468-1-Sergey.Semin@baikalelectronics.ru>
 <20200507230705.6468-2-Sergey.Semin@baikalelectronics.ru>
 <20200511153804.GA7015@bogus>
 <20200511202525.2qg472f5spkeajia@mobilestation>
 <CAL_JsqJEZF5xkNGGiBy5rgUFfg=hWp6qi=tzFW84cGD9m-p5SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJEZF5xkNGGiBy5rgUFfg=hWp6qi=tzFW84cGD9m-p5SA@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 11, 2020 at 05:37:41PM -0500, Rob Herring wrote:
> On Mon, May 11, 2020 at 3:25 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Mon, May 11, 2020 at 10:38:04AM -0500, Rob Herring wrote:
> > > On Fri, 8 May 2020 02:07:03 +0300, Serge Semin wrote:
> > > > There is a single register provided by the SoC system controller,
> > > > which can be used to tune the L2-cache RAM up. It only provides a way
> > > > to change the L2-RAM access latencies. So aside from "be,bt1-l2-ctl"
> > > > compatible string the device node can be optionally equipped with the
> > > > properties of Tag/Data/WS latencies.
> > > >
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > > Cc: Paul Burton <paulburton@kernel.org>
> > > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > > Cc: Olof Johansson <olof@lixom.net>
> > > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > Cc: linux-mips@vger.kernel.org
> > > > Cc: soc@kernel.org
> > > >
> > > > ---
> > > >
> > > > Changelog v2:
> > > > - Move driver to the memory subsystem.
> > > > - Use dual GPL/BSD license.
> > > > - Use single lined copyright header.
> > > > - Move "allOf" restrictions to the root level of the properties.
> > > > - Discard syscon compatible string and reg property.
> > > > - The DT node is supposed to be a child of the Baikal-T1 system controller
> > > >   node.
> > > > ---
> > > >  .../memory-controllers/baikal,bt1-l2-ctl.yaml | 59 +++++++++++++++++++
> > > >  1 file changed, 59 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> > > >
> > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > [nip] ...
> > >
> > > See https://patchwork.ozlabs.org/patch/1285665
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure dt-schema is up to date:
> > >
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > >
> > > Please check and re-submit.
> > >
> >
> > The problem is due to an absent vendor prefix in the test kernel source tree
> > environment. As I said in the cover-letter the new vendor prefix will be added
> > in the framework of the next patchset:
> > https://lkml.org/lkml/2020/5/6/1047
> >
> > Rob, please review that patchset first, merge in the corresponding patch from
> > there and test this binding out then.
> 
> Did you read the part about a 'bot'? My bot doesn't read cover letters
> and I only occasionally do. Do you want to write me a script that can
> do this?

A script, that would read a cover-letter for you? =)
Anyway I wasn't talking to the bot, but to you explaining why the problem
happened and of how to solve it. I didn't mean to blame you or the 'bot'
for not reading the letter. Sorry, if it seemed like I did.

-Sergey

> 
> Rob
