Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4031B5E09
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 16:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgDWOjn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 10:39:43 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37360 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDWOjn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 10:39:43 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 03NEdBvU005174;
        Thu, 23 Apr 2020 23:39:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 03NEdBvU005174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587652752;
        bh=BOj4UmRurC8rIWuQU/ZmKHElncJFocku3VBgXu1RgAA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1hYRHfJGcVtvhI7v3fVw2vGsunw0j1bi0rsj5BrQLs12lPnZHWJ0vKfvmsYAQ8J/L
         hxF3PcS7OO6EZDxp+agaO0r8aVNgi2E/DEkX4Qc0zL+rMgW1IwONCqmA/zqAMt9wv5
         UmywdLSZMgjuI/tILQObUROvMy/d6eRJ5QZPM9IaUNHOodZPfp4inQ6znsqD7QYuYM
         MhGwIGDRp/h8HXrKMTcvrhFHk5+XcK6VDJyBzJTA9lBR+MPTy5QMSr8O4QzvITPm67
         3kf0hHMKPXwzgeM3PdR4RduKKOKLb0BgCW6AM4uYrRk3/Lu95A0qI0F+aoAuGSKQOJ
         K3IbgUWZuJPEA==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id u12so5870421uau.10;
        Thu, 23 Apr 2020 07:39:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuYndmls2GE6Ol6v2QDwjG7ODl+52Q8UBwkJ2MwIqVq5mNdOY/vH
        BLxyvN7IZzxqpJgZU71FQHoJpjs4mi+ccV5ERVo=
X-Google-Smtp-Source: APiQypIwuC0cDKGe0gh6zvueBRX9TXDNtypehZWx7OK3iYNRcYYiiZ2rKufnuNz2HnAdH2/E2wVHXctGE6zkM5SVJJc=
X-Received: by 2002:a67:3293:: with SMTP id y141mr3518879vsy.54.1587652750987;
 Thu, 23 Apr 2020 07:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com> <20200419202128.20571-1-natechancellor@gmail.com>
In-Reply-To: <20200419202128.20571-1-natechancellor@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 23 Apr 2020 23:38:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3pt6VoQb3-HtOFJF5JEmaQhjyi+8OSCXu6zQ3oV579A@mail.gmail.com>
Message-ID: <CAK7LNAT3pt6VoQb3-HtOFJF5JEmaQhjyi+8OSCXu6zQ3oV579A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: add CONFIG_LD_IS_LLD
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 5:21 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
> specific logic such as ld-version or ld-ifversion and gain the
> ability to select potential features that depend on the linker at
> configuration time such as LTO.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [nc: Reword commit message]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---


Acked-by: Masahiro Yamada <masahiroy@kernel.org>


-- 
Best Regards
Masahiro Yamada
