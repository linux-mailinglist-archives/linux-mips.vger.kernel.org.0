Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1A9B590B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Sep 2019 02:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfIRAen (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Sep 2019 20:34:43 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:58901 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726971AbfIRAen (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Sep 2019 20:34:43 -0400
Received: from mxback1g.mail.yandex.net (mxback1g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:162])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id B52284200735;
        Wed, 18 Sep 2019 03:34:38 +0300 (MSK)
Received: from sas2-44d129ed7200.qloud-c.yandex.net (sas2-44d129ed7200.qloud-c.yandex.net [2a02:6b8:c08:ff0a:0:640:44d1:29ed])
        by mxback1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id XWNVTDbIbC-YbRKrJBa;
        Wed, 18 Sep 2019 03:34:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1568766878;
        bh=Kij3Q0nxAJtBn/KMLLWc5IhgVDlVLSDmGkWny3ag4IU=;
        h=In-Reply-To:Cc:To:Subject:From:Date:References:Message-ID;
        b=wf7QcMBASD+rXFGYmfJ9aWi+OBk4VPX4Head61X/yck70Mte3nSBqcOoJly+J0c/1
         vzd0CtmKaiHxHrQjUylIcgFajxhyPhWH74oV5ieUwrkVsLytTEVsQ7YPGAF8t5M/tS
         U08EDH69uixwqo2UxYEY7Wc9R2ZGwnlNPYkAKZvQ=
Authentication-Results: mxback1g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas2-44d129ed7200.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id RDO4Quqbdf-YIqG4kHW;
        Wed, 18 Sep 2019 03:34:23 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/13] Modernize Loongson64 Machine
To:     Matt Turner <mattst88@gmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?57O757ufLeeOi+a0quiZjg==?= <wanghonghu@loongson.cn>,
        Paul Hua <paul.hua.gm@gmail.com>, wangxuerui@qiniu.com
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <CAEdQ38EbtBsmAU0D8VtNkp=AMLo9XN43v3-OaEN-2n6zfGDMkw@mail.gmail.com>
Message-ID: <0491a5e9-1113-046d-b455-cd54f8cc8651@flygoat.com>
Date:   Wed, 18 Sep 2019 08:33:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEdQ38EbtBsmAU0D8VtNkp=AMLo9XN43v3-OaEN-2n6zfGDMkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



14:30, 2019年9月12日, Matt Turner <mattst88@gmail.com>:

    On Tue, Aug 27, 2019 at 1:53 AM Jiaxun Yang <jiaxun.yang@flygoat.com
    <mailto:jiaxun.yang@flygoat.com>> wrote:

          Loongson have a long history of contributing their code to
        mainline kernel.
          However, it seems like recent years, they are focusing on
        maintain a kernel by themselves
          rather than contribute there code to the community.

Hi Matt:

    Do you know more about this? I have a Loongson 3A3000 system that I
    have never been able to make stable. I tried pulling patches out of
    the glibc, binutils, gcc, and Linux repos I found at
    https://github.com/loongson-community but my system still hardlocks,

What's the behaviour of hardlock? Kernel RCU stall? Or simply no response?

    preventing me from doing much of anything with it.

    Do we know why critical looking toolchain patches like "Added misses
    sync in mips_process_sync_loop for add sync before ll sc" [0] and "Fix

LLSC fixes have been mainlined in latest binutils.
And GCC-9.1 have introduced march=gs464e for 3A3000.

    loads for Loongson3 to promoting stability" [1] have not been
    submitted upstream?

Load issue only influence specified revisions of Loongson-3A2000, your 
hardware shouldn't have that problem.

    I'm interested in supporting Loongson 3 in Gentoo, and the hardware
    that has been given to me would be extremely useful for Gentoo's MIPS
    port in general, but it's just not usable at all currently.

You can try Fedora 28 maintained by Lemote  which have been verified in 
production environment for a period 
[http://mirror.lemote.com:8000/fedora/fedora28-live/] if the hardware is 
still unstable, then it might be a memory stability issue. You can try 
to clean your DIMM solt and DDR golden finger, or even swap the memory 
module.

Btw: Xuerui Wang <wangxuerui@qiniu.com> had maintained his 3A3000 Gentoo 
port [https://github.com/xen0n/loongson-overlay] for a long time. I'll 
Cc him this email and probability he can give you further assistance.


Thanks.


    [0]
    https://github.com/longson-community/gcc/commit/e7e3b0f956929f022caa01ed25a482495b11d575
    <https://github.com/loongson-community/gcc/commit/e7e3b0f956929f022caa01ed25a482495b11d575>
    [1]
    https://github.com/loongson-community/binutils-gdb/commit/2f0e91d2af6093097202fae3adab624ffa86a156



-- 
Jiaxun Yang
