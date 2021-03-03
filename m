Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD0E32C891
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240052AbhCDAuv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 3 Mar 2021 19:50:51 -0500
Received: from aposti.net ([89.234.176.197]:46706 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245604AbhCCVAz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 16:00:55 -0500
Date:   Wed, 03 Mar 2021 20:57:56 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
To:     Rob Herring <robh@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        MIPS <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <KKVEPQ.TT4PXOZ85QWA1@crapouillou.net>
In-Reply-To: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
References: <20210303193305.924384-1-paul@crapouillou.net>
        <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

Le mer. 3 mars 2021 à 14:37, Rob Herring <robh@kernel.org> a écrit :
> On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> 
> wrote:
>> 
>>  Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> 
> I had checked the other built-in cases as microblaze broke too, but
> missed some of the many ways MIPS can have a dtb. Appended and
> built-in DTBs were supposed to be temporary. :(

Actually I'm glad these options are here, they make debugging much 
easier, when working on new SoCs.

-Paul

>>  Therefore, the decompress routine must be careful to copy the blob 
>> at
>>  the next aligned address after the kernel image.
>> 
>>  This commit fixes the kernel sometimes not booting with a Device 
>> Tree
>>  blob appended to it.
>> 
>>  Fixes: c4d5e638d6e9 ("scripts/dtc: Update to upstream version 
>> v1.6.0-51-g183df9e9c2b9")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/boot/compressed/decompress.c | 8 ++++++++
>>   arch/mips/kernel/vmlinux.lds.S         | 2 ++
>>   2 files changed, 10 insertions(+)
> 
> Acked-by: Rob Herring <robh@kernel.org>


