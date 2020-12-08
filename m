Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5A02D34BF
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 22:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgLHVAK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 8 Dec 2020 16:00:10 -0500
Received: from aposti.net ([89.234.176.197]:42030 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbgLHVAK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Dec 2020 16:00:10 -0500
Date:   Tue, 08 Dec 2020 19:00:22 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE()
 =?UTF-8?Q?and=0D=0A?= IF_ENABLED() macros
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <MGB1LQ.44LK9O2T0H6E1@crapouillou.net>
In-Reply-To: <cf2f222b-e7cc-c7b7-2586-31dd3df7c0c7@infradead.org>
References: <20201208164821.2686082-1-paul@crapouillou.net>
        <cf2f222b-e7cc-c7b7-2586-31dd3df7c0c7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Randy,

Le mar. 8 déc. 2020 à 9:39, Randy Dunlap <rdunlap@infradead.org> a 
écrit :
> On 12/8/20 8:48 AM, Paul Cercueil wrote:
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Hi Paul,
> 
> Why not just add these 2 new macros to <linux/kconfig.h> ?
> 
> Maybe you don't want to add the other 2 headers there also?

That means including <linux/compiler.h> in <linux/kconfig.h>, which 
causes build failures:

  LD      vmlinux
  SORTTAB vmlinux
  SYSMAP  System.map
  AS      arch/mips/boot/compressed/head.o
  CC      arch/mips/boot/compressed/decompress.o
  CC      arch/mips/boot/compressed/string.o
  CC      arch/mips/boot/compressed/dummy.o
  OBJCOPY arch/mips/boot/compressed/vmlinux.bin
  HOSTCC  arch/mips/boot/compressed/calc_vmlinuz_load_addr
  GZIP    arch/mips/boot/compressed/vmlinux.bin.z
In file included from ./include/linux/kcsan-checks.h:7,
                 from ./include/asm-generic/rwonce.h:27,
                 from ./arch/mips/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:246,
                 from ././include/linux/kconfig.h:8,
                 from <command-line>:32:
/include/linux/compiler_attributes.h:64: warning: "__always_inline" 
redefined
   64 | #define __always_inline                 inline 
__attribute__((__always_inline__))
      |
In file included from ./include/linux/stddef.h:5,
                 from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/mips/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:246,
                 from ././include/linux/kconfig.h:8,
                 from <command-line>:32:
/include/uapi/linux/stddef.h:5: note: this is the location of the 
previous definition
    5 | #define __always_inline inline
      |
In file included from ./arch/mips/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:246,
                 from ././include/linux/kconfig.h:8,
                 from <command-line>:32:
/include/asm-generic/rwonce.h:64:31: error: expected ‘;’ before 
‘unsigned’
   64 | static __no_sanitize_or_inline
      |                               ^
      |                               ;
   65 | unsigned long __read_once_word_nocheck(const void *addr)
      | ~~~~~~~~
/include/asm-generic/rwonce.h:65:15: warning: no previous prototype 
for ‘__read_once_word_nocheck’ [-Wmissing-prototypes]
   65 | unsigned long __read_once_word_nocheck(const void *addr)
      |               ^~~~~~~~~~~~~~~~~~~~~~~~
/include/asm-generic/rwonce.h:82:28: error: expected ‘;’ before 
‘unsigned’
   82 | static __no_kasan_or_inline
      |                            ^
      |                            ;
   83 | unsigned long read_word_at_a_time(const void *addr)
      | ~~~~~~~~
/include/asm-generic/rwonce.h:83:15: warning: no previous prototype 
for ‘read_word_at_a_time’ [-Wmissing-prototypes]
   83 | unsigned long read_word_at_a_time(const void *addr)
      |               ^~~~~~~~~~~~~~~~~~~


That's why I opted for a new header.

Cheers,
-Paul

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
>>  +	(BUILD_BUG_ON_ZERO(__same_type((a), (b))) || IS_ENABLED(option) ? 
>> (a) : (b))
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
>> 
> 
> 
> thanks.
> --
> ~Randy
> 


