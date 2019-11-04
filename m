Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813AEEE7DB
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 20:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbfKDTDK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 14:03:10 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:47051 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDTDK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 14:03:10 -0500
Received: by mail-pg1-f195.google.com with SMTP id f19so11972938pgn.13
        for <linux-mips@vger.kernel.org>; Mon, 04 Nov 2019 11:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mZqxvkrtzPsRoZTI7aNkRzMMf5lWeHjBX/Hf0nx/9QM=;
        b=plRjai3koIkh9PM6bipRrfL7g5R6jvxrR0QRD4cP6g++Kwhk7Wfd8GOKfKMPJsN7Sv
         48+WUyC01NqKd3HciMDt7Hk0K9T2Nr7Dq9qZsBjXZ5VLcrT1Ftlo/DKYbYhn456XNL2q
         TdQ5S6zOI7L74ZHW6T8wEFPXPCbGKJPta5zdi432r8E1Vi8ZSmHiIFz9zAEyYw4iMQJT
         +wClvIbENmma0bxxgG1DBY2/wykYk9hqOTL4n2T8lKerbg/mogs6H1Um7UGIjhSD85cu
         PQwqdgmKdcWh6avFsjWsMgmKsUekJd9dvyDvnIXO6s2fUTunDBRq6lP74TQD0P3BBbzp
         znLw==
X-Gm-Message-State: APjAAAVvFmcyf2aSRuaQyQz8tOpntvTDENMTMqKsA2/XBrCTvMnN1N4C
        J65YbXy0ovnsCk24aEF8gDU=
X-Google-Smtp-Source: APXvYqzddVRUSzrs4Weqi/EZwgQUw2pIzcHhSjhMPuyU1XRiONunV7NxmqgznFVWjvQ6GReqc1mBPA==
X-Received: by 2002:a63:67c3:: with SMTP id b186mr31718285pgc.152.1572894188330;
        Mon, 04 Nov 2019 11:03:08 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id 6sm19206868pfy.43.2019.11.04.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 11:03:07 -0800 (PST)
Date:   Mon, 4 Nov 2019 11:03:30 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Loongson: Remove Loongson-2E/2F support
Message-ID: <20191104190330.hpzuqsyh5j5tkr4p@lantea.localdomain>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On Sun, Nov 03, 2019 at 01:20:15PM +0800, Huacai Chen wrote:
> Loongson-2E/2F is old, inactive and a bit ugly, so let's remove them
> and the world will be more comfortable.
> 
> Old:
> Products with Loongson-2E/2F are more than ten years old, there is no
> new products.
> 
> Inactive:
> There are not any updates for a long time, and the maintainer (Jiaxun
> Yang) focuses on Loongson-3 now.

Jiaxun just made changes to the 2E/2F code just a couple of weeks ago to
separate it from other Loongson64 support & clean it up - he also
indicated at the same time that he intends to contiue maintaining this
code [1].

> Ugly:
> Loongson-2E/2F are not compatible with regular MIPS, e.g., ebase, cache
> flush method and tlb refill handler.

Sadly "quirks" like this aren't solely the domain of Loongson 2E/2F
machines, so this isn't an unusual burden.

> Linux-5.4.x is a LTS release, I think it is the suitable time to remove
> Loongson-2E/2F.

I disagree - Jiaxun says he's happy to maintain the platform & has
recently been working on it. I'm not going to remove it & deny him that
chance. If it does indeed become unmaintained then sure let's drop it,
but that doesn't seem to be the case here.

Thanks,
    Paul

[1] https://lore.kernel.org/linux-mips/AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com/
