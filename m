Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3A944B211
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 18:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241153AbhKIRkW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 9 Nov 2021 12:40:22 -0500
Received: from aposti.net ([89.234.176.197]:60738 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239402AbhKIRkW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 12:40:22 -0500
Date:   Tue, 09 Nov 2021 17:37:25 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] MIPS: fix generic zboot support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     YunQiang Su <yunqiang.su@cipunited.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org
Message-Id: <DMFB2R.C29XL2IEV0CC1@crapouillou.net>
In-Reply-To: <70a3e99c-0682-4f0f-9ba5-186d3e1398b8@www.fastmail.com>
References: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
        <2JZ82R.JILSE46R0P2T1@crapouillou.net>
        <8R092R.UUI0DN154MP31@crapouillou.net>
        <70a3e99c-0682-4f0f-9ba5-186d3e1398b8@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun., nov. 8 2021 at 18:09:06 +0000, Jiaxun Yang 
<jiaxun.yang@flygoat.com> a écrit :
> 
> 
> 在2021年11月8日十一月 上午10:21，Paul Cercueil写道：
>>  Hi again,
>> 
>>  Le lun., nov. 8 2021 at 09:54:38 +0000, Paul Cercueil
>>  <paul@crapouillou.net> a écrit :
>>>  Hi,
>>> 
>>>  Le ven., nov. 5 2021 at 09:52:32 -0400, YunQiang Su
>>>  <yunqiang.su@cipunited.com> a écrit :
>>>>  There are 2 problems here:
>>>>  1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M
>>>>  boston.
>>>>     Why it is set here? Any other platform needs this value?
>>> 
>>>  Is there another place where it should be set?
>>> 
>>>  With this patch applied, kernels won't boot anymore on Ingenic 
>>> boards.
>> 
>>  Nevermind - it works, I just needed to adapt my tooling.
>> 
>>  However, I think there should still be an option to have a fixed 
>> zload
>>  address, for the case where you want a vmlinuz.bin.
> 
> Hmm how about leave it for Kconfig?

Sure, that works.

Cheers,
-Paul


