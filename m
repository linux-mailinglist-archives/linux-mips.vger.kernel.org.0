Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8886379B5A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 23:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388320AbfG2Vm7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 17:42:59 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:38803 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388056AbfG2Vm6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 17:42:58 -0400
Received: by mail-lf1-f53.google.com with SMTP id h28so43080469lfj.5
        for <linux-mips@vger.kernel.org>; Mon, 29 Jul 2019 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6nCAhqsVRTUbfSc3zueaP6/rAmu54qp6S7qtfkPndZw=;
        b=XQ5H57KC2m9zzV1YUZO2/UWUGFWXuv+sLFLOwg3sjsZ6WLSFSMgjzgd3Or7LhL54M2
         bYe1qUnhOKBgSiDnPFf6lV8dAf84PqVI4ee6Xpy83AkPlQDtVFSemPu+rRyjXmwAty+E
         3LFTUHJcG2rDwKZTufp1Mup/u3IMlCyDSlo6szx2MlgadTZzuNsXgb0JEiB1z4kLZh56
         1vyyRdPUD7f25dKVqz7jJrjHA4KWNZm6Wx7lYNaXU+pJbStQRT2i9rI+cRUHGORPQkY7
         83n6/YiPNSQpL+03K9Juot7d6QLspBvmI1FgIZDAf8bwBTMJ6H1NVGCxwYkPu3ivASn7
         pNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6nCAhqsVRTUbfSc3zueaP6/rAmu54qp6S7qtfkPndZw=;
        b=f2EHMck/XjY6iB9dKh7jXoB8SlZSQt7QFbuCiJtJGqc4zAaVV4i29aydyoCbxna7yV
         pHOhNBV9pgUqAoXSnlefsLyORfSSGSjN27F4os/lwIw6ggGQnBvOfsjlRqV78kqt5kFN
         A/6Sk7EiMWgdYizfWgvNDi/HNZFdNFzN6BE0Z0CXanmLA+btFn8lzL4BY2SLCL9iHQyt
         pfGG1/XOw9NcD+wdUdRdQUgMFyaP4R74FH+iCbh49fkaUDBm+zn+MDUEJa0JAvrWKkFD
         45ig3XscEDJQddrK6CNAz6kyTUqlTfzk1jsSyDzueRYAbWLT1RinY4qYgbCfeGX3aHKM
         KGgw==
X-Gm-Message-State: APjAAAUb+dFoc7pgyKkVjULC5Wtnni7rM+zmlDG1qLpuo27D4oiCIABc
        7x/sgtvVQitYMC4G2QYE+RFAJmMJA4E5IbI0ojAmSsK5
X-Google-Smtp-Source: APXvYqwPPJD/EfvWSQiiprO7ycqY+wqwRXmEiafD8nOfeRaXHuKlzj+ngqiBVCA5U0tcxLAepJhz+O+oI8uWKeXtDz0=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr54417470lfc.60.1564436577047;
 Mon, 29 Jul 2019 14:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:42:46 +0200
Message-ID: <CACRpkdb630mbyV8n+6meo6ooEe_Lg+p66CX3PBTm5P78Lc5qJw@mail.gmail.com>
Subject: Re: Ingenic pinctrl patchs.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Paul Burton <paul.burton@mips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 14, 2019 at 8:55 AM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> Add support for Ingenic JZ4760, JZ4760B, X1000, X1000E and X1500.

All 6 patches applied. Seems very straight-forward thanks for fixing this!

Yours,
Linus Walleij
