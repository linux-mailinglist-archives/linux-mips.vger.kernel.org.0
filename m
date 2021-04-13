Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFA935DF65
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345056AbhDMMvF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 08:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241873AbhDMMu6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 08:50:58 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB378C061574;
        Tue, 13 Apr 2021 05:50:38 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id z85-20020a4a49580000b02901e62808350bso1243148ooa.6;
        Tue, 13 Apr 2021 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ln3ek0nTyB1P0KLSlLSuGmS+bf4MCQh1y2JkmxQe0zo=;
        b=S/gDkLVKYwxDdlDyJ0aW7HwV95CVFhFpSC+Wzfp3jRuU5WhE8JFcstHYgGsbFsf9zy
         dTc3IjCnU9AgS/TsCgALumH14dMf5uehYlGCyOxtN51pZOFiqLvFYo+e0o1VmLq5GN2U
         Phr3dkEJwQCto/kHtqI/UD8wFdKmqTmSsHsqTXwki3p4Xul0JbUBTLaLqVSfGsg9yIFm
         O5Ns8zILhdGDKUGK3Xa30MPN6u5UxSjGTUyKjuMiulyjJ6Ov4MjDS0pazCz3okoCl0FA
         7o29zuYgrHAzROr0KpoStW0ei1fjvuiPIrOOV2I3ber6ZN8bO2B1N+tyx7ls56xnHjVk
         xtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ln3ek0nTyB1P0KLSlLSuGmS+bf4MCQh1y2JkmxQe0zo=;
        b=MTcD8I1s3Zro+yoQEr+yffLj2v8lsqQs+A+quRSiPPeh6RM5s0CvmAV2a4SKOyxkKX
         /fcV5MQfjcrheKHdWrC4z+nf22uks0yhbnpqz+oDytC97kWmD3Yw1UfYp1PWbL0qImsG
         0U1Kbo3kUYXjiumYbWKU4MaaJOVlFnA8AQPqN3M/PR3tjsaO7lsrPCLattL0I/eSRlPV
         +A0tZScdT2J2uU1OB8PnuZ8LM8Rfow+eNhemuKjOHAVkIw04gqlaKtoCm5ejIDj073fa
         RbuzThLmavkf8lScZJOJ2vBYl6FKAUXU6lSLdSxdNC6XILfyb9oFobA50z/WlS63xlxV
         Z1Fg==
X-Gm-Message-State: AOAM533FAq3+PhSbPflvhyNhjsC66ICiyYnO7W5FJR8oDX66KBDVK9DX
        +51WSX9jipzDiuSbE8pfQ0fAvQV0Mm0rmIVkfZ4JYJTboPo=
X-Google-Smtp-Source: ABdhPJxujxpezD6rQDrnwUUcHfdAKDYUhPXbuU4DYaM2yBJ0qlZzrzBMuF9lOzCCF3G1v6+dFQkayFgeTnTxfjN45ew=
X-Received: by 2002:a4a:b389:: with SMTP id p9mr26449894ooo.71.1618318237749;
 Tue, 13 Apr 2021 05:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com> <20210413062146.389690-4-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210413062146.389690-4-ilya.lipnitskiy@gmail.com>
From:   Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date:   Tue, 13 Apr 2021 15:50:27 +0300
Message-ID: <CAHNKnsRQ9nGUuHwqsY1_k+NUo6tGQnVsDqzTG3-57HBjW4M_8w@mail.gmail.com>
Subject: Re: [PATCH 3/8] MIPS: pci-rt3883: trivial: remove unused variable
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 9:22 AM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
> Fixes the following compiler warning:
>   warning: unused variable 'flags' [-Wunused-variable]
>
> Fixes: e5067c718b3a ("MIPS: pci-rt3883: Remove odd locking in PCI config space access code")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Cc: trivial@kernel.org

Yep, I overlooked these local variables. Thank you.

Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

-- 
Sergey
