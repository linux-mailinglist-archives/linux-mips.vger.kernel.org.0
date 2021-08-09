Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3463E49B9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Aug 2021 18:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbhHIQWq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 9 Aug 2021 12:22:46 -0400
Received: from aposti.net ([89.234.176.197]:50464 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232734AbhHIQWo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 9 Aug 2021 12:22:44 -0400
Date:   Mon, 09 Aug 2021 18:22:12 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Message-Id: <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
In-Reply-To: <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <20210808134526.119198-9-paul@crapouillou.net>
        <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
        <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
        <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
        <137A13EE-9E0E-469E-BE43-677349478A58@goldelico.com>
        <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le lun., août 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> quick feedback: our HDMI on top compiles fine after fixing 2 merge 
> conflicts, but dos not yet work.
> Will need some spare time with access to the CI20 board to research 
> the issue, i.e. can not give feedback immediately.

Alright, no problem. I'll be back home in about 2 weeks and then I can 
test on my CI20 as well.

Cheers,
-Paul

> BR and thanks,
> Nikolaus
> 
>>  Am 08.08.2021 um 21:12 schrieb H. Nikolaus Schaller 
>> <hns@goldelico.com>:
>> 
>> 
>> 
>>>  Am 08.08.2021 um 21:06 schrieb H. Nikolaus Schaller 
>>> <hns@goldelico.com>:
>>> 
>>> 
>>> 
>>>>  Am 08.08.2021 um 21:04 schrieb Paul Cercueil 
>>>> <paul@crapouillou.net>:
>>>> 
>>>>  Hi Nikolaus,
>>>> 
>>>>  Le dim., août 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller 
>>>> <hns@goldelico.com> a écrit :
>>>>>  Hi Paul,
>>>>>  all other patches apply cleanly but this one fails on top of 
>>>>> v5.14-rc4.
>>>>>  What base are you using?
>>>>>  BR and thanks,
>>>>>  Nikolaus
>>>> 
>>>>  The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc), 
>>>> branch drm-misc-next.
>>> 
>>>  Ok, fine!
>> 
>>  Contains 3 patches for drm/ingenic and after taking them first, I 
>> can apply the series.
>> 
>>  Again, BR and thanks,
>>  Nikolaus
>> 
>>  _______________________________________________
>>  https://projects.goldelico.com/p/gta04-kernel/
>>  Letux-kernel mailing list
>>  Letux-kernel@openphoenux.org
>>  http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel
> 


