Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B24BEDFA22
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 03:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfJVBaL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 21 Oct 2019 21:30:11 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42296 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfJVBaK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Oct 2019 21:30:10 -0400
Received: by mail-il1-f193.google.com with SMTP id o16so5793638ilq.9
        for <linux-mips@vger.kernel.org>; Mon, 21 Oct 2019 18:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qku3pnEKE18eEF6bQlFQtxcJhcmkyU8XoJ67crRfYjM=;
        b=Tv3Sj4zqNF58CJCLebIKe1z+rpqiW0DBiOfEhsWfQ8AQVnS5r4OZf1y/g8osJM1Q+8
         0hFOq6okfnZ2qMwQqn/WlCJq1G0CnDJdMVPzbdfMN3a2GmHGeIrxfjkBqdhMQsmFZ3R8
         MCLh48/TJHjWao6gKIxVPPvu21SthWuRwWLNJn72/ApqnwFuxIZGVkkT4ia+/BFZ3+3f
         Jjdp6w/m0dG5ezAWRuSH2ce3elgiV1B1tjj1SWahKEhoO6TSySFHv799L55saj8YdWqy
         BsXh005gWgCqkrq151jMfDHSI1ooHuUZRoOjiOyi/3QwDwzPDMFNc08NF1JDY+V6C/uv
         +C4Q==
X-Gm-Message-State: APjAAAWBePJUnOTEcrWA6DZmy6BA2Rs3rZbdeTa5ZZTMIS7lmdZUs2OJ
        XvlPRpPqOE8yW5OanBpkTtur7rHawkOjAz+cGlbgzvrP
X-Google-Smtp-Source: APXvYqw+gMcAI9soHCLGqt2CchvMKJC5gkbQ6QiYvAdgOgvdTWKGYtQjcv/bmBou9QP2J29racDaXMuBVjRL61f3oZo=
X-Received: by 2002:a92:d6c2:: with SMTP id z2mr9847678ilp.270.1571707810043;
 Mon, 21 Oct 2019 18:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
 <CAAhV-H49Gx4RXz1ahDcxd6zrSgcj74UjwN=xopC_YYutojP_0Q@mail.gmail.com> <AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com>
In-Reply-To: <AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 22 Oct 2019 09:35:38 +0800
Message-ID: <CAAhV-H6iCHprEHRa2Do2QEQD+UkML=X=UwemR3OELXCrBhwv7w@mail.gmail.com>
Subject: Re: [PATCH 0/5] MIPS: Loongson64: separate loongson2ef/loongson64 code
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun

On Mon, Oct 21, 2019 at 11:56 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 于 2019年10月21日 GMT+08:00 上午9:07:52, Huacai Chen <chenhc@lemote.com> 写到:
> >Hi, Jiaxun,
> >
> >Can we just "retire" the Loongson-2E/2F support? Let 5.4-lts be the
> >last version which support Loongson-2E/2F.
> Hi Huacai,
>
> There are still a lot of Loongson-2F users. Please don't leave them alone.
>
> I'm still going to maintain these code. Although might not be very active.
If Loongson-2E/2F block us to modernize Loongson64, let's just retire
it; if it doesn't block us, we don't need to separate.

Huacai
>
>
> >
> >Huacai
> >
> --
> Jiaxun Yang
