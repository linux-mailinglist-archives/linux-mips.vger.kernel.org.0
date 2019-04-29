Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7691BDFB3
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 11:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfD2Jnt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 05:43:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:56163 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfD2Jnt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 05:43:49 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2m3G-1gdyq42eM8-0133kZ; Mon, 29 Apr 2019 11:43:20 +0200
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
To:     Esben Haabendal <esben@haabendal.dk>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, andriy.shevchenko@linux.intel.com,
        macro@linux-mips.org, vz@mleia.com, slemieux.tyco@gmail.com,
        khilman@baylibre.com, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <87ef5lz423.fsf@haabendal.dk>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <d0b966eb-46b7-d145-92ed-3c62c495f41b@metux.net>
Date:   Mon, 29 Apr 2019 11:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87ef5lz423.fsf@haabendal.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:68dkhGSAKsaCjO526gNf2WSoTW6jL84pVEW36g5e32fJf4hZfEa
 B5yR5eOo/trCHlzEMiqf88gr4lugIpFcu4i7DTW0T8FoWZiDwOwvxkhUV//Oq9txPyP1qxO
 p0s8teHbOF2xnbWjYTCy/e6+F0vybuPcYhQPvcgRagIqrGRZ5ZI4QdP/10WEUP7zI9Ka+YU
 NVd7BerOC+zYOaIOiK9cQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NvmcDnTkNeI=:ba8d+q8YRab3rFKFqBt24t
 Zg9Zpq/zp8ESR/s4VsMdM2nnOKEofNFRgQuqib0Eoa+F6Di5aptfGcy2fbPQ8PlEnZZ9eFk2I
 W8lkLs1brmFQ4pMtwo1NaxLwJO+yyvyfB7yhUe3mP3ipOkVy3TvxwOqCpUxbn7cvLhhjdXYOV
 RACHse6YI1rEPLKisTi4jbY/Z2xia1z7JZNNtXMm7NyYuxlDHoAmeM51Uq1Sm9jqHrh3VjIFE
 zH5gWFbcmJhRKcS506T4D0qDLdiTRWb5HWe08PMYOLEyCWt6KkONz7ZlQEuLletC4+ebSyFne
 +YblDaPDYWW6s7TMZS94IzEKoglkP06ZU7juKMArxn0JPRB97yN78PMrSGLDm4zCHngdgwukX
 8QhoUFb/g5oGgRP7xEm3XeyGV0XvRu9ft3THf7jFb/oF+7zCYEmaFMR7HLRHU94BxlelmoOUT
 hf0mEVyRlee3ckCEnDTzSPPktrpdeTwqaoCQIhlRInQVIwdhHJ8XZKfDN1mzvZ2IlFCWEBcMH
 +/+AxD4dkbOiJWktWAReEU2MAQiJAuIPnt8UjKkg2V6v0lHpO3+n8CFCI9Jvijm6LfpHzTHUN
 Z7KbPljaibH9464lnBZleel3EqRWzc88wYjkyJ4C3GZdlzFeP8imAVrJmxNQRR3yOT8ND3ssO
 MC6KOR0+WrmqVYkvJIvXzV6xd3FMar2vZbSJ2ckBe+smk2GbBP44mQDVVrZ5aKzyo4QDZBzHk
 BkVF8qEdunqnt+mSaL40iQ9yOh8uAqzpNBWyyGax+adypiNnzhrhF9jigoE=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29.04.19 09:03, Esben Haabendal wrote:

> Why not simply replace iobase, mapbase and mapsize with a struct
> resource value instead?

That was actually my original goal, when I started this. But the
situation is a bit more tricky. Many drivers (especially the old ones)
initialize these fields in different ways. And there're many places
accessing these fields.

Drivers for old devices should be handled w/ great care. I don't have
access to all that hardware, so I can't test it. Therefore, I'm trying
to move in small steps. One step ahead another.

One of my next steps would be factoring out more common operations
(eg. mapping, etc) into helpers, up to a point, where someday no driver
is accessing these fields directly anymore.

Then we could easily move everything into struct resource. On that
road, we'd also need to find a way for handling the specialities of
the various UPIO_* modes via struct resource.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
