Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD3A3603DF
	for <lists+linux-mips@lfdr.de>; Thu, 15 Apr 2021 10:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhDOIH6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Apr 2021 04:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDOIH6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Apr 2021 04:07:58 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD11C061574;
        Thu, 15 Apr 2021 01:07:35 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so21835651otb.7;
        Thu, 15 Apr 2021 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4x2zPRkrRtqYD5K5m2BlNAn5NndYRLGDDLyS1fbJuU=;
        b=RYBB+myXB858Lk7tkbdh5mU04N9i99DeizzNjXvHxOIUpCjAHGTMTLMNqyeY87NzL/
         bGTspbo2oybwrtD016LzzC6OkI90038kQbsOOxQYSCDhgnRs6glvizolDnak4Na2bxzd
         9I+FtTzfiPfHUWPQbyY0/AUFaOpqYIz/HQlVNCPqCgmPmzb6jxSXZ+sFq8TUyMjoLsTI
         iubv8ZMfTbVb03Ywz/wNuortGXbKaG+FpsywjuN9uyBZJ2Qmy0QTocScuesgbkyCMbnb
         HjNXUsLVJGNg7+0fxrpuDXy4Ed02W/znc4LCrP/8CAEBAJ7GJ/6Kc3Dq/d4SM/nZrt0A
         kx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4x2zPRkrRtqYD5K5m2BlNAn5NndYRLGDDLyS1fbJuU=;
        b=I5R8gRnBteeRKQueiwPPIXXsrBsc0+j/qCnpw+1rmKog5RocqArR/w0jxUsy/ktADK
         8w2Qe4NLTf+AC4VikWeCoh1BirRLy8FRPC1OFBX4jIGrwwlXsgl2p8YdRYZ+FZlH5xTl
         ukVGrpZFdm9I0Zuc6Lm3gaNQ+YHlk1doq6E8TSWL0XNdi2m6bP5OeWHf4EMvwEP24Oda
         uhO8ahWtdOrNOw58tXnauG1PgaocNHs0wMTuUz8uqjqEX8/ReLLjpllRuuwJ5Ka+a2OB
         tOJXQyn869zQhqcah8KhTbxTG5GHPuvhgZGW8f5Go8wGIji7zKTm4463wLHYrz17Eyog
         Quaw==
X-Gm-Message-State: AOAM530H4QznizSJtS2ejaXDcY46OPOH0hlqzG3Iz54kFlwOZmQ45pZ6
        fwkOHlOfiVvT/MGFqsDAQ4W0u63U50ggo7PVFjU=
X-Google-Smtp-Source: ABdhPJxbKBGOG8PWLwThMjPFLBC1arvnaYYrxdNFMhS2Z3lFBFPYZ0IKFlKyDJ1av9/l/MAHZWNmDnzdyhRX33uyVPU=
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr1651505ots.110.1618474055310;
 Thu, 15 Apr 2021 01:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com> <20210414031240.313852-3-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210414031240.313852-3-ilya.lipnitskiy@gmail.com>
From:   Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date:   Thu, 15 Apr 2021 11:07:24 +0300
Message-ID: <CAHNKnsT8GngwDVrX9HvoGFpqHj-dnWhk_vCkSAhQhdRSbK5_NA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] MIPS: pci-rt2880: remove unneeded locks
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 14, 2021 at 6:12 AM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
> Mirror pci-rt3883 fix from commit e5067c718b3a ("MIPS: pci-rt3883:
> Remove odd locking in PCI config space access code"). pci-rt2880 shares
> the driver layout with pci-rt3883 and the same reasons apply.
>
> Caller (generic PCI code) already does proper locking, so no need to add
> another one here. Local PCI read/write functions are never called
> simultaneously, also they do not require synchronization with the PCI
> controller ops, since they are used before the controller registration.
>
> Suggested-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

-- 
Sergey
