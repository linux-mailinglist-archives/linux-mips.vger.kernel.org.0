Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210D01DC419
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgEUAmV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:42:21 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33320 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgEUAmU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:42:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B5B668030779;
        Thu, 21 May 2020 00:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 64TghbS4nfSD; Thu, 21 May 2020 03:42:18 +0300 (MSK)
Date:   Thu, 21 May 2020 03:42:17 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/14] mips: Prepare MIPS-arch code for Baikal-T1 SoC
 support
Message-ID: <20200521004217.6gdcpboxaqizreky@mobilestation>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 03:34:29AM +0300, Serge Semin wrote:
>

[nip]

> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4

Thomas,
Please note that this patchset is based on the Linux 5.7-rc4 tree (it most likely
will get cleanly applied on rc6 as well), while mips-next is still at rc1. Due
to that the patchset fails to be applied on mips-next. I think it would be
better first to merge the last Linux tree into the mips-next, then try to merge
this patchset in. Should you have any problem after that, please let me know.
I'll resend the patchset being rebased on top of the new mips-next tree.

-Sergey


