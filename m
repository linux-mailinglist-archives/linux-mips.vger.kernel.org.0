Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969743431DA
	for <lists+linux-mips@lfdr.de>; Sun, 21 Mar 2021 10:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCUJVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Mar 2021 05:21:16 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:48191 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229990AbhCUJUr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Mar 2021 05:20:47 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lNuGE-003lHF-1r; Sun, 21 Mar 2021 10:20:38 +0100
Received: from p57bd9a6f.dip0.t-ipconnect.de ([87.189.154.111] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lNuGD-001TwM-Dq; Sun, 21 Mar 2021 10:20:37 +0100
Subject: Re: remove the legacy ide driver
To:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20210318045706.200458-1-hch@lst.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <4ac2f934-fa64-f8c2-8a4d-4b15c8a421a6@physik.fu-berlin.de>
Date:   Sun, 21 Mar 2021 10:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.154.111
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Christoph!

On 3/18/21 5:56 AM, Christoph Hellwig wrote:
> libata mostly covers all hardware supported by the legacy ide driver.
> There are three mips drivers that are not supported, but the linux-mips
> list could not identify any users of those.  There also are two m68k
> drivers that do not have libata equivalents, which might or might not
> have users, so we'll need some input and possibly help from the m68k
> community here.

I think those drivers were the Q60 driver and the MacIDE driver, weren't they?

Either way, I have so far been unsuccessful in obtaining access to these machines
but I assume once we gain access to such machines, Bartlomiej could convert the
drivers the same way he already converted the falcon, gayle and buddha drivers,
for example.

One could also just convert the drivers to libata and include them untested, the
conversion itself seems pretty little work for someone experienced with libata.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

