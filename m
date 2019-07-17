Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0897A6BFC1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 18:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGQQmK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 12:42:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35142 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQQmK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jul 2019 12:42:10 -0400
Received: by mail-io1-f65.google.com with SMTP id m24so46822490ioo.2
        for <linux-mips@vger.kernel.org>; Wed, 17 Jul 2019 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MEk0Eu2nCv7ODpQXfa3RYlGX5rYs9SEdcQrSe6XXqk=;
        b=B3mG3LUlbSYHSOgC7XNu2pZlrZ7ePegASDphXdzO294KIOq1wXXWSGU/CkSrlt8zqC
         OsdUm+qjRNROMQJ5gcyQtpTbtUjCXo0kvjyqxj4XPRyiolAKqsiatIpC94zOpxxeIecV
         F5K0zXPcY0D1VT0KJ77DaZ3UmbR4xMFfKGMPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MEk0Eu2nCv7ODpQXfa3RYlGX5rYs9SEdcQrSe6XXqk=;
        b=MK75lswIEGmLPhhbfQrKlN9bSJ+KiPi9HEbJZInsZ2eTm4FdfWbNUt3V54H/T3A6UH
         OLbadBzKovAPPsGOcsTBWVEThbkJrPjXhc/mSELiwEeTZ2KUBQB0STp6nq0s5R7k5k6M
         7SX7it0HiFRPSz3ozIRca611m/sAE/hjmK8QwCNnyMNGO9QmA8TRoX+9daZ6B5dRld9e
         rtnQaJ+cIjW/sjpOwAGfzWneb1mq/f90qNjuXvlJ2pk4evfwJ1wpaZgoLYLP82L+U3x+
         k8DB+TLRGhZmVj6aqJdmTZwxxjrgXm+3M6IrcH9ZQCeluAPrmPw2y4/QbY2Pg6r4SR8G
         CaIQ==
X-Gm-Message-State: APjAAAVFT3GGOotTr3uecZ8CNB5CSKGJGzmL0Hh9b0IpUaZkwmkSCNS/
        TIYoTpOG4fwM78OmiXz1hsZxKQCY0WE=
X-Google-Smtp-Source: APXvYqzLqmsstNGDMrK88IYxTQDi2QJu0mCYAhi7ss+62MOe7S1ybfZMC5c7jduNpTg0G1DIg2Qj+g==
X-Received: by 2002:a6b:f711:: with SMTP id k17mr22436977iog.273.1563381729027;
        Wed, 17 Jul 2019 09:42:09 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id e188sm20647785ioa.3.2019.07.17.09.42.08
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 09:42:08 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id i10so46701534iol.13
        for <linux-mips@vger.kernel.org>; Wed, 17 Jul 2019 09:42:08 -0700 (PDT)
X-Received: by 2002:a6b:bbc1:: with SMTP id l184mr39875052iof.232.1563381728230;
 Wed, 17 Jul 2019 09:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
In-Reply-To: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 17 Jul 2019 09:41:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipjStEwJj2_iWxBdVC4oV8rY5NjrRb1tmWLUa0VrS_Eg@mail.gmail.com>
Message-ID: <CAHk-=wipjStEwJj2_iWxBdVC4oV8rY5NjrRb1tmWLUa0VrS_Eg@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 17, 2019 at 8:25 AM Paul Burton <paul.burton@mips.com> wrote:
>
> Documentation/process/license-rules.rst suggests to me that the version
> in the MIPS tree is correct in terms of license name ("GPL-2.0" without
> the "-only" suffix) whilst the version in master is correct in terms of
> comment style ("/* */" rather than "//").

It's actually license-rules.rst that just hasn't been updated. The
"GPL-.2.0" and "GPL-2.0+" naming was considered too terse, so the
modern spdx tag suggestions are "GPL-2.0-only" and "GPL-2.0-or-later".

The full list of all spdx license tags (many of which aren't relevant
for the kernel, of course) can be found at

    https://spdx.org/licenses/

in case you care.

             Linus
