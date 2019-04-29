Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4788FDCC5
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 09:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfD2HX6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 03:23:58 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbfD2HX5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 03:23:57 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7AAk-1giQjU0jDY-017SZ2; Mon, 29 Apr 2019 09:23:28 +0200
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
Message-ID: <721dc048-8b5f-e7f5-2dab-f0f328435e0c@metux.net>
Date:   Mon, 29 Apr 2019 09:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427133117.GC11368@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2yBsSwNlRemILw3qvHg+EUmYturt1pLcLjGTAKgJyue8kvRS4SA
 Ycg5vG+6X+ZgHuQ3PHVzy/Dv44Zuxjh37IHDyzF2jEvtvZGNvYkKtrnXVZYGUnPdIu0W46i
 2IMqhI87Gg+pJeqQ6/ht5bwJVFkYWHqCEPoyT4ASEIm1+8v8y21GaFqc39ZCbGTdMT51cQj
 0S+tKBdUy1LLCwqz09Z5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hvct3rbX28g=:TmP05eZMgYa4HiZY4PnD/X
 6m3IhBL+nEVPGdArSYiuiX7eZZXEk5U/K4fdA/5I69ZzNB+lgpMzTJARgTptylrCcsF+ec56R
 EcFsOKNj9r4+Pijm0w6PIOOCQR9sDUMsKWVVev1N7blGt5gqfEfHG3QYEEANluS9l3kZ85qbk
 LdiiJxi6KrmHyMeNDiFyYrsu6r5+ZF6VhCjr35ptTbfRr0e5WdHohtBwPezdwun0dBypwZywX
 L5iAIZgzdTo2KZXu+RTM7QCX25OsuIZNUK0fBx7MuFFqj8vtok69bXzmZ8j7mixBq7tx5Wrn6
 i/cdujidsg4MAPszgSCu03/hJyb8p1ELPZ5aG5Cw03pNubg+wvW0vv70xGJY2ux2SC5jfv/TZ
 0kjKPYeKxFMu/0DII+t2N4c4ZCQJKTkCH/2d297RXIqJfaPcp0I+1ngc88j46FPAj7Y/CXSna
 oWFRjB2Mk47zKZTsVGCP+SZCjO+ppRHXdfWvy2WO2L47GwCItPGmDKR1G9/dkNJT/v4lSeMO9
 8RlnxdMzk4uTIE1tZ0xj9SJNh31sjQNICyC1uJ5Jnx2LeKdeZw8Ultodwh9RHuzYigZGtEqtq
 +w5cJnlLXt6zOcX65xf+ZznoLz9/DKEE+bN1MafnjmBF5nahezF1Q9YFoj0JclEWAYzhUDE9C
 F62YYxCgxwvt3b48D5G4DMkXK5gD+OnF6o1vZQ8+QwLzMY/Vt77ayebi1+6HkKqsi3zgXZHmD
 8+778zAcA9tvPs8yE7LGV7ixGCrb8ircrZMSmUQV9blo0HEhiHR6q028GOw=
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

Do you happen to know anybody who has ?

--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
