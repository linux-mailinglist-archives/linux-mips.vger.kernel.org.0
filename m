Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507C1E2CD
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 14:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfD2Mhf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 08:37:35 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfD2Mhf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 08:37:35 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPoPd-1h7YiS0myB-00MpYJ; Mon, 29 Apr 2019 14:37:11 +0200
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, andrew@aj.id.au,
        andriy.shevchenko@linux.intel.com, macro@linux-mips.org,
        vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427133117.GC11368@kroah.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <bae3f23b-8823-f089-c40e-024ba225555f@metux.net>
Date:   Mon, 29 Apr 2019 14:37:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427133117.GC11368@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:KHUlUYtstuOEVXKZKNHyCnLCt6mq7L7HHLmuMvln4md2is42m2D
 Gvo9vOwjIRj6LOt0W8pXYE9v/qI7Zt147k18Yao4ebuIrvwMIQUsLt/uhZdnIkf6TXIF/2S
 i841E/m6um4E5qYu5wWiUl7XOuDGZarAmJeOQLoXfq89S/4wJw/bTUhC+J+wfkeAy6LT8O0
 2Q4XNEfbMs6baSq1jfeqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qsR2mgXWc80=:kOaVYs2+zc60ka2vcrJS1G
 6jjjD2rzIyURBuqEL6QGX/rLYjQoEewtndqbo2z/Zeq3LWRQK7VVV/g3jzsqHfHK0pRbR3iWW
 lHzYu+Ocphgh3aYHOj1tT4XVJikTmy1DGrmwSaYPiqxxRYGEOHHKgsd8MwiJvcyFqrJmY4bZf
 CmMGOlXqmGS4/mcQcfpGcPWy/tHy81F4dTNC+fHe1ORcaaPnQILx0hNuDe34B22WYlKx/NSnB
 G26mudb1+zA7rCK11WN5pz1xNscoklrB4MG7l23BtLE3kTqFh2AD2CWhWMF650iI91vzCekSl
 81iaSY9aOKIG/IWZlr4bOF2ADTZFekb5jsCGBI9fJ0XxDOOZmKOfU4m5yoYV3qUZjIkjqdwjR
 BNGBKyeNceGPrXYEpckfa+hDYD5k/aFeWiymyqiRbWXtiTGL1l91toEPNqF8usmeATFJZo30c
 2tPDHQVcb5UtItD0TEupC6+LC8CUPRmifWN4DmMjmQs+rYTCL7XWL72+ruXo4kMgAfKDXW0IG
 d6AUbAR06eze8qNuIXBOydRC/nRDTIv9BLJwnixcfqonqBiXSLRQ9XEhmZMC+gCQEmQPvRuGo
 v/L1GiKVpib2P2r06lK31PMfqW4f59ibIiaMTwNj/cpXrKc1s7+ephQ78zpKUW19SiZDmrDpJ
 CD2b/FyvoP+mFBB5xvOL+xjqTCggBjuFXC+oC8/QD0xSSAX2fub+agHpSpCGZT2CmyXSPquCS
 nDXXmSecoORpQFCPaPHR5Z12wTg4UfBlSqiv6ZT6mrUg8zSf+/GRQVmfBVM=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27.04.19 15:31, Greg KH wrote:
> On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
>> Using dev_err() instead of printk() for more consistent output.
>> (prints device name, etc).
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
>> ---
>>  drivers/tty/serial/dz.c | 8 ++++----
> 
> Do you have this hardware to test any of these changes with?

Unfortunately not :(


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
