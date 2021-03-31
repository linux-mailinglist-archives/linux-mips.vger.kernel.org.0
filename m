Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6094349183
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 13:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhCYMGb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 08:06:31 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:6138 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230133AbhCYMGY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Mar 2021 08:06:24 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4F5kNB1nf0z9v0GZ;
        Thu, 25 Mar 2021 13:06:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id JkNGHrWfVGIB; Thu, 25 Mar 2021 13:06:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4F5kNB0wKHz9v07g;
        Thu, 25 Mar 2021 13:06:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B0988B853;
        Thu, 25 Mar 2021 13:06:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id bAlm_IeUvyN3; Thu, 25 Mar 2021 13:06:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 9491B8B849;
        Thu, 25 Mar 2021 13:06:18 +0100 (CET)
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
Date:   Thu, 25 Mar 2021 13:03:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 24/03/2021 à 18:32, Rob Herring a écrit :
> On Wed, Mar 24, 2021 at 11:01 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 09/03/2021 à 22:29, Daniel Walker a écrit :
>>> On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 09/03/2021 à 01:02, Daniel Walker a écrit :
>>>>> This is a scripted mass convert of the config files to use
>>>>> the new generic cmdline. There is a bit of a trim effect here.
>>>>> It would seems that some of the config haven't been trimmed in
>>>>> a while.
>>>>
>>>> If you do that in a separate patch, you loose bisectability.
>>>>
>>>> I think it would have been better to do things in a different way, more or less like I did in my series:
>>>> 1/ Provide GENERIC cmdline at the same functionnality level as what is
>>>> spread in the different architectures
>>>> 2/ Convert architectures to the generic with least churn.
>>>> 3/ Add new features to the generic
>>>
>>> You have to have the churn eventually, no matter how you do it. The only way you
>>> don't have churn is if you never upgrade the feature set.
>>>
>>>
>>>>>
>>>>> The bash script used to convert is as follows,
>>>>>
>>>>> if [[ -z "$1" || -z "$2" ]]; then
>>>>>            echo "Two arguments are needed."
>>>>>            exit 1
>>>>> fi
>>>>> mkdir $1
>>>>> cp $2 $1/.config
>>>>> sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config
>>>>
>>>> This is not correct.
>>>>
>>>> By default, on powerpc the provided command line is used only if the bootloader doesn't provide one.
>>>>
>>>> Otherwise:
>>>> - the builtin command line is appended to the one provided by the bootloader
>>>> if CONFIG_CMDLINE_EXTEND is selected
>>>> - the builtin command line replaces to the one provided by the bootloader if
>>>> CONFIG_CMDLINE_FORCE is selected
>>>
>>> I think my changes maintain most of this due to the override of
>>> CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
>>> an example of why these changes were created in the first place.
>>
>> "inflexibility in powerpc" : Can you elaborate ?
>>
>>>
>>> For example , say the default command line is "root=/dev/issblk0" from iss476
>>> platform. And the bootloader adds "root=/dev/sda1"
>>>
>>> The result is <prepend><bootloader><append>.
>>
>>
>> I'm still having hard time understanding the benefit of having both <prepend> and <append>.
>> Could you please provide a complete exemple from real life, ie what exactly the problem is and what
>> it solves ?
> 
> It doesn't matter. We already have both cases and 'extend' has meant either one.
> 
> What someone wants is policy and the kernel shouldn't be defining the policy.
> 

Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.

Let's only provide once CMDLINE as of today, and ask the user to select whether he wants it appended 
or prepended or replacee. Then no need to change all existing config to rename CONFIG_CMDLINE into 
either of the new ones.

That's the main difference between my series and Daniel's series. So I'll finish taking Will's 
comment into account and we'll send out a v3 soon.

Thanks
Christophe
