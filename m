Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8709B231E78
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgG2MWH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 08:22:07 -0400
Received: from [115.28.160.31] ([115.28.160.31]:43992 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726502AbgG2MWH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 08:22:07 -0400
Received: from hanazono.local (unknown [116.236.177.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E167F60130;
        Wed, 29 Jul 2020 20:21:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1596025313; bh=Ukwn7Jhtdx8pbtIs+CCMFr+oxkzHmvy1j+EGp9QgbHk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BvGwqVcN5NUjUnHok54UoEM9f4VRsdYm+AnnDyxQREVV0WaWX85TvUy4eNyidcmEg
         t32MHAmcOrLsuXpU222Gz2MhtnOr7no5MpBdjQ2t3VPKAOi2uBBb5Bil0Y1wxvy2DR
         +4xm2qHkAfxYwNf3XvFxBIWqPi5W4VbxZEIMj+f8=
Subject: Re: [PATCH v4 3/3] MIPS: handle Loongson-specific GSExc exception
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200728100655.3005831-1-git@xen0n.name>
 <20200728100655.3005831-4-git@xen0n.name>
 <20200728205125.GA22052@alpha.franken.de>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <7cfadb9c-101e-66d4-2e0f-11a7e3c9e168@xen0n.name>
Date:   Wed, 29 Jul 2020 20:21:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:81.0)
 Gecko/20100101 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <20200728205125.GA22052@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2020/7/29 04:51, Thomas Bogendoerfer wrote:
> On Tue, Jul 28, 2020 at 06:06:55PM +0800, WANG Xuerui wrote:
>> index a1b966f3578e..5fa87d4b5dca 100644
>> --- a/arch/mips/kernel/genex.S
>> +++ b/arch/mips/kernel/genex.S
>> @@ -498,6 +498,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
>>  	KMODE
>>  	.endm
>>  
>> +	.macro __build_clear_gsexc
>> +	mfc0	a1, CP0_DIAGNOSTIC1
> this doesn't work when building for a legacy core:
>
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S: Assembler messages:
> /local/tbogendoerfer/korg/linux/arch/mips/kernel/genex.S:565: Error: invalid operands `mfc0 $5,$22,1'
>
> Thomas.
>
Sorry for not noticing this, native compilation on Loongson is slow so
sometimes I skip build tests, and it was certainly wrong. I'll fix soon.

I think I need to spend a few weekends to setup an amd64 CI for
build-testing...

