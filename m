Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACE52D410E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 12:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730447AbgLIL2E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 9 Dec 2020 06:28:04 -0500
Received: from aposti.net ([89.234.176.197]:60676 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgLIL2D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Dec 2020 06:28:03 -0500
Date:   Wed, 09 Dec 2020 11:27:07 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE()
 =?UTF-8?Q?and=0D=0A?= IF_ENABLED() macros
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        MIPS <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        od@zcrc.me, Linux ARM <linux-arm-kernel@lists.infradead.org>
Message-Id: <75L2LQ.XOYPRHI9W3U9@crapouillou.net>
In-Reply-To: <CAMj1kXGXsTTtPLX0HM3_HYRBTJ8q+w09xgXs9BXMSe8GLtk2YQ@mail.gmail.com>
References: <20201208164821.2686082-1-paul@crapouillou.net>
        <CAMj1kXGXsTTtPLX0HM3_HYRBTJ8q+w09xgXs9BXMSe8GLtk2YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ard,

Le mer. 9 déc. 2020 à 10:38, Ard Biesheuvel <ardb@kernel.org> a 
écrit :
> On Tue, 8 Dec 2020 at 17:49, Paul Cercueil <paul@crapouillou.net> 
> wrote:
>> 
>>  Introduce a new header <linux/if_enabled.h>, that brings two new 
>> macros:
>>  IF_ENABLED_OR_ELSE() and IF_ENABLED().
>> 
>>  IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO 
>> is set
>>  to 'y' or 'm', (b) otherwise. It is used internally to define the
>>  IF_ENABLED() macro. The (a) and (b) arguments must be of the same 
>> type.
>> 
>>  IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set 
>> to 'y'
>>  or 'm', NULL otherwise. The (ptr) argument must be a pointer.
>> 
>>  The IF_ENABLED() macro can be very useful to help GCC drop dead 
>> code.
>> 
>>  For instance, consider the following:
>> 
>>      #ifdef CONFIG_FOO_SUSPEND
>>      static int foo_suspend(struct device *dev)
>>      {
>>         ...
>>      }
>>      #endif
>> 
>>      static struct pm_ops foo_ops = {
>>          #ifdef CONFIG_FOO_SUSPEND
>>          .suspend = foo_suspend,
>>          #endif
>>      };
>> 
>>  While this works, the foo_suspend() macro is compiled conditionally,
>>  only when CONFIG_FOO_SUSPEND is set. This is problematic, as there 
>> could
>>  be a build bug in this function, we wouldn't have a way to know 
>> unless
>>  the config option is set.
>> 
>>  An alternative is to declare foo_suspend() always, but mark it as 
>> maybe
>>  unused:
>> 
>>      static int __maybe_unused foo_suspend(struct device *dev)
>>      {
>>         ...
>>      }
>> 
>>      static struct pm_ops foo_ops = {
>>          #ifdef CONFIG_FOO_SUSPEND
>>          .suspend = foo_suspend,
>>          #endif
>>      };
>> 
>>  Again, this works, but the __maybe_unused attribute is required to
>>  instruct the compiler that the function may not be referenced 
>> anywhere,
>>  and is safe to remove without making a fuss about it. This makes the
>>  programmer responsible for tagging the functions that can be
>>  garbage-collected.
>> 
>>  With this patch, it is now possible to write the following:
>> 
>>      static int foo_suspend(struct device *dev)
>>      {
>>         ...
>>      }
>> 
>>      static struct pm_ops foo_ops = {
>>          .suspend = IF_ENABLED(CONFIG_FOO_SUSPEND, foo_suspend),
>>      };
>> 
>>  The foo_suspend() function will now be automatically dropped by the
>>  compiler, and it does not require any specific attribute.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Hi Paul,
> 
> I understand the issue you are trying to address here, but please note
> that there are many cases where the struct member in question will not
> even be declared if the associated CONFIG option is not set, in which
> case this will cause a compile error.

Of course. This is for the case where the field is always present. For 
instance, (struct device_driver *)->pm is always present, independently 
of CONFIG_PM.

Cheers,
-Paul

> 
>>  ---
>>   include/linux/if_enabled.h | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 include/linux/if_enabled.h
>> 
>>  diff --git a/include/linux/if_enabled.h b/include/linux/if_enabled.h
>>  new file mode 100644
>>  index 000000000000..8189d1402340
>>  --- /dev/null
>>  +++ b/include/linux/if_enabled.h
>>  @@ -0,0 +1,22 @@
>>  +/* SPDX-License-Identifier: GPL-2.0 */
>>  +#ifndef __LINUX_IF_ENABLED_H
>>  +#define __LINUX_IF_ENABLED_H
>>  +
>>  +#include <linux/build_bug.h>
>>  +#include <linux/compiler_types.h>
>>  +#include <linux/kconfig.h>
>>  +
>>  +/*
>>  + * IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if 
>> CONFIG_FOO is set
>>  + * to 'y' or 'm', (b) otherwise.
>>  + */
>>  +#define IF_ENABLED_OR_ELSE(option, a, b) \
>>  +       (BUILD_BUG_ON_ZERO(__same_type((a), (b))) || 
>> IS_ENABLED(option) ? (a) : (b))
>>  +
>>  +/*
>>  + * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is 
>> set to 'y'
>>  + * or 'm', NULL otherwise.
>>  + */
>>  +#define IF_ENABLED(option, ptr) IF_ENABLED_OR_ELSE(option, ptr, 
>> NULL)
>>  +
>>  +#endif /* __LINUX_IF_ENABLED_H */
>>  --
>>  2.29.2
>> 
>> 
>>  _______________________________________________
>>  linux-arm-kernel mailing list
>>  linux-arm-kernel@lists.infradead.org
>>  http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


