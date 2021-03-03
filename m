Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1177232BD9F
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346265AbhCCQRs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:48 -0500
Received: from mail-vs1-f43.google.com ([209.85.217.43]:33174 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbhCCKa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 05:30:27 -0500
Received: by mail-vs1-f43.google.com with SMTP id b189so6357126vsd.0;
        Wed, 03 Mar 2021 02:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWLoJKrST9SY284XzyZhaHgjO9L3hwsdopDdAp6+Qlo=;
        b=chrzGNYs5n+BOENUpuq53FK1a4WsBrOMAbWQ+Ifa1JKwKwd/nvyBpa0Aeh6NtzTNtw
         yeNd3PEFRhedZFzITcSitEIu+S31J0oOhkpafz02v+ZeF4zF650o76nIw/KqQ4Pg0KU+
         miH4Ovs6Y2v+Azse5vv/zMTGxCz1eq7m1sAAe8Kf/2Lmls597/H8Lp76J79B/35FsnYq
         DN4HWRwQOOAPuerh25BPxnRq19k57UqjosCHk0NhzgRXytzmAwdQXcncER9p7jh8VpSt
         KCqfNugeefDDT7io+V2W6th+tKk7azLfDvQ766LaLEyFVnfHma6vX2yIqhb0k/0bTBRt
         ia9w==
X-Gm-Message-State: AOAM533QvLhBAfrHpNxXGurkWEJTPYfVSYqGW0lk7EMrT37QFjr976yh
        LYeN8KwkD33BXvRMtYH/OeVISGCy8gcIYDzgp5ODce8HueI=
X-Google-Smtp-Source: ABdhPJzpzQ3O9SZyCnmbtWEbsFfvCEjIhxXr0EwZ57EjV3/sxsysE7w38CMuqEzZWCrIK6RNljiUJq2fg3z/4NKTStE=
X-Received: by 2002:a67:fb86:: with SMTP id n6mr5477431vsr.3.1614767385754;
 Wed, 03 Mar 2021 02:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20210303074107.GA8880@lst.de> <20210303.173122.1467075982540149385.anemo@mba.ocn.ne.jp>
In-Reply-To: <20210303.173122.1467075982540149385.anemo@mba.ocn.ne.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Mar 2021 11:29:34 +0100
Message-ID: <CAMuHMdXwD6Oi1a6mmrPUA20vMPd6jQ1816vtc_WxobX3TW3y4g@mail.gmail.com>
Subject: Re: tx4938 and tx4939 ide drivers
To:     Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Christoph Hellwig <hch@lst.de>
Cc:     linux-ide@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nemoto-san, Christoph,

On Wed, Mar 3, 2021 at 9:31 AM Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
>
> On Wed, 3 Mar 2021 08:41:07 +0100, Christoph Hellwig <hch@lst.de> wrote:
> > the tx4938 and tx4939 legacy ide drivers are some of the few that do
> > not have libata equivalents, which is a bad thing given that CONFIG_IDE
> > is planned to go away this year.  Are there any users of this hardware
> > left, and if yes willing to help with the move to libata?
>
> I think nobody use these drivers now.
>
> As I wrote in
> https://lore.kernel.org/lkml/20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp/
> removal of these drivers does not break the only known user of TX49
> boards. (i.e. Mr. Geert Uytterhoeven)

Right. Feel free to remove tx4938ide support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
