Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F249BECCE6
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 03:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfKBCkz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 22:40:55 -0400
Received: from forward106j.mail.yandex.net ([5.45.198.249]:57239 "EHLO
        forward106j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727067AbfKBCkz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 22:40:55 -0400
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 6291B11A04ED;
        Sat,  2 Nov 2019 05:40:51 +0300 (MSK)
Received: from mxback8q.mail.yandex.net (mxback8q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:b38f:32ec])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 5B93D7F20013;
        Sat,  2 Nov 2019 05:40:51 +0300 (MSK)
Received: from vla5-dfb0352c045b.qloud-c.yandex.net (vla5-dfb0352c045b.qloud-c.yandex.net [2a02:6b8:c18:348f:0:640:dfb0:352c])
        by mxback8q.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Vmu3lmIoXI-eofSU3x0;
        Sat, 02 Nov 2019 05:40:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1572662451;
        bh=bLS5wzD5BpHdqD5b39TqcaTvrmJYKCzMdNKEQgmtXs8=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=LmS8jzuTgfVUjx+/dI3t7dtflrY50otNWULESgovTbUiv2cZ5lwfC0FIaOi167l6K
         d/09YmnmFfGwzcbMyRmRoB0cAbd62tFELjKCgZsK2ImBPQi+BhVEvUzQJ+pkaQyH1E
         MRLwczd3wCXIPm/3igBrOEouGd2YE699aVRc/5aE=
Authentication-Results: mxback8q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-dfb0352c045b.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id 0jFaYaZA5n-egVeYYD5;
        Sat, 02 Nov 2019 05:40:49 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH] MIPS: Loongson: Add board_ebase_setup() support
To:     Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1571975104-5849-1-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e7b63b4e-a2c2-eaa2-50bd-d36bcf8c8faa@flygoat.com>
Date:   Sat, 2 Nov 2019 10:40:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571975104-5849-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2019/10/25 ÉÏÎç11:45, Huacai Chen Ð´µÀ:
> Old processors before Loongson-3A2000 have a 32bit ebase register and
> have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
> register and do have the WG bit. Unfortunately, Loongson processors
> which have the WG bit are slightly different from MIPS R2. This makes
> the generic ebase setup not suitable for every scenarios.
> 
> To make Loongson's kernel be more robust, we add a board_ebase_setup()
> hook to ensure that CKSEG0 is always used for ebase. This is also useful
> on platforms where BIOS doesn't initialise an appropriate ebase.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
--
Jiaxun Yang
