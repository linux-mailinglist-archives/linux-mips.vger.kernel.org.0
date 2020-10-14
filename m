Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21E828E60B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 20:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgJNSLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 14:11:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49752 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbgJNSLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 14:11:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 263C4803073E;
        Wed, 14 Oct 2020 18:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ntl7Ii8wms8a; Wed, 14 Oct 2020 21:11:40 +0300 (MSK)
Date:   Wed, 14 Oct 2020 21:11:36 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Florian Fainelli <f.fainelli@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Message-ID: <20201014181136.5hwsu77rv3wbxw7w@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
 <ed0221ee-c586-b8f8-a7d1-4a2a190dc41b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ed0221ee-c586-b8f8-a7d1-4a2a190dc41b@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 11:00:45AM -0700, Florian Fainelli wrote:
> On 10/14/20 3:14 AM, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
> > incompatible names.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > files. I did only a manual grepping of the possible nodes dependencies.
> 

> Not sure how you envisioned these change to be picked up, but you may
> need to split these changes between ARM/ARM64, MIPS and PowerPC at
> least. And within ARM/ARM64 you will most likely have to split according
> to the various SoC maintainers.

Hmm, I don't really know how it's going to be done in this case, but there must
be a way to get the cross-platform patches picked up in general. For
instance, see the patches like:
714acdbd1c94 arch: rename copy_thread_tls() back to copy_thread()
140c8180eb7c arch: remove HAVE_COPY_THREAD_TLS
They touched the files from different files, but still have been merged in.
Maybe I should have copied these three patches to the "linux-arch@vger.kernel.org"
list or some other mailing list...

-Sergey

> -- 
> Florian
