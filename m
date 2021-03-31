Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397A8347E68
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 18:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhCXRBg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 13:01:36 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:28511 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236988AbhCXRBF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 13:01:05 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4F5Dyg2yVdz9tyfd;
        Wed, 24 Mar 2021 18:00:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id hMuZCLVXRcCR; Wed, 24 Mar 2021 18:00:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4F5Dyg1vd9z9tyfc;
        Wed, 24 Mar 2021 18:00:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 765D78B82C;
        Wed, 24 Mar 2021 18:01:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id uqfRv-8BUINu; Wed, 24 Mar 2021 18:01:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 997938B82B;
        Wed, 24 Mar 2021 18:00:59 +0100 (CET)
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
Date:   Wed, 24 Mar 2021 17:59:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210309212944.GR109100@zorba>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 09/03/2021 à 22:29, Daniel Walker a écrit :
> On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
>>
>>
>> Le 09/03/2021 à 01:02, Daniel Walker a écrit :
>>> This is a scripted mass convert of the config files to use
>>> the new generic cmdline. There is a bit of a trim effect here.
>>> It would seems that some of the config haven't been trimmed in
>>> a while.
>>
>> If you do that in a separate patch, you loose bisectability.
>>
>> I think it would have been better to do things in a different way, more or less like I did in my series:
>> 1/ Provide GENERIC cmdline at the same functionnality level as what is
>> spread in the different architectures
>> 2/ Convert architectures to the generic with least churn.
>> 3/ Add new features to the generic
> 
> You have to have the churn eventually, no matter how you do it. The only way you
> don't have churn is if you never upgrade the feature set.
> 
> 
>>>
>>> The bash script used to convert is as follows,
>>>
>>> if [[ -z "$1" || -z "$2" ]]; then
>>>           echo "Two arguments are needed."
>>>           exit 1
>>> fi
>>> mkdir $1
>>> cp $2 $1/.config
>>> sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config
>>
>> This is not correct.
>>
>> By default, on powerpc the provided command line is used only if the bootloader doesn't provide one.
>>
>> Otherwise:
>> - the builtin command line is appended to the one provided by the bootloader
>> if CONFIG_CMDLINE_EXTEND is selected
>> - the builtin command line replaces to the one provided by the bootloader if
>> CONFIG_CMDLINE_FORCE is selected
> 
> I think my changes maintain most of this due to the override of
> CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in powerpc is
> an example of why these changes were created in the first place.

"inflexibility in powerpc" : Can you elaborate ?

> 
> For example , say the default command line is "root=/dev/issblk0" from iss476
> platform. And the bootloader adds "root=/dev/sda1"
> 
> The result is <prepend><bootloader><append>.


I'm still having hard time understanding the benefit of having both <prepend> and <append>.
Could you please provide a complete exemple from real life, ie what exactly the problem is and what 
it solves ?

> 
> Then you have,
> 
> root=/dev/issblk0 root=/dev/sda1
> 
> and the bootloader has precedent over the default command line. So root= in the
> above cases is defined by the bootloader.
> 
> The only issue would be if a person wants to override the default command line
> with an unrelated bootloader command line. I don't know how many people do this,
> but I doubt it's many. Can you think of any use cases like this?
> 
> I would imagine there are many more people who have to entirely duplicate the
> default command line in the boot loader when they really just want to change a
> single part of it like the root= device or console device or speed.
> 
> Daniel
> 

Christophe
