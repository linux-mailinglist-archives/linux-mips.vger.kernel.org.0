Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194271DCD61
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 14:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbgEUM65 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 08:58:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37640 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbgEUM64 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 08:58:56 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D145E803078D;
        Thu, 21 May 2020 12:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IIkDM5PcshWY; Thu, 21 May 2020 15:58:53 +0300 (MSK)
Date:   Thu, 21 May 2020 15:58:51 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        David Lechner <david@lechnology.com>,
        John Garry <john.garry@huawei.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        Sameer Pujar <spujar@nvidia.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/14] bus: cdmm: Add MIPS R5 arch support
Message-ID: <20200521125851.5upamjd7ldirj57a@mobilestation>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521003443.11385-12-Sergey.Semin@baikalelectronics.ru>
 <9ad8383b-8199-1006-cf91-d760bace705e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9ad8383b-8199-1006-cf91-d760bace705e@cogentembedded.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 01:25:21PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 21.05.2020 3:34, Serge Semin wrote:
> 
> > CDMM may be available not only MIPS R2 architectures, but also in
>                                 ^ on              -re, it's singular

Thanks, Sergey. Got it. I'll fix it in the next revision.

> 
> > newer MIPS R5 chips. For instance our P5600 chip has one. Lets mark
Probably also:                                                ^ Let's
Right?

-Sergey

> > the CDMM bus being supported for that MIPS arch too.

> > 
> > Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-mips@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> [...]
> 
> MBR, Sergei
