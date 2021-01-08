Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4202EF07C
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 11:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbhAHKO1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 05:14:27 -0500
Received: from mout.gmx.net ([212.227.17.22]:59319 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbhAHKO1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 05:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610100739;
        bh=Y1EXhfy2GX6BKCkkTeeQ3v/7QlyUVQsu2NAr41iu/Sw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=IyqdIPh+L7MLf3T5FcFxCsAsNeQE0td0a3xbU/ezZiZm/Yc2KbaG9BVD9y8GUxAPb
         Resm/yrEoYcDzqL/mGXZihEBg6WHRjtOgMCa9sMZ30zk/XsknZE4arczoPJSjn51jI
         OCpctjBi2zSqwqQGOPTsp6RRqbpLGSl6WDwwWKrE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MvsJ5-1k9A0a2c59-00svM8; Fri, 08
 Jan 2021 11:12:19 +0100
Date:   Fri, 8 Jan 2021 12:13:58 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210108121358.72b66c8b82461c981104e172@gmx.com>
In-Reply-To: <s5hsg7byezb.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UmWRWXKCa6/ymFTViCRAeU4M6gEkr/6LUBhT4nyx6zEQWvzG13x
 UThTgjLOVy8iOUfrxZH6dtcF+inN62XbRmiMGLwhRiQfesIUFtED42FgFlW57+KJ/THEDES
 6yHNCMJzgxnIm8UJrFNUiav2VRmhUWwmmHfDB/3GMJnd2c2AqA00CgHKv2UhPxKZOsfaW+4
 svOOubJqZJLgg+fgMZj/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rR+wgWwL8DY=:lcuzI0l3bHMFl7fbdXHJ5R
 /QLVNneSYx0aIo5KTt4ezNykLWjxG9pNgZt5t+kXZQzHVKZ4w3LKqNFiKakzKQotB1jbjgBWG
 7yWNBzjktzCC4NxdvjQZXseUqtmnzSvilP6mETg8Il0Qk5aciHL+DWRmXC7bQ3I9mYL9TReY3
 mZYT0R46ZXC3q6zhGoipu9kvwzb3uobDKOtkB02pvUsteHu7NWPq3busTOj/LdaP2AZhG+Lzv
 4NN88w993zOxQwbRaZQGAhusguSnIdeiFagM2s25FlYAoT/BaQ3mzjcnUAiYF1qJBJBOZdjwK
 0ArwxT3gtZGwj6NfhQgXLqUKTBE9Qwip3eD6PXwFG6T9YFYAeLY22yQdRvNlDjq32f+Oz53Kf
 NkQe7KTrxJRla/f8pVgBCQcjPN+aIZiX0mXTnBD2D47MKcEAuNCxlw4v0RhMBPIIRqFU5JY8x
 v+UHADVAtcPYlje/Te9BbI5VyBssEpzLxBJvoNH7XFGq722KdCJohIqrR1m3zi2SdBwkCnQE4
 1dGWbXvKdv7oviUGIjZkkfasRzCFGqDizRBaPeuCJ45RCT/OxZBrLJ8/5rM0uuZK/VTrpHsVy
 t+htTVzJoGyx9eoBrSF5kigpqOiPg62FBOJFX/YeQQwXzQtSStY+Z+lw97YME3CkFUQqvyYqs
 d35JM4jF9J83eJdrbXt5rpV70qAZcRLztc8eiFY8ZiQnZqDC0SyrNtaya+ZBYw4TOweySBOwJ
 yo52TBzBsQQHtCXP8NLclkkQKsrWRAfbm23QOy/8pPTMaxieK+M7FcI5Kl6PYGYZIdNeustwN
 ID/RGPflsuLepMV5PTVm5EH0S91432jjvnA69DRUy+IjCynhimjzvu9DqLdQQIubfFiEcoL3G
 aUWYhtFy9Guo9MDJARzQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 08 Jan 2021 10:06:48 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > +static int __init n64audio_probe(struct platform_device *pdev)
>
> Usually the probe callback itself shouldn't be __init.
>
> > +fs_initcall(n64audio_init);
>
> Does it have to be this initcall?

It could be module init instead, nothing specific in fs_initcall. It's
__init because it can only be compiled in, and removing that run-once
code saves RAM. The target only has 8mb RAM.

- Lauri
