Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E31DC2A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 08:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfD2Gtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 02:49:31 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:53559 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbfD2Gtb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 02:49:31 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mcp3E-1gl7730n7C-00ZzhK; Mon, 29 Apr 2019 08:48:59 +0200
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, macro@linux-mips.org, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        davem@davemloft.net, jacmet@sunsite.dk, linux@prisktech.co.nz,
        matthias.bgg@gmail.com, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <20190428152103.GP9224@smile.fi.intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <431b36fe-3071-fcfd-b04e-b4b293e79a80@metux.net>
Date:   Mon, 29 Apr 2019 08:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428152103.GP9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:M88UFXLBX4VkHOON6uaOcOnE636KnuLI4S/ApACS+qnAPKvNe1+
 9MFUOX3DMU30BBIWozSwvAEA9pGnmBl6OGeXBQ8Y1viVSeN44w0UCqfu9VYX20rWKj/nkKL
 vlvP3uU93E8RgsPKi9ujRFjje3G/Y2BUL7L9RvbqLvk4fuIny6ic9WkRhGLxllJ4DYLhyIb
 wH0HgSJz+Bi+9teW53wMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UkSaLiNxTwM=:2TXPwgpE5+RBFRbyUqHOFQ
 xeHDo/3j0Na0BnkC+0JTCEUa34sTmyQbRB7w4ugZtpJdoNSu1xdU+BMA09hadC91DTT1c0yzO
 kuk7XpLkyI+N0+19kIGZ5gCjqYsD/gbKZ8Qyy9JocWvi4y1vEXHasSDdt8iTaU9VrQLQy8flK
 qSDevaqy2gkfA3bR4BtjfkFZnSKHQtpDiqq3mXC+4IcTnAFIySQzIAlEJJiI55bqb+tSkbzKq
 owQcCerB9D3TCNpnxqqLNVjWK+g79RDFMzNjrcbVvEkGniIRma6jIIKMCyNf42DVoMiMrhh0x
 aXAPFtRiFh/GxROS/IxKSP4wV6B5wR/h27VqFY21bHhQofeIIGTmI0KiIabQGBsdW35kxOhxg
 1i/1jG+pgigRkOKnignHIi2N2wHB6JAqxpWKLNKvEGWP50G0wE8Z6ORBFJtpohgAXfmwiFBxW
 3n1pn+bbr+SvajsKMQUl3+ZkelGKovLL03+RClDxUZP2SUJsaCOHtLAKZGFiCfwViK8E8xgfT
 G9pOuAh4EzKSrpcY52lyA+aZpShZ857A09XO01lj1MT/UIHMroXwGqPKTYB4pmEmeIzsrBOO+
 5T+0kwhObrwWG+hIxyGgBRbGwhYmyae04xr2e8gQMLYXfoA6nSOT3OsoSAIHPclTioTlxFhoE
 Oa4DTHlLTaZWs27uSZAC9epbFBl9Fx2JmP26IreUA0ypMl3yx9fpLArWCrivScL7WAoEN62AS
 VaOqKOyMslPbPSY1JUwq9qDAdgT3eIjQcZTeU8BmLykfVe2cq22dosTi4sw=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28.04.19 17:21, Andy Shevchenko wrote:

> 
>> +#define SERIAL_RT2880_IOSIZE	0x100
> 
> And why this is in the header file and not in corresponding C one?

hmm, no particular reason, maybe just an old habit to put definitions
into .h files ;-)

I can move it to 8250_of.c if you like me to.



--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
