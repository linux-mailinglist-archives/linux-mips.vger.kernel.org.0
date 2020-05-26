Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24B51E2697
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 18:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgEZQMg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 12:12:36 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58934 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgEZQMg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 12:12:36 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DD16A803086B;
        Tue, 26 May 2020 16:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id h4VA-Y7ucsL7; Tue, 26 May 2020 19:12:33 +0300 (MSK)
Date:   Tue, 26 May 2020 19:12:32 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-mips@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: memory: Add Baikal-T1 L2-cache
 Control Block binding
Message-ID: <20200526161232.cmrn5iydtcffua2p@mobilestation>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-4-Sergey.Semin@baikalelectronics.ru>
 <20200526160915.GA4042264@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200526160915.GA4042264@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 10:09:15AM -0600, Rob Herring wrote:
> On Tue, 26 May 2020 15:59:25 +0300, Serge Semin wrote:
> > There is a single register provided by the SoC system controller,
> > which can be used to tune the L2-cache RAM up. It only provides a way
> > to change the L2-RAM access latencies. So aside from "be,bt1-l2-ctl"
> > compatible string the device node can be optionally equipped with the
> > properties of Tag/Data/WS latencies.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: linux-mips@vger.kernel.org
> > Cc: soc@kernel.org
> > 
> > ---
> > 
> > Changelog v2:
> > - Move driver to the memory subsystem.
> > - Use dual GPL/BSD license.
> > - Use single lined copyright header.
> > - Move "allOf" restrictions to the root level of the properties.
> > - Discard syscon compatible string and reg property.
> > - The DT node is supposed to be a child of the Baikal-T1 system controller
> >   node.
> > 
> > Changelog v3:
> > - Get the reg property back even though the driver is using the parental
> >   syscon regmap.
> > - The DT schema will live separately from the system controller, but the
> >   corresponding sub-node of the later DT schema will $ref this one.
> > - Set non-default latencies in the example.
> > ---
> >  .../memory-controllers/baikal,bt1-l2-ctl.yaml | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Great! Thanks.

-Sergey
