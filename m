Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E7044B3EF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 21:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244301AbhKIUbL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 9 Nov 2021 15:31:11 -0500
Received: from aposti.net ([89.234.176.197]:50676 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243090AbhKIUbL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 15:31:11 -0500
Date:   Tue, 09 Nov 2021 20:28:14 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mips: decompressor: do not copy source files while
 building
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Xingxing Su <suxingxing@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhaoxiao <zhaoxiao@uniontech.com>
Message-Id: <2JNB2R.VS072C44UZD22@crapouillou.net>
In-Reply-To: <CAK7LNAQzUDerTOpaNjSSRAWqwQHC8RY2MX3VeEk_uJS9AXK82w@mail.gmail.com>
References: <20211105023815.85784-1-masahiroy@kernel.org>
        <YG0B2R.AN2GMAOFSVCK1@crapouillou.net>
        <CAK7LNAQzUDerTOpaNjSSRAWqwQHC8RY2MX3VeEk_uJS9AXK82w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mer., nov. 10 2021 at 01:57:28 +0900, Masahiro Yamada 
<masahiroy@kernel.org> a écrit :
> On Tue, Nov 9, 2021 at 9:10 PM Paul Cercueil <paul@crapouillou.net> 
> wrote:
>> 
>>  Hi Masahiro,
>> 
>>  Le ven., nov. 5 2021 at 11:38:14 +0900, Masahiro Yamada
>>  <masahiroy@kernel.org> a écrit :
>>  > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify 
>> libfdt
>>  > builds") stated, copying source files during the build time may 
>> not
>>  > end up with as clean code as expected.
>>  >
>>  > Do similar for mips to clean up the Makefile and .gitignore.
>> 
>>  What did you base this patch on?
>> 
>>  It does not apply cleanly here. It tries to create ashldi3.c and
>>  bswapsi.c, which already exist.
>> 
> 
> Please remove them manually
> before 'git am'.

That works. I thought these files were staged in git.

Tested-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


