Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAADC60732D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Oct 2022 11:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiJUJCx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Oct 2022 05:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiJUJCw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Oct 2022 05:02:52 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DCA22527CE;
        Fri, 21 Oct 2022 02:02:48 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1olnvQ-0005Yy-00; Fri, 21 Oct 2022 11:02:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BE3E6C0D46; Fri, 21 Oct 2022 10:47:13 +0200 (CEST)
Date:   Fri, 21 Oct 2022 10:47:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@fungible.com>,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hauke@hauke-m.de,
        zajec5@gmail.com, zhouyanjie@wanyeetech.com,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com,
        f.fainelli@gmail.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: mips: add CPU bindings for MIPS
 architecture
Message-ID: <20221021084713.GA5976@alpha.franken.de>
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
 <20221006042945.1038594-2-sergio.paracuellos@gmail.com>
 <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
 <CAMhs-H8tMP-TyH9dBeO5dGe8spu3h6571-Zeo=_Xshh04x+w1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H8tMP-TyH9dBeO5dGe8spu3h6571-Zeo=_Xshh04x+w1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 17, 2022 at 07:53:00AM +0200, Sergio Paracuellos wrote:
> On Thu, Oct 6, 2022 at 1:24 PM Philippe Mathieu-Daudé
> <philmd@fungible.com> wrote:
> >
> > On 6/10/22 06:29, Sergio Paracuellos wrote:
> > > Add the yaml binding for available CPUs in MIPS architecture.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >   .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
> > >   .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
> > >   .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
> > >   3 files changed, 115 insertions(+), 77 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
> > >   create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
> > >   delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> >
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@fungible.com>
> 
> Thanks!
> 
> Thomas, are this series going through your tree?

I'll take them.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
