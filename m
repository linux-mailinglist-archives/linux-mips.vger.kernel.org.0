Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64CE2D4128
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 12:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgLILce convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 9 Dec 2020 06:32:34 -0500
Received: from aposti.net ([89.234.176.197]:33654 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgLILce (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Dec 2020 06:32:34 -0500
Date:   Wed, 09 Dec 2020 11:31:41 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE()
 =?UTF-8?Q?and=0D=0A?= IF_ENABLED() macros
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <TCL2LQ.PG7DIQPDDGUT1@crapouillou.net>
In-Reply-To: <CACRpkdZFy8bvsV+HkzWsu0OKjg6i82o-mL+7v3_Ev5h_QR=xiA@mail.gmail.com>
References: <20201208164821.2686082-1-paul@crapouillou.net>
        <CACRpkdZFy8bvsV+HkzWsu0OKjg6i82o-mL+7v3_Ev5h_QR=xiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

Le mer. 9 déc. 2020 à 9:59, Linus Walleij <linus.walleij@linaro.org> 
a écrit :
> On Tue, Dec 8, 2020 at 5:48 PM Paul Cercueil <paul@crapouillou.net> 
> wrote:
> 
>>  Introduce a new header <linux/if_enabled.h>, that brings two new 
>> macros:
>>  IF_ENABLED_OR_ELSE() and IF_ENABLED().
> 
> I understand what the patch is trying to do, but when we already have
> IS_ENABLED() in <linux/kconfig.h> this syntax becomes a big cognitive
> confusion for the mind.
> 
> At least the commit needs to explain why it doesn't work to use
> IS_ENABLED() instead so that this is needed.

You can use IS_ENABLED(). Then you'd write:

field = IS_ENABLED(CONFIG_FOO) ? &my_ptr : NULL,

the IF_ENABLED() macro makes it a bit cleaner by allowing you to write:

field = IF_ENABLED(CONFIG_FOO, &my_ptr),

Cheers,
-Paul

> Certainly the build failures must be possible to solve so that this
> can live with the sibling IS_ENABLED() inside <linux/kconfig.h>,
> it can't be too hard.
> 
> Yours,
> Linus Walleij


