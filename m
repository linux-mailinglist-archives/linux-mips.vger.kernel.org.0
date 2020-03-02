Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8587B1755E5
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 09:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgCBIWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 03:22:55 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34465 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgCBIWz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 03:22:55 -0500
Received: by mail-oi1-f178.google.com with SMTP id g6so7759369oiy.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Mar 2020 00:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qMLlgrdOybdPFsbPK3axTggvK+2K8kdyrKtTiqAGjDM=;
        b=Hi5MN8JutLJEgEPY57Pxh0yx2c7cpvbhZqnmAQYrbjoux8Y1Uxa71JNVySsnfI1fXO
         qqAd4sQmJu5L3+V3fbsRRSkoTrcV15g0ndUqjJs9h67DUIXRr6Pnt8+4vnwtb4Y7rad+
         9BXXBiDM/jABx4VXTykdp+54t/E08QtuAHYuk17ueBnq9Ua+YWCMkvmVwSwfDQNRtEmB
         1CYAfS6/VL2OgnRl0QiOGQf8VYGbOYjlLFpscrTHYbcyfD5nVpqdUCVvtQvaXj/hxxuT
         N6bdvyYB1aWQN98nYgnb1+sKcHS1Njg4RkheIEsTqolcfTD40upcjC+lsawMGMEfYK3p
         r0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qMLlgrdOybdPFsbPK3axTggvK+2K8kdyrKtTiqAGjDM=;
        b=UbD5aFCvcaSm6YIxtuXAcuTwZPUuLNz2ehZdlxkIn1Wv4Tctygc5BkEWQa8J4hGQOT
         +0WEpLsu/2XH2JUFpUJrYb+Jjm9RoUUNrBhfADUNrhQHCWic7s2md6u69NjktPDoSsQx
         5c2FGtYvoU0GYYROPPM2vAsRKdvCamzEYMbMm8iHrabDWv5M0bn/ZRTJeO0gaxXpd0+P
         9fJjKTPZ1P+rOZd8y4vvHPp0YqIT/MBPaZIvBvYLX+HGC1xqP64stMJuN6xDin2UL24o
         UCqyZSe0uvrC4b4MCjRL1sscO5WyFFsix14oaoqL+/pDKzqh6ktJi5VmFWJv4Nly8Ayo
         NAow==
X-Gm-Message-State: ANhLgQ1ypdl8Ihtqrk/Hf1RuFYfQu9IBuTdgf/D4b4ml/q8uCfqmVhDd
        JYFGTYgYA53t3fVJH1wUeRUUys4RwP/gTak8YtcPSw==
X-Google-Smtp-Source: ADFU+vuS5+QPRzUDvjDxjxpzrIhIdwZvCu7hdNfprJ+tYzhLVNYpcxURBcVWIUhjba+5wjjqKzHAWB3iTXE6QOmulqg=
X-Received: by 2002:aca:230e:: with SMTP id e14mr2244953oie.169.1583137374076;
 Mon, 02 Mar 2020 00:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de> <7cbd08b1-2841-7ffc-eab8-410a77eae083@gentoo.org>
In-Reply-To: <7cbd08b1-2841-7ffc-eab8-410a77eae083@gentoo.org>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Mon, 2 Mar 2020 09:22:07 +0100
Message-ID: <CAOLZvyGyjksZWMwFwbTW=WOobnsPQXh-BTU7DReWjBbGxSpF5A@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Linux-MIPS <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Joshua Kinard <kumba@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 2, 2020 at 12:50 AM Joshua Kinard <kumba@gentoo.org> wrote:
>
> On 2/27/2020 09:49, Thomas Bogendoerfer wrote:
> > Hi,
> >
> > we have 47 MIPS system types and I'd like to get an overview how alive
> > they really are. I've already grouped the 47 systems a little bit by
> > hardware I already own and regulary test kernels. Could you please
> > give me some feedback about the "unclassified" systems ? What systems
> > are supported by qemu (real test not just repeating qemu docs) ?
> > Thank you for your help.

I have all Alchemy DB1xxx boards, still working, as well as few MTX-1.

As an aside, does anyone know where to get "newer" MIPS hardware,
for example with 64bit MipsR6 cores?

Manuel
