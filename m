Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5854EED8C6
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 07:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfKDGAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 01:00:07 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:32885 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGAH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 01:00:07 -0500
Received: by mail-il1-f195.google.com with SMTP id m5so4587078ilq.0
        for <linux-mips@vger.kernel.org>; Sun, 03 Nov 2019 22:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SJewhF0QgPWY/yGtLd8oNL6N3AjMgWfg4DRTID6Um4w=;
        b=GGdZdgcGgs7TATTf3DMBf4Y/GoAMJDcTK2UOb6lQ6k1luTpgwovK5M3xZxmheSVKlR
         YjOxZMpNlqlqeE2UWqdmXyH5GnrXkVMR66f265DDPF2U0QvlDnLQqmG0zmU3HnmXApQv
         Yd+GesfiDH0h/k8z7HdHYQ+AQ/3vQyR2tewYA/jkM3zFIq7ClwiWji57hXCOwIOpx1DH
         dKWrfCy0bZJAep4jlcSKJg1I0L+2Xdh/+v9Z/U2NPSthkXBKYEyjgHtM8ui4VTsQFFxL
         KMc4dNch+jHpiVmUWZr6TV0S2e3lKwdrQe+EcyiIzfqtiRAErKwk9EZYZX08K82lOvOm
         Sd3Q==
X-Gm-Message-State: APjAAAXDSpePDsakwEgkov9WLSmLujTs905pXY62RkSi8D5Dw2u/JYFT
        srFFvKi/fpInlnFZCAIkl5idp1IdKYPgpFRRHvM=
X-Google-Smtp-Source: APXvYqyGatsXVq2mh3zGUoaRZCP/zTCggiObT6coD8TR1IERWiQvHxTiWiSiLvmD5BqR92218aa5Z7XG6n4ea3QvIFA=
X-Received: by 2002:a92:1d8d:: with SMTP id g13mr21349379ile.35.1572847206640;
 Sun, 03 Nov 2019 22:00:06 -0800 (PST)
MIME-Version: 1.0
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com> <alpine.LFD.2.21.1911032301160.367459@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1911032301160.367459@eddie.linux-mips.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 4 Nov 2019 14:05:49 +0800
Message-ID: <CAAhV-H7R3Ci+Z1kMc2MXcK69JwoH5+bxvGGCjrLzBNbEki76zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Loongson: Remove Loongson-2E/2F support
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Maciej,

On Mon, Nov 4, 2019 at 7:08 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Sun, 3 Nov 2019, Huacai Chen wrote:
>
> > Loongson-2E/2F is old, inactive and a bit ugly, so let's remove them
> > and the world will be more comfortable.
>
>  People still use them, e.g. I do, and upstream removal causes an issue
> with the need to backport changes not specific to the platform.
>
>  If you don't want to maintain the code, then just mark it orphan and rely
> on the community to maintain it.  If it starts breaking and nobody picks
> it to make fixes, then it can be removed.  There's no need to rush IMO.
>
>  BTW, there used to be a patch somewhere to support more than 512MiB of
> DRAM with the 2E, but I can't find it -- can you help me tracking it down?
>
OK, we will keep Loongson-2E/2F in kernel for sometime, thanks.

Huacai
>   Maciej
