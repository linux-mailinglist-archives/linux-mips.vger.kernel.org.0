Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46584338A38
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 11:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhCLKep (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 05:34:45 -0500
Received: from elvis.franken.de ([193.175.24.41]:52584 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233407AbhCLKem (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 05:34:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lKf7u-0007WV-05; Fri, 12 Mar 2021 11:34:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29B11C1E4A; Fri, 12 Mar 2021 11:29:24 +0100 (CET)
Date:   Fri, 12 Mar 2021 11:29:24 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] mips: bmips: include dt-bindings headers
Message-ID: <20210312102924.GF7027@alpha.franken.de>
References: <20200812063129.361862-1-noltari@gmail.com>
 <20210224093856.2021-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210224093856.2021-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 24, 2021 at 10:38:49AM +0100, Álvaro Fernández Rojas wrote:
> Allow including dt-bindings header files for bcm63xx.
> 
>  v2: remove irqs header and add more bindings.
> 
> Álvaro Fernández Rojas (7):
>   mips: dts: brcm: allow including header files
>   mips: bmips: bcm3368: include dt-bindings
>   mips: bmips: bcm6328: include dt-bindings
>   mips: bmips: bcm6358: include dt-bindings
>   mips: bmips: bcm6362: include dt-bindings
>   mips: bmips: bcm6368: include dt-bindings
>   mips: bmips: bcm63268: include dt-bindings
> 
>  arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts    | 2 +-
>  arch/mips/boot/dts/brcm/bcm3368.dtsi                   | 3 +++
>  arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts | 2 +-
>  arch/mips/boot/dts/brcm/bcm63268.dtsi                  | 5 +++++
>  arch/mips/boot/dts/brcm/bcm6328.dtsi                   | 5 +++++
>  arch/mips/boot/dts/brcm/bcm6358-neufbox4-sercomm.dts   | 2 +-
>  arch/mips/boot/dts/brcm/bcm6358.dtsi                   | 4 ++++
>  arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts   | 2 +-
>  arch/mips/boot/dts/brcm/bcm6362.dtsi                   | 5 +++++
>  arch/mips/boot/dts/brcm/bcm6368.dtsi                   | 4 ++++
>  arch/mips/boot/dts/brcm/bcm93384wvg.dts                | 2 +-
>  arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts          | 2 +-
>  arch/mips/boot/dts/brcm/bcm96368mvwg.dts               | 2 +-
>  arch/mips/boot/dts/brcm/bcm97125cbmb.dts               | 2 +-
>  arch/mips/boot/dts/brcm/bcm97346dbsmb.dts              | 4 ++--
>  arch/mips/boot/dts/brcm/bcm97358svmb.dts               | 4 ++--
>  arch/mips/boot/dts/brcm/bcm97360svmb.dts               | 2 +-
>  arch/mips/boot/dts/brcm/bcm97362svmb.dts               | 4 ++--
>  arch/mips/boot/dts/brcm/bcm97420c.dts                  | 2 +-
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts               | 4 ++--
>  arch/mips/boot/dts/brcm/bcm97435svmb.dts               | 4 ++--
>  arch/mips/boot/dts/brcm/bcm9ejtagprb.dts               | 2 +-
>  22 files changed, 47 insertions(+), 21 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
