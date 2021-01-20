Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0012FD170
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 14:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389086AbhATMgI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 07:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20573 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728173AbhATLR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 06:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611141390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lHbOad7UbTw336+P1gTH/88rhJNp5wkbXBildQOJJ5o=;
        b=c9fG1jl43rT7WH1OGoPGTY/4BO0YjrkW8YetNuT2JVuHtiJo2o+7kJiJLZea4Vc4lAv8Gc
        vbfQUHttOrQLZUznDF00SJJvbOsHpD+nIc6olUFTM52RecW3VJgEg5D53SeWWoO9/+n17z
        8/RBwNV6LcG2yQ97rP4eNh17e5vX7oE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-NQnPUZx5Pp6fydOs_MDSkA-1; Wed, 20 Jan 2021 06:16:28 -0500
X-MC-Unique: NQnPUZx5Pp6fydOs_MDSkA-1
Received: by mail-ej1-f72.google.com with SMTP id gt18so2976017ejb.18
        for <linux-mips@vger.kernel.org>; Wed, 20 Jan 2021 03:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lHbOad7UbTw336+P1gTH/88rhJNp5wkbXBildQOJJ5o=;
        b=NVpDUNgF67TDoebozKs8KhVqi2YhcwDYXE0KqtdsngV4bquQjR+/Ax+i+C64UmwPis
         Dekr0uB2ZqL5gLfj+qYH57joYw7AiWyy/aR5WBbw0YF4PqLYXgSOY2teVakxL+PF+IHF
         Yl5AqZfZG/L6man12WfMC9TyLdERGFMQPB0ITzaR7GuTRxo4TdG9/O1ecanma92Fk0Mz
         SAx0YVlMAhKmjyASvd4Et4vAEA8BK3adcKkBGgQgN3KBZqNyAg0RBFUM3lXZB7thGPFM
         TUmqcNe1Fxr9ybEApArGi9Xq/YTXBgWygRfw5pqjhfLHNzJVZ1L2Jw2Qth1B2tBobSnT
         jMZw==
X-Gm-Message-State: AOAM5334pmSCzif8CiTrE1suRynzWx+by8WmH3/T2HDSWvxPLqR/QRc6
        5GYozYdAeIfBrHyZjI51lD3H2/NM+7P4ewM5J09V8at5pn2YV3zk1j0aCcNEWf20kDu6jvqSHNH
        Wnhta1EVQAYgyOfHE8RrDgQ==
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr5585771ejc.197.1611141387200;
        Wed, 20 Jan 2021 03:16:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyigbX/Un99OC72HerCFQXCLMLZaRISS6cecfapeu87wa1/j2Jm/2VFhhG3mq+6HkWLgCusXA==
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr5585763ejc.197.1611141387085;
        Wed, 20 Jan 2021 03:16:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id di28sm926097edb.71.2021.01.20.03.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 03:16:25 -0800 (PST)
Subject: Re: [PATCH] fbdev/simplefb: Add the N64's mode
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org
References: <20210115160102.cf4c85db9f815758716f086f@gmx.com>
 <aeb93d4a-d7c0-5e0d-4de4-4a70f85cb202@redhat.com>
 <20210115143745.GA15166@alpha.franken.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0dc4f046-ff1f-edba-f58a-08d7b7417998@redhat.com>
Date:   Wed, 20 Jan 2021 12:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210115143745.GA15166@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 1/15/21 3:37 PM, Thomas Bogendoerfer wrote:
> On Fri, Jan 15, 2021 at 03:06:13PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/15/21 3:01 PM, Lauri Kasanen wrote:
>>> Signed-off-by: Lauri Kasanen <cand@gmx.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> What is the plan for merging this patch? I've another simplefb patch which
>> I need/plan to push to drm-misc-nexy soon, shall I also push this one then?
>>
>> Or is there some plan to merge the entire series this used to be part of
>> in one go?
> 
> this looks independant enough to me, so I'd appreciate, if you take it.

Ok, I've just pushed this patch to drm-misc-next.

Regards,

Hans

