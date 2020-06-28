Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0798420C7A9
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2020 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgF1L0J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jun 2020 07:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgF1L0I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jun 2020 07:26:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C1CC061794;
        Sun, 28 Jun 2020 04:26:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a6so13679587wrm.4;
        Sun, 28 Jun 2020 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S+k6UtPIvO0vIYbrlMDk45zrIVwFhaRGOClzN9gbCgs=;
        b=WCAzAftwg7qux9HBjIOiWi8WrC89fPVL6lvR7VK3RKs9uF+baZ8sp4sZSMqb3iOoCx
         v8BB0oZbYz7bKozw8eMUtvYPbwcQuH0Nf44GK/t2E+oRm/aOxF3nXK9FZ7vvroShwghd
         SyEsSa8CwLXWeSQpC4c+OsUHCQB19CK0F4D6ngjy8TseEAiQKLnbrEmgyEQqSr6aJqOo
         yEafGR47cwC185jXi3IujhjuZKA+4wxncfRMbn1gDpn0tfSlKZ9evrtKqlQOQLOnqf5F
         aUrcz2VBOJE8z1NJmKBNgDvREKP+/T/hHglJz/xkeuIKpT0NovSQv2l/QrpQJMaAId5T
         AeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S+k6UtPIvO0vIYbrlMDk45zrIVwFhaRGOClzN9gbCgs=;
        b=hYj6rIbhjaDBeTEXeSlkqjiW4eC0ffyKGTrla3eLcFzDuBAJsU+dwzNq8wKR8jqnzZ
         TLkuAtwfIXC8dMIdGRcu/+Jiqrcyf3XbbGmeYA/abaB4O88A8FNZIoryXLqHiYl9I+lI
         +/HF6oeTgIXD5rQstu19FQkbiy/lyJyWCcHwx35QqqmEYaEYiJaT3HiyczSOWKtTB91J
         fByrVsFUsukqQokZSLoO5ZaYv97KFORBNXoANmFAVZjyvrR+o88tetNYLRY/1Rj3xRAe
         dEvwBueC/XC9OuR4DNPvzEb7yEwSZZ41XFeQFDVzo5ERlVd0EBXUdCdIOX6bhNrEG/4j
         2H3w==
X-Gm-Message-State: AOAM532Oxspv6BXSo6xNsKs1wPtJZypUxk6a1kN+wWW+VdUvqoHAeQzQ
        9kO9Sw5U0fx4g/9TK1IOw8d/E8UayEEo77UIum4=
X-Google-Smtp-Source: ABdhPJxF/pjQBgCeBAbqhm4mgZrudZ1F7qiZE+sYiYJEnTaoqWG9BfQoEXfJqsnVtSNSHzDzlkgWDqOmSNUSnpMDgZw=
X-Received: by 2002:a5d:6907:: with SMTP id t7mr12403926wru.329.1593343567163;
 Sun, 28 Jun 2020 04:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn> <e419a2acea6c1977eaef5d049d607749@kernel.org>
In-Reply-To: <e419a2acea6c1977eaef5d049d607749@kernel.org>
From:   Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Sun, 28 Jun 2020 13:25:54 +0200
Message-ID: <CAHiYmc6wmgHYm688pTFEAoyzD+nE68SPeJgCOcZLb2yRRgwGRg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] irqchip: Fix potential resource leaks
To:     Marc Zyngier <maz@kernel.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D1=81=D1=80=D0=B5, 24. =D1=98=D1=83=D0=BD 2020. =D1=83 10:40 Marc Zyngier =
<maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>
> On 2020-06-24 08:44, Tiezhu Yang wrote:
> > [git send-email failed due to too many commands,
> >  so only cc the major related email and resend it,
> >  sorry for that]
>
> This is becoming majorly annoying.

I don't think this is the right vocabulary to welcome newcomers,
however "terrible" thinks they did.

Rather, patience, calmness and clear and detailed explanations would
work much better - and certainly be much more helpful and useful to
the community in the long run.

Regards,
Aleksandar

> Please fix your git setup
> *before* dumping 57 emails for just 14 patches. You have done
> the same thing yesterday, and I would hope you learned from your
> mistakes.
>
> Also, do not repost a series more than once per week. You have
> already exceeded your quota by quite a margin.
>
>          M.
> --
> Jazz is not dead. It just smells funny...
