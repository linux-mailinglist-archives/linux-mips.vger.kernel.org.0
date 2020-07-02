Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2DC2120B3
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2020 12:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgGBKMz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Jul 2020 06:12:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:46108 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgGBKMz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 Jul 2020 06:12:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jqwD4-0001E1-00; Thu, 02 Jul 2020 12:12:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 151F3C0725; Thu,  2 Jul 2020 12:12:29 +0200 (CEST)
Date:   Thu, 2 Jul 2020 12:12:29 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v2 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200702101229.GA9924@alpha.franken.de>
References: <20200602183354.39707-1-zhouyanjie@wanyeetech.com>
 <20200602183354.39707-2-zhouyanjie@wanyeetech.com>
 <20200619110524.GA9391@alpha.franken.de>
 <CAOMZO5CuxzMm+XFX6-mh55mcw5jgf5iYs-ej5NqjCsD6hSnr7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5CuxzMm+XFX6-mh55mcw5jgf5iYs-ej5NqjCsD6hSnr7Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 29, 2020 at 04:28:31PM -0300, Fabio Estevam wrote:
> On Fri, Jun 19, 2020 at 9:48 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Wed, Jun 03, 2020 at 02:33:54AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> > > Document the available properties for the SoC root node and the
> > > CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> > >
> > > Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> > > Tested-by: Paul Boddie <paul@boddie.org.uk>
> > > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > > ---
> > >
> > > Notes:
> > >     v1->v2:
> > >     1.Remove unnecessary "items".
> > >     2.Add "clocks" as suggested by Paul Cercueil.
> > >
> > >  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 67 ++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> >
> > applied to mips-next.
> 
> This causes 'make dt_binding_check' to fail:
> 
> $ make dt_binding_check
>   CHKDT   Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml:
> while scanning a block scalar
>   in "<unicode string>", line 42, column 5
> found a tab character where an indentation space is expected
>   in "<unicode string>", line 46, column 1
> Documentation/devicetree/bindings/Makefile:20: recipe for target
> 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts'
> failed
> make[1]: *** [Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts]
> Error 1
> Makefile:1343: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2


thank you for noticing. It's my fault, I've changed spaces into tabs while
applying, which is of course wrong for yaml files... I've commited a fix
for this to mips-next and 'make dt_binding_check' now passes for me.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
